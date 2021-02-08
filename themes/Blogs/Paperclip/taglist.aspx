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
                   <CSBlog:WeblogPostData ID="WeblogPostData1" runat="server" Property="Subject" LinkTo="Post" Tag="H5" CssClass="posthead" />

                   <CSBlog:WeblogPostData ID="WeblogPostData2" Property="Excerpt" runat="server" />

                    <div class="postfoot">	
                        <span class="em">Posted:</span>
                        <CSBlog:WeblogPostData Property="UserTime" LinkTo="Post" IncludeTimeInDate="true" runat="server" />
				        <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
				        <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" /> 
				        <CSControl:PlaceHolder runat="server">
							<DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
                            <ContentTemplate>
                                <CSBlog:WeblogPostData Text="{0} comment(s)" Property="Replies" LinkTo="PostComments" runat="server">
                                    <LeaderTemplate>| <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_With" id="CommentDesc"/> </LeaderTemplate>
                                    <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="GreaterThan" /></DisplayConditions>
                                </CSBlog:WeblogPostData>
                                <CSBlog:WeblogPostData Text="no comments" Property="Replies" LinkTo="PostComments" runat="server">
                                    <LeaderTemplate>| <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_With" id="CommentDesc"/> </LeaderTemplate>
                                    <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="LessThanOrEqualTo" /></DisplayConditions>
                                </CSBlog:WeblogPostData>
                             </ContentTemplate>
                        </CSControl:PlaceHolder>
                        <CSBlog:WeblogPostTagEditableList runat="server" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />
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
