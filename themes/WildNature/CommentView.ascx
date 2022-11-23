<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>

<div id="id_<%=Comment.Id %>" class="comment<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
        <div class="date"><%= Comment.DateCreated %></div>
        <div class="author">
        <%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\">" + Comment.Author + "</a>" : Comment.Author %> <%= Flag %>
        </div>
        <%= AdminLinks %>
        <div class="gravatar"><%= Gravatar(80)%></div>
        <div class="content"><%= Text %></div>
</div>