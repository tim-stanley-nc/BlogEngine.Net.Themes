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

public partial class themes_Gluttony_site : System.Web.UI.MasterPage
{
	protected enum Link
	{
		Home,
		Archive, 
		Contact, 
		Search, 
		Login
	}

    protected void Page_Load(object sender, EventArgs e)
    {

    }


	protected string GetLinkStyle(Link link)
	{
		bool found = false;

		switch (link)
		{
			case Link.Archive:
				return (HttpContext.Current.Request.Path.EndsWith("archive.aspx") ? "current_page_item" : "page_item");
			case Link.Contact:
				return (HttpContext.Current.Request.Path.EndsWith("contact.aspx") ? "current_page_item" : "page_item");
			case Link.Login:
				return (HttpContext.Current.Request.Path.EndsWith("login.aspx") ? "current_page_item" : "page_item");
			case Link.Search:
				return (HttpContext.Current.Request.Path.EndsWith("search.aspx") ? "current_page_item" : "page_item");
			case Link.Home:
				return (HttpContext.Current.Request.Path.EndsWith("default.aspx") ? "current_page_item" : "page_item");
			default:
				return "current_page_item";

		}
	}
}
