<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SidePanel.ascx.cs" EnableViewState="false"
    Inherits="User_controls_SidePanel" %>
<%@ Register Src="~/admin/menu.ascx" TagName="menu" TagPrefix="uc1" %>
<%@ Import Namespace="BlogEngine.Core" %>

<!-- admin start -->
<% if (Utils.IsAuthenticated) { %>
<!--sidebox start -->
<div id="Div1" class="dbx-box widget_categories">
    <h3 class="dbx-handle">
        Administration</h3>
    <div class="dbx-content">
        <uc1:menu ID="Menu1" runat="server" />
    </div>
</div>
<!--sidebox end -->
<%} 
%>
<!-- admin end -->
<!--sidebox start -->
<div id="categories" class="dbx-box widget_categories">
    <h3 class="dbx-handle">
        Categories</h3>
    <div class="dbx-content">
        <blog:CategoryList ID="CategoryList1" ShowRssIcon="false" runat="Server" />
    </div>
</div>
<!--sidebox end -->
<!--sidebox start -->
<div id="archives" class="dbx-box widget_archives">
    <h3 class="dbx-handle">
        Archives</h3>
    <div class="dbx-content">
        <blog:MonthList ID="MonthList" runat="Server" />
    </div>
</div>
<!--sidebox end -->
<!--sidebox start -->
<div id="pages" class="dbx-box widget_rss">
    <h3 class="dbx-handle">
        Pages</h3>
    <div class="dbx-content">
        <blog:PageList ID="PageList1" runat="Server" />
    </div>
</div>
<!--sidebox end -->
<!--sidebox start -->
<div id="rss-1" class="dbx-box widget_rss">
    <h3 class="dbx-handle">
        Blogroll</h3>
    <div class="dbx-content">
        <blog:Blogroll ID="TagCloud2" runat="server" />
    </div>
</div>
<!--sidebox end -->
<!--sidebox start -->
<div id="disclaimer" class="dbx-box widget_rss">
    <h3 class="dbx-handle">
        Disclaimer</h3>
    <div class="dbx-content">
        The opinions expressed herein are my own personal opinions and do not represent
        my employer's view in anyway.
        <br />
        <br />
        &copy; Copyright 2007
    </div>
</div>
<!--sidebox end -->
