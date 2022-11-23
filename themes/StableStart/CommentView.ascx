<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>
<%@ Import Namespace="BlogEngine.Core" %>
<br />
<div id="comments">
<div id="id_<%=Comment.Id %>" class="vcard comment<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
    <div id="commentheader">
        <div id="commentauthor"><%= Flag %>&nbsp;<%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\" target=_blank >" + Comment.Author + "</a>" : Comment.Author %><%= Comment.Website != null ? "  (<a href=\"" + Comment.Website + "\" target=_blank >" + "website link" + "</a>)" : "&nbsp;"%></div>
        <div id="commentdate"><%= Comment.DateCreated.ToString("MMMM d. yyyy HH:mm") %></div>
    </div>
    <div id="commentgravatar"><%= Gravatar(60)%></div>
    <div id="commentcontent" align="left"><%= ResolveLinks(Comment.Content) %></div>
</div>
</div>
<% if (Utils.IsAuthenticated) { %>
    <div id="commentadmin" nowrap>Admin Menu <%= AdminLinks %></div>
<%} %>

<br />