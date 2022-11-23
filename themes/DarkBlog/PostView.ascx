<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post xfolkentry">
  
  <div class="postheaderbox">
      <h1><a href="<%=Post.RelativeLink %>" class="taggedlink"><%=Post.Title %></a></h1>
      
      <div class="bottom">
        
        <div class="categories">
            Published <%=Post.DateCreated.ToShortDateString() %> 
            by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.Author %></a>
            
            <%  if (CategoryLinks(" | ") != null)
                {
                    if (CategoryLinks(" | ").Length > 0)
                    { %>
                     in <%=CategoryLinks(" | ")%>
            <% }} %>
        </div>
        
        <% if (TagLinks(", ") != null) { %>
            <div class="tags">Tags: <%=TagLinks(", ") %></div>
        <% } %>
      </div>
  </div>
  
  <div class="postText">
    <asp:PlaceHolder ID="BodyContent" runat="server" />
  </div>
  
  <div class="rating"><%=Rating %></div><br />

  <div class="postFoot">
    <div class="bookmarks">
      <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
      <a rel="nofollow" href="http://www.dotnetkicks.com/submit?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">Kick it!</a> | 
      <a rel="nofollow" href="http://www.dzone.com/links/add.html?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">DZone it!</a> | 
      <a rel="nofollow" href="http://del.icio.us/post?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">del.icio.us</a>      
    </div>
    
    <div class="floatright">
        <%=AdminLinks %>
        <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Resources.labels.comments %> (<%=Post.ApprovedComments.Count %>)</a> |
        <a rel="nofollow" href="<%=Post.PermaLink %>">Permalink</a> |
        <a rel="nofollow" href="<%=CommentFeed %>">Post RSS</a>  
    </div>
  </div>
</div>