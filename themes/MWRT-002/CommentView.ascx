<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>

<div id="id_<%=Comment.Id %>" class="comment<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
	<p class="date"><%= Comment.DateCreated %></p>
	<p class="gravatar"><%= Gravatar(80)%></p>
	<p class="content"><%= ResolveLinks(Comment.Content) %></p>
	<p class="author">
		<%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\">" + Comment.Author + "</a>" : Comment.Author %>
		<%= Flag %>
		<%= AdminLinks %>
	</p>
</div>