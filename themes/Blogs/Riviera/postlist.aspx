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
                    <CSBlog:WeblogPostData runat="server" Property="Subject" LinkTo="Post" Tag="span" CssClass="entrylistheader" />                    
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
                    <CSBlog:WeblogPostData Property="Excerpt" runat="server" />
                    <div class="entrylistfooter">
                        <CSBlog:WeblogPostTagEditableList runat="server" id="InlineTagEditorPanel" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />                    
                    </div>
                </dd>                        
            </dl>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSBlog:WeblogPostList>
    <CSControl:SinglePager id = "pager" runat = "Server"  />
       
</asp:Content>
