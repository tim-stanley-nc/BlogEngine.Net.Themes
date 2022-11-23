<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SidePanel.ascx.cs" EnableViewState="false" Inherits="User_controls_SidePanel" %>
<%@ Register Src="~/admin/menu.ascx" TagName="menu" TagPrefix="uc1" %>
<%@ Import Namespace="BlogEngine.Core" %>

<div class="box">
  <h2>About the author</h2>
  <table summary="About the author">
    <tr>
      <td><img src="~/themes/darkblog/noavatar.jpg" runat="server" alt="Name of author" style="border:5px solid #555; margin: 0 10px 0 0" /></td>
      <td style="vertical-align:top">
        Author name<br />
        Something about me and what I do.
        <br />
        
        <asp:HyperLink runat="server" NavigateUrl="~/contact.aspx" style="float:right;clear:both">
          E-mail me <img src="~/pics/mail.gif" alt="Send mail" runat="server" style="width:16px" />
        </asp:HyperLink> 
      </td>
    </tr>
  </table>  
</div>

<% if (Utils.IsAuthenticated){ %>
<div class="box">
  <h2>Administration</h2>
  <uc1:menu ID="Menu1" runat="server" />
</div>
<%} %>

<div class="box">
  <h2>Calendar</h2>
  <div style="text-align:center">
    <blog:PostCalendar runat="Server" NextMonthText=">>" DayNameFormat="FirstTwoLetters" FirstDayOfWeek="monday" PrevMonthText="<<" CssClass="calendar" BorderWidth="0" WeekendDayStyle-CssClass="weekend" OtherMonthDayStyle-CssClass="other" UseAccessibleHeader="true" EnableViewState="false" />
  </div>
</div>

<%--<div class="box">
  <h2><%=Resources.labels.pages %></h2>
  <blog:PageList runat="Server" />
</div>--%>

<div class="box">
  <h2><%=Resources.labels.archive %></h2>
  <blog:MonthList runat="server" />
  <blog:SearchBox ID="SearchBox1" runat="server" />
</div>

<div class="box">
  <h2>Tags</h2>
  <blog:TagCloud runat="server" />
</div>

<div class="box">
  <h2><%=Resources.labels.categories %></h2>
  <blog:CategoryList runat="Server" ShowRssIcon="false" />
</div>

<div class="box">
  <h2><%=Resources.labels.blogroll %></h2>   
  <blog:Blogroll runat="server" />
  <a href="opml.axd" style="display:block;text-align:left; padding-left: 5px; padding-top:5px;" title="Download OPML file" >Download OPML file <asp:Image ID="Image1" runat="server" ImageUrl="~/pics/opml.png" AlternateText="OPML" /></a>
</div>

<div class="box">
  <h2>Disclaimer</h2>
  <p>
    The opinions expressed herein are my own personal opinions and do not represent my employer's view in anyway.<br /><br />
</p>
</div>

<div style="clear:both;">
    <a id="A1" href="~/syndication.axd" title="RSS" runat="server">
        <img id="contbgltup" src="~/themes/darkblog/images/rss.jpg" runat="server" alt="RSS" />
    </a>
</div>