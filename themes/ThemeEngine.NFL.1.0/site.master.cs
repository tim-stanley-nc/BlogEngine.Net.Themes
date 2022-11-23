using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.IO;
using System.Collections.Generic;

using BlogEngine.Core;

public partial class site : System.Web.UI.MasterPage
{
	//
	// If you do not want to allow the user to pick a theme, set COOKIE_ENABLED = false, and set DEFAULT_THEME 
	// to the theme that you want to show.
	//
	private const bool COOKIE_ENABLED = true;

	//
	// The name of the cookie that will persist the theme selection per user.
	//
	private const string COOKIE_NAME = "ThemeEngine.NFL.1.0";

	//
	// this is the folder under the themes folder where the theme is installed.
	//
	private const string THEME_PATH = "~/themes/ThemeEngine.NFL.1.0";

	//
	// This is the default theme.  This is the theme that will show to a visitor who has not selected a theme yet.
	// Or, if you have changed COOKIE_ENABLED to false, this is the only theme that will be displayed.
	//
	private const string DEFAULT_THEME = "Cowboys";
	
	//
	// The key in the cache to store the installed themes.
	//
	private const string CACHE_KEY = "ThemeEngine.NFL.1.0.InstalledThemes";

	#region RequestTheme

	private string _requestTheme;

	/// <summary>
	/// This is the theme that will be rendered for the current request.
	/// </summary>
	public string RequestTheme
	{
		get
		{
			return _requestTheme;
		}
		set
		{
			_requestTheme = value;
		}
	}

	#endregion

	protected string GetCookie(string cookieName, string defaultValue)
	{
		if (HttpContext.Current.Request.Cookies[cookieName] != null)
		{
			return HttpContext.Current.Request.Cookies[cookieName].Value;
		}
		else
		{
			return defaultValue;
		}
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		try
		{
			if (COOKIE_ENABLED)
			{
				this.ddlThemeEngine.SelectedIndexChanged += new EventHandler(ddlThemeEngine_SelectedIndexChanged);
			}
			else
			{
				this.ddlThemeEngine.Visible = false;
			}

			this.RequestTheme = this.GetSelectedTheme();

			if (!this.Page.IsPostBack && COOKIE_ENABLED)
			{
				List<string> installedThemes = this.GetInstalledThemes();
				this.ddlThemeEngine.Items.Clear();

				foreach (string installedTheme in installedThemes)
				{
					this.ddlThemeEngine.Items.Add(new ListItem(installedTheme, installedTheme));
				}

				if (!string.IsNullOrEmpty(this.RequestTheme))
				{
					this.ddlThemeEngine.SelectedValue = this.RequestTheme;
				}
			}
		}
		catch (System.Exception exception)
		{
			//
			// Hide the error unless we are in debug mode.
			//
#if DEBUG
			throw;
#endif
		}
	}

	void ddlThemeEngine_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (COOKIE_ENABLED)
		{
			try
			{
				string themeName = this.ddlThemeEngine.SelectedValue;
				List<string> installedThemes = this.GetInstalledThemes();

				if (installedThemes.Contains(themeName))
				{
					HttpCookie cookie = new HttpCookie(COOKIE_NAME, themeName);
					cookie.Expires = System.DateTime.Now.AddYears(10);



					System.Web.HttpContext.Current.Response.Cookies.Add(cookie);

					this.RequestTheme = themeName;
				}
			}
			catch (System.Exception exception)
			{
				//
				// Hide the error unless we are in debug mode.
				//
#if DEBUG
				throw;
#endif
			}

		}
	}

	protected void Page_PreRender(object sender, EventArgs e)
	{
		InsertThemeStylesheet();
	}

	protected void InsertThemeStylesheet()
	{
		if (!string.IsNullOrEmpty(this.RequestTheme))
		{
			HtmlLink link = new HtmlLink();
			link.Attributes["rel"] = "stylesheet";
			link.Attributes["type"] = "text/css";
			link.Attributes["href"] = this.RequestTheme + "/style.css";
			this.Page.Header.Controls.Add(link);
		}
	}

	private string GetSelectedTheme()
	{
		try
		{
			string themeName = COOKIE_ENABLED ? GetCookie(COOKIE_NAME, DEFAULT_THEME) : DEFAULT_THEME;

			List<string> installedThemes = GetInstalledThemes();

			//
			// If the theme name is still blank or null, or the theme found is not in the current list of available themes, then resort to the default theme.
			//
			if (string.IsNullOrEmpty(themeName) || !installedThemes.Contains(themeName))
			{
				//
				// If the default theme is in the list of installed themes, use it.
				//
				if (installedThemes.Contains(DEFAULT_THEME))
				{
					themeName = DEFAULT_THEME;
				}
				else
				{
					if (installedThemes.Count == 0)
					{
						//
						// There are no installed themes found, go without....
						//
						themeName = string.Empty;
					}
					else
					{
						//
						// Something is configured incorrectly because the default theme was not found in the installed theme list.  Just use the first one on the list.				
						//
						themeName = installedThemes[0];
					}
				}
			}

			return themeName;
		}
		catch (System.Exception exception)
		{
			//
			// Hide the error unless we are in debug mode.
			//
#if DEBUG
			throw;
#endif
		}

		return string.Empty;
	}

	private List<string> GetInstalledThemes()
	{
		List<string> installedThemes = Cache[CACHE_KEY] as List<string>;

		if (installedThemes == null)
		{
			installedThemes = new List<string>();

			try
			{
				string themePath;

				//
				// If this is a preview.
				//
				/*
				 * jf26028 - 20080114 - This works correctly, but there was something uncomfortable about getting the path to the theme from the 
				 * querystring.  I could not get it to break, or do something evil, but maybe someone else could...
				 * 
				 * So, the answer is to hard code the name of this theme here, and not care about the instance name or the querystring.
				 * 
				 * 
				if (!string.IsNullOrEmpty(Request.QueryString["theme"]))
				{
					themePath = HttpContext.Current.Server.MapPath("~/themes/" + Request.QueryString["theme"]);
				}
				else
				{
					themePath = HttpContext.Current.Server.MapPath("~/themes/" + BlogSettings.Instance.Theme);
				}
				*/

				themePath = Server.MapPath(THEME_PATH);

				foreach (string directory in Directory.GetDirectories(themePath))
				{
					string installedTheme = directory.Substring(directory.LastIndexOf(Path.DirectorySeparatorChar) + 1);

					if (!installedTheme.Equals("images", StringComparison.InvariantCultureIgnoreCase))
					{
						installedThemes.Add(installedTheme);
					}
				}

				Cache.Add(CACHE_KEY, installedThemes, null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Low, null);
			}
			catch (System.Exception exception)
			{
				//
				// Hide the error unless we are in debug mode.
				//
#if DEBUG
				throw;
#endif
			}
		}

		return installedThemes;
	}
}
