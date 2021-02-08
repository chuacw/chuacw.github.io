<%@ Control Language="C#" AutoEventWireup="true" %>

<div class="CommonContentBox">
    <div class="CommonContentBoxContent">
        <table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td align="right">
            <CSForum:ThreadSubscriptionToggleButton runat="server">
               <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="Forums_StopEmailingMe" /></OnTemplate>
               <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="Forums_EmailMe" /></OffTemplate>
               <ProcessingTemplate>...</ProcessingTemplate>
            </CSForum:ThreadSubscriptionToggleButton>
        </td></tr></table>
        <h4 class="ForumPostHeader">
            <div style="float: right;">
                <CSForum:ThreadRating runat="server" ID="ThreadRating" RatingCssClass="ForumThreadRateControl" RatingReadOnlyCssClass="ForumThreadRateControlReadOnly" RatingActiveCssClass="ForumThreadRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" EnableDetails="true" />
                <CSControl:PlaceHolder runat="server">
                    <DisplayConditions>
                        <CSControl:Conditions runat="server" Operator="Not">
                            <CSControl:ControlVisibilityCondition runat="server" ControlId="ThreadRating" />
                        </CSControl:Conditions>
                    </DisplayConditions>
                    <ContentTemplate>
                        <CSControl:UserData LinkTo="Login" runat="server">
                            <ContentTemplate>
                                <CSControl:ThemeImage ImageAlign="absmiddle" border="0" runat="server" ImageUrl="~/images/common/5star-rating.png" />
                            </ContentTemplate>
                            <TrailerTemplate><CSForum:ThreadData runat="server" Property="TotalRatings" ResourceName="Forums_RatingsSummary" /></TrailerTemplate>
                        </CSControl:UserData>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
            </div>
            <CSControl:ThemeImage runat="server" BorderWidth="0" ImageUrl="~/images/icon_post_show.gif" style="float: left; margin-right: 5px;" />          
            <CSControl:ResourceControl ResourceName="PostQuestionAnswerView_ThisPostHas" runat="server" /> 
            <CSForum:ThreadData runat="server" Property="Replies">
                <TrailerTemplate>
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions>
                            <CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="1" Operator="EqualTo" /> 
                        </ContentConditions>
                        <TrueContentTemplate> <CSControl:ResourceControl ResourceName="Reply" runat="server" /> | </TrueContentTemplate>
                        <FalseContentTemplate> <CSControl:ResourceControl ResourceName="Replies" runat="server" /> | </FalseContentTemplate>
                    </CSControl:ConditionalContent>
                </TrailerTemplate>
            </CSForum:ThreadData>
            <CSForum:ThreadData runat="server" Property="TrackedCount">
                <TrailerTemplate>
                    <CSControl:ConditionalContent runat="server" >
                        <ContentConditions>
                            <CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="TrackedCount" ComparisonValue="1" Operator="EqualTo" />                                
                        </ContentConditions>
                        <TrueContentTemplate> <CSControl:ResourceControl ResourceName="Follower" runat="server" /></TrueContentTemplate>
                        <FalseContentTemplate> <CSControl:ResourceControl ResourceName="Followers" runat="server" /></FalseContentTemplate>
                    </CSControl:ConditionalContent>
                </TrailerTemplate>
            </CSForum:ThreadData>     
        </h4>
    
        <CSForum:ForumPostList runat="server" ID="PostList">
            <QueryOverrides SortBy="PostDate" PagerID="Pager" />
            <ItemTemplate>
                <CSForum:ForumPostData runat="server" Property="PostID" FormatString="0" Text="&lt;a name=&quot;{0}&quot;&gt;&lt;/a&gt;" />
                <div class="CommonCommentArea Normal"> 
                    <div class="CommonCommentUser" style="text-align: center;">
                        <CSControl:UserData runat="server" LinkTo="Profile" Tag="Div" CssClass="ForumPostUserAvatar">
                            <ContentTemplate>
                                <CSControl:UserAvatar runat="server" BorderWidth="0" />
                            </ContentTemplate>
                        </CSControl:UserData>
                        <CSControl:PlaceHolder runat="server">
                            <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
                            <ContentTemplate>
                                <CSControl:UserPostIcons runat="server" Tag="Div" />
                                <CSControl:UserPostGenderIcon runat="server" Tag="Div" />
                                <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="TotalPosts">
                                    <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="PostCount" Operator="EqualTo" /></DisplayConditions>
                                    <LeaderTemplate><CSControl:ResourceControl ResourceName="PostFlatView_Posts" runat="server" /></LeaderTemplate>
                                </CSControl:UserData>
                                <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="UserRank" Tag="Div">
                                    <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="UserRank" Operator="EqualTo" /></DisplayConditions>
                                </CSControl:UserData>
                                <CSControl:UserData runat="server" Property="Points" Tag="Div"><LeaderTemplate><CSControl:ResourceControl ID="ResourceControl5" runat="server" ResourceName="PostFlatView_UserPoints" /></LeaderTemplate></CSControl:UserData>
                                <CSControl:PlaceHolder runat="server" Tag="Div">
                                    <DisplayConditions><CSControl:UserPropertyValueComparison ComparisonProperty="IsOnline" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                                    <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/user_IsOnline.gif" runat="server" /></ContentTemplate>
                                </CSControl:PlaceHolder>
                                <CSControl:PlaceHolder runat="server" Tag="Div">
                                    <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison ComparisonProperty="IsOnline" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                                    <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/user_IsOffline.gif" runat="server" /></ContentTemplate>
                                </CSControl:PlaceHolder>
                                <CSControl:UserRoleIcons runat="server" LinkTo="Role" Tag="Div" CssClass="ForumPostRoleIcons">
                                    <SeparatorTemplate><br /></SeparatorTemplate>
                                </CSControl:UserRoleIcons>
                            </ContentTemplate>
                        </CSControl:PlaceHolder>
                    </div>    	                                    
                    <div class="CommonCommentArrow"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div><div class="r5"></div><div class="r6"></div><div class="r7"></div><div class="r8"></div><div class="r9"></div><div class="r10"></div></div>
                    <div class="CommonCommentBubble">
                        <div class="CommonCommentBubbleRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                        <div class="CommonCommentContent"><div style="width: 100%; overflow: hidden;">                                 
                            <div class="ForumPostTitle">	
                                <div class="ForumPostTitleInner">					                
                                <div class="ForumPostButtons">
                                    <CSForum:ForumPostData runat="server" IgnoreLinkPermissions="true" LinkTo="Reply" LinkCssClass="ReplyButton">
                                        <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Button_Reply" /></span></ContentTemplate>
                                    </CSForum:ForumPostData>                                    
                                    <CSForum:ForumPostOptionsPopupMenu Text="<span>More</span>" runat="server" ButtonActiveCssClass="MoreButton" ButtonInactiveCssClass="MoreButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown" />
                                </div>
                                <CSForum:ForumPostData runat="server" LinkTo="PermaLink"><ContentTemplate><CSControl:ThemeImage runat="server" BorderWidth="0" ImageUrl="~/images/icon_post_show.gif" style="float: left; margin-right: 10px;" /></ContentTemplate></CSForum:ForumPostData>
                                <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Strong"  />
                                <CSForum:ForumPostEmoticon runat="server" />
                                <CSControl:PlaceHolder runat="server" Tag="Span" CssClass="ForumPostTitleDate">
                                    <ContentTemplate>
                                        <CSForum:ForumPostData runat="server" Id="ReplyToLabel" ResourceName="PostView_ReplyToLabel" LinkTo="ParentPost" />
                                        <CSControl:ConditionalContent runat="server">
                                            <ContentConditions>
                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ReplyToLabel" ControlVisiblilityEquals="true" />
                                            </ContentConditions>
                                            <TrueContentTemplate>
                                                <CSForum:ForumPostData runat="server" Property="PostDate" IncludeTimeInDate="true" />                              
                                            </TrueContentTemplate>
                                            <FalseContentTemplate>
                                                <CSForum:ForumPostData runat="server" Property="PostDate" ResourceName="Forum_Posted" IncludeTimeInDate="true" />
                                            </FalseContentTemplate>
                                        </CSControl:ConditionalContent>     
                                        <CSForum:ForumPostData runat="server" Property="UserHostAddress" ResourceName="PostFlatView_IPAddress" Tag="Span">
                                            <LeaderTemplate> | </LeaderTemplate>
                                        </CSForum:ForumPostData>                       
                                        <CSControl:ResourceControl runat="server" ResourceName="Button_Locked">
                                            <DisplayConditions><CSForum:ForumPostPropertyValueComparison ComparisonProperty="IsLocked" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                                            <LeaderTemplate> | <span class="CommonImageTextButton CommonLockedButton"></LeaderTemplate>
                                            <TrailerTemplate></span></TrailerTemplate>
                                        </CSControl:ResourceControl>
                                    </ContentTemplate>
                                </CSControl:PlaceHolder>
                                <div style="clear: both;"></div>
                                <CSForum:ForumPostRating runat="server" ID="PostRating" RatingCssClass="ForumThreadRateControl" RatingReadOnlyCssClass="ForumThreadRateControlReadOnly" RatingActiveCssClass="ForumThreadRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" EnableDetails="true" Tag="Div" />
                                <CSControl:PlaceHolder runat="server" Tag="Div">
                                    <DisplayConditions>
                                        <CSControl:Conditions runat="server" Operator="Not">
                                            <CSControl:ControlVisibilityCondition runat="server" ControlId="PostRating" /> 
                                            <CSForum:ForumPostData runat="server" Property="TotalRatings" ResourceName="Forums_RatingsSummary" />
                                        </CSControl:Conditions>
                                    </DisplayConditions>
                                    <ContentTemplate>
                                        <CSControl:UserData LinkTo="Login" runat="server">
                                            <ContentTemplate>
                                                <CSControl:ThemeImage align="absmiddle" border="0" runat="server" ImageUrl="~/images/common/5star-rating.png" /> 
                                                <CSForum:ForumPostData runat="server" Property="TotalRatings" ResourceName="Forums_RatingsSummary" />
                                            </ContentTemplate>
                                        </CSControl:UserData>
                                    </ContentTemplate>
                                </CSControl:PlaceHolder>  
                                <CSForum:PostAttachmentData runat="server" Property="FileName" LinkTo="Attachment" Tag="Div" CssClass="ForumPostAttachment" />
                                <csmail:EvolutionMediaGalleryAttachmentCount ID="EvolutionMediaGalleryAttachmentCount1" runat="server" CssClass="CommonPaperclipButton EvolutionAttachmentSummary" Tag="Div" />
                                </div>
                            </div>        
                            <div style="clear: both;"></div>
                            <CSForum:ForumPostData Property="FormattedBody" runat="server" IncrementViewCount="true" />
                            <CSForum:ForumPostData Property="EditNotes" runat="server">
                                <DisplayConditions><CSForum:ForumConfigurationPropertyValueComparison runat="server" ComparisonProperty="DisplayEditNotesInPost" Operator="IsSetOrTrue" /></DisplayConditions>
                                <LeaderTemplate><br /><br /></LeaderTemplate>
                            </CSForum:ForumPostData>        
                            <CSControl:UserProfileData Property="SignatureFormatted" runat="server" Tag="Div" CssClass="ForumPostSignature" />
                            <div class="ForumPostFooter">                            
                                <div class="ForumPostButtons" style="float: right;">
                                    <CSForum:ForumPostModerationPopupMenu ID="ForumPostModerationPopupMenu2" ResourceName="ModerationPopupMenu_Text" runat="server" ButtonActiveCssClass="CommonTextButtonHighlight" ButtonInactiveCssClass="CommonTextButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown">
                                        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                    </CSForum:ForumPostModerationPopupMenu>
                                </div>
                                <ul class="ForumPostStatistics CommonPrintHidden">
					                <CSMail:EvolutionMediaGalleryAttachmentList runat="server" Tag="div" CssClass="EvolutionAttachment">
									    <HeaderTemplate>
										    Attachments:<br />
										    <ul>
									    </HeaderTemplate>
									    <ItemTemplate>
										    <li>
											    <CSMedia:MediaGalleryPostData runat="server" Property="Subject" LinkTo="View" />
					                            <CSMedia:MediaGalleryPostData LinkCssClass="CommonImageTextButton CommonDownloadButton" LinkTo="Download" IgnoreLinkPermissions="true" Text="&nbsp;" runat="server" />
										    </li>
									    </ItemTemplate>
									    <FooterTemplate>
										    </ul>
									    </FooterTemplate>
									    <TrailerTemplate> | </TrailerTemplate>
					                </CSMail:EvolutionMediaGalleryAttachmentList>
                                    <CSForum:ForumPostTagEditableList runat="server" EditorCssClass="CommonInlineTagEditor" Tag="Li">
                                        <TrailerTemplate> | </TrailerTemplate>
                                    </CSForum:ForumPostTagEditableList>
                                    <CSForum:ForumPostData runat="server" Property="Points" ResourceName="PostFlatView_PostPoints" Tag="Li" />
                                </ul>     
                            </div>                                
                        </div></div>
                        <div class="CommonCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                    </div>
                    <div style="clear: both;"></div>
                </div>
            </ItemTemplate>
        </CSForum:ForumPostList>
    </div>
    <div class="CommonContentBoxFooter">
        <div style="float: right;">
            <CSForum:ThreadData runat="server" LinkTo="PreviousThread" ResourceName="Button_PreviousTopic"  /> |
            <CSForum:ThreadData runat="server" LinkTo="NextThread" ResourceName="Button_NextTopic"  />
        </div>
        <CSControl:Pager runat="server" id="Pager" ShowTotalSummary="true" CssClass="CommonPager">
                <CurrentPageLinkTemplate><CSControl:CSLinkData runat="server" LinkTo="Link" runat="server" Property="Text" LinkCssClass="Selected" Text="&lt;span&gt;{0}&lt;/span&gt;" /></CurrentPageLinkTemplate>
                <FirstLinkTemplate><CSControl:CSLinkData runat="server" LinkTo="Link" runat="server" Text="&lt;span&gt;&amp;laquo;&lt;/span&gt;" /></FirstLinkTemplate>
                <LastLinkTemplate><CSControl:CSLinkData runat="server" LinkTo="Link" runat="server" Text="&lt;span&gt;&amp;raquo;&lt;/span&gt;" /></LastLinkTemplate>
                <NextLinkTemplate><CSControl:CSLinkData runat="server" LinkTo="Link" runat="server" Text="&lt;span&gt;Next&lt;/span&gt;" /></NextLinkTemplate>
                <PageLinkTemplate><CSControl:CSLinkData runat="server" LinkTo="Link" Property="Text" runat="server" Text="&lt;span&gt;{0}&lt;/span&gt;" /></PageLinkTemplate>
                <PreviousLinkTemplate><CSControl:CSLinkData runat="server" LinkTo="Link" runat="server" Text="&lt;span&gt;Prev&lt;/span&gt;" /></PreviousLinkTemplate>
                <SeparatorTemplate></SeparatorTemplate>
                <TrailerTemplate><div style="clear: both;"></div></TrailerTemplate>
            <PagerUrlFormatTemplate>
                <CSControl:SiteUrl runat="server" RenderRawUrl="true" UrlName="hub_forum_thread_paged" Parameter3="{0}">
            	    <Parameter1Template><CSHub:HubData runat="server" Property="ApplicationKey" /></Parameter1Template>
                    <Parameter2Template><CSForum:ThreadData runat="server" Property="ThreadID" FormatString="0" /></Parameter2Template>
                </CSControl:SiteUrl>
            </PagerUrlFormatTemplate>
        </CSControl:Pager>
        <CSForum:ThreadData LinkTo="Rss" runat="server" Text="RSS">
            <LeaderTemplate> | </LeaderTemplate>
        </CSForum:ThreadData>
    </div>
</div>

