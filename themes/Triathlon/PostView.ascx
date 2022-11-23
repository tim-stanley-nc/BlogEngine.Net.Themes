<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<div class="post">
    <div class="posthead">
        <h2>
            <a class="postheader taggedlink" href="<%=Post.RelativeLink %>">
                <%=Post.Title %></a>
        </h2>
        <div class="descr">
            <img id="Img3" src="~/themes/indigo/img/timeicon.gif" runat="server" alt="clock" />
            <%=Post.DateCreated.ToString("MMMM d, yyyy HH:mm")%>
            by
            <img id="Img5" src="~/themes/indigo/img/author.gif" runat="server" alt="author" />
            <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx">
                <%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author%></a></div>
        <div class="postcontent">
            <asp:PlaceHolder ID="BodyContent" runat="server" />
        </div>
        <!-- end posthead -->
        <div class="postfooter">
            Tags:
            <%=TagLinks(", ") %><br />
            Categories:
            <%=CategoryLinks(" | ") %><br />
            Actions:
            <%=AdminLinks %>
            <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">
                E-mail</a> | <a rel="nofollow" href="http://www.dotnetkicks.com/submit?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">
                    Kick it!</a> | <a href="<%=Post.PermaLink %>" rel="bookmark">Permalink</a>
            | <a rel="nofollow" href="<%=Post.RelativeLink %>#comment">
                <img id="Img6" runat="server" alt="comment" src="~/themes/indigo/img/comments.gif" /><%=Resources.labels.comments %>
                (<%=Post.ApprovedComments.Count %>)</a> | <a rel="nofollow" href="<%=CommentFeed %>">
                    <asp:Image ID="Image2" runat="Server" ImageUrl="~/pics/rssButton.gif" AlternateText="RSS comment feed"
                        Style="margin-right: 3px" />Comment RSS</a>
        </div>
        <br />
    </div>
    </div> 
    <!-- end post -->
