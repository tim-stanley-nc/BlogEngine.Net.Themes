<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PostView.ascx.cs" Inherits="themes_curiouslygreen_PostView" %>

<div class="post xfolkentry">
    <h1><a class="postheader taggedlink" href="<%=Post.RelativeLink %>"><%=MarkUpTitle(Post.Title) %></a></h1>
    
    <%=Post.Content %>
    <div class="divider"></div>
    <div class="summary">
        <%=Post.DateCreated.ToString("MMMM d, yyyy HH:mm")%> by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.Author %></a>
        <br />
        <%=AdminLinks %>
        <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
        <a rel="nofollow" href="<%=Post.PermaLink %>">Permalink</a> |
        <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Resources.labels.comments %> (<%=Post.Comments.Count %>)</a> |
        <a rel="nofollow" href="<%=CommentFeed %>">Comment RSS<asp:Image ID="Image1" runat="Server" ImageUrl="~/pics/rssbutton.gif" AlternateText="RSS comment feed" style="margin-left:3px" /></a>
    </div>
</div>