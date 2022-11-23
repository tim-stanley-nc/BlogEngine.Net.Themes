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

public partial class themes_Gluttony_PostView : BlogEngine.Core.Web.Controls.PostViewBase
{
	protected new void Page_Load(object sender, EventArgs e)
	{
		base.Page_Load(sender, e);
	}

	public string GetLinksWithLabel(string label, string linkText)
	{
		if (string.IsNullOrEmpty(linkText))
		{
			return string.Empty;
		}
		else
		{
			return label + linkText + "<br />";
		}
	}
}
