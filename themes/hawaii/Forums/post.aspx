<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSForum:BreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSForum:BreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" Tag="H1" CssClass="CommonTitle" EnableRendering="true">
        <ContentTemplate><CSForum:ThreadData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>		
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:ConditionalAction runat="server">
        <Conditions Operator="Not"><CSForum:ForumPermissionCondition runat="server" Permission="Read" /></Conditions>
        <Actions><CSControl:GoToMessageAction runat="server" MessageType="AccessDenied" /></Actions>
    </CSControl:ConditionalAction>

	<div class="CommonContentBox">
	    <div class="CommonContentBoxContent">
    
            <ul class="ForumPostList">
			    <li>
	                <CSForum:ForumPostData runat="server" Property="PostID" FormatString="0" Text="&lt;a name=&quot;{0}&quot;&gt;&lt;/a&gt;" />
		            <div class="ForumPostArea">
			            <h4 class="ForumPostHeader">
				            <table cellpadding="0" cellspacing="0" border="0" width="100%">
					            <tr valign="middle">
						            <td align="left">
						                <CSForum:ForumPostData runat="server" LinkTo="PermaLink"><ContentTemplate><CSControl:ThemeImage runat="server" BorderWidth="0" ImageUrl="~/images/icon_post_show.gif" /></ContentTemplate></CSForum:ForumPostData>
						                <CSForum:ForumPostData runat="server" Property="PostDate" IncludeTimeInDate="true" />    
						            </td>
						            <td align="right">
    							    
						            <CSForum:ForumPostData runat="server" ResourceName="PostView_ReplyToLabel" LinkTo="ParentPost" />
						            <CSForum:ForumPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" />
						            </td>
					            </tr>
				            </table>
			            </h4>
			            <table cellspacing="0" cellpadding="0" border="0" width="100%">
				            <tr valign=top>
					            <td rowspan="2" class="ForumPostUserArea">
						            <div class="ForumPostUserContent">
						            <ul class="ForumPostUserPropertyList">
						                <li class="ForumPostUserName">
						                    <CSControl:PlaceHolder runat="server">
						                        <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
						                        <ContentTemplate>
						                            <CSControl:PlaceHolder runat="server">
						                                <DisplayConditions><CSControl:UserPropertyValueComparison ComparisonProperty="IsOnline" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
						                                <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/user_IsOnline.gif" runat="server" /></ContentTemplate>
						                            </CSControl:PlaceHolder>
						                            <CSControl:PlaceHolder runat="server">
						                                <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison ComparisonProperty="IsOnline" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
						                                <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/user_IsOffline.gif" runat="server" /></ContentTemplate>
						                            </CSControl:PlaceHolder>
						                        </ContentTemplate>
						                    </CSControl:PlaceHolder>
						                    <CSControl:UserData runat="server" LinkTo="Profile" Property="DisplayName" />
						                </li>
						                <CSControl:UserData runat="server" LinkTo="Profile" Tag="Li" CssClass="ForumPostUserAvatar">
						                    <ContentTemplate>
						                        <CSControl:UserAvatar runat="server" BorderWidth="1" />
						                    </ContentTemplate>
						                </CSControl:UserData>
							            <CSControl:PlaceHolder runat="server">
						                    <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
						                    <ContentTemplate>
						                        <CSControl:UserPostIcons runat="server" Tag="Li" />
						                        <CSControl:UserPostGenderIcon runat="server" Tag="Li" />
						                        <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="TotalPosts" Tag="Li">
						                            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="PostCount" Operator="EqualTo" /></DisplayConditions>
						                            <LeaderTemplate><CSControl:ResourceControl ResourceName="PostFlatView_Posts" runat="server" /></LeaderTemplate>
						                        </CSControl:UserData>
						                        <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="UserRank" Tag="Li">
						                            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="UserRank" Operator="EqualTo" /></DisplayConditions>
						                        </CSControl:UserData>
                                                <CSControl:UserData runat="server" Property="Points" Tag="Li"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="PostFlatView_UserPoints" /></LeaderTemplate></CSControl:UserData>
                                                <CSControl:UserRoleIcons runat="server" LinkTo="Role" Tag="Li" CssClass="ForumPostRoleIcons">
                                                    <SeparatorTemplate><br /></SeparatorTemplate>
                                                </CSControl:UserRoleIcons>
                                            </ContentTemplate>
                                        </CSControl:PlaceHolder>
						            </ul>
						            </div>
					            </td>
					            <td class="ForumPostContentArea">
						            <div class="ForumPostTitleArea">
							            <h4 class="ForumPostTitle">
							                <CSForum:ForumPostEmoticon runat="server" />
								            <CSForum:ForumPostData runat="server" Property="Subject" />
							            </h4>
    									
						                <CSForum:PostAttachmentData runat="server" Property="FileName" LinkTo="Attachment" Tag="Div" CssClass="ForumPostAttachment" />

							            <div class="ForumPostButtons">
							                <table cellpadding="0" cellspacing="0" border="0"><tr>
							                    <CSControl:ResourceControl runat="server" ResourceName="Button_Locked">
								                    <DisplayConditions><CSForum:ForumPostPropertyValueComparison ComparisonProperty="IsLocked" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
								                    <LeaderTemplate><td><span class="CommonImageTextButton CommonLockedButton"></LeaderTemplate>
								                    <TrailerTemplate></span></td><td> </td></TrailerTemplate>
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
							                    <CSForum:FavoritePopupMenu ResourceName="FavoritePopupMenu_Text" runat="server" ButtonActiveCssClass="CommonTextButtonHighlight" ButtonInactiveCssClass="CommonTextButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown">
							                        <LeaderTemplate><td>|</td><td></LeaderTemplate>
							                        <TrailerTemplate></td></TrailerTemplate>
							                    </CSForum:FavoritePopupMenu>
							                    <CSForum:ForumPostModerationPopupMenu ResourceName="ModerationPopupMenu_Text" runat="server" ButtonActiveCssClass="CommonTextButtonHighlight" ButtonInactiveCssClass="CommonTextButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown">
							                        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
							                        <LeaderTemplate><td>|</td><td></LeaderTemplate>
							                        <TrailerTemplate></td></TrailerTemplate>
							                    </CSForum:ForumPostModerationPopupMenu>
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
							            <div style="clear: both;"></div>
						            </div>
    								
						            <table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" style="table-layout: fixed;">
							            <tr><td>
							            <div class="ForumPostBodyArea">
							            <div class="ForumPostContentText">
								            <CSForum:ForumPostData Property="FormattedBody" runat="server" IncrementViewCount="true" />
								            <CSForum:ForumPostData Property="EditNotes" runat="server">
	                                            <DisplayConditions><CSForum:ForumConfigurationPropertyValueComparison runat="server" ComparisonProperty="DisplayEditNotesInPost" Operator="IsSetOrTrue" /></DisplayConditions>
	                                            <LeaderTemplate><br /><br /></LeaderTemplate>
	                                        </CSForum:ForumPostData>
							            </div>
							            <CSControl:UserProfileData Property="SignatureFormatted" runat="server" Tag="Div" CssClass="ForumPostSignature" />
							            </div>
							            </td></tr>
						            </table>
					            </td>
				            </tr>
				            <tr valign="bottom">
					            <td class="ForumPostFooterArea">	
						            <CSForum:ForumPostTagEditableList runat="server" EditorCssClass="CommonInlineTagEditor" Tag="Div" />
						            <ul class="ForumPostStatistics CommonPrintHidden" style="clear: both;">
						                <li></li>
						                <CSForum:ForumPostData runat="server" Property="Points" ResourceName="PostFlatView_PostPoints" Tag="Li" />
							            <CSForum:ForumPostData runat="server" Property="UserHostAddress" ResourceName="PostFlatView_IPAddress" Tag="Li" />
							            <CSForum:ForumPostData runat="server" LinkTo="Report" ResourceName="Report" Tag="Li" />
							            <CSForum:ForumPostData runat="server" LinkTo="QuickReply" ResourceName="QuickReply" Tag="Li" />
						            </ul>
					            </td>
				            </tr>
			            </table>
		            </div>
	            </li>
		    </ul>
		
		</div>
		<div class="CommonContentBoxFooter">
    		<CSForum:ForumPostData runat="server" LinkTo="Thread" ResourceName="SinglePostView_ViewThread" />
        </div>
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server" />