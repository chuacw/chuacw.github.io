<%@ Control Language="C#" %>

<div class="CommonContentBox">
    <div class="CommonContentBoxContent">
        <div style="float: left; margin: 0 10px 10px 0;">
            <CSControl:UserAvatar runat="server" Width="80" Height="80" />
        </div>
        <div style="float: left;">
            <CSControl:UserProfileData runat="server" Property="Age" ResourceName="UserActivity_UserAge" Tag="Div" />
            <CSControl:UserProfileData runat="server" Property="Location" Tag="Div" />
            <CSControl:UserProfileData runat="server" Property="Gender" Tag="Div">
                <DisplayConditions Operator="Not"><CSControl:UserProfilePropertyValueComparison runat="server" ComparisonProperty="Gender" Operator="EqualTo" ComparisonValue="NotSet" /></DisplayConditions>
            </CSControl:UserProfileData>
            <CSControl:UserData runat="server" Property="TotalPosts" LinkTo="PostsSearch" Tag="Div">
                <TrailerTemplate> <CSControl:ResourceControl runat="server" ResourceName="Posts" /></TrailerTemplate>
            </CSControl:UserData>
            <CSControl:UserData runat="server" Property="Points">
                <TrailerTemplate>
                    <CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_PointsLast" />
                </TrailerTemplate>
            </CSControl:UserData>
        </div>
        <div style="clear: both;"></div>
        <ul class="CommonContentBoxList">
            <CSControl:UserData runat="server" LinkTo="ChangeAvatar" ResourceName="EditProfile_ChangeAvatar" Tag="Li" />
            <CSControl:placeholder runat="server">
                <DisplayConditions>
                    <CSControl:UserInRoleCondition runat="server" Role="Registered Users" UseAccessingUser="true" />
                </DisplayConditions>
                <ContentTemplate>
                    <CSControl:UserData LinkTo="FriendRequest" ResourceName="Friends_Add" runat="server" Tag="LI" />
                    <CSControl:DeleteFriendshipForm runat="server" DeleteButtonId="DeleteLinkButton" Tag="LI">
                        <SuccessActions>
                            <CSControl:GoToModifiedUrlAction runat="server" />
                        </SuccessActions>
                        <DisplayConditions Operator="Not">
                            <CSControl:FriendshipPropertyValueComparison runat="server" ComparisonProperty="FriendshipState" Operator="equalTo" ComparisonValue="Approved" />
                        </DisplayConditions>
                        <FormTemplate>
                            <script type="text/javascript">
                                function confirmFriendCancel()
                                {
                                    return window.confirm('<CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_FriendDeleteConfirm" Encoding="JavaScript" />');
                                }
                            </script>
                            <CSControl:ResourceLinkButton ID="DeleteLinkButton" runat="server" OnClientClick="return confirmFriendCancel();">
                                <cscontrol:userdata runat="server" property="DisplayName" resourcename="Friends_CancelFriendship" />
                            </CSControl:ResourceLinkButton>
                        </FormTemplate>
                    </CSControl:DeleteFriendshipForm>
                    <CSControl:ApproveFriendshipForm runat="server" ApproveButtonId="ApproveLinkButton" Tag="LI">
                        <SuccessActions>
                            <CSControl:GoToModifiedUrlAction runat="server" />
                        </SuccessActions>
                        <FormTemplate>
                            <asp:LinkButton ID="ApproveLinkButton" runat="server">
                                <cscontrol:userdata runat="server" property="DisplayName" resourcename="Friends_ApproveFriendship" />
                            </asp:LinkButton>
                        </FormTemplate>
                    </CSControl:ApproveFriendshipForm>
                    <CSControl:DeleteFriendshipForm runat="server" DeleteButtonId="DeleteLinkButton" Tag="LI">
                        <SuccessActions>
                            <CSControl:GoToModifiedUrlAction runat="server" />
                        </SuccessActions>
                        <DisplayConditions>
                            <CSControl:FriendshipPropertyValueComparison runat="server" ComparisonProperty="FriendshipState" Operator="equalTo" ComparisonValue="Approved" />
                        </DisplayConditions>
                        <FormTemplate>
                            <asp:LinkButton ID="DeleteLinkButton" runat="server">
                                <cscontrol:userdata runat="server" property="DisplayName" resourcename="Friends_DeleteFriendship" />
                            </asp:LinkButton>
                        </FormTemplate>
                    </CSControl:DeleteFriendshipForm>
                    <CSControl:UserData runat="server" LinkTo="AddComment" ResourceName="ViewUserProfile_AddComment" Tag="LI">
                        <TrailerTemplate><br /></TrailerTemplate>
                    </CSControl:UserData>
                </ContentTemplate>
            </CSControl:placeholder>
            <cscontrol:userdata runat="server" LinkTo="SendConversationMessage" ResourceName="ViewUserProfile_SendMessage" Tag="LI" />
            <CSControl:UserData runat="server" ResourceName="ViewUserProfile_SendEmail" LinkTo="SendEmail" Tag="LI" />
            <CSControl:UserData runat="server" LinkTo="AddAnnouncement" ResourceName="ViewUserProfile_AddAnnouncement" Tag="LI" />
            <CSControl:UserData runat="server" LinkTo="EditProfile" ResourceName="ModeratePost_EditUser" Tag="LI" />
        </ul>
    </div>
</div>