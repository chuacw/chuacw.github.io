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
                    <span class="em">Posted:</span>
                    <CSControl:IndexPostData Property="PostDate" LinkTo="Post" FormatString="f" runat="server" />
					<CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
					<CSControl:IndexPostData Property="UserName" runat="server" LinkTo="author" /> 
                </div>
                <CSControl:IndexPostData Property="FormattedBody" TruncateAt="300" runat="server" />

                <div class="postfoot">
                    <CSControl:PlaceHolder runat="server">
						<DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
                        <ContentTemplate>
                            <CSBlog:WeblogPostData Text="{0} comment(s)" Property="Replies" LinkTo="PostComments" runat="server">
                                <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_With" id="CommentDesc"/> </LeaderTemplate>
                                <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="GreaterThan" /></DisplayConditions>
                            </CSBlog:WeblogPostData>
                            <CSBlog:WeblogPostData Text="no comments" Property="Replies" LinkTo="PostComments" runat="server">
                                <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_With" id="CommentDesc"/> </LeaderTemplate>
                                <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison ID="PropertyValueComparison1" runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="LessThanOrEqualTo" /></DisplayConditions>
                            </CSBlog:WeblogPostData>
                         </ContentTemplate>
                    </CSControl:PlaceHolder>
                    <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />
                    <CSBlog:WeblogPostData ResourceName="Weblog_Link_EditPost" runat="server" />
                </div>                            
            </div>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSControl:IndexPostList>
    <CSControl:SinglePager id = "pager" runat = "Server"  />
</asp:Content>
