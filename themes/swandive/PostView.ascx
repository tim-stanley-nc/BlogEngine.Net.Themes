<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post xfolkentry">
    <h1><a class="postheader taggedlink" href="<%=Post.RelativeLink %>"><%=Post.Title %></a></h1>
    <div class="descr"><%=Post.DateCreated.ToString("MMMM d, yyyy HH:mm")%> by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.Author %></a></div>
    <div class="entry"><asp:PlaceHolder ID="BodyContent" runat="server" />
    
        <br /><%=Rating %>
    </div>
    <div class="info">
        Tags: <%=TagLinks(", ") %><br />
        Categories: <%=CategoryLinks(" | ") %><br />
        Actions: <%=AdminLinks %>
        <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
        <a rel="bookmark" href="<%=Post.PermaLink %>">Permalink</a> |
        <a href="<%=Post.RelativeLink %>#comment">Comments (<%=Post.ApprovedComments.Count %>)</a> |
        <a rel="nofollow" href="<%=CommentFeed %>">Comment RSS<asp:Image ID="Image1" runat="Server" ImageUrl="~/pics/rssbutton.gif" AlternateText="RSS comment feed" style="margin-left:3px" /></a>
    </div>
</div>