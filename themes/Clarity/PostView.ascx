<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<div class="post xfolkentry">
    <h2>
        <a href="<%=Post.RelativeLink %>">
            <%=Post.Title %>
        </a>
    </h2>
    <div class="articleinfo">
        Posted on
        <%=Post.DateCreated.ToString("MMMM d, yyyy HH:mm")%>
        by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx">
            <%=Post.Author %>
        </a>
        <br />
        <%=TagLinks(", ") %>
        <br />
        Categories:
        <%=CategoryLinks(" | ") %>
        <br />
        Actions:
        <%=AdminLinks %>
        <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">
            E-mail</a> | <a href="<%=Post.PermaLink %>">Permalink</a> | <a href="<%=Post.RelativeLink %>#comment">
                Comments (<%=Post.Comments.Count %>)</a> | <a href="<%=Post.TrackbackLink %>">Trackback</a>
    </div>
    <p>
        <%=Post.Content %>
        
       <span class="ratingsection"> <%=Rating %></span>
    </p>
</div>
