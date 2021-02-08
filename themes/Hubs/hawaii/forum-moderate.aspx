<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSForum:ForumData LinkTo="HomePage" Text="Discussions" runat="server" />
        &raquo;
        <CSForum:ForumData LinkTo="moderate" Text="Moderation" runat="server" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" IncludeSectionOrHubName="true" ResourceName="ModerateForum_TitleName" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
        
            <CSForum:ForumPostList runat="server" ShowHeaderFooterOnNone="false">
                <QueryOverrides PagerID="Pager" QueryType="ModeratedPosts" />
                <HeaderTemplate><ul class="ForumPostList"></HeaderTemplate>
                <ItemTemplate>
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
								            <CSControl:UserAvatar runat="server" BorderWidth="1" Tag="Li" CssClass="ForumPostUserAvatar" />
									        <CSControl:PlaceHolder runat="server">
								                <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
								                <ContentTemplate>
								                    <CSControl:UserPostIcons runat="server" Tag="Li" CssClass="ForumPostUserIcons" />
								                    <CSControl:UserPostGenderIcon runat="server" Tag="Li" CssClass="ForumPostUserIcons" />
								                    <CSControl:UserData runat="server" Property="DateCreated" Tag="Li" CssClass="ForumPostUserAttribute"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="PostFlatView_Joined" /></LeaderTemplate></CSControl:UserData>
								                    <CSControl:UserProfileData runat="server" Property="Location" Tag="Li" CssClass="ForumPostUserAttribute" />
								                    <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="TotalPosts" Tag="Li" CssClass="ForumPostUserAttribute">
								                        <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="PostCount" Operator="EqualTo" /></DisplayConditions>
								                        <LeaderTemplate><CSControl:ResourceControl ResourceName="PostFlatView_Posts" runat="server" /></LeaderTemplate>
								                    </CSControl:UserData>
								                    <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="UserRank" Tag="Li" CssClass="ForumPostUserAttribute">
								                        <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="UserRank" Operator="EqualTo" /></DisplayConditions>
								                    </CSControl:UserData>
                                                    <CSControl:UserData runat="server" Property="Points" Tag="Li" CssClass="ForumPostUserAttribute"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="PostFlatView_UserPoints" /></LeaderTemplate></CSControl:UserData>
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
									                <CSControl:ResourceControl runat="server" ResourceName="Button_Locked" CssClass="CommonImageTextButton CommonLockedButton" Tag="Span">
									                    <DisplayConditions><CSForum:ForumPostPropertyValueComparison ComparisonProperty="IsLocked" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
									                    <LeaderTemplate><td></LeaderTemplate>
									                    <TrailerTemplate></td><td> </td></TrailerTemplate>
									                </CSControl:ResourceControl>
                                                    <CSForum:ForumPostData runat="server" IgnoreLinkPermissions="true" LinkTo="Reply" LinkCssClass="ReplyButton" Tag="Td">
                                                        <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Button_Reply" /></span></ContentTemplate>
                                                    </CSForum:ForumPostData>									                
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
									                <CSControl:UserContactPopupMenu ResourceName="ContactPopupMenu_Text" runat="server" ButtonActiveCssClass="CommonTextButtonHighlight" ButtonInactiveCssClass="CommonTextButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown">
									                    <LeaderTemplate><td>|</td><td></LeaderTemplate>
									                    <TrailerTemplate></td></TrailerTemplate>
									                </CSControl:UserContactPopupMenu>
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
								                    <CSControl:ResourceControl runat="server" ResourceName="Button_Answer" Tag="Span" CssClass="CommonTextButton">
				                                        <DisplayConditions Operator="And">
				                                            <CSControl:ControlVisibilityCondition runat="server" ControlId="AnswerToggleButton" ControlVisiblilityEquals="false" />
				                                            <CSForum:ForumPostPropertyValueComparison ComparisonProperty="PostStatus" Operator="Contains" ComparisonValue="IsAnswer" runat="server" />
				                                        </DisplayConditions>
				                                         <LeaderTemplate><td>|&nbsp;</td><td></LeaderTemplate>
									                    <TrailerTemplate></td></TrailerTemplate>
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
								        </ul>
							        </td>
						        </tr>
					        </table>
				        </div>
			        </li>
                </ItemTemplate>
                <NoneTemplate>There are no discussion posts to moderate.</NoneTemplate>
                <FooterTemplate>
	                </ul>
	            </FooterTemplate>
            </CSForum:ForumPostList>
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:Pager runat="server" id="Pager" ShowTotalSummary="true" />
		</div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server" />