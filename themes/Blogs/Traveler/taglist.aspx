<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false">
        <ContentTemplate>
            <CSControl:ConditionalContent runat="server">
                <ContentConditions><CSControl:CSContextPropertyValueComparison runat="server" ComparisonProperty="Tags" Operator="IsSetOrTrue" /></ContentConditions>
                <TrueContentTemplate><CSControl:CSContextData Property="Tags" runat="server" /></TrueContentTemplate>
                <FalseContentTemplate><CSControl:ResourceControl ResourceName="TagBrowser_Title" runat="server" /></FalseContentTemplate>
            </CSControl:ConditionalContent>
        </ContentTemplate>
    </CSControl:Title>

    <CSControl:ResourceControl runat="server" ResourceName="TagBrowser_Title" CssClass="pageTitle" Tag="h2" />
    
    <CSBlog:TagBreadCrumb runat="server" ShowHome="false" />  <CSBlog:TagRssLink runat="server"><LeaderTemplate>(</LeaderTemplate><TrailerTemplate>)</TrailerTemplate></CSBlog:TagRssLink>
    
    <CSBlog:TagCloud runat="server" TagCssClasses="Tag6,Tag5,Tag4,Tag3,Tag2,Tag1" TagCloudCssClass="TagCloud" NoRelatedTagsResourceName="TagCloud_NoSubTagsDefined" NoTagsResourceName="TagCloud_NoTagsDefined" />

    <CSBlog:WeblogPostList runat="server">
        <QueryOverrides PagerID="PostPager" />
        <DisplayConditions>
            <CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" />
        </DisplayConditions>
        <ItemTemplate>
             <div class="post">
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
                            <CSBlog:WeblogPostTagEditableList runat="server" id="InlineTagEditorPanel" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" />
                            <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_Edit" runat="server" />
                        </div>
                    </div>       
                </div>                            
            </div>
        </ItemTemplate>
    </CSBlog:WeblogPostList>

    <CSControl:SinglePager runat="server" ID="PostPager">
        <DisplayConditions>
            <CSControl:QueryStringPropertyValueComparison ID="QueryStringPropertyValueComparison1" QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" />
        </DisplayConditions>
    </CSControl:SinglePager>
</asp:Content>
