<%@ Control Language="C#" %>

<CSControl:UserData runat="server" UseAccessingUser="true">
    <DisplayConditions><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
    <ContentTemplate>
        <CSControl:UserData runat="server" LinkTo="Login" ResourceName="A_Login" />
         <CSControl:SiteUrl runat="server" UrlName="user_Register" Parameter1="" ResourceName="register">
            <DisplayConditions Operator="Not"><CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="AccountActivation" ComparisonValue="InvitationOnly" Operator="EqualTo" runat="server" /></DisplayConditions>
            <LeaderTemplate>| </LeaderTemplate>
        </CSControl:SiteUrl>
        <CSControl:UserData runat="server" ResourceName="help" LinkTo="FAQ"><LeaderTemplate>| </LeaderTemplate></CSControl:UserData>
     </ContentTemplate>
</CSControl:UserData>

<CSControl:UserData runat="server" UseAccessingUser="true">
    <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
    <ContentTemplate>
        <CSControl:UserData runat="server" LinkTo="Profile" Property="DisplayName"></CSControl:UserData>
        <CSControl:UserData runat="server" Property="DisplayName" UseImpersonator="true" Tag="Span" CssClass="CommonUserImpersonationText">
            <LeaderTemplate>(</LeaderTemplate>
            <TrailerTemplate>)</TrailerTemplate>
        </CSControl:UserData>
        <CSControl:UserData runat="server" LinkTo="EditProfile" ResourceName="BreadCrumb_EditUserProfile"><LeaderTemplate><span class="sub">| </LeaderTemplate><TrailerTemplate></span></TrailerTemplate></CSControl:UserData>
        <CSControl:SiteSettingsData runat="server">
            <DisplayConditions Operator="Not">
                <CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="AuthenticationType" Operator="EqualTo" ComparisonValue="windows" />
                <CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="AuthenticationType" Operator="EqualTo" ComparisonValue="passport" />
                <CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="AuthenticationType" Operator="EqualTo" ComparisonValue="cookies" />
            </DisplayConditions>
            <ContentTemplate>
                <CSControl:UserData runat="server" LinkTo="Logout" ResourceName="logout"><LeaderTemplate><span class="sub">| </LeaderTemplate><TrailerTemplate></span></TrailerTemplate></CSControl:UserData>
            </ContentTemplate>
        </CSControl:SiteSettingsData>
        <CSControl:SiteUrl runat="server" UrlName="user_Invite" ResourceName="invite">
            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="AccountActivation" ComparisonValue="InvitationOnly" Operator="EqualTo" runat="server" /></DisplayConditions>
            <LeaderTemplate>| </LeaderTemplate>
        </CSControl:SiteUrl>
        <CSControl:UserData runat="server" ResourceName="help" LinkTo="FAQ"><LeaderTemplate><span class="sub">| </LeaderTemplate><TrailerTemplate></span></TrailerTemplate></CSControl:UserData>
        <CSMessage:ConversationList runat="server">
            <QueryOverrides runat="server" PageSize="1" ReadStatus="Unread" PagerID="conversationsUnread" />
            <ItemTemplate></ItemTemplate>
        </CSMessage:ConversationList>
        <div class="sub2">
            <CSControl:Pager runat="server" ID="conversationsUnread" Tag="strong" ShowTotalSummary="true" ShowFirst="false" ShowIndividualPages="false" PageSize="9999" ShowLast="false" ShowPagerItems="false" ShowPrevious="false">
                <TotalSummaryTemplate>
                    <CSControl:UserData runat="server" LinkTo="userConversations" ID="conversationsUnreadLink">
                        <ContentTemplate>
                            <CSControl:PagerData runat="server" Property="TotalRecords" ResourceName="Conversations_Inbox" />
                        </ContentTemplate>
                    </CSControl:UserData>
                </TotalSummaryTemplate>
            </CSControl:Pager>
            <CSControl:UserData runat="server" LinkTo="userConversations" ID="conversationsLink" ResourceName="Conversation_Conversations">
                <DisplayConditions>
                    <CSControl:ControlVisibilityCondition runat="server" ControlId="conversationsUnread" ControlVisiblilityEquals="false" />
                </DisplayConditions>
            </CSControl:UserData>
            <CSControl:FriendshipList runat="server">
                <QueryOverrides runat="server" PageSize="1" PagerID="PendingFriendsPager" QueryType="PendingToAccessingUser" />
                <ItemTemplate></ItemTemplate>
            </CSControl:FriendshipList>
            <CSControl:Pager runat="server" ID="PendingFriendsPager" Tag="strong" ShowTotalSummary="true" ShowFirst="false" ShowIndividualPages="false" PageSize="9999" ShowLast="false" ShowPagerItems="false" ShowPrevious="false">
                <TotalSummaryTemplate>
                     <CSControl:PlaceHolder runat="server">
                        <DisplayConditions Operator="Or">
                            <CSControl:ControlVisibilityCondition runat="server" ControlId="conversationsUnreadLink" />
                            <CSControl:ControlVisibilityCondition runat="server" ControlId="conversationsLink" />
                        </DisplayConditions>
                        <ContentTemplate> | </ContentTemplate>
                    </CSControl:PlaceHolder>  
                    <CSControl:UserData runat="server" LinkTo="Friends" LinkQueryStringModification="Show=Review">
                        <ContentTemplate>
                            <CSControl:PagerData runat="server" Property="TotalRecords" ResourceName="EditProfile_Friends_Count" />
                        </ContentTemplate>
                    </CSControl:UserData>
                </TotalSummaryTemplate>
            </CSControl:Pager>
            <CSControl:UserData runat="server" LinkTo="friends" ResourceName="EditProfile_FavoriteUsers_Title">
                <LeaderTemplate>
                    <CSControl:PlaceHolder runat="server">
                        <DisplayConditions Operator="Or">
                            <CSControl:ControlVisibilityCondition runat="server" ControlId="conversationsUnreadLink" />
                            <CSControl:ControlVisibilityCondition runat="server" ControlId="conversationsLink" />
                        </DisplayConditions>
                        <ContentTemplate> | </ContentTemplate>
                    </CSControl:PlaceHolder> 
                </LeaderTemplate>
                <DisplayConditions>
                    <CSControl:ControlVisibilityCondition runat="server" ControlId="PendingFriendsPager" ControlVisiblilityEquals="false" />
                </DisplayConditions>
            </CSControl:UserData>
        </div>
    </ContentTemplate>
</CSControl:UserData>