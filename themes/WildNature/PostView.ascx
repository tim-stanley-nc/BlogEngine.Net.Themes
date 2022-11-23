<%@ Control Language="C#" AutoEventWireup="true" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<div class="post xfolkentry">
    <div class="date">
        <span id="month"><%=Post.DateCreated.ToString("MMM")%></span>
        <span id="day"><%=Post.DateCreated.ToString("dd")%></span>
        <span id="year"><%=Post.DateCreated.ToString("yyyy")%></span>
    </div>
    <div class="entirepost">
        <h1>
            <a class="postheader taggedlink" href="<%=Post.RelativeLink %>">
                <%=Post.Title %>
            </a>
        </h1>
        <div class="descr">
            <%=AdminLinks %>
            by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx">
                <%=Post.Author %></a> | 
            <a rel="nofollow" href="<%=Post.RelativeLink %>#comment">
                <%=Post.ApprovedComments.Count %>
                <%=Resources.labels.comments %></a>
        </div>
        <div class="entry">
            <asp:PlaceHolder ID="BodyContent" runat="server" />
        </div>
        <%=Rating %>
        <div id="PostInfo" class="info">
            <span style="padding: 2px 0px 0px 0px; display: block;">Tags:
                <%=TagLinks(", ") %>
                | Categories:
                <%=CategoryLinks(" , ") %>
            </span><span style="padding: 2px 0px 0px 0px;">Share it: <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">
                Send to a friend</a> | <a rel="nofollow" href="http://www.stumbleupon.com/submit?url=<%=Post.RelativeLink %>&title=<%=Post.AbsoluteLink.ToString() %>">
                    Stumble it!</a> | <a rel="nofollow" href="http://www.dotnetkicks.com/submit?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">
                        Kick it!</a> | <a rel="nofollow" href="http://www.dzone.com/links/add.html?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">
                            DZone it!</a> | <a rel="nofollow" href="http://del.icio.us/post?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">
                                del.icio.us</a> </span>
        </div>
    </div>
</div>
