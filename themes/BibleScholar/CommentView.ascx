<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>

<% if (Post.IsCommentsEnabled) {%>
<div class="vcard comments<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
	<ul>
        <li class="comment" id="comment-<%=Comment.Id %>">
        	<div style="float:left; margin-right:10px;"><%= Gravatar(75)%></div>
			<div style="float:left; width:350px;">
			    <p style="float:none;"><strong><%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\">" + Comment.Author + "</a>" : Comment.Author %></strong> said,</p>
			    <%if (!Comment.IsApproved) {%>
			        <p><em>Your comment is awaiting moderation.</em></p>
			    <%} else { %>
                    <p><%= Text %></p>
                <%} %>
            </div>
            <div style="clear:both; float:none;"></div>
            <%= AdminLinks %>
		</li>
	</ul>	
</div>

<%} else { %>
    <p class="nocomments">Comments are closed.</p>
<%} %>

