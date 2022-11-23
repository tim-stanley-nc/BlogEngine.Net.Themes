<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post xfolkentry">
    <div class="postheader">
		<h3><a class="postheader" href="<%=Post.RelativeLink %>" class="taggedlink"><%=Post.Title %></a></h3>
	    <ul class="post_info">
			<li class="date">Posted by
				<a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.Author %></a>
				on <%=Post.DateCreated.ToString("MMMM d, yyyy HH:mm")%>
			</li>
			<li class="comments">
				<a rel="nofollow" href="<%=Post.RelativeLink %>#comment">Comments (<%=Post.Comments.Count %>)</a>
			</li>
		</ul>	
    </div>
	<div class="postcontent"><%=Post.Content %></div>
    <br />
    <div class="postfooter">
        <%=Rating %><br />
        <%=TagLinks(", ") %><br />
        Categories: <%=CategoryLinks(" | ") %><br />
        Actions: <%=AdminLinks %>
        <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
        <a href="<%=Post.PermaLink %>">Permalink</a> |
        <a href="<%=Post.RelativeLink %>#comment">Comments (<%=Post.Comments.Count %>)</a>
        <a rel="nofollow" href="<%=CommentFeed %>"><asp:Image ID="Image1" runat="Server" ImageUrl="~/pics/rssbutton.gif" AlternateText="RSS comment feed" /></a> |
        <a href="<%=Post.TrackbackLink %>">Trackback</a>
		<br />
		
    </div>
    <br />
</div>