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
        <CSBlog:TagBreadCrumb runat="server" ShowHome="false" />  
        <CSBlog:TagRssLink runat="server"><LeaderTemplate>(</LeaderTemplate><TrailerTemplate>)</TrailerTemplate></CSBlog:TagRssLink>
    </div>
    <div class="tagcloudlarge">
        <CSBlog:TagCloud runat="server" TagCssClasses="tag6,tag5,tag4,tag3,tag2,tag1" TagCloudCssClass="TagCloud" NoRelatedTagsResourceName="TagCloud_NoSubTagsDefined" NoTagsResourceName="TagCloud_NoTagsDefined" />
    </div>
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
                    <CSBlog:WeblogPostData Property="UserTime" LinkTo="Post" IncludeTimeInDate="true" runat="server" Tag="span" CssClass="entrylistheadersub" /> 
                </dt>
                <dd>
                    <CSBlog:WeblogPostData Property="FormattedBody" runat="server" TruncateAt="360">
                        <TrailerTemplate>
                            <CSBlog:WeblogPostData LinkTo="post" Text="Read More..." runat="server" />
                        </TrailerTemplate>
                    </CSBlog:WeblogPostData>
                    <div class="entrylistfooter">	
                        <span class="author">
					        <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
					        <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" /> 
                        </span>
                        <CSControl:PlaceHolder runat="server">
							<DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
                            <ContentTemplate>
                                <CSBlog:WeblogPostData Text="{0} comment(s)" Property="Replies" LinkTo="PostComments" runat="server" LinkCssClass="commentslink">
                                    <LeaderTemplate>| </LeaderTemplate>
                                    <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="GreaterThan" /></DisplayConditions>
                                </CSBlog:WeblogPostData>
                                <CSBlog:WeblogPostData Text="no comments" Property="Replies" LinkTo="PostComments" runat="server" LinkCssClass="commentslink">
                                    <LeaderTemplate>| <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_With" id="CommentDesc"/> </LeaderTemplate>
                                    <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison ID="PropertyValueComparison1" runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="LessThanOrEqualTo" /></DisplayConditions>
                                </CSBlog:WeblogPostData>
                            </ContentTemplate>
                        </CSControl:PlaceHolder>
                        <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />                        
                        <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_EditPost" runat="server" />
                        <CSBlog:WeblogPostTagEditableList runat="server" id="InlineTagEditorPanel" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="filedunder" />                    
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
