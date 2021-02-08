<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ Register Src="thread-questionandanswerview-post.ascx" TagPrefix="CSUserControl" TagName="Post" %>

<!-- The thread starter -->
<div class="CommonContentBox">
    <div class="CommonContentBoxContent">     
        <h4 class="ForumPostHeader">
            <div style="float: right;">
                <CSForum:ThreadRating runat="server" ID="ThreadRating" RatingCssClass="ForumThreadRateControl" RatingReadOnlyCssClass="ForumThreadRateControlReadOnly" RatingActiveCssClass="ForumThreadRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" EnableDetails="true" />
                <CSControl:UserData LinkTo="Login" runat="server">
                    <DisplayConditions Operator="Not"><CSControl:ControlVisibilityCondition runat="server" ControlId="ThreadRating" /></DisplayConditions>
                    <ContentTemplate><CSControl:ThemeImage ImageAlign="absmiddle" border="0" runat="server" ImageUrl="~/images/common/5star-rating.png" /></ContentTemplate>
                    <TrailerTemplate><CSForum:ThreadData runat="server" Property="TotalRatings" ResourceName="Forums_RatingsSummary" /></TrailerTemplate>
                </CSControl:UserData>
            </div>
            <CSControl:ConditionalContent runat="server">
                <ContentConditions><CSForum:ThreadPropertyValueComparison ComparisonProperty="Status" Operator="EqualTo" ComparisonValue="Answered" runat="server" /></ContentConditions>
                <TrueContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_Answered.gif" runat="server" AlternateTextResourceName="Status_Answered" style="float: left; margin-right: 5px;" /></TrueContentTemplate>
                <FalseContentTemplate>
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions><CSForum:ThreadPropertyValueComparison ComparisonProperty="Status" Operator="EqualTo" ComparisonValue="AnsweredNotVerified" runat="server" /></ContentConditions>
                        <TrueContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_SuggestedAnswer.gif" runat="server" AlternateTextResourceName="Status_AnsweredNotVerified" style="float: left; margin-right: 5px;" /></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_NotAnswered.gif" runat="server" AlternateTextResourceName="Status_NotAnswered" style="float: left; margin-right: 5px;" /></FalseContentTemplate>  
                    </CSControl:ConditionalContent>                  
                </FalseContentTemplate>
            </CSControl:ConditionalContent>            
            <CSControl:ResourceControl ResourceName="PostQuestionAnswerView_ThisPostHas" runat="server" /> 
            <CSControl:ControlData runat="server" ControlId="PostListAnswers" Property="ItemCount">
                <TrailerTemplate>
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions><CSControl:ControlPropertyValueComparison runat="server" ComparisonControlId="PostListAnswers" ComparisonProperty="ItemCount" ComparisonValue="1" Operator="EqualTo" /></ContentConditions>
                        <TrueContentTemplate> <CSControl:ResourceControl ResourceName="PostQuestionAnswerView_VerifiedAnswer" runat="server" /> | </TrueContentTemplate>
                        <FalseContentTemplate> <CSControl:ResourceControl ResourceName="PostQuestionAnswerView_VerifiedAnswers" runat="server" /> | </FalseContentTemplate>
                    </CSControl:ConditionalContent>
                </TrailerTemplate>
            </CSControl:ControlData>
            <CSForum:ThreadData runat="server" Property="Replies">
                <TrailerTemplate>
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions><CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="1" Operator="EqualTo" /> </ContentConditions>
                        <TrueContentTemplate> <CSControl:ResourceControl ResourceName="Reply" runat="server" /> | </TrueContentTemplate>
                        <FalseContentTemplate> <CSControl:ResourceControl ResourceName="Replies" runat="server" /> | </FalseContentTemplate>
                    </CSControl:ConditionalContent>
                </TrailerTemplate>
            </CSForum:ThreadData>
            <CSForum:ThreadData runat="server" Property="TrackedCount">
                <TrailerTemplate>
                    <CSControl:ConditionalContent runat="server" >
                        <ContentConditions><CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="TrackedCount" ComparisonValue="1" Operator="EqualTo" /></ContentConditions>
                        <TrueContentTemplate> <CSControl:ResourceControl ResourceName="Follower" runat="server" /></TrueContentTemplate>
                        <FalseContentTemplate> <CSControl:ResourceControl ResourceName="Followers" runat="server" /></FalseContentTemplate>
                    </CSControl:ConditionalContent>
                </TrailerTemplate>
            </CSForum:ThreadData> 
        </h4>
        <CSForum:ForumPostList runat="server">
            <QueryOverrides PageIndex="0" PageSize="1" QueryType="ThreadStarter"  />
            <ItemTemplate>
                <div class="ForumThreadStarterSidebar">
                    <CSForum:ForumPostData runat="server" IgnoreLinkPermissions="true" LinkTo="ReplyAsSuggestedAnswer" ResourceName="PostQuestionAnswerView_SuggestAnAnswer" LinkCssClass="ActionButton" Tag="Div" />
                    <CSForum:ForumPostData runat="server" IgnoreLinkPermissions="true" LinkTo="Reply" ResourceName="Reply" LinkCssClass="CommonTextButton" Tag="Div" />
                    <CSForum:ThreadSubscriptionToggleButton runat="server" Tag="Div" ButtonOnCssClass="CommonTextButton" ButtonOffCssClass="CommonTextButton" >
                       <OnTemplate><CSControl:ResourceControl ResourceName="PostQuestionAnswerView_StopFollowing" runat="server" /></OnTemplate>
                       <OffTemplate><CSControl:ResourceControl ResourceName="PostQuestionAnswerView_FollowThisQuestion" runat="server" /></OffTemplate>
                       <ProcessingTemplate>...</ProcessingTemplate>
                    </CSForum:ThreadSubscriptionToggleButton>
                    <CSForum:ForumPostData runat="server" LinkTo="StartConversation" ResourceName="Conversation_Post_SendTo" LinkCssClass="CommonTextButton" Tag="Div" />
                    <CSForum:FavoritePopupMenu ID="FavoritePopupMenu1" ResourceName="PostQuestionAnswerView_AddToFavorites" runat="server" ButtonActiveCssClass="CommonTextButtonHighlight" ButtonInactiveCssClass="CommonTextButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown" Tag="Div" />
                    <CSForum:ForumPostData runat="server" LinkTo="Report" ResourceName="Report" LinkCssClass="CommonTextButton" Tag="Div" />
                    <CSForum:ForumPostData runat="server" LinkTo="Delete" ResourceName="Button_Delete" LinkCssClass="CommonTextButton" Tag="Div" />
                    <CSForum:ForumPostData runat="server" LinkTo="Edit" ResourceName="Button_Edit" LinkCssClass="CommonTextButton" Tag="Div" />                    
                </div>  
                <div>
                    <CSUserControl:Post runat="server" AdditionalCssClass="ThreadStarter" ShowPostButtons="false" />
                </div>
            </ItemTemplate>                
        </CSForum:ForumPostList>
    </div>

<!-- Posts Marked as Verified Answers -->                      
<CSForum:ForumPostList runat="server" ID="PostListAnswers">
    <QueryOverrides SortBy="PostDate" QueryType="ThreadAnswers" PageIndex="0" PageSize="9999"  />
    <HeaderTemplate>
        </div>
        <div class="CommonContentBox" style="background-color: #CCFFCC; border-top-color: #339900;">  
            <div class="CommonContentBoxContent"> 
                <h4 class="CommonContentBoxHeader VerifiedAnswers" style="color: #339900; border-bottom-color: #339900;">
                    <CSControl:ThemeImage ImageUrl="~/images/status_Answered.gif" runat="server" AlternateTextResourceName="Status_Answered" /> 
                    <CSControl:ResourceControl ResourceName="PostQuestionAnswerView_AllVerifiedAnswer" runat="server" />
                </h4>
    </HeaderTemplate>
    <ItemTemplate>
        <CSUserControl:Post runat="server" AdditionalCssClass="Top" RenderLinkTarget="false" />
    </ItemTemplate>
    <FooterTemplate>
            </div>
    </FooterTemplate>
</CSForum:ForumPostList>    
              
<!-- All Replies --> 
<CSForum:ForumPostList runat="server">
    <DisplayConditions Operator="And">
        <CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="GreaterThan" />
        <CSControl:CustomCondition runat="server" CustomResult='<%# ((ForumPostList) CSControlUtility.Instance().FindControl(this, "PostListAnswers")).ItemCount < ForumControlUtility.Instance().GetCurrentThread(this).Replies  %>' />
    </DisplayConditions>
    <QueryOverrides SortBy="PostDate" PagerID="PagerQnA" PageIndex="0" PageSize="15"  />
    <HeaderTemplate>
        </div>
        <div class="CommonContentBox">   
            <div class="CommonContentBoxContent">  
                <h4 class="CommonContentBoxHeader AllReplies"><CSControl:ResourceControl ResourceName="PostQuestionAnswerView_AllReplies" runat="server" /></h4>    
    </HeaderTemplate>
    <ItemTemplate>    
        <CSControl:PlaceHolder runat="server">
            <DisplayConditions Operator="Not"><CSForum:ForumPostPropertyComparison ID="ForumPostPropertyComparison" runat="server" ComparisonProperty1="PostID" ComparisonProperty2="ParentID" Operator="EqualTo" /></DisplayConditions>
            <ContentTemplate><CSUserControl:Post runat="server" /></ContentTemplate>
        </CSControl:PlaceHolder>
    </ItemTemplate>
    <FooterTemplate>
            </div>
    </FooterTemplate>
</CSForum:ForumPostList>     
    
    <div class="CommonContentBoxFooter">
        <div style="float: right;">
            <CSForum:ThreadData runat="server" LinkTo="PreviousThread" ResourceName="Button_PreviousTopic"  /> |
            <CSForum:ThreadData runat="server" LinkTo="NextThread" ResourceName="Button_NextTopic"  />                 
        </div>
        <CSControl:Pager runat="server" id="PagerQnA" ShowTotalSummary="true" Visible="true">
            <PagerUrlFormatTemplate>
                <CSControl:SiteUrl runat="server" RenderRawUrl="true" UrlName="thread_Paged" Parameter2="{0}">
                    <Parameter1Template><CSForum:ThreadData runat="server" Property="ThreadID" FormatString="0" /></Parameter1Template>
                </CSControl:SiteUrl>
            </PagerUrlFormatTemplate>
        </CSControl:Pager>
        <CSForum:ThreadData LinkTo="Rss" runat="server" ResourceName="Rss"><LeaderTemplate> | </LeaderTemplate></CSForum:ThreadData>     
    </div>   
</div>