<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<div class="post">            
    <h1><a href="<%=Post.RelativeLink %>" title="Permanent Link to <%=Server.HtmlEncode(Post.Title) %>"><%=Server.HtmlEncode(Post.Title) %></a></h1>
    <p class="small">Posted by <%=Post.Author %> on <%=Post.DateCreated.ToString("d. MMMM yyyy HH:mm") %></p>
    <%=AdminLinks %>
    <asp:PlaceHolder ID="BodyContent" runat="server" />
     <div class="postmeta">
        <h4><%=Rating %></h4>
        <h4>Comments: <%=Post.ApprovedComments.Count %></h4>
        <h4>Filed Under: <%=CategoryLinks(" | ") %></h4>
        Tags: <%=TagLinks(", ") %>
    </div>
</div>

