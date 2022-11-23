<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post xfolkentry">
  <h2><a href="<%=Post.RelativeLink %>" class="taggedlink"><%=Server.HtmlEncode(Post.Title) %></a></h2>
  
  <span class="author">Posted by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author%></a></span> |
  <span class="tags">Filed under <%=TagLinks(", ") %></span>
  
  <div class="text"><asp:PlaceHolder ID="BodyContent" runat="server" /></div>
  
  <%=Rating %>
  
  <div class="post-footer">    
	<div class="bookmarks">
      <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
      <a rel="nofollow" href="http://www.dotnetkicks.com/submit?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">Kick it!</a> | 
      <a rel="nofollow" href="http://www.dzone.com/links/add.html?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">DZone it!</a> | 
      <a rel="nofollow" href="http://del.icio.us/post?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">del.icio.us</a>      
    </div>

	<%=AdminLinks %>
	<a rel="bookmark" href="<%=Post.PermaLink %>">Permalink</a> |
    <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Resources.labels.comments %> (<%=Post.ApprovedComments.Count %>)</a> |
    <%=Post.DateCreated.ToString("MMMM d, yyyy HH:mm") %>
  </div>
</div>