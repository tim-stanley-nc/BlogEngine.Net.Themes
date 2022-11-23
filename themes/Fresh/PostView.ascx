<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<div class="CalendarGroup">
    <div class="Calendar">
        <span class="Month">
            <%=Post.DateCreated.ToString("MMM")%></span><br />
        <span class="Day">
            <%=Post.DateCreated.ToString("d.")%></span><br />
        <span class="Year">
            <%=Post.DateCreated.ToString("yyyy")%></span>
    </div>
</div>
<div class="TitleGroup">
    <h2>
        <a href="<%=Post.RelativeLink %>" title="<%=Server.HtmlEncode(Post.Title) %>">
            <%=Server.HtmlEncode(Post.Title)%></a>
    </h2>
    <div class="meta">
        Posted by: <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx">
            <%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author%></a>
        in Categories:
        <%=CategoryLinks(" | ")%>.<br />
        Tags:
        <%=TagLinks(", ")%>
    </div>
</div>
<div class="Clear">
</div>
<div class="PostContent">
    <asp:PlaceHolder ID="BodyContent" runat="server" />
    <script type="text/javascript"><!--
    google_ad_client = "pub-2873892966714049";
    /* Fresh BlogEngine.Net Theme, 468x60 */
    google_ad_slot = "6005551256";
    google_ad_width = 468;
    google_ad_height = 60;
    //-->
    </script>
    <script type="text/javascript"
    src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
    </script>
    <%=Rating%>
    <div class="CommentsGroup">
        <span class="CommentsCloud"><%=Post.ApprovedComments.Count%></span> <span class="CommentsText"> Comments</span></div>
    <div class="Bookmarks">
        <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">
            E-mail</a> | <a rel="nofollow" href="http://www.dotnetkicks.com/submit?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">
                Kick it!</a> | <a rel="nofollow" href="http://www.dzone.com/links/add.html?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">
                    DZone it!</a> | <a rel="nofollow" href="http://del.icio.us/post?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">
                        del.icio.us</a>
    </div>
    <div>
        <%=AdminLinks%>
        <a rel="bookmark" href="<%=Post.PermaLink %>">Permalink</a> | <a rel="nofollow" href="<%=Post.RelativeLink %>#comment">
            <%=Resources.labels.comments%>
            (<%=Post.ApprovedComments.Count%>)</a> | <a rel="nofollow" href="<%=CommentFeed %>">
                Post RSS</a></div>
</div>
