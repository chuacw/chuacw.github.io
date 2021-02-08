<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="UserBadgeArea" Src="UserBadgeArea.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea">
        <div class="Common">
            <CSControl:UserData runat="server" LinkTo="profile" Property="DisplayName" />
             &raquo;
            <CSControl:UserData runat="server" LinkTo="friends" ResourceName="EditProfile_FavoriteUsers_Title" />
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="tr">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSControl:UserData runat="server" Property="DisplayName" />'s <CSControl:ResourceControl runat="server" ResourceName="EditProfile_FavoriteUsers_Title" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">

    <div class="CommonSidebar">
        <CSUserControl:UserBadgeArea runat="server" />
    </div> 

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <CSControl:PlaceHolder runat="server">
            <DisplayConditions><CSControl:CurrentUserIsAccessingUserCondition runat="server" /></DisplayConditions>
            <ContentTemplate>
                <div class="CommonContentBoxHeaderForm">
                    Show:
                    
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions Operator="Or">
                            <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Friends" />
                            <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="IsSetOrTrue" /></CSControl:Conditions>
                        </ContentConditions>
                        <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="EditProfile_FavoriteUsers_Title" QueryStringModification="Show=Friends&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="EditProfile_FavoriteUsers_Title" QueryStringModification="Show=Friends&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                    </CSControl:ConditionalContent> |
                    
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Review" /></ContentConditions>
                        <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Friends_RequestsReview" QueryStringModification="Show=Review&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Friends_RequestsReview" QueryStringModification="Show=Review&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                    </CSControl:ConditionalContent> |
                    
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Pending" /></ContentConditions>
                        <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Friends_YourRequests" QueryStringModification="Show=Pending&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Friends_YourRequests" QueryStringModification="Show=Pending&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                    </CSControl:ConditionalContent>
                </div>
            </ContentTemplate>
        </CSControl:PlaceHolder>
        <div class="CommonContentBoxContent">

        
            <CSControl:PlaceHolder runat="server">
                <DisplayConditions Operator="Or">
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Friends" />
                    <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="IsSetOrTrue" /></CSControl:Conditions>
                </DisplayConditions>
                <ContentTemplate>
                    <script type="text/javascript">
                        function confirmFriendDelete()
                        {
                            return window.confirm('<CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_FriendDeleteConfirm" Encoding="JavaScript" />');
                        }
                    </script>
                
                    <CSControl:FriendshipList ID="ApprovedFriends" runat="server" ShowHeaderFooterOnNone="false">
                        <QueryOverrides QueryType="ApprovedForCurrentUser" PageSize="21" PagerID="FriendPager" SortBy="LastModifiedDate" SortOrder="Descending" />
                        <ItemTemplate>
                            <div class="CommonSideListArea">
                                <div class="CommonSideListImage">
                                    <CSControl:UserData runat="server" LinkTo="Profile"><ContentTemplate><CSControl:UserAvatar runat="server" Height="60" Width="60" ShowAnonymousAvatar="true" /></ContentTemplate></CSControl:UserData>
                                </div>
                                <div class="CommonSideListContent">
                                    <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Strong" />
                                    <CSControl:UserData runat="server" LinkTo="sendconversationmessage" ResourceName="EditProfile_FriendsPrivateMessage" Tag="Div" />
                                    <CSControl:DeleteFriendshipForm runat="server" DeleteButtonId="DeleteLinkButton" Tag="Div">
                                        <DisplayConditions><CSControl:CurrentUserIsAccessingUserCondition runat="server" UsePageLevelContext="true" /></DisplayConditions>
                                        <SuccessActions><CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="ApprovedFriends" /></SuccessActions>
                                        <FormTemplate><CSControl:ResourceLinkButton ID="DeleteLinkButton" runat="server" ResourceName="Friend_Remove" OnClientClick="return confirmFriendDelete();" /> </FormTemplate>
                                    </CSControl:DeleteFriendshipForm>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                        </ItemTemplate>
                        <NoneTemplate><CSControl:UserData runat="server" Property="DisplayName" ResourceName="EditProfile_Friends_None" /></NoneTemplate>
                        <FooterTemplate>
                            <div style="clear: both;"></div>
                        </FooterTemplate>
                     </CSControl:FriendshipList>
                     <CSControl:Pager runat="server" ID="FriendPager" ShowTotalSummary="true">
                        <LeaderTemplate></div><div class="CommonContentBoxFooter"></LeaderTemplate>
                        <TrailerTemplate></div></TrailerTemplate>
                    </CSControl:Pager>
                </ContentTemplate>
            </CSControl:PlaceHolder>                    
                            
            <CSControl:PlaceHolder runat="server">
                <DisplayConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Review" /></DisplayConditions>
                <ContentTemplate>
                    <CSControl:FriendshipList ID="PendingFriendRequestToYou" runat="server" ShowHeaderFooterOnNone="false" ItemsPerRow="2">
                        <QueryOverrides QueryType="PendingToAccessingUser" PageSize="21" PagerID="ReviewPager" />
                        <ItemTemplate>
                            <div class="CommonSideListArea">
                                <div class="CommonSideListImage">
                                    <CSControl:UserData runat="server" LinkTo="Profile"><ContentTemplate><CSControl:UserAvatar runat="server" Height="60" Width="60" ShowAnonymousAvatar="true" /></ContentTemplate></CSControl:UserData>
                                </div>
                                <div class="CommonSideListContent">
                                    <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Strong" />
                                    <div>
                                        <CSControl:ApproveFriendshipForm runat="server" ApproveButtonId="AcceptLinkButton">
                                            <SuccessActions>
                                                <CSControl:GoToModifiedUrlAction runat="server" />
                                            </SuccessActions>
                                            <FormTemplate>
                                                <CSControl:ResourceLinkButton ID="AcceptLinkButton" runat="server" resourcename="FriendRequest_Accept" />
                                            </FormTemplate>
                                        </CSControl:ApproveFriendshipForm> |
                                        <CSControl:RejectFriendshipForm runat="server" RejectButtonId="RejectLinkButton">
                                            <SuccessActions>
                                                <CSControl:GoToModifiedUrlAction runat="server" />
                                            </SuccessActions>
                                            <FormTemplate>
                                                <CSControl:ResourceLinkButton ID="RejectLinkButton" runat="server" resourcename="FriendRequest_Reject" />
                                            </FormTemplate>
                                        </CSControl:RejectFriendshipForm>
                                    </div>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                        </ItemTemplate>
                        <NoneTemplate>You do not have any friendship requests to review.</NoneTemplate>
                        <FooterTemplate>
                            <div style="clear: both;"></div>
                        </FooterTemplate>
                      </CSControl:FriendshipList>
                      <CSControl:Pager runat="server" ID="ReviewPager" ShowTotalSummary="true">
                            <LeaderTemplate></div><div class="CommonContentBoxFooter"></LeaderTemplate>
                            <TrailerTemplate></div></TrailerTemplate>
                        </CSControl:Pager>
                </ContentTemplate>
            </CSControl:PlaceHolder>                                    
                
            <CSControl:PlaceHolder runat="server">
                <DisplayConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Pending" /></DisplayConditions>
                <ContentTemplate>
                    <CSControl:FriendshipList ID="PendingFriendRequestFromYou" runat="server" ShowHeaderFooterOnNone="false" ItemsPerRow="2">
                        <QueryOverrides QueryType="PendingFromAccessingUser" PageSize="21" PagerID="PendingPager" />
                        <ItemTemplate>
                            <div class="CommonSideListArea">
                                <div class="CommonSideListImage">
                                    <CSControl:UserData runat="server" LinkTo="Profile"><ContentTemplate><CSControl:UserAvatar runat="server" Height="60" Width="60" ShowAnonymousAvatar="true" /></ContentTemplate></CSControl:UserData>
                                </div>
                                <div class="CommonSideListContent">
                                    <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Strong" />
                                    <CSControl:DeleteFriendshipForm runat="server" DeleteButtonId="Cancel" Tag="Div">
                                        <SuccessActions>                                                
                                            <CSControl:GoToModifiedUrlAction runat="server" />                                                
                                        </SuccessActions>
                                        <FormTemplate>
                                            <asp:LinkButton ID="Cancel" runat="server" OnClientClick="return (confirm('Are you sure you want to cancel this friendship?'))" Text="Cancel request" />
                                        </FormTemplate>
                                    </CSControl:DeleteFriendshipForm>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                        </ItemTemplate>
                        <NoneTemplate>You do not have any pending friendship requests.</NoneTemplate>
                        <FooterTemplate>
                            <div style="clear: both;"></div>
                        </FooterTemplate>
                    </CSControl:FriendshipList>
                    <CSControl:Pager runat="server" ID="PendingPager" ShowTotalSummary="true">
                        <LeaderTemplate></div><div class="CommonContentBoxFooter"></LeaderTemplate>
                        <TrailerTemplate></div></TrailerTemplate>
                    </CSControl:Pager>
                </ContentTemplate>
            </CSControl:PlaceHolder>                
 
        </div>            
    </div>
</asp:Content>