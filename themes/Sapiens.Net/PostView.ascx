<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post content-item">
  <h2 class="post-title content-item-top"><a href="<%=Post.RelativeLink %>" class="taggedlink"><%=Server.HtmlEncode(Post.Title) %></a></h2>
 <div class="content-item-middle-wrapper">
<div class="post-text content-item-middle">
  <asp:PlaceHolder ID="BodyContent" runat="server" />
  <div class="post-tags">
  <% if (Post.Tags.Count > 0)
	 { %>
  <div class="tags"><b>
    Tags:</b> <%=TagLinks(", ")%></div>
  <% } %>
  <% if (Post.Categories.Count > 0)
	 { %>
    <div class="categories">
   <b><%= Resources.labels.categories%>:</b>
    <%=CategoryLinks(" | ")%></div>
    <% } %>
      <%=Rating %>
    </div>
     
  </div>
  <div class="post-footer">   
    <div class="bookmarks">
      <a rel="nofollow" href="<%=CommentFeed %>">Post RSS<img src="<%=VirtualPathUtility.ToAbsolute("~/pics/")%>rssButton.gif" alt="RSS comment feed" style="margin-left:3px" /></a>  | 
      <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
      <a rel="nofollow" href="http://www.dotnetkicks.com/submit?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">Kick it!</a> | 
      <a rel="nofollow" href="http://www.dzone.com/links/add.html?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">DZone it!</a> | 
      <a rel="nofollow" href="http://del.icio.us/post?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">del.icio.us</a>      
    </div>
    </div>
</div>
  
  </div>
  
  <div class="bottom-info content-item-bottom">
  <div class="meta-post">
    <span class="pubDate"><%=Post.DateCreated.ToString("d. MMMM yyyy HH:mm") %></span>
    by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author %></a> | 
        <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Resources.labels.comments %> (<%=Post.ApprovedComments.Count %>)</a>
     | <a rel="bookmark" href="<%=Post.PermaLink %>">Permalink</a> 
    
 <span class="admin_links"><%=AdminLinks%></span>

  </div>

  </div>

  