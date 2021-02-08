<%@ Control Language="C#" AutoEventWireup="true" %>

<script runat="server" language="C#">

    public string AdditionalCssClass
    {
        get { return (string) ViewState["AdditionalCssClass"] ?? string.Empty; }
        set { ViewState["AdditionalCssClass"] = value; }
    }

    public bool RenderLinkTarget
    {
        get { return (bool) (ViewState["RenderLinkTarget"] ?? true); }
        set { ViewState["RenderLinkTarget"] = value; }
    }

    public bool ShowPostButtons
    {
        get { return (bool)(ViewState["ShowPostButtons"] ?? true); }
        set { ViewState["ShowPostButtons"] = value; }
    }

</script>

<CSForum:ForumPostData runat="server" Property="PostID" FormatString="0" Text="&lt;a name=&quot;{0}&quot;&gt;&lt;/a&gt;">                  
    <DisplayConditions><CSControl:CustomCondition runat="server" CustomResult='<%# RenderLinkTarget %>' /></DisplayConditions>
</CSForum:ForumPostData>

<CSControl:ConditionalContent runat="server">
    <ContentConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostStatus" ComparisonValue="IsAnswer" Operator="Contains"  /></ContentConditions>
    <TrueContentTemplate><div class="CommonCommentArea Verified <%# AdditionalCssClass %>"></TrueContentTemplate>
    <FalseContentTemplate>
        <CSControl:ConditionalContent runat="server">
            <ContentConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostStatus" ComparisonValue="IsSuggestedAnswer" Operator="Contains" /></ContentConditions>
            <TrueContentTemplate><div class="CommonCommentArea Suggested <%# AdditionalCssClass %>"></TrueContentTemplate>
            <FalseContentTemplate><div class="CommonCommentArea Normal <%# AdditionalCssClass %>"></FalseContentTemplate>
        </CSControl:ConditionalContent>
    </FalseContentTemplate>
</CSControl:ConditionalContent>
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
                    <TrailerTemplate> <CSControl:ResourceControl ResourceName="PostFlatView_Posts" runat="server" /></TrailerTemplate>
                </CSControl:UserData>
                <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="UserRank" Tag="Div">
                    <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="UserRank" Operator="EqualTo" /></DisplayConditions>
                </CSControl:UserData>
                <CSControl:UserData runat="server" Property="Points" Tag="Div"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="PostFlatView_UserPoints" /></LeaderTemplate></CSControl:UserData>
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
                <CSControl:PlaceHolder Tag="Div" CssClass="ForumPostButtons" runat="server">
                    <DisplayConditions><CSControl:CustomCondition runat="server" CustomResult='<%# ShowPostButtons %>' /></DisplayConditions>
                    <ContentTemplate>
                        <CSForum:ForumPostData runat="server" IgnoreLinkPermissions="true" LinkTo="Reply" LinkCssClass="ReplyButton">
                            <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Button_Reply" /></span></ContentTemplate>
                        </CSForum:ForumPostData>
                        <CSForum:ForumPostStatusAnswerForm runat="server" SuggestAnswerButtonId="SuggestAnswerButton" VerifyAnswerButtonId="VerifyAnswerButton" NotAnswerButtonId="NotAnswerButton">
                            <SuccessActions>
                                <CSForum:GoToCurrentPostAction runat="server" />
                            </SuccessActions>
                            <FormTemplate>
                                <asp:LinkButton runat="server" ID="NotAnswerButton" CssClass="NotAnswerButton"><span><CSControl:ResourceControl runat="server" ResourceName="MarkAsNotAnswer" /></span></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="SuggestAnswerButton" CssClass="SuggestAnswerButton"><span><CSControl:ResourceControl runat="server" ResourceName="PostQuestionAnswerView_SuggestAsAnswer" /></span></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="VerifyAnswerButton" CssClass="AnswerButton"><span><CSControl:ResourceControl runat="server" ResourceName="MarkAsAnswer" /></span></asp:LinkButton>                                                        
                            </FormTemplate>
                        </CSForum:ForumPostStatusAnswerForm>
                        <CSForum:ForumPostOptionsPopupMenu Text="<span>More</span>" runat="server" ButtonActiveCssClass="MoreButton" ButtonInactiveCssClass="MoreButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown" />
                    </ContentTemplate>
                </CSControl:PlaceHolder>
                <CSForum:ForumPostData runat="server" LinkTo="PermaLink">
                    <ContentTemplate>
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostStatus" ComparisonValue="IsAnswer" Operator="Contains"  /></ContentConditions>
                            <TrueContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_Answered.gif" runat="server" AlternateTextResourceName="Status_Answered" style="float: left; margin-right: 5px;" /></TrueContentTemplate>
                            <FalseContentTemplate>
                                <CSControl:ConditionalContent runat="server">
                                    <ContentConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostStatus" ComparisonValue="IsSuggestedAnswer" Operator="Contains" /></ContentConditions>
                                    <TrueContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_SuggestedAnswer.gif" runat="server" AlternateTextResourceName="Status_AnsweredNotVerified" style="float: left; margin-right: 5px;" /></TrueContentTemplate>
                                    <FalseContentTemplate><CSControl:ThemeImage runat="server" BorderWidth="0" ImageUrl="~/images/icon_post_show.gif" style="float: left; margin-right: 5px;" /></FalseContentTemplate>
                                </CSControl:ConditionalContent>
                            </FalseContentTemplate>
                        </CSControl:ConditionalContent>
                    </ContentTemplate>
                </CSForum:ForumPostData>
                <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Strong"  />
                <CSForum:ForumPostEmoticon runat="server" />
                <span class="ForumPostTitleDate">
                    <CSForum:ForumPostData runat="server" Id="ReplyToLabel" ResourceName="PostView_ReplyToLabel" LinkTo="ParentPost" />
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ReplyToLabel" ControlVisiblilityEquals="true" /></ContentConditions>
                        <TrueContentTemplate><CSForum:ForumPostData runat="server" Property="PostDate" IncludeTimeInDate="true" /></TrueContentTemplate>
                        <FalseContentTemplate><CSForum:ForumPostData runat="server" Property="PostDate" ResourceName="Forum_PostedOn" IncludeTimeInDate="true" /></FalseContentTemplate>
                    </CSControl:ConditionalContent>     
                    <CSForum:ForumPostData runat="server" Property="UserHostAddress" ResourceName="PostFlatView_IPAddress" Tag="Span">
                        <LeaderTemplate> | </LeaderTemplate>
                    </CSForum:ForumPostData>                       
                    <CSControl:ResourceControl runat="server" ResourceName="Button_Locked">
                        <DisplayConditions><CSForum:ForumPostPropertyValueComparison ComparisonProperty="IsLocked" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                        <LeaderTemplate> | <span class="CommonImageTextButton CommonLockedButton"></LeaderTemplate>
                        <TrailerTemplate></span></TrailerTemplate>
                    </CSControl:ResourceControl>
                </span>
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
                </div>
                <CSForum:ForumPostAnswerVerifiedByUserList runat="server">
                    <DisplayConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostStatus" ComparisonValue="IsSuggestedAnswer" Operator="Contains" /></DisplayConditions>
                    <QueryOverrides QueryType="AnswerSuggestedBy" />
                    <HeaderTemplate><div class="ForumPostSuggestedBySection">Suggested by </HeaderTemplate>
                    <ItemTemplate><CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" /></ItemTemplate>
                    <TrailerTemplate></div></TrailerTemplate>
                </CSForum:ForumPostAnswerVerifiedByUserList>
                <CSForum:ForumPostAnswerVerifiedByUserList runat="server">
                    <DisplayConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostStatus" ComparisonValue="IsAnswer" Operator="Contains"  /></DisplayConditions>
                    <QueryOverrides QueryType="AnswerVerifiedBy" />
                    <HeaderTemplate><div class="ForumPostVerifiedBySection">Verified by </HeaderTemplate>
                    <ItemTemplate>
                        <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" />
                    </ItemTemplate>
                    <TrailerTemplate></div></TrailerTemplate>
                </CSForum:ForumPostAnswerVerifiedByUserList>
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
                    <table cellpadding="0" cellspacing="0" border="0"><tr>
                        <CSForum:ForumPostModerationPopupMenu ID="ForumPostModerationPopupMenu2" ResourceName="ModerationPopupMenu_Text" runat="server" ButtonActiveCssClass="CommonTextButtonHighlight" ButtonInactiveCssClass="CommonTextButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown">
                            <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                            <LeaderTemplate><td></LeaderTemplate>
                            <TrailerTemplate></td><td> | </td></TrailerTemplate>
                        </CSForum:ForumPostModerationPopupMenu>
                        <CSForum:ForumPostData runat="server" LinkTo="QuickReply" ResourceName="QuickReply">
                            <LeaderTemplate><td>&nbsp;</LeaderTemplate>
                            <TrailerTemplate></td></TrailerTemplate>
                        </CSForum:ForumPostData>
                    </tr></table>
                </div>
                <ul class="ForumPostStatistics CommonPrintHidden">
                    <CSForum:ForumPostTagEditableList runat="server" EditorCssClass="CommonInlineTagEditor" Tag="Li" />
                    <CSForum:ForumPostData runat="server" Property="Points" ResourceName="PostFlatView_PostPoints" Tag="Li">
                        <LeaderTemplate> | </LeaderTemplate>
                    </CSForum:ForumPostData>
                </ul>  
            </div>
        </div></div>
        <div class="CommonCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
    </div>
    <div style="clear: both;"></div>
</div>
