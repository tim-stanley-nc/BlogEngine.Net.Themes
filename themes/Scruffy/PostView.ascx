<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<script runat="server">

    protected string IsFirst()
    {
        Response.Write(this.Parent);
        if (Post.Next == null)
            return "class='post xfolkentry first'";
        else
            return "class='post xfolkentry'";
    }

</script>


<div class='post xfolkentry'>
  <h2 class="title"><a href="<%=Post.RelativeLink %>" class="taggedlink"><%=Server.HtmlEncode(Post.Title) %></a></h2>
  <p class="postmetadata">
    <span class="date"><%=Post.DateCreated.ToString("d. MMMM yyyy HH:mm") %></span>
    <span class="author">
        By
        <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author %></a>
    </span>
    <span class="comments">
    <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Post.ApprovedComments.Count %></a>
    </span>
    <span class="category">
        In
        <%=CategoryLinks(" | ") %>
    </span>
  </p>
  
  
  <div class="text"><asp:PlaceHolder ID="BodyContent" runat="server" /></div>
  <div class="bottom">
    <%=Rating %>
    <p class="tags">Tags: <%=TagLinks(", ") %></p>
  </div>

  <div class="footer">    
    <div class="bookmarks">
      <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
      <a rel="nofollow" href="http://www.dotnetkicks.com/submit?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">Kick it!</a> | 
      <a rel="nofollow" href="http://www.dzone.com/links/add.html?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">DZone it!</a> | 
      <a rel="nofollow" href="http://del.icio.us/post?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">del.icio.us</a>      
    </div>
    
    <%=AdminLinks %>
    <a rel="bookmark" href="<%=Post.PermaLink %>">Permalink</a> |
    <a rel="nofollow" href="<%=CommentFeed %>">Post RSS<img src="<%=VirtualPathUtility.ToAbsolute("~/pics/")%>rssButton.gif" alt="RSS comment feed" style="margin-left:3px" /></a>    
  </div>
  <div class="postbottom">  </div>
</div>