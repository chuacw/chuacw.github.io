<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>
<%@ Register TagPrefix="CSUserControl" TagName="AdTop" Src="/Themes/CS2008-Common/Ad-Top.ascx" %>
<%@ Register TagPrefix="CSUserControl" TagName="AdBottom" Src="/Themes/CS2008-Common/Ad-Bottom.ascx" %>

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
               <CSBlog:WeblogPostData Property="UserTime" FormatString="ddd, d MMM yyyy @ h:mm tt" LinkTo="Post" IncludeTimeInDate="true" runat="server" Tag="div" CssClass="postsubhead" />
               <div class="postsub">
                <CSBlog:WeblogPostData runat="server" Property="Subject" LinkTo="Post" Tag="H2" />
               </div>

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


                <div class="postfoot">
                    Posted
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
                    <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />
                    <CSBlog:WeblogPostTagEditableList runat="server" id="InlineTagEditorPanel" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />

                </div>
            </div>
            <hr>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSBlog:WeblogPostList>

        <!-- AdPart chuacw 1 May 2011 -->
        <CSControl:AdPart runat="Server" ContentName="StandardBottom" ContentCssClass="CommonContentPartBorderOff" ContentHoverCssClass="CommonContentPartBorderOn">
          <DefaultContentTemplate>
        	<CSUserControl:AdBottom runat="server" />
          </DefaultContentTemplate>
        </CSControl:AdPart>

    <CSControl:SinglePager id = "pager" runat = "Server"  />

</asp:Content>
