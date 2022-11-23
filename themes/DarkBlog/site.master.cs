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
using BlogEngine.Core;

public partial class themes_Cogitation_site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
        {
            // subscribe to post serving event
            Post.Serving += new EventHandler<ServingEventArgs>(Post_Serving);
        }
    }

    public static string GetMenu(string title, string url)
    {
        string CssClass = string.Empty;
        string href = HttpContext.Current.Request.ApplicationPath + "/" + url;

        if (HttpContext.Current.Request.RawUrl.Contains(url))
        {
            CssClass = "current";
        }
        return string.Format("<a class='{0}' href='{1}'><span>{2}</span></a>", CssClass, href, title);
    }
	
	private void Post_Serving(object sender, ServingEventArgs e)
    {
        if (!IsPostBack && e.Location == ServingLocation.SinglePost)
        {
            // if serving single post - get a page handle
            System.Web.UI.Page pg = (System.Web.UI.Page)HttpContext.Current.CurrentHandler;
            bool added = false;

            // check if style sheet for single post 
            // already added to the page header
            foreach (Control ctl in pg.Header.Controls)
            {
                if (ctl.GetType() == typeof(HtmlLink))
                {  
                    HtmlLink lk = (HtmlLink)ctl;
                    if (lk.Attributes["href"] == "singlepost.css")
                    {
                        added = true;
                    }
                }
            }

            if (!added)
            {
                // if style sheet for single post not yet added
                // to the master page header - add it now
                HtmlLink link = new HtmlLink();
                link.Attributes.Add("href", "singlepost.css");
                link.Attributes.Add("media", "screen");
                link.Attributes.Add("rel", "stylesheet");
                link.Attributes.Add("type", "text/css");
                pg.Header.Controls.Add(link);
            }
        }  
    }
}
