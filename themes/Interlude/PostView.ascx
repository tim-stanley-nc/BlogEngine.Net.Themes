<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post xfolkentry">
    <p class="date"><%=Post.DateCreated.ToString("MMMM") %><b><%=Post.DateCreated.ToString("dd") %></b></p>
    <h1><a href="<%=Post.RelativeLink %>" class="taggedlink"><%=Post.Title %></a></h1>
    <div class="meta">
        <span class="tags">Tags: <%=TagLinks(", ") %></span> | <span class="categories">Categories: <%=CategoryLinks(" | ") %></span>
        <br />
        <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
        <a rel="bookmark" href="<%=Post.PermaLink %>">Permalink</a> | 
        <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"> <%=Resources.labels.comments %> (<%=Post.ApprovedComments.Count %>)</a> | 
        <a rel="nofollow" href="<%=CommentFeed %>">Post RSS<img src="<%=VirtualPathUtility.ToAbsolute("~/pics/")%>rssButton.gif" alt="RSS comment feed" style="margin-left: 3px" /></a>
        
    </div>
    <div class="entry">
        <asp:PlaceHolder ID="BodyContent" runat="server" />
        <%=Rating %>
        <%=AdminLinks %>
    </div> 
</div>
