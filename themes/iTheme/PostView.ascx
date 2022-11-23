<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<div class="post">
    <div class="date">
        <span>
            <%=Post.DateCreated.ToString ("MMM")%></span>
        <%=Post.DateCreated.ToString("dd")%></div>
    <div class="title">
        <h2>
            <a href="<%=Post.RelativeLink %>">
                <%=Post.Title %>
            </a>
        </h2>
        <div class="postdata">
            <span class="category">
                <%=CategoryLinks(" | ") %>
            </span><span class="comments"><a href="<%=Post.RelativeLink %>" title="<%=Post.Title %>">
                <% if (Post.ApprovedComments.Count == 0) { %>
                No
                <%}
                   else {%>
                <%=Post.ApprovedComments.Count%>
                <%}
                %>
                Comments &#187;</a> </span>
        </div>
    </div>
    <div class="entry">
        <asp:PlaceHolder ID="BodyContent" runat="server" />
    </div>
    <!--/entry -->
    <div class="tags">
        Tags:
        <%=TagLinks(" | ") %>
        <br />
    </div>
    <% if (BlogEngine.Core.Utils.IsAuthenticated) { %>
    <div class="admin">
        Admin: <%=AdminLinks %>
    </div>
    <%} 
    %>
</div>
