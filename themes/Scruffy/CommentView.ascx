<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>

<div id="id_<%=Comment.Id %>" class="vcard comment<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
  <div class="commentmeta clearfix">
    <div class="gravatar">
    <%= Gravatar(40)%>
    </div>
<span class="commentauthor">
    <%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\" class=\"url fn\">" + Comment.Author + "</a>" : "<span class=\"fn\">" + Comment.Author + "</span>"%>
    <%=Flag%>
    <%=AdminLinks%>
</span>
<br/>
<span class="commentdate"><%= Comment.DateCreated%></span>
<span class="commentpermalink">
<a href="#id_<%=Comment.Id %>">Permalink</a>
</span>
</div>
<div class="commententry">
<p><%= Text%></p>
</div>
</div>