<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<div class="post xfolkentry">
    <h2 class="title">
        <a href="<%=Post.RelativeLink %>" class="taggedlink">
            <%=Post.Title %>
        </a>
    </h2>
    <div class="story">
        <asp:PlaceHolder ID="BodyContent" runat="server" />
    </div>
    <div class="meta">
        <p class="date">
            Posted on
            <%=Post.DateCreated %>
            by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx">
                <%=Post.Author %>
            </a>
        </p>
        <p class="file">
            <a rel="bookmark" href="<%=Post.PermaLink %>">Permalink</a> | <a rel="nofollow" href="<%=Post.RelativeLink %>#comment">
                <%=Resources.labels.comments %>
                (<%=Post.ApprovedComments.Count %>)</a> | <a rel="nofollow" href="<%=CommentFeed %>">
                    Post RSS<asp:Image ID="Image1" runat="Server" ImageUrl="~/pics/rssButton.gif" AlternateText="RSS comment feed"
                        Style="margin-left: 3px" /></a> |
            <%=AdminLinks %>
        </p>
        <p class="date">Categories:
            <%=CategoryLinks(" | ") %>
        </p>
        <p class="date">
            Tags:
            <%=TagLinks(", ") %>
        </p><%=Rating %>
    </div>
</div>
