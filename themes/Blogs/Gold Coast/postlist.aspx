<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="Main" runat="Server">
    
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" EnableRendering="true">
        <ContentTemplate>
            <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_Posts" Tag="h2" ContainerId="titleWrapper" CssClass="pageTitle">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="weblogs.weblogday" /></DisplayConditions>
                <LeaderTemplate><CSControl:CSContextData runat="server" Property="Date" FormatString="MMMM dd, yyyy" /> - </LeaderTemplate>
            </CSControl:ResourceControl>
            <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_Posts" Tag="h2" ContainerId="titleWrapper" CssClass="pageTitle">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="weblogs.weblogmonth" /></DisplayConditions>
                <LeaderTemplate><CSControl:CSContextData runat="server" Property="Date" FormatString="MMMM yyyy" /> - </LeaderTemplate>
            </CSControl:ResourceControl>
            <CSBlog:PostCategoryData Property="Name" runat="server" Tag="h2" ContainerId="titleWrapper" CssClass="pageTitle">
                <DisplayConditions Operator="Or">
                    <CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="weblogs.weblogpostcategory" />
                    <CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="weblogs.weblogarticlecategory" />
                </DisplayConditions>
            </CSBlog:PostCategoryData>
        </ContentTemplate>
    </CSControl:Title>
    <CSBlog:WeblogPostList id="EntryItems" Runat="server">
        <QueryOverrides BlogThreadType="AutoDetect" PagerID="pager" />
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <dl class="entrylist">
                <dt>
                    <CSBlog:WeblogPostData runat="server" Property="Subject" LinkTo="post" />
                </dt>
                <dd>
                    <CSBlog:WeblogPostData Property="FormattedBody" runat="server" />

                    <div class="entryviewfooter">
                        <CSBlog:PostAttachmentData runat="server" LinkTo="Attachment" Tag="Div" Property="FileName"><LeaderTemplate><span class="em">Attachment:</span> </LeaderTemplate></CSBlog:PostAttachmentData>	
                        <span class="em">Posted </span>
                        <CSBlog:WeblogPostData Property="UserTime" runat="server" LinkTo="post" />
			            <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
			            <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
			            <CSControl:PlaceHolder runat="server">
							<DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
                            <ContentTemplate>
                                <CSBlog:WeblogPostData Text="{0} comment(s)" Property="Replies" LinkTo="PostComments" runat="server">
                                    <LeaderTemplate>| </LeaderTemplate>
                                    <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="GreaterThan" /></DisplayConditions>
                                </CSBlog:WeblogPostData>
			                    <CSBlog:WeblogPostData Text="no comments" Property="Replies" LinkTo="PostComments" runat="server">
                                    <LeaderTemplate>| </LeaderTemplate>
                                    <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison ID="PropertyValueComparison1" runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="LessThanOrEqualTo" /></DisplayConditions>
                                </CSBlog:WeblogPostData>
                            </ContentTemplate>
                        </CSControl:PlaceHolder>
			            <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />
                        <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_EditPost" runat="server" />                        
                        <CSBlog:WeblogPostTagEditableList runat="server" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />
                    </div>
                </dd>
            </dl>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSBlog:WeblogPostList>
    <CSControl:SinglePager id = "pager" runat = "Server"  />
       
</asp:Content>
