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

public partial class themes_BrightSide_site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected string GetColoredHeading(string title)
    {
        string[] splitTitle;
        splitTitle = title.Split(' ');

        if (splitTitle.Length == 1)
            return title;
        else
        {
            string result = splitTitle[0];
            int iCounter = 0;
            for (int i = 1; i < splitTitle.Length; i++)
            {
                iCounter++;
                switch (iCounter)
                {
                    case 1:
                        result += string.Format(@"<span class=""green"">{0}</span>", splitTitle[i]);
                        break;
                    case 3:
                        result += string.Format(@"<span class=""gray"">{0}</span>", splitTitle[i]);
                        iCounter = 0;
                        break;
                    default:
                        result += splitTitle[i];
                        break;
                }
            }

            return result;
        }

    }
}
