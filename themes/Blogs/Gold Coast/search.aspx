<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" />

    <CSControl:WrappedLiteral Tag="h3" CssClass="contentheading" runat="server" Text="Search Results" />
    <CSControl:IndexPostList id="EntryItems" Runat="server">
        <QueryOverrides PagerID="pager" />
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <dl class="entrylist">
               <dt><CSControl:IndexPostData runat="server" Property="Title" LinkTo="Post" CssClass="posthead" /></dt>
               <dd>
                   <CSControl:IndexPostData Property="FormattedBody" TruncateAt="300" runat="server" />

                   <div class="entrylistfooter">	
                        <span class="em">Posted </span>
                        <CSControl:IndexPostData Property="PostDate" LinkTo="Post" FormatString="ddd, d MMMM, yyyy @ hh:mm tt" runat="server" />
					    <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
					    <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
					    <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" >
					        <LeaderTemplate> | </LeaderTemplate>
					    </CSBlog:WeblogPostRating>
                        <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_EditPost" runat="server" />
                        <CSBlog:WeblogPostTagEditableList runat="server" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />
                    </div>
                </dd>                         
            </dl>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSControl:IndexPostList>
    <CSControl:SinglePager id = "pager" runat = "Server"  />
</asp:Content>
