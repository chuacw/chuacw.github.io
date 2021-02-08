<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" />

    <CSControl:WrappedLiteral Tag="h3" CssClass="contentheading" runat="server" Text="Search Results" />
    <CSControl:IndexPostList id="EntryItems" Runat="server">
        <QueryOverrides PagerID="pager" />
        <HeaderTemplate><dl class="entrylist"></HeaderTemplate>
        <ItemTemplate>
            <dt>
                <CSControl:IndexPostData Property="PostDate" LinkCssClass="listdate" LinkTo="Post" FormatString="dd MMMM yyyy" runat="server" />
                <br />
                <CSControl:IndexPostData runat="server" Property="Title" LinkTo="Post" />
            </dt>
            <dd>
                <CSControl:IndexPostData Property="FormattedBody" TruncateAt="300" runat="server" />

                <div class="entrylistfooter">
                    <CSControl:PlaceHolder runat="server">
						<DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
                        <ContentTemplate>
                            <CSBlog:WeblogPostData Text="{0} comment(s)" Property="Replies" LinkTo="PostComments" runat="server" CssClass="commentslink">
                                <LeaderTemplate></LeaderTemplate>
                                <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="GreaterThan" /></DisplayConditions>
                            </CSBlog:WeblogPostData>
                            <CSBlog:WeblogPostData Text="no comments" Property="Replies" LinkTo="PostComments" runat="server" CssClass="commentslink">
                                <LeaderTemplate></LeaderTemplate>
                                <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison ID="PropertyValueComparison1" runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="LessThanOrEqualTo" /></DisplayConditions>
                            </CSBlog:WeblogPostData>
                         </ContentTemplate>
                    </CSControl:PlaceHolder>
                    <div>
                        <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_EditPost" runat="server" />
                    </div>
                    <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />                        
                </div>
            </dd>
        </ItemTemplate>
        <FooterTemplate></dl></FooterTemplate>
    </CSControl:IndexPostList>
    <CSControl:SinglePager id = "pager" runat = "Server"  />
</asp:Content>
