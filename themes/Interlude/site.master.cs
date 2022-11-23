using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public partial class site : System.Web.UI.MasterPage
{
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
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        string HOST_DOMAIN = BlogEngine.Core.Utils.AbsoluteWebRoot.ToString();

        if (!Page.IsPostBack)
        {
            HtmlGenericControl shCore = new HtmlGenericControl("script");
            shCore.Attributes["type"] = "text/javascript";
            shCore.Attributes["src"] = string.Format("{0}SyntaxHighlighter/Scripts/shCore.js", HOST_DOMAIN);

            HtmlGenericControl shCSharp = new HtmlGenericControl("script");
            shCSharp.Attributes["type"] = "text/javascript";
            shCSharp.Attributes["src"] = string.Format("{0}SyntaxHighlighter/Scripts/shBrushCSharp.js", HOST_DOMAIN);

            HtmlGenericControl shCss = new HtmlGenericControl("script");
            shCss.Attributes["type"] = "text/javascript";
            shCss.Attributes["src"] = string.Format("{0}SyntaxHighlighter/Scripts/shBrushCss.js", HOST_DOMAIN);

            HtmlGenericControl shJscript = new HtmlGenericControl("script");
            shJscript.Attributes["type"] = "text/javascript";
            shJscript.Attributes["src"] = string.Format("{0}SyntaxHighlighter/Scripts/shBrushJScript.js", HOST_DOMAIN);

            HtmlGenericControl shSql = new HtmlGenericControl("script");
            shSql.Attributes["type"] = "text/javascript";
            shSql.Attributes["src"] = string.Format("{0}SyntaxHighlighter/Scripts/shBrushSql.js", HOST_DOMAIN);

            HtmlGenericControl shVb = new HtmlGenericControl("script");
            shVb.Attributes["type"] = "text/javascript";
            shVb.Attributes["src"] = string.Format("{0}SyntaxHighlighter/Scripts/shBrushVb.js", HOST_DOMAIN);

            HtmlGenericControl shXml = new HtmlGenericControl("script");
            shXml.Attributes["type"] = "text/javascript";
            shXml.Attributes["src"] = string.Format("{0}SyntaxHighlighter/Scripts/shBrushXml.js", HOST_DOMAIN);

            HtmlLink syntaxCss = new HtmlLink();
            syntaxCss.Href = string.Format("{0}SyntaxHighlighter/Styles/SyntaxHighlighter.css", HOST_DOMAIN);
            syntaxCss.Attributes["rel"] = "stylesheet";
            syntaxCss.Attributes["type"] = "text/css";
            syntaxCss.Attributes["media"] = "screen";

            Page.Header.Controls.Add(shCore);
            Page.Header.Controls.Add(shCSharp);
            Page.Header.Controls.Add(shCss);
            Page.Header.Controls.Add(shJscript);
            Page.Header.Controls.Add(shSql);
            Page.Header.Controls.Add(shVb);
            Page.Header.Controls.Add(shXml);
            Page.Header.Controls.Add(syntaxCss);
        }
    }
}
