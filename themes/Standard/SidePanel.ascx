<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SidePanel.ascx.cs" EnableViewState="false" Inherits="User_controls_SidePanel" %>
<%@ Register Src="~/admin/menu.ascx" TagName="menu" TagPrefix="uc1" %>
<%@ Import Namespace="BlogEngine.Core" %>

<blog:WidgetZone runat="server" ID="rightzone" />

<div class="box">
  <h1>About the author</h1>
  <table summary="About the author">
    <tr>
      <td><img src="<%=Utils.RelativeWebRoot %>themes/Standard/noavatar.jpg" alt="Name of author" /></td>
      <td style="vertical-align:top">
        Author name<br />
        Something about me and what I do.
        <br /><br />
        
        <!-- Email -->
        <a href="<%=Utils.AbsoluteWebRoot %>contact.aspx" style="float:right;clear:both">
          E-mail me <img src="<%=Utils.RelativeWebRoot %>pics/mail.gif" alt="Send mail" style="width:16px" />
        </a>
      </td>
    </tr>
  </table>  
</div>

<blog:SearchBox ID="SearchBox1" runat="server" /><br />

<% if (Page.User.Identity.IsAuthenticated){ %>
<div class="box">
  <h1>Administration</h1>
  <uc1:menu ID="Menu1" runat="server" />
</div>
<%} %>

<div class="box">
  <h1>Calendar</h1>
  <div style="text-align:center">
    <blog:PostCalendar runat="Server" NextMonthText=">>" DayNameFormat="FirstTwoLetters" FirstDayOfWeek="monday" PrevMonthText="<<" CssClass="calendar" BorderWidth="0" WeekendDayStyle-CssClass="weekend" OtherMonthDayStyle-CssClass="other" UseAccessibleHeader="true" EnableViewState="false" />
    <br />
    <a href="<%=Utils.AbsoluteWebRoot %>calendar/default.aspx">View posts in large calendar</a>
  </div>
</div>

<div class="box">
  <h1><%=Resources.labels.pages %></h1>
  <blog:PageList runat="Server" />
</div>

<div class="box recent">
  <h1><%=Resources.labels.recentPosts %></h1>
  <blog:RecentPosts runat="Server" />
</div>

<div class="box recent">
  <h1><%=Resources.labels.recentComments %></h1>
  <blog:RecentComments runat="Server" />
</div>

<div class="box">
  <h1><%=Resources.labels.archive %></h1>
  <blog:MonthList runat="server" />
</div>

<div class="box">
  <h1>Authors</h1>
  <blog:AuthorList runat="Server" ShowRssIcon="true"  />
</div>

<div class="box">
  <h1>Tags</h1>
  <blog:TagCloud runat="server" />
</div>

<div class="box">
  <h1><%=Resources.labels.categories %></h1>
  <blog:CategoryList runat="Server" ShowRssIcon="true" /><br />
</div>

<div class="box">
  <h1><%=Resources.labels.blogroll %></h1>   
  <blog:Blogroll runat="server" />
  <a href="<%=Utils.AbsoluteWebRoot %>opml.axd" style="display:block;text-align:right" title="Download OPML file" >Download OPML file <img src="<%=Utils.AbsoluteWebRoot %>pics/opml.png" alt="OPML" /></a>
</div>

<div class="box">
  <h1>Disclaimer</h1>
  <p>
    The opinions expressed herein are my own personal opinions and do not represent my employer's view in anyway.<br /><br />
    &copy; Copyright <%=DateTime.Now.Year %><br /><br />
    <asp:LoginStatus runat="Server" LoginText="Sign in" LogoutText="Sign out" EnableViewState="false" />
</p>
</div>