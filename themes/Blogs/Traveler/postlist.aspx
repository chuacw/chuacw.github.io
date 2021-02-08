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
        <ItemTemplate>
            <div class="post">
                <div class="postcommentarea">
                    <CSControl:PlaceHolder runat="server">
					    <DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
                        <ContentTemplate>
                            <CSBlog:WeblogPostData Text="{0}" Property="Replies" LinkTo="PostComments" runat="server" /><br />Comments
                        </ContentTemplate>
                    </CSControl:PlaceHolder>
                </div>
                <div class="postasidecomment">
                   <div class="postsub">
                       <h2>
                         <CSBlog:WeblogPostData runat="server" Property="Subject" LinkTo="post" />
                         <span>
                            <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" /> <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
                         </span>
                         <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />
                       </h2>
                       <CSBlog:WeblogPostData Property="Excerpt" runat="server" />

                        <div class="postfoot">	
                            <CSBlog:WeblogPostTagEditableList runat="server" id="InlineTagEditorPanel" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Span" />
                            <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_EditPost" runat="server" />
                        </div>
                    </div>                          
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSBlog:WeblogPostList>
    
    <CSControl:SinglePager id="pager" runat="Server"  />
</asp:Content>
