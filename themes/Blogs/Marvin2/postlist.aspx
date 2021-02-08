<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>
<%@ Register TagPrefix="CSUserControl" TagName="AdTop" Src="/Themes/CS2008-Common/Ad-Top.ascx" %>
<%@ Register TagPrefix="CSUserControl" TagName="AdBottom" Src="/Themes/CS2008-Common/Ad-Bottom.ascx" %>

<asp:Content ContentPlaceHolderID="Main" runat="Server">
    
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" EnableRendering="true">
        <ContentTemplate>
            <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_Posts" Tag="h2" ContainerId="titleWrapper" CssClass="pageTitle">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="weblogs.weblogday" /></DisplayConditions>
                <LeaderTemplate><CSControl:CSContextData runat="server" Property="Date" FormatString="dd MMMM, yyyy" /> - </LeaderTemplate>
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
    <!-- WeblogPostList -->

    <!-- AdPart chuacw -->
    <CSControl:AdPart runat = "Server" contentname="StandardTop" ContentCssClass="CommonContentPartBorderOff" ContentHoverCssClass="CommonContentPartBorderOn">
	<DefaultContentTemplate>
	<CSUserControl:AdTop runat="server" />
	</DefaultContentTemplate>
    </CSControl:AdPart>

    <CSBlog:WeblogPostList id="EntryItems" Runat="server">
        <QueryOverrides BlogThreadType="AutoDetect" PagerID="pager" />
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <div class="post">
                <h5>
                    <CSBlog:WeblogPostData runat="server" Property="Subject" LinkTo="Post" />
                    <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />
                </h5>

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false">
        <ContentTemplate>
            <CSControl:ConditionalContent runat="server">
                <ContentConditions><CSControl:CSContextPropertyValueComparison runat="server" ComparisonProperty="Tags" Operator="IsSetOrTrue" /></ContentConditions>
                <TrueContentTemplate><CSControl:CSContextData Property="Tags" runat="server" /></TrueContentTemplate>
                <FalseContentTemplate><CSControl:ResourceControl ResourceName="TagBrowser_Title" runat="server" /></FalseContentTemplate>
            </CSControl:ConditionalContent>
        </ContentTemplate>
    </CSControl:Title>

		<!-- readmore -->
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></ContentConditions>
                    <TrueContentTemplate>
                       <CSBlog:WeblogPostData Property="excerpt" runat="server" />
		       <br/><CSBlog:WeblogPostData Text="Read more..." LinkTo="post" runat="server" />
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                      <CSBlog:WeblogPostData Property="FormattedBody" runat="server" />
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>

                <p class="postfoot">	
                    Posted 
                    <CSBlog:WeblogPostData Property="UserTime" LinkTo="Post" FormatString="ddd, d MMM yyyy @ h:mm tt" IncludeTimeInDate="true" runat="server" />
      
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
                                <LeaderTemplate>| <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_With" id="CommentDesc"/> </LeaderTemplate>
                                <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison ID="PropertyValueComparison1" runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="LessThanOrEqualTo" /></DisplayConditions>
                            </CSBlog:WeblogPostData>
                        </ContentTemplate>
                    </CSControl:PlaceHolder>
                    <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_EditPost" runat="server" />
                    <CSBlog:WeblogPostTagEditableList runat="server" id="InlineTagEditorPanel" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />                    
                    
                </p>                            
            </div>
            
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSBlog:WeblogPostList>
    <CSControl:SinglePager id = "pager" runat = "Server"  />
    <!-- AdPart chuacw 1 May 2011 -->
    <CSControl:AdPart runat="Server" ContentName="StandardBottom" ContentCssClass="CommonContentPartBorderOff" ContentHoverCssClass="CommonContentPartBorderOn">
      <DefaultContentTemplate>
    	<CSUserControl:AdBottom runat="server" />
      </DefaultContentTemplate>
    </CSControl:AdPart>
</asp:Content>
