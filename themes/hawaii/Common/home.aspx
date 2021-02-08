<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="home.Master" %>

<script runat="server" language="C#">

    void Page_Load()
    {
        int userID = CommunityServer.Components.CSContext.Current.User.UserID;
        ((WeblogPostList)CSControlUtility.Instance().FindControl(this, "BlogInformation")).QueryOverrides.UserID = userID;
        ((MediaGalleryPostList)CSControlUtility.Instance().FindControl(this, "MediaInformation")).QueryOverrides.UserID = userID;

        if (!user.IsAnonymous)
        {
            string titleText = string.Format(CommunityServer.Components.ResourceManager.GetString("ViewUserProfile_UserFriendsActivity"), user.DisplayName);
            string aggRssUrl = CommunityServer.Components.SiteUrls.Instance().UserFriendsActivityRss(user.Username);
            Head.AddRssAutoDiscovery(titleText, aggRssUrl, this.Context);
        }
    }
    
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
    <CSControl:Title runat="server" EnableRendering="true" IncludeSiteName="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate>
            <CSControl:ConditionalContent runat="server">
                <ContentConditions Operator="Or">
                    <CSControl:SiteThemeConfigurationDataPropertyValueComparison ComparisonProperty="showWelcomeMessageToAllUsers" Operator="IsSetOrTrue" runat="server" />
                    <CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" />
                </ContentConditions>
                <TrueContentTemplate><CSControl:ResourceControl runat="server" ResourceName="Home" /></TrueContentTemplate>
                <FalseContentTemplate><CSControl:UserData UseAccessingUser="true" runat="server" Property="DisplayName" /></FalseContentTemplate>
            </CSControl:ConditionalContent>
        </ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">
    <CSControl:PlaceHolder runat="server">
        <DisplayConditions Operator="And">
            <CSControl:Conditions runat="server" Operator="Not"><CSControl:SiteThemeConfigurationDataPropertyValueComparison ComparisonProperty="showWelcomeMessageToAllUsers" Operator="IsSetOrTrue" runat="server" /></CSControl:Conditions>
            <CSControl:Conditions runat="server" Operator="Not"><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></CSControl:Conditions>
        </DisplayConditions>
        <ContentTemplate>
            <div class="CommonSidebar">
	            <div class="CommonContentBox">
	                <div class="CommonContentBoxContent">
	                    <div style="float: left; margin: 0 10px 10px 0;">
	                        <CSControl:UserAvatar runat="server" UseAccessingUser="true" Width="80" Height="80" />
	                    </div>
   	                    <ul class="CommonContentBoxList" style="float: left;">
	                        <CSControl:UserData UseAccessingUser="true" LinkTo="Profile" Tag="Li" runat="server" ResourceName="Profile_ViewPublicProfile" />
	                        <CSControl:UserData UseAccessingUser="true" LinkTo="EditProfile" Tag="Li" runat="server" ResourceName="Home_EditProfile" />
	                        <CSControl:UserData UseAccessingUser="true" runat="server" LinkTo="ChangeAvatar" ResourceName="EditProfile_ChangeAvatar" Tag="Li" />
	                    </ul>
	                    <div style="clear: both;"></div>
	                </div>
                </div>
	        
                <CSControl:PlaceHolder runat="server">
                    <DisplayConditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="Weblog" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></DisplayConditions>
                    <ContentTemplate>
                        <div class="CommonContentBox Highlighted2">
                            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="weblogs" /></h4>
                            <div class="CommonContentBoxContent">
	                            <CSBlog:WeblogPostList runat="server" ID="BlogInformation" ShowHeaderFooterOnNone="true">
	                                <QueryOverrides BlogPostType="Article,Comment,Post" PageSize="5" PageIndex="0" IncludeCategories="false" IsAggregate="false" IsCommunityAggregatedOnly="false" PostConfig="Empty" />
	                                <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
	                                <ItemTemplate>
                                        <CSBlog:WeblogPostData runat="server" Property="Subject" TruncateAt="50" LinkTo="Post" Tag="LI" />
                                        <CSBlog:WeblogPostFeedbackData runat="server" Property="Subject" TruncateAt="50" LinkTo="Feedback" Tag="LI" />    	    
	                                </ItemTemplate>
	                                <NoneTemplate>
	                                    <li><CSControl:ResourceControl runat="server" ResourceName="Home_NotPosted" /></li>
	                                </NoneTemplate>
	                                <FooterTemplate></ul></FooterTemplate>
	                            </CSBlog:WeblogPostList>
	                            <CSBlog:SectionMembershipList runat="server" ShowHeaderFooterOnNone="false">
	                                <QueryOverrides QueryType="AccessingUserMembership" MembershipType="Owner" PageSize="5" PageIndex="0" />
	                                <HeaderTemplate><ul class="CommonContentBoxList Seperator"></HeaderTemplate>
	                                <ItemTemplate>
	                                    <CSBlog:WeblogData LinkTo="HomePage" Property="Name" runat="server" Tag="LI" style="font-weight: bold;" />
	                                </ItemTemplate>
	                                <FooterTemplate></ul></FooterTemplate>
	                            </CSBlog:SectionMembershipList>
                            </div>
                            <div class="CommonContentBoxFooter">
                                <CSControl:SiteUrl runat="server" UrlName="webloghome" ResourceName="Home_ViewAllBlogPosts" />
                            </div>
                        </div>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
                
                <CSControl:PlaceHolder runat="server">
                    <DisplayConditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="MediaGallery" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></DisplayConditions>
                    <ContentTemplate>
                        <div class="CommonContentBox Highlighted2">
                            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="media" /></h4>
                            <div class="CommonContentBoxContent">
	                            <CSMedia:MediaGalleryPostList runat="server" ID="MediaInformation" ShowHeaderFooterOnNone="true">
	                                <QueryOverrides PageSize="5" SortBy="PostDate" SortOrder="Descending" IncludeCategories="false" PageIndex="0" IsAggregate="false" IsCommunityAggregatedOnly="false" />
	                                <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
	                                <ItemTemplate>
	                                    <CSMedia:MediaGalleryPostData runat="server" Property="Subject" TruncateAt="50" LinkTo="View" Tag="LI" />
	                                </ItemTemplate>
	                                <NoneTemplate>
	                                    <li><CSControl:ResourceControl runat="server" ResourceName="Home_NoFilesUploaded" /></li>
	                                </NoneTemplate>
	                                <FooterTemplate></ul></FooterTemplate>
	                            </CSMedia:MediaGalleryPostList>
	                            <CSMedia:SectionMembershipList runat="server" ShowHeaderFooterOnNone="false">
	                                <QueryOverrides QueryType="AccessingUserMembership" MembershipType="Owner" PageSize="5" PageIndex="0" />
	                                <HeaderTemplate><ul class="CommonContentBoxList Seperator"></HeaderTemplate>
	                                <ItemTemplate>
	                                    <CSMedia:MediaGalleryData LinkTo="MediaGalleryHome" Property="Name" runat="server" Tag="LI" style="font-weight: bold;" />
	                                </ItemTemplate>
	                                <FooterTemplate></ul></FooterTemplate>
	                            </CSMedia:SectionMembershipList>
                            </div>
                            <div class="CommonContentBoxFooter">
                                <CSControl:SiteUrl runat="server" UrlName="mediagallerieshome" ResourceName="Home_ViewAllMedia" />
                            </div>
                        </div>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
                
                <CSControl:PlaceHolder runat="server">
                    <DisplayConditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="Forum" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></DisplayConditions>
                    <ContentTemplate>
                        <div class="CommonContentBox Highlighted2">
                            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="forums" /></h4>
                            <div class="CommonContentBoxContent">
                                <CSForum:ThreadList runat="server" ShowHeaderFooterOnNone="true">
                                    <QueryOverrides PageSize="5" PageIndex="0" UserFilter="ShowTopicsParticipatedIn" IncludeCategories="false" SortBy="LastPost" SortOrder="Descending" />
                                    <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
                                    <ItemTemplate>
                                        <CSForum:ThreadData runat="server" Property="Subject" TruncateAt="50" LinkTo="MostRecentPost" Tag="LI" />
                                    </ItemTemplate>
                                    <NoneTemplate>
                                        <li><CSControl:ResourceControl runat="server" ResourceName="Home_NoDiscussions" /></li>
                                    </NoneTemplate>
                                    <FooterTemplate></ul></FooterTemplate>
                                </CSForum:ThreadList>
                            </div>
                            <div class="CommonContentBoxFooter">
                                <CSControl:SiteUrl runat="server" UrlName="forumshome" ResourceName="Home_ViewAllDiscussions" />
                            </div>
                        </div>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
                
                <CSControl:PlaceHolder runat="server">
                    <DisplayConditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="Wiki" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></DisplayConditions>
                    <ContentTemplate>
                        <div class="CommonContentBox Highlighted2">
                            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="wikis" /></h4>
                            <div class="CommonContentBoxContent">
	                            <CSControl:ConditionalAction runat="server">
	                                <Conditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="Wiki" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></Conditions>
	                                <Actions>
	                                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="AuthorUserID">
                                            <QueryOverrideValueTemplate runat="server">
                                                <CSControl:UserData runat="server" Property="UserID" UseAccessingUser="true" FormatString="0" />
                                            </QueryOverrideValueTemplate>
                                        </CSControl:SetQueryOverridePropertyAction>
                                        <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="WikiPages" />
	                                </Actions>
	                            </CSControl:ConditionalAction>
	                            <CSWiki:PageList runat="server" ID="WikiPages">
	                                <QueryOverrides runat="server" PageSize="5" PageIndex="0" />
	                                <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
	                                <ItemTemplate>
	                                    <CSWiki:PageData runat="server" Property="Title" LinkTo="Page" Tag="Li" TruncateAt="50" />
	                                </ItemTemplate>
	                                <NoneTemplate>
	                                    <li><CSControl:ResourceControl runat="server" ResourceName="Wikis_PageList_None" /></li>
	                                </NoneTemplate>
	                                <FooterTemplate></ul></FooterTemplate>
	                            </CSWiki:PageList>
                            </div>
                            <div class="CommonContentBoxFooter">
                                <CSControl:SiteUrl runat="server" UrlName="wikishome" ResourceName="Wikis_PageList_ViewMore" />
                            </div>
                        </div>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
                
                <div class="CommonContentBox">
                    <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_Tab_Favorites" /></h4>
                    <div class="CommonContentBoxContent">
                        <CSControl:FavorableContentList runat="server">
                            <QueryOverrides QueryType="AccessingUserFavorites" PageSize="10" PagerID="FavoritesPager" />
                            <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
                            <ItemTemplate><CSControl:FavorableContentData Property="TitleHtml" LinkTo="View" Tag="LI" runat="server" /></ItemTemplate>
                            <NoneTemplate><li><CSControl:ResourceControl runat="server" ResourceName="Home_NoFavoritePosts" /></li></NoneTemplate>
                            <FooterTemplate></ul></FooterTemplate>
                        </CSControl:FavorableContentList>
                    </div>
                    <CSControl:Pager ShowFirst="false" ShowPrevious="false" ShowIndividualPages="false" ShowLast="false" ID="FavoritesPager" Tag="Div" CssClass="CommonContentBoxFooter">
                        <NextLinkTemplate>
                            <CSControl:UserData UseAccessingUser="true" LinkTo="Favorites" ResourceName="ViewMore" runat="server" />
                        </NextLinkTemplate>
                    </CSControl:Pager>
                </div>
            </div>
        </ContentTemplate>
    </CSControl:PlaceHolder>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:ConditionalContent runat="server">
        <ContentConditions Operator="And">
            <CSControl:Conditions runat="server" Operator="Not"><CSControl:SiteThemeConfigurationDataPropertyValueComparison ComparisonProperty="showWelcomeMessageToAllUsers" Operator="IsSetOrTrue" runat="server" /></CSControl:Conditions>
            <CSControl:Conditions runat="server" Operator="Not"><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></CSControl:Conditions>
        </ContentConditions>
        <TrueContentTemplate>
            <CSControl:PlaceHolder runat="server">
                <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="EnableConversations" Operator="issetortrue" /></DisplayConditions>
                <ContentTemplate>
                    <div class="CommonContentBox">
	                <div class="CommonContentBoxContent">
	                    <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Home_YourConversations" /></h4>
	                    <CSMessage:ConversationList runat="server" ShowHeaderFooterOnNone="false" ControlIdsToHideWhenNotVisible="ViewAllConversations">
                            <QueryOverrides runat="server" PageSize="5" PagerID="ConversationsPager" />
		                    <HeaderTemplate>
			                    <div class="CommonListArea">
		                        <script type="text/javascript">
                                    function confirmConversationDelete()
                                    {
                                        return window.confirm('Are you sure you want to delete this conversation?');
                                    }
                                </script>
			                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
				                    <thead>
					                    <tr>
						                    <th class="CommonListHeader" colspan="2"><CSControl:ResourceControl runat="server" ResourceName="Conversation" /></th>
						                    <th class="CommonListHeader">&nbsp;</th>
					                    </tr>
				                    </thead>
				                    <tbody>
		                    </HeaderTemplate>
		                    <ItemTemplate>
		                        <CSMessage:ConversationMessageList runat="server">
                                    <QueryOverrides runat="server" PageSize="1" PageIndex="0" SortOrder="Descending" />
                                    <ItemTemplate>
				                        <tr class="CommonListRow">
				                            <td class="CommonListCell">
				                                <CSControl:UserData LinkTo="Profile" runat="server">
				                                    <ContentTemplate><CSControl:UserAvatar runat="server" Width="32" Height="32" BorderWidth="0" /></ContentTemplate>
				                                </CSControl:UserData>
				                            </td>
					                        <td class="CommonListCell" style="width: 85%;">
					                            <CSControl:ConditionalContent runat="server">
			                                        <ContentConditions>
			                                            <CSMessage:ConversationPropertyValueComparison runat="server" ComparisonProperty="HasRead" Operator="isSetOrTrue" />
			                                        </ContentConditions>
			                                        <TrueContentTemplate>
			                                            <CSMessage:ConversationData runat="server" LinkTo="View">
                                                            <ContentTemplate><CSMessage:ConversationMessageData runat="server" Property="Subject" /></ContentTemplate>
                                                        </CSMessage:ConversationData>
			                                        </TrueContentTemplate>
			                                        <FalseContentTemplate>
			                                            <CSMessage:ConversationData runat="server" LinkTo="View" Tag="strong">
                                                            <ContentTemplate><CSMessage:ConversationMessageData runat="server" Property="Subject" /></ContentTemplate>
                                                        </CSMessage:ConversationData>
			                                        </FalseContentTemplate>
			                                    </CSControl:ConditionalContent>
                                                
                                                <div style="font-size: 85%;">
					                                <CSControl:ResourceControl runat="server" ResourceName="LastMessageBy" /> 
					                                <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" />
					                                <CSControl:ResourceControl runat="server" ResourceName="on" />
					                                <CSMessage:ConversationMessageData runat="server" Property="DateCreated" IncludeTimeInDate="true" />
						                        </div>
					                        </td>
					                        <td class="CommonListCell" style="width: 15%; font-size: 85%;">
                                                <CSMessage:DeleteConversationForm runat="server" DeleteButtonId="DeleteConversation">
                                                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                                    <FormTemplate><CSControl:ResourceLinkButton runat="server" ID="DeleteConversation" ResourceName="ViewUserProfile_DeleteConversation" OnClientClick="return confirmConversationDelete();" /></FormTemplate>
                                                </CSMessage:DeleteConversationForm>
					                        </td>
				                        </tr>				
                                    </ItemTemplate>
                                </CSMessage:ConversationMessageList>
		                    </ItemTemplate>
		                    <AlternatingItemTemplate>
		                        <CSMessage:ConversationMessageList runat="server">
                                    <QueryOverrides runat="server" PageSize="1" PageIndex="0" SortOrder="Descending" />
                                    <ItemTemplate>
				                        <tr class="CommonListRowAlt">
				                            <td class="CommonListCell">
				                                <CSControl:UserData LinkTo="Profile" runat="server">
				                                    <ContentTemplate><CSControl:UserAvatar runat="server" Width="32" Height="32" BorderWidth="0" /></ContentTemplate>
				                                </CSControl:UserData>
				                            </td>
					                        <td class="CommonListCell" style="width: 85%;">
                                                <CSControl:ConditionalContent runat="server">
			                                        <ContentConditions>
			                                            <CSMessage:ConversationPropertyValueComparison runat="server" ComparisonProperty="HasRead" Operator="isSetOrTrue" />
			                                        </ContentConditions>
			                                        <TrueContentTemplate>
			                                            <CSMessage:ConversationData runat="server" LinkTo="View">
                                                            <ContentTemplate><CSMessage:ConversationMessageData runat="server" Property="Subject" /></ContentTemplate>
                                                        </CSMessage:ConversationData>
			                                        </TrueContentTemplate>
			                                        <FalseContentTemplate>
			                                            <CSMessage:ConversationData runat="server" LinkTo="View" Tag="strong">
                                                            <ContentTemplate><CSMessage:ConversationMessageData runat="server" Property="Subject" /></ContentTemplate>
                                                        </CSMessage:ConversationData>
			                                        </FalseContentTemplate>
			                                    </CSControl:ConditionalContent>
                                                <div style="font-size: 85%;">
					                                <CSControl:ResourceControl runat="server" ResourceName="LastMessageBy" />  
					                                <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" />
					                                <CSControl:ResourceControl runat="server" ResourceName="on" />
					                                <CSMessage:ConversationMessageData runat="server" Property="DateCreated" IncludeTimeInDate="true" />
						                        </div>
					                        </td>
					                        <td class="CommonListCell" style="width: 15%; font-size: 85%;">
                                                <CSMessage:DeleteConversationForm runat="server" DeleteButtonId="DeleteConversation">
                                                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                                    <FormTemplate><CSControl:ResourceLinkButton runat="server" ID="DeleteConversation" ResourceName="ViewUserProfile_DeleteConversation" OnClientClick="return confirmConversationDelete();" /></FormTemplate>
                                                </CSMessage:DeleteConversationForm>
					                        </td>
				                        </tr>				
                                    </ItemTemplate>
                                </CSMessage:ConversationMessageList>
		                    </AlternatingItemTemplate>
		                    <FooterTemplate>
			                    </tbody>
			                    </table>
			                    </div>
		                    </FooterTemplate>
		                     <NoneTemplate>
		                        <CSControl:ResourceControl runat="server" ResourceName="ViewConversations_NoTopics" />
		                    </NoneTemplate>
                        </CSMessage:ConversationList>
	                </div>
	                <CSControl:PostbackPager runat="server" ID="ConversationsPager" ShowFirst="false" ShowLast="false" ShowPrevious="false" ShowIndividualPages="false" ShowNext="True" ShowTotalSummary="false" Tag="Div" CssClass="CommonContentBoxFooter">
                        <NextLinkTemplate><CSControl:UserData runat="server" LinkTo="UserConversations" UseAccessingUser="true" ResourceName="ViewUserProfile_ViewAllPrivateMessages" /></NextLinkTemplate>
                    </CSControl:PostbackPager>
	            </div>
                </ContentTemplate>
            </CSControl:PlaceHolder>
    	    
    	    
    	    <div class="CommonContentBox TitleHighlighted">
                <h4 class="CommonContentBoxHeader">
                    <CSControl:UserData UseAccessingUser="true" runat="server" LinkTo="FriendsActivityRss" style="float: right;">
                        <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/common/feed-icon-12x12.png" BorderWidth="0" runat="server" /></ContentTemplate>
                    </CSControl:UserData>
                    <CSControl:ResourceControl runat="server" ResourceName="FriendActivity" />
                </h4>
                <div class="CommonContentBoxContent">
    	    <script type="text/javascript">
                function confirmActivityDelete()
                {
                    return window.confirm('<%# CommunityServer.Components.ResourceManager.GetString("Activity_DeleteConfirmation") %>');
                }
            </script>
            <CSMessage:ActivityMessageList runat="server" ID="FriendsActivityList" ShowHeaderFooterOnNone="false">
                <QueryOverrides QueryType="AccessingUsersFriendsActivity" PagerID="ActivityPager" PageSize="20" />
                <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
                <ItemTemplate>
                    <CSMessage:ActivityMessageData runat="server" Property="DateCreated" Tag="Li" CssClass="Header">
                        <DisplayConditions><CSControl:CustomCondition CustomResult='<%# ShowDateHeader("FriendActivity", Eval("DateCreated")) %>' runat="server" /></DisplayConditions>
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
                <NoneTemplate><CSControl:ResourceControl runat="server" ResourceName="FriendActivity_NotActive" /></NoneTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </CSMessage:ActivityMessageList>
                </div>
                <CSControl:Pager runat="server" ID="ActivityPager" QueryStringProperty="ActivityPI" />
            </div>
	        
	            
	    </TrueContentTemplate>
	    <FalseContentTemplate>
	        <CSControl:SiteThemeConfigurationData Property="welcomeMessage" runat="server">
	            <LeaderTemplate>
        	        <div class="CommonContentBox">
	                    <div class="CommonContentBoxContent">
	            </LeaderTemplate>
	            <TrailerTemplate>
	                    </div>
	                </div>
	            </TrailerTemplate>
	        </CSControl:SiteThemeConfigurationData>
	    
            <CSMessage:ActivityMessageList runat="server" ShowHeaderFooterOnNone="false">
                <QueryOverrides QueryType="SiteActivity" PageSize="30" PageIndex="0" />
                <LeaderTemplate>
                    <div class="CommonContentBox TitleHighlighted">
                        <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="SiteActivity" /></h4>
                        <div class="CommonContentBoxContent">
                </LeaderTemplate>
                <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
                <ItemTemplate>
                    <CSMessage:ActivityMessageData runat="server" Property="DateCreated" Tag="Li" CssClass="Header">
                        <DisplayConditions><CSControl:CustomCondition CustomResult='<%# ShowDateHeader("FriendActivity", Eval("DateCreated")) %>' runat="server" /></DisplayConditions>
                    </CSMessage:ActivityMessageData>
                    <CSMessage:ActivityMessageData Property="Type" Text="&lt;li class=&quot;CommonActivity {0}&quot;&gt;" runat="server" />
                        <CSMessage:ActivityMessageData runat="server" Property="Body" />
                        <CSMessage:DeleteActivityMessageForm runat="server" DeleteButtonId="DeleteSiteActivity">
                            <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                            <FormTemplate>
                                <div class="CommonActivityDeleteArea">
                                    <CSControl:ResourceLinkButton runat="server" ID="DeleteSiteActivity" ToolTip="Delete Activity Message" OnClientClick="return confirmActivityDelete();">
                                        <CSControl:ThemeImage runat="server" ImageUrl="~/images/common/x-delete-icon.png" BorderWidth="0" />
                                    </CSControl:ResourceLinkButton>
                                </div>
                            </FormTemplate>
                        </CSMessage:DeleteActivityMessageForm>
                    </li>
                </ItemTemplate>
                <NoneTemplate><CSControl:ResourceControl runat="server" ResourceName="SiteActivity_NotActive" /></NoneTemplate>
                <FooterTemplate></ul></FooterTemplate>
                <TrailerTemplate>
                        </div>
                    </div>	                    
                </TrailerTemplate>
            </CSMessage:ActivityMessageList>
	            
	    </FalseContentTemplate>
    </CSControl:ConditionalContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server">
    <div class="CommonSidebar">
        <CSControl:ConditionalContent runat="server">
            <ContentConditions Operator="And">
                <CSControl:Conditions runat="server" Operator="Not"><CSControl:SiteThemeConfigurationDataPropertyValueComparison ComparisonProperty="showWelcomeMessageToAllUsers" Operator="IsSetOrTrue" runat="server" /></CSControl:Conditions>
                <CSControl:Conditions runat="server" Operator="Not"><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></CSControl:Conditions>
            </ContentConditions>
            <TrueContentTemplate>
                <div class="CommonContentBox">
                    <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="YourFriends" /></h4>
	                <div class="CommonContentBoxContent">
	                    <CSControl:FriendshipList runat="server" ShowHeaderFooterOnNone="false">
	                        <QueryOverrides runat="server" QueryType="ApprovedForAccessingUser" PageSize="9" SortBy="LastModifiedDate" SortOrder="descending" />
		                    <ItemTemplate>
		                        <div class="CommonAvatarListArea">
                                   <CSControl:UserData LinkTo="Profile" runat="server" Tag="Div" CssClass="CommonAvatarArea"><ContentTemplate><CSControl:UserAvatar runat="server" Width="60" Height="60" /></ContentTemplate></CSControl:UserData>
                                   <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" TruncateAt="25" />
                                </div>
		                    </ItemTemplate>
		                    <NoneTemplate><CSControl:ResourceControl runat="server" ResourceName="Friends_None" /></NoneTemplate>
		                    <FooterTemplate>
			                    <div style="clear: both;"></div>
		                    </FooterTemplate>
	                    </CSControl:FriendshipList>
	                </div>
	                <div class="CommonContentBoxFooter">
	                    <CSControl:UserData LinkTo="Friends" UseAccessingUser="true" ResourceName="Friends_ViewAll" runat="server" />
	                </div> 
	            </div>
        	    
                <CSControl:PlaceHolder runat="server">
                    <DisplayConditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="Hub" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></DisplayConditions>
                    <ContentTemplate>
                        <div class="CommonContentBox">
                            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_Yours" /></h4>
                            <div class="CommonContentBoxContent">
	                            <CSHub:SectionMembershipList runat="server" ShowHeaderFooterOnNone="false">
	                                <QueryOverrides SortBy="SectionName" SortOrder="Ascending" QueryType="AccessingUserMembership" PageSize="6" MembershipType="Owner,Manager,Member" />
                                    <ItemTemplate>
                                        <CSHub:HubData runat="server" CssClass="CommonAvatarListArea" Tag="Div">
                                            <ContentTemplate>
                                                <CSHub:HubData runat="server" LinkTo="HomePage" Tag="Div" CssClass="CommonAvatarArea">
                                                    <ContentTemplate><CSHub:HubAvatar runat="server" BorderWidth="0" Width="60" Height="60" /></ContentTemplate>
                                                </CSHub:HubData>
                                                <CSHub:HubData runat="server" Property="Name" TruncateAt="25" LinkTo="HomePage" />
                                            </ContentTemplate>
                                        </CSHub:HubData>
                                    </ItemTemplate>
                                    <NoneTemplate>
                                        <CSControl:ResourceControl runat="server" ResourceName="Hubs_None" />
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
                            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="MediaGallery_YourFiles" /></h4>
                            <div class="CommonContentBoxContent">
                                <CSControl:UserFolderList runat="server" ID="UserFolders">
                                    <QueryOverrides QueryType="AccessingUserFolders" PageSize="4" />
                                    <ItemTemplate>
                                        <div class="CommonAvatarListArea">
                                            <CSControl:UserFolderData runat="server" LinkTo="View" Tag="Div" CssClass="CommonAvatarArea">
                                                <ContentTemplate><CSControl:Image runat="server" ImageUrl="~/utility/filethumbnails/folder.gif" BorderWidth="0" /></ContentTemplate>
                                            </CSControl:UserFolderData>
                                            <CSControl:UserFolderData runat="server" Property="Name" LinkTo="View" TruncateAt="25" />
                                        </div>
                                    </ItemTemplate>
                                </CSControl:UserFolderList>
	                            <CSControl:UserFileList runat="server" ID="UserFiles">
                                    <QueryOverrides QueryType="AccessingUserFiles" PageSize="5" />
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
                                        <CSControl:ResourceControl runat="server" ResourceName="MediaGallery_Files_None" />
                                    </ContentTemplate>
                                </CSControl:PlaceHolder>
                                
                            </div>
                            <div class="CommonContentBoxFooter">
                                <CSControl:UserData UseAccessingUser="true" runat="server" LinkTo="userfiles" ResourceName="MediaGallery_Files_ViewUpload" />
                            </div>
                        </div>
                    </ContentTemplate>
	            </CSControl:PlaceHolder>
	        </TrueContentTemplate>
	        <FalseContentTemplate>
	            <CSControl:PlaceHolder runat="server">
                    <DisplayConditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="Weblog" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></DisplayConditions>
                    <ContentTemplate>
                        <div class="CommonContentBox Highlighted2">
                            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="weblogs" /></h4>
                            <div class="CommonContentBoxContent">
	                            <CSBlog:WeblogPostList runat="server" ShowHeaderFooterOnNone="true">
	                                <QueryOverrides BlogPostType="Article,Comment,Post" PageSize="5" IncludeCategories="false" PageIndex="0" IsAggregate="false" IsCommunityAggregatedOnly="false" PostConfig="Empty" />
	                                <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
	                                <ItemTemplate>
                                        <CSBlog:WeblogPostData runat="server" Property="Subject" TruncateAt="50" LinkTo="Post" Tag="LI" />
                                        <CSBlog:WeblogPostFeedbackData runat="server" Property="Subject" TruncateAt="50" LinkTo="Feedback" Tag="LI" />    	    
	                                </ItemTemplate>
	                                <NoneTemplate>
	                                    <li><CSControl:ResourceControl runat="server" ResourceName="BlogActivity_NotActive" /></li>
	                                </NoneTemplate>
	                                <FooterTemplate></ul></FooterTemplate>
	                            </CSBlog:WeblogPostList>
                            </div>
                            <div class="CommonContentBoxFooter">
                                <CSControl:SiteUrl runat="server" UrlName="webloghome" ResourceName="Home_ViewAllBlogPosts" />
                            </div>
                        </div>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
                
                <CSControl:PlaceHolder runat="server">
                    <DisplayConditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="MediaGallery" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></DisplayConditions>
                    <ContentTemplate>
                        <div class="CommonContentBox Highlighted2">
                            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="media" /></h4>
                            <div class="CommonContentBoxContent">
	                            <CSMedia:MediaGalleryPostList runat="server" ShowHeaderFooterOnNone="true">
	                                <QueryOverrides PageSize="5" SortBy="PostDate" SortOrder="Descending" IncludeCategories="false" PageIndex="0" IsAggregate="false" IsCommunityAggregatedOnly="false" />
	                                <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
	                                <ItemTemplate>
	                                    <CSMedia:MediaGalleryPostData runat="server" Property="Subject" TruncateAt="50" LinkTo="View" Tag="LI" />
	                                </ItemTemplate>
	                                <NoneTemplate>
	                                    <li><CSControl:ResourceControl runat="server" ResourceName="MediaActivity_NotActive" /></li>
	                                </NoneTemplate>
	                                <FooterTemplate></ul></FooterTemplate>
	                            </CSMedia:MediaGalleryPostList>
                            </div>
                            <div class="CommonContentBoxFooter">
                                <CSControl:SiteUrl runat="server" UrlName="mediagallerieshome" ResourceName="Home_ViewAllMedia" />
                            </div>
                        </div>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
                
                <CSControl:PlaceHolder runat="server">
                    <DisplayConditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="Forum" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></DisplayConditions>
                    <ContentTemplate>
                        <div class="CommonContentBox Highlighted2">
                            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="forums" /></h4>
                            <div class="CommonContentBoxContent">
                                <CSForum:ThreadList runat="server" ShowHeaderFooterOnNone="true">
                                    <QueryOverrides PageSize="5" PageIndex="0" ActiveTopics="true" IncludeCategories="false" SortBy="LastPost" SortOrder="Descending" />
                                    <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
                                    <ItemTemplate>
                                        <CSForum:ThreadData runat="server" Property="Subject" TruncateAt="50" LinkTo="MostRecentPost" Tag="LI" />
                                    </ItemTemplate>
                                    <NoneTemplate>
                                        <li><CSControl:ResourceControl runat="server" ResourceName="ForumActivity_NotActive" /></li>
                                    </NoneTemplate>
                                    <FooterTemplate></ul></FooterTemplate>
                                </CSForum:ThreadList>
                            </div>
                            <div class="CommonContentBoxFooter">
                                <CSControl:SiteUrl runat="server" UrlName="forumshome" ResourceName="Home_ViewAllDiscussions" />
                            </div>
                        </div>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
                
                <CSControl:PlaceHolder runat="server">
                    <DisplayConditions><CSControl:ApplicationPropertyValueComparison runat="server" ApplicationType="Wiki" ComparisonProperty="Enabled" Operator="IsSetOrTrue" /></DisplayConditions>
                    <ContentTemplate>
                        <div class="CommonContentBox Highlighted2">
                            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="wikis" /></h4>
                            <div class="CommonContentBoxContent">
	                            <CSWiki:PageList runat="server">
	                                <QueryOverrides runat="server" PageSize="5" PageIndex="0" />
	                                <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
	                                <ItemTemplate>
	                                    <CSWiki:PageData runat="server" Property="Title" LinkTo="Page" Tag="Li" TruncateAt="50" />
	                                </ItemTemplate>
	                                <NoneTemplate>
	                                    <li><CSControl:ResourceControl runat="server" ResourceName="Wikis_PageList_None" /></li>
	                                </NoneTemplate>
	                                <FooterTemplate></ul></FooterTemplate>
	                            </CSWiki:PageList>
                            </div>
                            <div class="CommonContentBoxFooter">
                                <CSControl:SiteUrl runat="server" UrlName="wikishome" ResourceName="Wikis_PageList_ViewMore" />
                            </div>
                        </div>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
	        </FalseContentTemplate>
        </CSControl:ConditionalContent>
    </div>	
</asp:Content>