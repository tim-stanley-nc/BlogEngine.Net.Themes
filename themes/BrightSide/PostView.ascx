<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<script runat="server">

    protected string GetColoredTitle(string title)
    { 
        string[] splitTitle;
        splitTitle = title.Split(' ');

        if (splitTitle.Length == 1)
            return title;
        else
        {
            int iGreen = splitTitle.Length / 3;
            if (iGreen == 0)
                iGreen = 1;
            string result = String.Join(" ", splitTitle, 0, splitTitle.Length - iGreen);
            result += @" <span class=""green"">" + String.Join(" ", splitTitle, splitTitle.Length - iGreen, iGreen) + "</span>";

            return result;
        }
    
    }

</script>


<div class="post-main">
    <h1 class="postheader" ><a class="postheader taggedlink" href="<%=Post.RelativeLink %>"><%=GetColoredTitle(Post.Title)%></a></h1>
    <div class="date"><%=Post.DateCreated.ToString("MMMM d, yyyy HH:mm")%> by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.Author %></a></div>
    <!--<div class="entry">-->
        <%-- <%=Body %> This has been depreciated so please don't use it anymore. --%>
        <%-- Instead use the line below --%>
        <div><asp:PlaceHolder ID="BodyContent" runat="server" /></div>
        <br /><%=Rating %>
    <!--</div>-->
</div>
    <div class="post-footer">
        Tags: <%=TagLinks(", ") %><br />
        Categories: <%=CategoryLinks(" | ") %><br />
        Actions: <%=AdminLinks %>
        <a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
        <a href="<%=Post.PermaLink %>" rel="bookmark">Permalink</a> |
        <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Resources.labels.comments %> (<%=Post.ApprovedComments.Count %>)</a> |
        <a rel="nofollow" href="<%=CommentFeed %>">Comment RSS<asp:Image ID="Image1" runat="Server" ImageUrl="~/pics/rssbutton.gif" AlternateText="RSS comment feed" style="margin-left:3px" /></a>
    </div>
