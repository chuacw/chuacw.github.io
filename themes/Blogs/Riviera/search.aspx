<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" />

    <CSControl:WrappedLiteral Tag="h3" ContainerId="titleWrapper" CssClass="contentheading" runat="server" Text="Search Results" />
    <CSControl:IndexPostList id="EntryItems" Runat="server">
        <QueryOverrides PagerID="pager" />
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <dl class="entrylist">
                <dt>
                    <CSControl:IndexPostData runat="server" Property="Title" LinkTo="Post" Tag="span" CssClass="entrylistheader" />
                    <br />
                    <div class="entryviewheadersub">
                        <span class="entrylistheadersub">
                            <CSBlog:WeblogPostData Property="UserTime" IncludeTimeInDate="true" runat="server"><LeaderTemplate>Published </LeaderTemplate></CSBlog:WeblogPostData>
                            <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server"><LeaderTemplate>| </LeaderTemplate></CSBlog:WeblogPostData>
                            <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />
                            <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_Edit" runat="server" />                        
                        </span>
                    </div>
                </dt>
                <dd>
                    <CSControl:IndexPostData Property="FormattedBody" TruncateAt="300" runat="server">
                        <TrailerTemplate> <CSControl:IndexPostData runat="server" LinkTo="post" Text="Read More..." /></TrailerTemplate>
                    </CSControl:IndexPostData>
                </dd>                          
            </dl>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSControl:IndexPostList>
    <CSControl:SinglePager id = "pager" runat = "Server"  />
</asp:Content>
