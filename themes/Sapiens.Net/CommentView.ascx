<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>

<div id="id_<%=Comment.Id %>" class="vcard wrapper <%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
<div class="top-info">

  <span class="gravatar"><%= Gravatar(32)%></span>
  <span class="author">
    <%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\" class=\"url fn\">" + Comment.Author + "</a>" : "<span class=\"fn\">" +Comment.Author + "</span>" %>
<%= Flag %>   
        </span>
  </div>
  <div class="comment-text"><%= Text %></div>
  
  <div class="bottom-info">
  <%= Comment.DateCreated %> <a href="#id_<%=Comment.Id %>">#</a>   <%= AdminLinks %>
  </div>
</div>
