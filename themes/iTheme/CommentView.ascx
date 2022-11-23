<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>
<div id="id_<%=Comment.Id %>" class="comment<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
    <p class="author">
        <%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\">" + Comment.Author + "</a>" : Comment.Author %>
        <%= AdminLinks %>
    </p>
    <p class="date">
        Posted on
        <%= Comment.DateCreated.ToString("dddd, d MMMM yyyy HH:mm")%>
    </p>
    <p class="content">
        <%= ResolveLinks(Comment.Content) %>
    </p>
</div>
