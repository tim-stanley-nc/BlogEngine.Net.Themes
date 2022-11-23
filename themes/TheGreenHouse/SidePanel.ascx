<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SidePanel.ascx.cs" EnableViewState="false"
    Inherits="User_controls_SidePanel" %>
<%@ Register Src="~/admin/menu.ascx" TagName="menu" TagPrefix="uc1" %>
<%@ Import Namespace="BlogEngine.Core" %>


<% if (Page.User.Identity.IsAuthenticated)
   { %>
<div class="links">
    <br />
    <h2>
        Administration</h2>
    <uc1:menu ID="Menu1" runat="server" />
</div>
<%} %>
<div class="links">
    <br />
    <h2>
        Calendar</h2>
    <div style="text-align: center">
        <blog:PostCalendar runat="Server" NextMonthText=">>" DayNameFormat="FirstTwoLetters"
            FirstDayOfWeek="monday" PrevMonthText="<<" CssClass="calendar" BorderWidth="0"
            WeekendDayStyle-CssClass="weekend" OtherMonthDayStyle-CssClass="other" UseAccessibleHeader="true"
            EnableViewState="false" />
        <br />
        <a href="<%=Utils.AbsoluteWebRoot %>calendar/default.aspx" />View posts in large calendar</a>
    </div>
</div>
<div class="links">
    <br />
    <h2>
        <%=Resources.labels.pages %>
    </h2>
    <blog:PageList runat="Server" />
</div>
<div class="links">
    <br />
    <h2>
        <%=Resources.labels.archive %>
    </h2>
    <blog:MonthList runat="server" />
</div>
<div class="links">
    <br />
    <h2>
        Authors</h2>
    <blog:AuthorList runat="Server" />
</div>
<div class="links">
    <br />
    <h2>
        Tags</h2>
    <blog:TagCloud runat="server" />
</div>
<div class="links">
    <br />
    <h2>
        <%=Resources.labels.categories %>
    </h2>
    <blog:CategoryList runat="Server" />
    <br />
    <a href="~/archive.aspx" runat="Server">Archive</a>
    <%--  <blog:Searchlinks runat="server" />--%>
</div>
<div class="links">
    <br />
    <h2>
        <%=Resources.labels.blogroll %>
    </h2>
    <blog:Blogroll runat="server" />
    <a href="opml.axd" style="display: block; text-align: right" title="Download OPML file">
        Download OPML file
        <asp:Image ID="Image1" runat="server" ImageUrl="~/pics/opml.png" AlternateText="OPML" /></a>
</div>
<div class="links">
    <br />
    <h2>
        Disclaimer</h2>
    <ul>
        The opinions expressed herein are my own personal opinions and do not represent
        my employer's view in anyway.<br />
        <br />
        &copy; Copyright
        <%=DateTime.Now.Year %>
        <br />
        <br />
        <asp:LoginStatus runat="Server" LoginText="Sign in" LogoutText="Sign out" EnableViewState="false" />
    </ul>
</div>
