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
    
    <CSBlog:TagCloud runat="server" CssClass="souptagcloudlarge" Tag="div" TagCssClasses="souptag6,souptag5,souptag4,souptag3,souptag2,souptag1" TagCloudCssClass="TagCloud" NoRelatedTagsResourceName="TagCloud_NoSubTagsDefined" NoTagsResourceName="TagCloud_NoTagsDefined" />

    <CSBlog:WeblogPostList runat="server">
        <QueryOverrides PagerID="PostPager" />
        <DisplayConditions>
            <CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" />
        </DisplayConditions>
        <HeaderTemplate><dl class="entrylist"></HeaderTemplate>
        <ItemTemplate>
             <dt>
                <CSBlog:WeblogPostData Property="UserTime" LinkTo="Post" FormatString="dd MMMM yyyy" runat="server" LinkCssClass="listdate" />
                <br />
                <CSBlog:WeblogPostData runat="server" Property="Subject" LinkTo="Post" />                    
            </dt>
            <dd>
                <CSBlog:WeblogPostData Property="FormattedBody" runat="server" TruncateAt="300">
                    <TrailerTemplate><CSBlog:WeblogPostData runat="server" LinkTo="post" ResourceName="Weblog_Post_ReadMore" /></TrailerTemplate>
                </CSBlog:WeblogPostData>

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
                    <CSBlog:WeblogPostTagEditableList runat="server" id="InlineTagEditorPanel" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />                    
                    <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />                        
                </div>
            </dd>
        </ItemTemplate>
        <FooterTemplate></dl></FooterTemplate>
    </CSBlog:WeblogPostList>

    <CSControl:SinglePager runat="server" ID="PostPager">
        <DisplayConditions>
            <CSControl:QueryStringPropertyValueComparison ID="QueryStringPropertyValueComparison1" QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" />
        </DisplayConditions>
    </CSControl:SinglePager>
</asp:Content>
