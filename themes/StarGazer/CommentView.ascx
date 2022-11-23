<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CommentView.ascx.cs" Inherits="themes_StarGazer_CommentView" %>

<div id="id_<%=Comment.Id %>" class="comment<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
  <p class="date"><%= Comment.DateCreated.ToString("MMMM d. yyyy HH:mm") %></p>
  <p class="gravatar"><%= Gravatar(80) %></p>
  <p class="content"><%= ResolveLinks(Comment.Content) %></p>
  <p class="author">
    <%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\">" + Comment.Author + "</a>" : Comment.Author %>
    <%= AdminLinks %>
  </p>
</div>