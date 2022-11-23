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

public partial class themes_curiouslygreen_PostView : BlogEngine.Core.Web.Controls.PostViewBase
{
  protected void Page_Load(object sender, EventArgs e)
  {

  }
  protected string MarkUpTitle(string originalTitle)
  {
    int spanspace = originalTitle.LastIndexOf(' ');
    string newTitle;

    if (spanspace > 0)
      newTitle = originalTitle.Substring(0, spanspace) + "<span>" + originalTitle.Substring(spanspace) + "</span>";
    else
      newTitle = originalTitle;

    return newTitle;
  }
}
