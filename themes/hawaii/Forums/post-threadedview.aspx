<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" %>
<%@ Import Namespace="CommunityServer.Components" %>
<%@ Import Namespace="CommunityServer.Discussions.Components" %>
<%@ Import Namespace="CommunityServer.Discussions.Controls" %>

<CSControl:Title runat="server" IncludeSiteName="true">
    <ContentTemplate><CSForum:ForumPostData runat="server" Property="Subject" /></ContentTemplate>
</CSControl:Title>	

<CSControl:ConditionalAction runat="server">
    <Conditions Operator="Not"><CSForum:ForumPermissionCondition runat="server" Permission="Read" /></Conditions>
    <Actions><CSControl:GoToMessageAction runat="server" MessageType="AccessDenied" /></Actions>
</CSControl:ConditionalAction>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional-dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <CSControl:Head ID="Head1" runat="Server">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <CSControl:Style runat="server" visible = "true" />
        <CSControl:ThemeStyle runat="server" Href="~/style/common.css" />
		<CSControl:ThemeStyle runat="server" Href="~/style/forum.css" />
		<CSControl:ThemeStyle runat="server" Href="~/style/common_print.css" media="print" />
		<CSControl:ThemeStyle runat="server" Href="~/style/forum_print.css" media="print" />
		<CSControl:ThemeStyle href="~/style/ForumThreadedPost.css" runat="server" />
		<CSControl:ThemeStyle Href="~/style/DynamicStyle.aspx" runat="server" EnsureNotCachedOnPreview="true" />
    </CSControl:Head>
    </head>
	<body>
		<form runat="server">
			<TWC:Modal ID="Modal1" runat="server" CssClasses="CommonModal" TitleCssClasses="CommonModalTitle" CloseCssClasses="CommonModalClose" ContentCssClasses="CommonModalContent" FooterCssClasses="CommonModalFooter" ResizeCssClasses="CommonModalResize" MaskCssClasses="CommonModalMask" LoadingUrl="~/utility/loading.htm" />			
			<div id="CommonOuter"><div id="Common">
				<div id="CommonBody">
					<table cellspacing="0" cellpadding="0" border="0" width="100%" id="CommonBodyTable">
						<tr>
							<td valign="top" width="100%" id="CommonBodyColumn"><table cellpadding="0" cellspacing="0" border="0" style="table-layout: fixed;" width="100%"><tr><td>

                                <script type="text/javascript">
                                // <![CDATA[
                                try
                                {
	                                var url = window.top.location.href;
	                                var re = new RegExp('<%=ForumPostTreeForm.ValidTopWindowUrlPattern%>', 'i');
	                                if (!re.test(url))
		                                window.top.location = '<%= SiteUrls.Instance().Post(CurrentPost.PostID) %>';
                                }
                                catch(err)
                                {
                                }
                                // ]]>
                                </script>
                                <script type="text/javascript">
                                // <![CDATA[
                                var resizeHandle = null;
                                function resizePostDisplay(width, height)
                                {
	                                clearTimeout(resizeHandle);
	                                var oWidth = width;
	                                var oHeight = height;

	                                var buttons = document.getElementById('PostButtons');
	                                var container = document.getElementById('PostDisplayContainer');
	                                var body = document.getElementById('PostDisplayBody');
	                                var header = document.getElementById('PostDisplayHeader');
	                                var footer = document.getElementById('PostDisplayFooter');

	                                if (container && body && header && footer && buttons && height > 0 && width > 0)
	                                {
		                                try
		                                {
			                                height -= parseInt(buttons.offsetHeight);
			                                container.style.height = ensureSafeInteger(height - 18) + 'px';
                                			
			                                height -= (parseInt(footer.offsetHeight) + parseInt(header.offsetHeight));
			                                body.style.height = ensureSafeInteger(height - 56) + 'px';
                                			
			                                buttons.style.width = ensureSafeInteger(width - 16) + 'px';
			                                container.style.width = ensureSafeInteger(width - 16) + 'px';
			                                header.style.width = ensureSafeInteger(width - 36) + 'px';
			                                body.style.width = ensureSafeInteger(width - 36) + 'px';
			                                footer.style.width = ensureSafeInteger(width - 48) + 'px';
                                			
			                                container.style.visibility = 'visible';
			                                buttons.style.visibility = 'visible';
		                                }
		                                catch (err)
		                                {
		                                }
	                                }
                                	
	                                resizeHandle = setTimeout('resizePostDisplay(' + oWidth + ',' + oHeight + ')', 999);
                                }

                                function ensureSafeInteger(value)
                                {
	                                if (value < 0)
		                                return 0;
	                                else
		                                return value;
                                }
                                // ]]>
                                </script>

                                <div id="PostButtons" class="ForumThreadPostButtons" style="visibility: hidden;">
                                <div style="float: left">
                                    <table cellpadding="0" cellspacing="0" border="0"><tr>
					                    <CSControl:ResourceControl runat="server" ResourceName="Button_Locked">
						                    <DisplayConditions><CSForum:ForumPostPropertyValueComparison ComparisonProperty="IsLocked" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
						                    <LeaderTemplate><td><span class="CommonImageTextButton CommonLockedButton"></LeaderTemplate>
						                    <TrailerTemplate></span></td><td> 
						                    </td></TrailerTemplate>
						                </CSControl:ResourceControl>
					                    <CSForum:ForumPostData runat="server" IgnoreLinkPermissions="true" LinkTo="Reply" ResourceName="Button_Reply" LinkCssClass="CommonTextButton" Tag="TD" />
					                    <CSForum:ForumPostData runat="server" LinkTo="StartConversation" ResourceName="Conversation_Post_SendTo" LinkCssClass="CommonTextButton">
					                        <LeaderTemplate><td>|</td><td></LeaderTemplate>
					                        <TrailerTemplate></td></TrailerTemplate>
					                    </CSForum:ForumPostData>
					                    <CSForum:ForumPostData runat="server" LinkTo="Delete" ResourceName="Button_Delete" LinkCssClass="CommonTextButton">
					                        <LeaderTemplate><td>|</td><td></LeaderTemplate>
					                        <TrailerTemplate></td></TrailerTemplate>
                                        </CSForum:ForumPostData>
					                    <CSForum:ForumPostData runat="server" LinkTo="Edit" ResourceName="Button_Edit" LinkCssClass="CommonTextButton">
					                        <LeaderTemplate><td>|</td><td></LeaderTemplate>
					                        <TrailerTemplate></td></TrailerTemplate>
					                    </CSForum:ForumPostData>
					                    <CSForum:ThreadStatusForm runat="server" StatusDropDownListId="ThreadStatus">
				                            <FormTemplate>
                                                <asp:DropDownList runat="server" ID="ThreadStatus" />								                
				                            </FormTemplate>
				                             <LeaderTemplate><td>|&nbsp;</td><td></LeaderTemplate>
					                        <TrailerTemplate></td></TrailerTemplate>
				                        </CSForum:ThreadStatusForm>
				                        <CSForum:ForumPostAnswerToggleButton ID="AnswerToggleButton" runat="server" ButtonOnCssClass="CommonTextButton" ButtonOffCssClass="CommonTextButton" ButtonProcessingCssClass="CommonTextButton">
                                            <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="MarkAsAnswer" /></OffTemplate>
                                            <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="MarkAsNotAnswer" /></OnTemplate>
                                            <ProcessingTemplate>...</ProcessingTemplate>
                                             <LeaderTemplate><td>|</td><td></LeaderTemplate>
					                        <TrailerTemplate></td></TrailerTemplate>
				                        </CSForum:ForumPostAnswerToggleButton>
				                        <CSControl:ResourceControl runat="server" ResourceName="Button_Answer">
	                                        <DisplayConditions Operator="And">
	                                            <CSControl:ControlVisibilityCondition runat="server" ControlId="AnswerToggleButton" ControlVisiblilityEquals="false" />
	                                            <CSForum:ForumPostPropertyValueComparison ComparisonProperty="PostStatus" Operator="Contains" ComparisonValue="IsAnswer" runat="server" />
	                                        </DisplayConditions>
	                                         <LeaderTemplate><td>|</td><td><span class="CommonTextButton"></LeaderTemplate>
						                    <TrailerTemplate></span></td></TrailerTemplate>
	                                    </CSControl:ResourceControl>
                                    </tr></table>
                                </div>
                                <div style="float: right">
                                    <table cellpadding="0" cellspacing="0" border="0"><tr>
                                        <CSForum:FavoritePopupMenu ResourceName="FavoritePopupMenu_Text" runat="server" ButtonActiveCssClass="CommonTextButtonHighlight" ButtonInactiveCssClass="CommonTextButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown">
					                        <LeaderTemplate><td></LeaderTemplate>
					                        <TrailerTemplate></td></TrailerTemplate>
					                    </CSForum:FavoritePopupMenu>
    					                <CSForum:ForumPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/">
    					                    <LeaderTemplate><td>|&nbsp;</td><td></LeaderTemplate>
					                        <TrailerTemplate></td></TrailerTemplate>
                                        </CSForum:ForumPostRating>
					                    <CSForum:ForumPostModerationPopupMenu ResourceName="ModerationPopupMenu_Text" runat="server" ButtonActiveCssClass="CommonTextButtonHighlight" ButtonInactiveCssClass="CommonTextButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown">
					                        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
					                        <LeaderTemplate><td>|</td><td></LeaderTemplate>
					                        <TrailerTemplate></td></TrailerTemplate>
					                    </CSForum:ForumPostModerationPopupMenu>
                                        <CSForum:ThreadRating runat="server" RatingCssClass="ForumThreadRateControl" RatingReadOnlyCssClass="ForumThreadRateControlReadOnly" RatingActiveCssClass="ForumThreadRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" EnableDetails="true">
                                            <LeaderTemplate><td>|&nbsp;</td><td></LeaderTemplate>
					                        <TrailerTemplate></td></TrailerTemplate>
                                        </CSForum:ThreadRating>
				                        <CSForum:ThreadSubscriptionToggleButton runat="server" ButtonOnCssClass="CommonTextButton" ButtonOffCssClass="CommonTextButton" ButtonProcessingCssClass="CommonTextButton">
				                           <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="Forums_StopEmailingMe" /></OnTemplate>
                                           <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="Forums_EmailMe" /></OffTemplate>
				                           <ProcessingTemplate>...</ProcessingTemplate>
				                           <LeaderTemplate><td>|</td><td></LeaderTemplate>
					                        <TrailerTemplate></td></TrailerTemplate>
				                        </CSForum:ThreadSubscriptionToggleButton>
								    </td></tr></table>
                                </div>
                                <div style="clear: both;"></div>
                                </div>

                                <div class="ForumThreadPostContainer" id="PostDisplayContainer" style="visibility: hidden;">
	                                <div class="ForumThreadPostBody">
		                                <div class="ForumThreadPostHeader" id="PostDisplayHeader">
			                                <table cellpadding="0" cellspacing="0" border="0">
			                                <tr valign="top">
				                                <td class="ForumThreadPostUserAvatar"><CSControl:UserAvatar runat="server" BorderWidth="1" /></td>
				                                <td>
					                                <div class="ForumThreadPostTitle">
					                                    <CSForum:ForumPostEmoticon runat="server" />
										                <CSForum:ForumPostData runat="server" Property="Subject" />
										            </div>
					                                <div class="ForumThreadPostPubDate"><CSForum:ForumPostData runat="server" Property="PostDate" IncludeTimeInDate="true" /> </div>
					                                <div class="ForumThreadPostAuthor"><CSControl:UserData runat="server" LinkTo="Profile" Property="DisplayName" /></div>
					                                <div class="ForumThreadPostUserProperties">
					                                    <CSControl:PlaceHolder runat="server">
									                        <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
									                        <ContentTemplate>
						                                        <ul class="ForumThreadPostUserPropertyList">
						                                            <CSControl:UserPostIcons runat="server" Tag="Li" />
						                                            <CSControl:UserPostGenderIcon runat="server" Tag="Li" />
									                                <CSControl:UserData runat="server" Property="DateCreated" Tag="Li"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="PostFlatView_Joined" /></LeaderTemplate></CSControl:UserData>
									                                <CSControl:UserProfileData runat="server" Property="Location" Tag="Li" />
									                                <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="TotalPosts" Tag="Li">
								                                        <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="PostCount" Operator="EqualTo" /></DisplayConditions>
								                                        <LeaderTemplate><CSControl:ResourceControl ResourceName="PostFlatView_Posts" runat="server" /></LeaderTemplate>
								                                    </CSControl:UserData>
								                                    <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="UserRank" Tag="Li">
								                                        <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="UserRank" Operator="EqualTo" /></DisplayConditions>
								                                    </CSControl:UserData>
                                                                    <CSControl:UserData runat="server" Property="Points" Tag="Li"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="PostFlatView_UserPoints" /></LeaderTemplate></CSControl:UserData>
						                                        </ul>
						                                     </ContentTemplate>
						                                 </CSControl:PlaceHolder>
					                                </div>
					                                <CSControl:UserRoleIcons runat="server" LinkTo="Role" Tag="Div" CssClass="ForumThreadPostRoleIcons">
                                                        <SeparatorTemplate> </SeparatorTemplate>
                                                    </CSControl:UserRoleIcons>
                                                    <CSForum:PostAttachmentData runat="server" Property="FileName" LinkTo="Attachment" Tag="Div" CssClass="ForumThreadPostAttachment" />
				                                </td>
			                                </tr>
			                                </table>
		                                </div>
		                                <div class="ForumThreadPostContent" id="PostDisplayBody">
			                                <CSForum:ForumPostData Property="FormattedBody" runat="server" IncrementViewCount="true" />
			                                <CSForum:ForumPostData Property="EditNotes" runat="server">
			                                    <DisplayConditions><CSForum:ForumConfigurationPropertyValueComparison runat="server" ComparisonProperty="DisplayEditNotesInPost" Operator="IsSetOrTrue" /></DisplayConditions>
			                                    <LeaderTemplate><br /><br /></LeaderTemplate>
			                                </CSForum:ForumPostData>
                                            <CSControl:UserProfileData Property="SignatureFormatted" runat="server" Tag="Div" CssClass="ForumPostSignature" />
		                                </div>
		                                <div class="ForumThreadPostFooterArea" id="PostDisplayFooter">	
			                                <ul class="ForumPostStatistics CommonPrintHidden" style="clear: both;">
				                                <CSForum:ForumPostData runat="server" Property="Points" ResourceName="PostFlatView_PostPoints" Tag="Li" />
									            <CSForum:ForumPostData runat="server" Property="UserHostAddress" ResourceName="PostFlatView_IPAddress" Tag="Li" />
									            <CSForum:ForumPostData runat="server" LinkTo="Report" ResourceName="Report" Tag="Li" />
									            <CSForum:ForumPostData runat="server" LinkTo="QuickReply" ResourceName="QuickReply" Tag="Li" />
			                                </ul>
		                                </div>
	                                </div>
                                </div>

                                <script type="text/javascript">
                                // <![CDATA[
                                setTimeout(initializePostDisplay, 19);
                                function initializePostDisplay()
                                {
	                                var buttons = document.getElementById('PostButtons');
	                                if (buttons)
	                                {
		                                if (parseInt(buttons.offsetHeight) == 0)
			                                setTimeout(initializePostDisplay, 19);
		                                else
		                                {
			                                if (window.parent && window.parent.updateLinkTargets)
				                                window.parent.updateLinkTargets(document);
                                		
			                                if (window.parent && window.parent.getPostDisplayWidthHeight)
			                                {
				                                var wh = window.parent.getPostDisplayWidthHeight();
				                                resizePostDisplay(wh[0], wh[1]);
			                                }
		                                }
	                                }
                                }
                                // ]]>
                                </script>
								
							</td></tr></table></td>
						</tr>
					</table>
				</div>
			</div></div>
		</form>
	</body>
</html>