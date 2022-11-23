<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>



<div id="post">
<div id="postheader">
<div id="postheadline"><h2><a href="<%=Post.RelativeLink %>"><%=Post.Title %></a></h2></div>
<div id="postauthor"><a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.Author %></a> posted on <%=Post.DateCreated.ToString("MMMM d, yyyy HH:mm")%></div>
<div id="postdate"></div>
</div><br />
<div id="postentry"><asp:PlaceHolder ID="BodyContent" runat="server" /></div>
<br />
<div id="postcategories">Posted in: <%=CategoryLinks(" , ") %>&nbsp;&nbsp;Tags: <%=TagLinks(", ") %></div>
<div id="postactions">Actions: 
    <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
    <a href="<%=Post.PermaLink %>" rel="bookmark">Permalink</a> | 
    <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Resources.labels.comments %> (<%=Post.ApprovedComments.Count %>)</a> |
    <a rel="nofollow" href="<%=CommentFeed %>">Comment RSS<asp:Image ID="Image1" runat="Server" ImageUrl="~/pics/rssbutton.gif" AlternateText="RSS comment feed" style="margin-left:3px;padding-top:3px;" /></a> |
    <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
    <a rel="nofollow" href="http://www.dotnetkicks.com/submit?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">Kick it!</a> | 
    <a rel="nofollow" href="http://www.dzone.com/links/add.html?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">DZone it!</a> | 
    <a rel="nofollow" href="http://del.icio.us/post?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">del.icio.us</a>
</div>
<% if (BlogEngine.Core.Utils.IsAuthenticated) { %>
	<div id="postadmin">Admin: <%=AdminLinks%></div>  
<%} %>
<div id="postrating"><%=Rating %></div><br />
</div>