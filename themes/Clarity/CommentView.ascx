<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>
<blockquote>
    <div id="id_<%=Comment.Id %>" class="comment<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
        <p class="date">
            <%= Comment.DateCreated.ToString("MMMM d. yyyy HH:mm") %>
            <%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\">" + Comment.Author + "</a>" : Comment.Author %>
            <%= AdminLinks %>
        </p>
        
            <div class="gravitar">
                <%= Gravatar(80)%>
            </div>
            <div class="commentcontent">
                <i><%= ResolveLinks(Comment.Content) %></i>
            </div>
        
    </div>
</blockquote>
