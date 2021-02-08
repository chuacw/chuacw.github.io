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
    
    <CSControl:ResourceControl runat="server" ResourceName="TagBrowser_Title" CssClass="contentheading" Tag="h2" />
    
    <div class="breadcrumb">
        <CSBlog:TagBreadCrumb runat="server" ShowHome="false" />  <CSBlog:TagRssLink runat="server" ><LeaderTemplate>(</LeaderTemplate><TrailerTemplate>)</TrailerTemplate></CSBlog:TagRssLink>
    </div>
    
    <CSBlog:TagCloud runat="server" TagCssClasses="tag6,tag5,tag4,tag3,tag2,tag1" TagCloudCssClass="tagcloudlarge" Tag="div" NoRelatedTagsResourceName="TagCloud_NoSubTagsDefined" NoTagsResourceName="TagCloud_NoTagsDefined" />

    <CSBlog:WeblogPostList runat="server">
        <QueryOverrides PagerID="PostPager" />
        <DisplayConditions>
            <CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" />
        </DisplayConditions>
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
    </CSBlog:WeblogPostList>

    <CSControl:SinglePager runat="server" ID="PostPager">
        <DisplayConditions>
            <CSControl:QueryStringPropertyValueComparison ID="QueryStringPropertyValueComparison1" QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" />
        </DisplayConditions>
    </CSControl:SinglePager>
</asp:Content>
