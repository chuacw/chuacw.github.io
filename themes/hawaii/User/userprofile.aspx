<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="UserBadgeArea" Src="UserBadgeArea.ascx" %>

<script runat="server" language="C#">

    DateTime lastDate = DateTime.MinValue;
    string lastDateKey = string.Empty;
    CommunityServer.Components.User user = CommunityServer.Components.CSContext.Current.User;

    public bool ShowDateHeader(string key, object date)
    {
        DateTime currDate = user.GetTimezone((DateTime)date).Date;
        if (currDate != lastDate || key != lastDateKey)
        {
            lastDateKey = key;
            lastDate = currDate;
            return true;
        }
        else
            return false;
    }

</script>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSControl:UserData Property="DisplayName" runat="server" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">
    <div class="CommonSidebar">
    
        <CSUserControl:UserBadgeArea runat="server" />
        

	    <CSControl:PlaceHolder runat="server">
	        <DisplayConditions Operator="Or">
	            <CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="EnableFavoriteSharing" Operator="IsSetOrTrue" />
	        </DisplayConditions>
	        <ContentTemplate>
	            <div class="CommonContentBox">
                    <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_Tab_Favorites" /></h4>
                    <div class="CommonContentBoxContent">
                        <CSControl:FavorableContentList runat="server">
                            <QueryOverrides QueryType="CurrentUserFavorites" PageSize="10" PagerID="FavoritesPager" />
                            <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
                            <ItemTemplate><CSControl:FavorableContentData Property="TitleHtml" LinkTo="View" Tag="LI" runat="server" /></ItemTemplate>
                            <NoneTemplate><li>
                                <CSControl:ResourceControl runat="server" ResourceName="Profile_NoFavoritePosts">
                                    <Parameter1Template><CSControl:UserData runat="server" Property="DisplayName" /></Parameter1Template>
                                </CSControl:ResourceControl>
                            </li></NoneTemplate>
                            <FooterTemplate></ul></FooterTemplate>
                        </CSControl:FavorableContentList>
                    </div>
                    <CSControl:Pager ShowFirst="false" ShowPrevious="false" ShowIndividualPages="false" ShowLast="false" ID="FavoritesPager" Tag="Div" CssClass="CommonContentBoxFooter">
                        <NextLinkTemplate>
                            <CSControl:UserData LinkTo="Favorites" ResourceName="ViewUserProfile_Favorites_ViewAll" runat="server" />
                        </NextLinkTemplate>
                    </CSControl:Pager>
                </div>
	        </ContentTemplate>
	    </CSControl:PlaceHolder>
	    
	    <CSControl:TemporaryRssFeedList runat="server" ShowHeaderFooterOnNone="true">
	        <QueryOverrides QueryType="ForCurrentUser" />
	        <HeaderTemplate>
	            <div class="CommonContentBox">
                <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="SharedFeeds" /></h4>
                <div class="CommonContentBoxContent">
	        </HeaderTemplate>
	        <ItemTemplate>
                <CSControl:DelayedContent runat="server" LoadImmediately="true">
                    <ContentTemplate>
                        <CSControl:ConditionalContent runat="server">
                            <DisplayConditions><CSControl:TemporaryRssFeedPropertyValueComparison runat="server" ComparisonProperty="TotalItems" Operator="GreaterThan" ComparisonValue="0" /></DisplayConditions>
                            <TrueContentTemplate>
                                <ul class="CommonContentBoxList">
                                    <CSControl:TemporaryRssFeedData runat="server" Property="Title" LinkTo="Feed" Tag="LI" style="font-size: 115%; font-weight: bold;" />
                                    <CSControl:TemporaryRssFeedItemList runat="server">
                                        <QueryOverrides PageSize="5" />
                                        <ItemTemplate><CSControl:TemporaryRssFeedItemData runat="server" Property="Title" LinkTo="FeedItem" Tag="LI" /></ItemTemplate>
                                    </CSControl:TemporaryRssFeedItemList>
                                </ul>
                            </TrueContentTemplate>
                            <FalseContentTemplate>
                                <ul class="CommonContentBoxList">
                                    <CSControl:TemporaryRssFeedData runat="server" LinkTo="Feed" Property="Url" Tag="Li" />
                                </ul>
                            </FalseContentTemplate>
                        </CSControl:ConditionalContent>
                    </ContentTemplate>		        
                    <NotLoadedTemplate>
                        <ul class="CommonContentBoxList">
                            <CSControl:TemporaryRssFeedData runat="server" LinkTo="Feed" Property="Url" Tag="Li" />
                        </ul>
                    </NotLoadedTemplate>
                </CSControl:DelayedContent>
	        </ItemTemplate>
	        <NoneTemplate><CSControl:UserData runat="server" Property="DisplayName" ResourceName="ViewUserProfile_NoSharedFeeds" />  <CSControl:UserData LinkTo="EditProfile" ResourceName="ViewUserProfile_EditToAddFeeds" runat="server" Tag="P" /></NoneTemplate>
	        <FooterTemplate>
	                </div>
	            </div>
	        </FooterTemplate>
	    </CSControl:TemporaryRssFeedList>
	    
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:ConditionalAction runat="server">
        <Conditions Operator="And">
            <CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="RequireAuthenticationForProfiles" Operator="IsSetOrTrue" />
            <CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" />
        </Conditions>
        <Actions>
            <CSControl:GoToSiteUrlAction runat="server" UrlName="login">
                <Parameter1Template><CSControl:ModifiedUrl runat="server" Encoding="URL" RenderRawUrl="true" /></Parameter1Template>
            </CSControl:GoToSiteUrlAction>
        </Actions>
    </CSControl:ConditionalAction>

    <div class="CommonContentBox">
        <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_MyBio" /></h4>
        <div class="CommonContentBoxContent">
            <CSControl:UserProfileData Property="Bio" runat="server" />
            <CSControl:PlaceHolder runat="server">
                <DisplayConditions Operator="Not"><CSControl:UserProfilePropertyValueComparison runat="server" ComparisonProperty="Bio" Operator="ContainsVisibleHtml" /></DisplayConditions>
                <ContentTemplate><CSControl:UserData runat="server" Property="DisplayName" ResourceName="ViewUserProfile_MyBio_NotEntered" />  <CSControl:UserData LinkTo="EditProfile" ResourceName="ViewUserProfile_MyBio_Edit" runat="server" Tag="P" /></ContentTemplate>
            </CSControl:PlaceHolder>
        </div>
    </div>
    
    <div class="CommonContentBox Highlighted">
        <h4 class="CommonContentBoxHeader">
            <CSControl:UserData runat="server" LinkTo="AnnouncementsRss" style="float: right;">
                <ContentTemplate>
                    <CSControl:ThemeImage ImageUrl="~/images/common/feed-icon-12x12.png" BorderWidth="0" runat="server" />
                </ContentTemplate>
            </CSControl:UserData>
            <CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_Announcements" />
        </h4>
        <div class="CommonContentBoxContent">
            <CSMessage:ProfileMessageList runat="server" ShowHeaderFooterOnNone="true">
                <QueryOverrides runat="server" QueryType="AnnouncementsForCurrentUser" PageSize="5" PagerID="AnnouncementsPager" />
                <HeaderTemplate>
                    <ul class="CommonContentBoxList">
                </HeaderTemplate>
                <ItemTemplate>
                    <CSMessage:ProfileMessageData runat="server" Property="DateCreated" Tag="Li" CssClass="Header">
                        <DisplayConditions><CSControl:CustomCondition CustomResult='<%# ShowDateHeader("Announcements", Eval("DateCreated")) %>' runat="server" /></DisplayConditions>
                    </CSMessage:ProfileMessageData>
                    <li>
                        <div class="CommonMessageActions">
                            <CSMessage:ProfileMessageData runat="server" ResourceName="Edit" LinkTo="Edit">
                                <TrailerTemplate> | </TrailerTemplate>
                            </CSMessage:ProfileMessageData>
                            <CSMessage:DeleteProfileMessageForm runat="server" DeleteButtonId="DeleteAnnouncement" ConfirmationResourceName="ViewUserProfile_DeleteAnnouncementConfirmation">
                                <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                <FormTemplate><asp:LinkButton runat="server" id="DeleteAnnouncement" Text="Delete" /></FormTemplate>
                            </CSMessage:DeleteProfileMessageForm>
                        </div>                
                        <div class="CommonMessageHeader">
                            <CSMessage:ProfileMessageData runat="server" Property="Subject" Tag="Strong" />
                        </div>
                        <CSMessage:ProfileMessageData runat="server" Property="Body" Tag="Div" />
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </CSMessage:ProfileMessageList>
        </div>
        <CSControl:PostbackPager runat="server" ID="AnnouncementsPager" ShowFirst="false" ShowLast="false" ShowPrevious="false" ShowIndividualPages="false" ShowNext="True" ShowTotalSummary="false" Tag="Div" CssClass="CommonContentBoxFooter">
            <NextLinkTemplate><CSControl:UserData LinkTo="Announcements" runat="server" ResourceName="ViewMore" /></NextLinkTemplate>
        </CSControl:PostbackPager>
        <CSControl:UserData LinkTo="AddAnnouncement" runat="server" ResourceName="ViewUserProfile_AddAnnouncement" CssClass="CommonContentBoxFooter">
            <DisplayConditions><CSControl:CurrentUserIsAccessingUserCondition runat="server" /></DisplayConditions>
        </CSControl:UserData>
    </div>
    
    <CSMessage:ActivityMessageList runat="server" ShowHeaderFooterOnNone="false" ID="ActivityList">
        <QueryOverrides QueryType="CurrentUserActivity" PageSize="15" PageIndex="0" PagerID="ActivityPager" />
        <LeaderTemplate>
            <script type="text/javascript">
                function confirmActivityDelete()
                {
                    return window.confirm('<%# CommunityServer.Components.ResourceManager.GetString("Activity_DeleteConfirmation") %>');
                }
            </script>
            <div class="CommonContentBox TitleHighlighted">
                <h4 class="CommonContentBoxHeader">
                    <CSControl:UserData runat="server" LinkTo="ActivitiesRss" style="float: right;">
                        <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/common/feed-icon-12x12.png" BorderWidth="0" runat="server" /></ContentTemplate>
                    </CSControl:UserData>
                    <CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_RecentActivity" />
                </h4>
                <div class="CommonContentBoxContent">
        </LeaderTemplate>
        <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
        <ItemTemplate>
                <CSMessage:ActivityMessageData runat="server" Property="DateCreated" Tag="Li" CssClass="Header">
                    <DisplayConditions><CSControl:CustomCondition CustomResult='<%# ShowDateHeader("Activity", Eval("DateCreated")) %>' runat="server" /></DisplayConditions>
                </CSMessage:ActivityMessageData>
                <CSMessage:ActivityMessageData Property="Type" Text="&lt;li class=&quot;CommonActivity {0}&quot;&gt;" runat="server" />
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr valign="top">
                            <td align="left" class="CommonActivityContent">
                                <CSMessage:ActivityMessageData runat="server" Property="Body" />            
                            </td>
                            <td align="right">
                                <CSMessage:DeleteActivityMessageForm runat="server" DeleteButtonId="DeleteActivity">
                                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                    <FormTemplate>
                                            <CSControl:ResourceLinkButton runat="server" ID="DeleteActivity" ToolTip="Delete Activity Message" OnClientClick="return confirmActivityDelete();">
                                                <CSControl:ThemeImage runat="server" ImageUrl="~/images/common/x-delete-icon.png" BorderWidth="0" />
                                            </CSControl:ResourceLinkButton>
                                    </FormTemplate>
                                </CSMessage:DeleteActivityMessageForm>
                            </td>
                        </tr>
                    </table>
                </li>
        </ItemTemplate>
        <NoneTemplate><CSControl:UserData runat="server" Property="DisplayName" ResourceName="ViewUserProfile_NoRecentActivity" /></NoneTemplate>
        <FooterTemplate></ul></FooterTemplate>
        <TrailerTemplate>
                </div>
        </TrailerTemplate>
    </CSMessage:ActivityMessageList>
    <CSControl:PlaceHolder runat="server">
        <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="ActivityList" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
        <ContentTemplate>
                <CSControl:PostbackPager runat="server" ID="ActivityPager" ShowFirst="false" ShowLast="false" ShowPrevious="false" ShowIndividualPages="false" ShowNext="True" ShowTotalSummary="false" Tag="Div" CssClass="CommonContentBoxFooter">
                    <NextLinkTemplate><CSControl:UserData LinkTo="Activities" runat="server" ResourceName="ViewMore" /></NextLinkTemplate>
                </CSControl:PostbackPager>
            </div> 
        </ContentTemplate>
    </CSControl:PlaceHolder>
    
    <div class="CommonContentBox">
        <h4 class="CommonContentBoxHeader">
            <CSControl:UserData runat="server" LinkTo="CommentsRss" style="float: right;">
                <ContentTemplate>
                    <CSControl:ThemeImage ImageUrl="~/images/common/feed-icon-12x12.png" BorderWidth="0" runat="server" />
                </ContentTemplate>
            </CSControl:UserData>
            <CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_Tab_Comments" />
        </h4>
        <div class="CommonContentBoxContent">
            <script type="text/javascript">
                function confirmCommentDelete() { return window.confirm('<CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_DeleteMessageConfirmation" Encoding="JavaScript" />'); }
            </script>
            <CSMessage:ProfileMessageList runat="server" ShowHeaderFooterOnNone="false">
                <QueryOverrides runat="server" QueryType="CommentsForCurrentUser" PageSize="5" PagerID="CommentPager" />
                <ItemTemplate>
                    <div class="CommonCommentArea">
                        <div class="CommonCommentUser">
                            <CSControl:UserData runat="server" LinkTo="Profile">
                                <ContentTemplate>
                                    <CSControl:UserAvatar runat="server" BorderWidth="0" Width="60" Height="60" />
                                </ContentTemplate>
                            </CSControl:UserData>
                        </div>
                        <div class="CommonCommentArrow"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div><div class="r5"></div><div class="r6"></div><div class="r7"></div><div class="r8"></div><div class="r9"></div><div class="r10"></div></div>
                        <div class="CommonCommentBubble">
                            <div class="CommonCommentBubbleRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                            <div class="CommonCommentContent">
                                <CSMessage:DeleteProfileMessageForm runat="server" DeleteButtonId="DeleteComment" Tag="Div" CssClass="CommonMessageActions">
                                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                    <FormTemplate><CSControl:ResourceLinkButton runat="server" id="DeleteComment" ResourceName="ViewUserProfile_DeleteComment" OnClientClick="return confirmCommentDelete();" /></FormTemplate>
                                </CSMessage:DeleteProfileMessageForm>
                                <div class="CommonMessageHeader">
                                    <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" Tag="Strong" /> 
                                    <CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_Wrote" />
                                    <CSMessage:ProfileMessageData runat="server" Property="Subject" Tag="Strong" />
                                </div>
                                <div class="CommonMessageDate">
                                    <CSControl:ResourceControl runat="server" ResourceName="on" /> <CSMessage:ProfileMessageData runat="server" Property="DateCreated" IncludeTimeInDate="true" />
                                </div>
                                
                                <CSMessage:ProfileMessageData runat="server" Property="Body" Tag="Div" />
                            </div>
                            <div class="CommonCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                        </div>
                        <div style="clear: both;"></div>
                    </div>     
                </ItemTemplate>
                <NoneTemplate>
	                <CSControl:UserData Property="DisplayName" ResourceName="ViewUserProfile_NoComments" runat="server" />
	            </NoneTemplate>
            </CSMessage:ProfileMessageList>
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:PostbackPager runat="server" ID="CommentPager" ShowFirst="false" ShowLast="false" ShowPrevious="false" ShowIndividualPages="false" ShowNext="True" ShowTotalSummary="false">
                <NextLinkTemplate>
                    <CSControl:UserData LinkTo="Comments" ResourceName="ViewMore" runat="server" />
                    <CSControl:WrappedLiteral Text=" | " runat="server">
                        <DisplayConditions Operator="not"><CSControl:CurrentUserIsAccessingUserCondition runat="server" /></DisplayConditions>
                    </CSControl:WrappedLiteral>
                </NextLinkTemplate>
            </CSControl:PostbackPager>
            <CSControl:UserData LinkTo="addcomment" runat="server" ResourceName="ViewUserProfile_AddComment">
                <DisplayConditions Operator="not"><CSControl:CurrentUserIsAccessingUserCondition runat="server" /></DisplayConditions>
            </CSControl:UserData>
        </div>
    </div>
    	
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server">
    <div class="CommonSidebar">

        <div class="CommonContentBox">
            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_Tab_UserWatchingYou" /></h4>
	        <div class="CommonContentBoxContent">
	            <CSControl:FriendshipList runat="server" ShowHeaderFooterOnNone="false">
	                <QueryOverrides runat="server" QueryType="ApprovedForCurrentUser" PageSize="9" SortBy="LastModifiedDate" SortOrder="descending" PagerID="FriendPager" />
		            <ItemTemplate>
		                <div class="CommonAvatarListArea">
                           <CSControl:UserData LinkTo="Profile" runat="server" Tag="Div" CssClass="CommonAvatarArea"><ContentTemplate><CSControl:UserAvatar runat="server" Width="60" Height="60" /></ContentTemplate></CSControl:UserData>
                           <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" TruncateAt="25" />
                        </div>
		            </ItemTemplate>
		            <NoneTemplate><CSControl:UserData Property="DisplayName" runat="server" ResourceName="EditProfile_Friends_None" /></NoneTemplate>
		            <FooterTemplate>
			            <div style="clear: both;"></div>
		            </FooterTemplate>
	            </CSControl:FriendshipList>
	        </div>
	        <CSControl:PostbackPager runat="server" ID="FriendPager" ShowFirst="false" ShowLast="false" ShowPrevious="false" ShowIndividualPages="false" ShowNext="True" ShowTotalSummary="false" Tag="Div" CssClass="CommonContentBoxFooter">
                <NextLinkTemplate><CSControl:UserData LinkTo="Friends" ResourceName="ViewMore" runat="server" /></NextLinkTemplate>
            </CSControl:PostbackPager>
	    </div>

        <CSControl:PlaceHolder runat="server">
            <DisplayConditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="Hub" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></DisplayConditions>
            <ContentTemplate>
                <div class="CommonContentBox">
                    <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_Tab_Hubs" /></h4>
                    <div class="CommonContentBoxContent">
	                    <CSHub:SectionMembershipList runat="server" ShowHeaderFooterOnNone="false">
	                        <QueryOverrides SortBy="SectionName" SortOrder="Ascending" QueryType="CurrentUserMembership" PageSize="6" MembershipType="Owner,Manager,Member" />
                            <ItemTemplate>
                                <CSHub:HubData runat="server" CssClass="CommonAvatarListArea" Tag="Div">
                                    <DisplayConditions Operator="or">
                                        <CSControl:Conditions runat="server" Operator="not">
                                            <CSHub:HubPropertyValueComparison runat="server" ComparisonProperty="IsPrivate" Operator="issetortrue" />    
                                        </CSControl:Conditions>
                                        <CSHub:HubPermissionCondition runat="server" Permission="view" />
                                    </DisplayConditions>
                                    <ContentTemplate>
                                        <CSHub:HubData runat="server" LinkTo="HomePage" Tag="Div" CssClass="CommonAvatarArea">
                                            <ContentTemplate><CSHub:HubAvatar runat="server" BorderWidth="0" Width="60" Height="60" /></ContentTemplate>
                                        </CSHub:HubData>
                                        <CSHub:HubData runat="server" Property="Name" TruncateAt="25" LinkTo="HomePage" />
                                    </ContentTemplate>
                                </CSHub:HubData>
                            </ItemTemplate>
                            <NoneTemplate>
                                <CSControl:UserData Property="DisplayName" runat="server" ResourceName="ViewUserProfile_NoHubs" />
                            </NoneTemplate>
                            <FooterTemplate><div style="clear: both;"></div></FooterTemplate>
                        </CSHub:SectionMembershipList>
                    </div>
                    <div class="CommonContentBoxFooter">
                        <CSControl:SiteUrl UrlName="hubshome" ResourceName="ViewAllGroups" runat="server" />
                    </div>
                </div>
            </ContentTemplate>
        </CSControl:PlaceHolder>
	    
	    <CSControl:PlaceHolder runat="server">
	        <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="EnableUserFileStorage" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
	        <ContentTemplate>
	            <div class="CommonContentBox">
                    <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_Tab_Files" /></h4>
                    <div class="CommonContentBoxContent">
                        <CSControl:UserFolderList runat="server" ID="UserFolders">
                            <QueryOverrides QueryType="CurrentUserFolders" PageSize="4" />
                            <ItemTemplate>
                                <div class="CommonAvatarListArea">
                                    <CSControl:UserFolderData runat="server" LinkTo="View" Tag="Div" CssClass="CommonAvatarArea">
                                        <ContentTemplate><CSControl:Image runat="server" ImageUrl="~/utility/filethumbnails/folder.gif" Width="60" Height="60" BorderWidth="0" /></ContentTemplate>
                                    </CSControl:UserFolderData>
                                    <CSControl:UserFolderData runat="server" Property="Name" LinkTo="View" TruncateAt="25" />
                                </div>
                            </ItemTemplate>
                        </CSControl:UserFolderList>
	                    <CSControl:UserFileList runat="server" ID="UserFiles">
                            <QueryOverrides QueryType="CurrentUserFiles" PageSize="5" />
                            <ItemTemplate>
                                <div class="CommonAvatarListArea">
                                    <CSControl:UserFileData runat="server" LinkTo="View" Tag="Div" CssClass="CommonAvatarArea">
                                        <ContentTemplate><CSControl:UserFileViewer runat="server" ViewType="Preview" Width="60" Height="60" /></ContentTemplate>
                                    </CSControl:UserFileData>
                                    <CSControl:UserFileData runat="server" Property="Name" LinkTo="View" TruncateAt="25" />
                                </div>
                            </ItemTemplate>
                        </CSControl:UserFileList>
                        <div style="clear: both;"></div>
                        
                        <CSControl:PlaceHolder runat="server">
                            <DisplayConditions Operator="And">
                                <CSControl:ControlPropertyValueComparison ComparisonControlId="UserFolders" ComparisonProperty="DataSource" Operator="EqualTo" ComparisonValue="0" runat="server" />
                                <CSControl:ControlPropertyValueComparison ComparisonControlId="UserFiles" ComparisonProperty="DataSource" Operator="EqualTo" ComparisonValue="0" runat="server" />
                            </DisplayConditions>
                            <ContentTemplate>
                                <CSControl:UserData Property="DisplayName" ResourceName="ViewUserProfile_NoFiles" runat="server" />
                                <CSControl:UserData LinkTo="UserFiles" runat="server" ResourceName="Uploadfiles" Tag="P">
                                    <DisplayConditions><CSControl:CurrentUserIsAccessingUserCondition runat="server" /></DisplayConditions>
                                </CSControl:UserData>
                            </ContentTemplate>
                        </CSControl:PlaceHolder>
                        
                    </div>
                    <div class="CommonContentBoxFooter">
                        <CSControl:UserData runat="server" LinkTo="userfiles" ResourceName="ViewUserProfile_ViewAllFiles" />
                    </div>
                </div>
            </ContentTemplate>
	    </CSControl:PlaceHolder>
</div>
</asp:Content>