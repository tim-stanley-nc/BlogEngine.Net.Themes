<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>
<br />
<div id="comments">
<div id="id_<%=Comment.Id %>" class="comment<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
    <div id="commentheader">
        <div id="commentauthor"><%= Flag %>&nbsp;<%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\">" + Comment.Author + "</a>" : Comment.Author %></div>
        <div id="commentdate"><%= Comment.DateCreated.ToString("MMMM d. yyyy HH:mm") %></div>
    </div>
    <div id="commentgravatar"><%= Gravatar(60)%></div>
    <div id="commentcontent"><%= ResolveLinks(Comment.Content) %></div>
    <div id="commentadmin"><%= AdminLinks %></div>
    <br />
    <%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\">" + Comment.Website + "</a>" : "no site" %><%= Comment.Website  %>
    <br />
</div>
</div>
<br />