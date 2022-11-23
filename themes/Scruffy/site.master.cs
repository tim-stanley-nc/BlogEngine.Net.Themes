using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using BlogEngine.Core;

public partial class site : System.Web.UI.MasterPage
{
    public int postListed = 0;

  protected void Page_Load(object sender, EventArgs e)
  {
		if (BlogEngine.Core.Utils.IsAuthenticated)
		{
            
			aLogin.InnerText = Resources.labels.logoff;
			aLogin.HRef = BlogEngine.Core.Utils.RelativeWebRoot + "login.aspx?logoff";
		}
		else
		{
			aLogin.HRef = BlogEngine.Core.Utils.RelativeWebRoot + "login.aspx";
			aLogin.InnerText = Resources.labels.login;
		}





        if (!Page.ClientScript.IsClientScriptBlockRegistered("pngFix"))
        {
            string query = Request.QueryString["theme"];
            string theme = !string.IsNullOrEmpty(query) ? query : BlogSettings.Instance.Theme;
            string totUrl = string.Concat(Utils.AbsoluteWebRoot, "themes/", theme, "/js/pngfix.js");
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "pngFix", string.Concat("<!--[if lte IE 6]><script defer type='text/javascript' src='", totUrl, "</script><![endif]-->"), false);
        }
      
  }

  private void Post_Serving(object sender, ServingEventArgs e)
  {
      if (e.Location != ServingLocation.PostList && e.Location != ServingLocation.SinglePost)
      {
          body.Attributes.Add("class", "altbg");
      }

  }

  protected override void OnInit(EventArgs e)
  {
      BlogEngine.Core.Page.Serving += new EventHandler<ServingEventArgs>(Post_Serving); 
      base.OnInit(e);
      
  }
}
