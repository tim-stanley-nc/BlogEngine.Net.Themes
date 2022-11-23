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
	// If you do not want to allow the user to pick a style, set COOKIE_ENABLED = false, and set DEFAULT_STYLE 
	// to the style that you want to show.
	//
	private const bool COOKIE_ENABLED = true;

	//
	// The name of the cookie that will persist the style selection per user.
	//
	private const string COOKIE_NAME = "ThemeEngine.LayoutGala.1.0";

	//
	// this is the folder where the styles are located.
	//
	private const string STYLE_PATH = "~/themes/ThemeEngine.LayoutGala.1.0/styles";

	//
	// This is the default style.  This is the style that will show to a visitor who has not selected a style yet.
	// Or, if you have changed COOKIE_ENABLED to false, this is the only style that will be displayed.
	//
	private const string DEFAULT_STYLE = "07";
	
	//
	// The key in the cache to store the installed styles.
	//
	private const string CACHE_KEY = "ThemeEngine.LayoutGala.1.0.InstalledStyles";

	#region RequestStyle

	private string _requestStyle;

	/// <summary>
	/// This is the style that will be rendered for the current request.
	/// </summary>
	public string RequestStyle
	{
		get
		{
			return _requestStyle;
		}
		set
		{
			_requestStyle = value;
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

			this.RequestStyle = this.GetSelectedStyle();

			if (!this.Page.IsPostBack && COOKIE_ENABLED)
			{
				List<string> installedStyles = this.GetInstalledStyles();
				this.ddlThemeEngine.Items.Clear();

				foreach (string installedTheme in installedStyles)
				{
					this.ddlThemeEngine.Items.Add(new ListItem(installedTheme, installedTheme));
				}

				if (!string.IsNullOrEmpty(this.RequestStyle))
				{
					this.ddlThemeEngine.SelectedValue = this.RequestStyle;
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
				string styleName = this.ddlThemeEngine.SelectedValue;
				List<string> installedStyles = this.GetInstalledStyles();

				if (installedStyles.Contains(styleName))
				{
					HttpCookie cookie = new HttpCookie(COOKIE_NAME, styleName);
					cookie.Expires = System.DateTime.Now.AddYears(10);

					System.Web.HttpContext.Current.Response.Cookies.Add(cookie);

					this.RequestStyle = styleName;
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
		if (!string.IsNullOrEmpty(this.RequestStyle))
		{
			HtmlLink link = new HtmlLink();
			link.Attributes["rel"] = "stylesheet";
			link.Attributes["type"] = "text/css";
			link.Attributes["href"] = STYLE_PATH + "/" + this.RequestStyle + ".css";
			this.Page.Header.Controls.Add(link);
		}
	}

	private string GetSelectedStyle()
	{
		try
		{
			string styleName = COOKIE_ENABLED ? GetCookie(COOKIE_NAME, DEFAULT_STYLE) : DEFAULT_STYLE;

			List<string> installedStyles = GetInstalledStyles();

			//
			// If the style name is still blank or null, or the style found is not in the current list of available styles, then resort to the default style.
			//
			if (string.IsNullOrEmpty(styleName) || !installedStyles.Contains(styleName))
			{
				//
				// If the default style is in the list of installed styles, use it.
				//
				if (installedStyles.Contains(DEFAULT_STYLE))
				{
					styleName = DEFAULT_STYLE;
				}
				else
				{
					if (installedStyles.Count == 0)
					{
						//
						// There are no installed styles found, go without....
						//
						styleName = string.Empty;
					}
					else
					{
						//
						// Something is configured incorrectly because the default style was not found in the installed style list.  Just use the first one on the list.				
						//
						styleName = installedStyles[0];
					}
				}
			}

			return styleName;
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

	private List<string> GetInstalledStyles()
	{
		List<string> installedStyles = Cache[CACHE_KEY] as List<string>;

		if (installedStyles == null)
		{
			installedStyles = new List<string>();

			try
			{
				string stylePath;

				//
				// If this is a preview.
				//
				/*
				 * jf26028 - 20080114 - This works correctly, but there was something uncomfortable about getting the path to the style from the 
				 * querystring.  I could not get it to break, or do something evil, but maybe someone else could...
				 * 
				 * So, the answer is to hard code the name of this style here, and not care about the instance name or the querystring.
				 * 
				 * 
				if (!string.IsNullOrEmpty(Request.QueryString["style"]))
				{
					stylePath = HttpContext.Current.Server.MapPath("~/styles/" + Request.QueryString["style"]);
				}
				else
				{
					stylePath = HttpContext.Current.Server.MapPath("~/styles/" + BlogSettings.Instance.Theme);
				}
				*/

				stylePath = Server.MapPath(STYLE_PATH);

				foreach (string installedStyle in Directory.GetFiles(stylePath, "*.css"))
				{
					string buffer = installedStyle.Substring(installedStyle.LastIndexOf(Path.DirectorySeparatorChar) + 1);
					buffer = buffer.Substring(0, buffer.LastIndexOf('.'));
					if (buffer != "style")
					{
						installedStyles.Add(buffer);
					}
				}

				Cache.Add(CACHE_KEY, installedStyles, null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Low, null);
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

		return installedStyles;
	}
}
