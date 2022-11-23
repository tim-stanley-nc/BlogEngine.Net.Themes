<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post xfolkentry">
    <h1><a class="postheader taggedlink" href="<%=Post.RelativeLink %>"><%=Post.Title %></a></h1>
    <div class="descr"><%=Post.DateCreated.ToString("dddd, d MMMM yyyy HH:mm")%> by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.Author %></a></div>
    <%-- <div class="entry"><%=Body %></div> This has been depreciated so please don't use it anymore. --%>
    <%-- Instead use the line below --%>
    <div class="entry"><asp:PlaceHolder ID="BodyContent" runat="server" /></div>
    <%=Rating %>
    <div class="info">
		<table>
			<% if (!String.IsNullOrEmpty(TagLinks(", "))) { %>
			<tr>
				<td valign="top">Tags: </td>
				<td>&nbsp;</td>
				<td valign="top" class="transformtext"><%=TagLinks(", ") %></td>
			</tr>
			<% } %>
			<tr>
				<td valign="top">Categories: </td>
				<td>&nbsp;</td>
				<td valign="top" class="transformtext"><%=CategoryLinks(" | ") %></td>
			</tr>
			<tr>
				<td valign="top">Actions: </td>
				<td>&nbsp;</td>
				<td valign="top">
					<%=AdminLinks %>
					<a rel="nofollow" href="mailto:?subject=<%=Post.Title %>&amp;body=Thought you might like this: <%=Post.AbsoluteLink.ToString() %>">E-mail</a> | 
					<a href="<%=Post.PermaLink %>" rel="bookmark">Permalink</a> |
					<a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Resources.labels.comments %> (<%=Post.ApprovedComments.Count %>)</a> |
					<a rel="nofollow" href="<%=CommentFeed %>">Comment RSS<asp:Image ID="Image1" runat="Server" ImageUrl="~/pics/rssButton.gif" AlternateText="RSS comment feed" ImageAlign="top" style="margin: 0 0 0 5px" /></a>
				</td>
			</tr>
		</table>
    </div>
</div>