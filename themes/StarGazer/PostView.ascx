<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PostView.ascx.cs" Inherits="themes_StarGazer_PostView" %>

<div class="post">
    <h2 class="title"><a href="<%=Post.RelativeLink %>"><%=Post.Title %></a></h2>
    <div class="entry">
        <p>
            <asp:PlaceHolder ID="BodyContent" runat="server" />
            <br />
            <%=Rating %>
            Tags: <%=TagLinks(", ") %><br />
            Categories: <%=CategoryLinks(" | ") %><br />
        </p>
    </div>
    <p class="meta">
        <span class="byline">Posted by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.Author %></a> on <%=Post.DateCreated.ToString("MMMM d, yyyy HH:mm") %></span> <a href="<%=Post.RelativeLink %>#comment" class="comments"><%=Post.Comments.Count %> <%=Resources.labels.comments %></a>
        <br />
        Actions: <%=AdminLinks %>
        <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
        <a rel="nofollow" href="<%=Post.PermaLink %>">Permalink</a> |
        <a rel="nofollow" href="<%=CommentFeed %>">Comment RSS<asp:Image ID="Image1" runat="Server" ImageUrl="~/pics/rssbutton.gif" AlternateText="RSS comment feed" style="margin-left:3px" /></a>
    </p>
</div>

