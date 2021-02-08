<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" />

    <CSControl:WrappedLiteral Tag="h2" ContainerId="titleWrapper" CssClass="pageTitle" runat="server" Text="Search Results" />
    <CSControl:IndexPostList id="EntryItems" Runat="server">
        <QueryOverrides PagerID="pager" />
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <div class="post">
                <div class="posthead">
                    <CSControl:IndexPostData runat="server" Property="Title" LinkTo="Post" Tag="H2" />
                </div>
                <CSControl:IndexPostData Property="FormattedBody" TruncateAt="300" runat="server" CssClass="postcontent" Tag="div" />
            </div>
            <div class="postfoot">	
                <span class="em">Posted </span>
                <CSControl:IndexPostData Property="PostDate" LinkTo="Post" FormatString="f" runat="server" />
				<CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
				<CSControl:IndexPostData Property="UserName" runat="server" />
				<CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_Edit" runat="server" />
            </div>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSControl:IndexPostList>
    <CSControl:SinglePager id = "pager" runat = "Server"  />
</asp:Content>
