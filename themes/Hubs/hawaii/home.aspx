<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

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
    <CSControl:Title runat="server" IncludeSiteName="true" IncludeSectionOrHubName="false" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSHub:HubData runat="server" Property="Name" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    <script type="text/javascript">
        function confirmActivityDelete()
        {
            return window.confirm('<%= CommunityServer.Components.ResourceManager.GetString("Activity_DeleteConfirmation") %>');
        }
    </script>
            
    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
            <CSControl:PlaceHolder runat="server">
                <DisplayConditions Operator="Not">
                    <CSHub:SectionMembershipPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="MembershipType" Operator="EqualTo" ComparisonValue="Owner" />
                    <CSHub:SectionMembershipPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="MembershipType" Operator="EqualTo" ComparisonValue="Member" />
                    <CSHub:SectionMembershipPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="MembershipType" Operator="EqualTo" ComparisonValue="Manager" />
                    <CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" />
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="AccessRequestSent" Operator="IsSetOrTrue" />
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="AccessRequestAccepted" Operator="IsSetOrTrue" />
                    <CSControl:UserInRoleCondition runat="server" Role="SystemAdministrator" UseAccessingUser="true" />
                </DisplayConditions>
                <ContentTemplate>
                    <div class="CommonMessageWarning">
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions>
                                <CSHub:HubPropertyValueComparison runat="server" ComparisonProperty="MembershipIsOpen" Operator="issetortrue" />
                            </ContentConditions>
                            <TrueContentTemplate>
                                <CSControl:ResourceControl runat="server" ResourceName="Hubs_OpenNotMemberMessage" />
                            </TrueContentTemplate>
                            <FalseContentTemplate>
                                <CSControl:ResourceControl runat="server" ResourceName="Hubs_NotMemberMessage" />
                            </FalseContentTemplate>
                        </CSControl:ConditionalContent>
                    </div>
                </ContentTemplate>
            </CSControl:PlaceHolder>
    
            <CSControl:PlaceHolder runat="server" Tag="Div" CssClass="CommonMessageSuccess">
                <DisplayConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="AccessRequestSent" Operator="IsSetOrTrue" /></DisplayConditions>
                <ContentTemplate>
                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_RequestSentMessage" />
                </ContentTemplate>
            </CSControl:PlaceHolder>
    
            <CSControl:PlaceHolder runat="server" Tag="Div" CssClass="CommonMessageSuccess">
                <DisplayConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="AccessRequestAccepted" Operator="IsSetOrTrue" /></DisplayConditions>
                <ContentTemplate>
                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_RequestAcceptedMessage" />
                </ContentTemplate>
            </CSControl:PlaceHolder>
        
            <div style="float: left; width: 80px; height: 100px; overflow: hidden; padding-right: 10px;">
                <CSHub:HubAvatar runat="server" BorderWidth="0" Width="80" Height="80" />
                <div>
                    <CSHub:HubData runat="server" LinkTo="EditAvatar" ResourceName="Hubs_Avatar_Change" />
                </div>
            </div>
            <div style="margin-left: 90px;">
                <CSHub:HubData Property="Description" runat="server" EnsureVisibleHtml="true" />
                <CSControl:PlaceHolder runat="server">
                    <DisplayConditions Operator="Not"><CSHub:HubPropertyValueComparison runat="server" ComparisonProperty="HtmlDescription" Operator="ContainsVisibleHtml" /></DisplayConditions>
                    <ContentTemplate>
                        A description has not yet been added to this group.
                        <CSHub:HubData LinkTo="Edit" Text="Edit this group and add a description" Tag="P" runat="server" />
                    </ContentTemplate>
                </CSControl:PlaceHolder>
            </div>        
            <div style="clear: both;"></div>
        </div>
            
        <CSMessage:ActivityMessageList runat="server" ShowHeaderFooterOnNone="false">
            <QueryOverrides QueryType="CurrentHubActivity" PageSize="20" PageIndex="0" />
            <LeaderTemplate>
                    <h4 class="CommonContentBoxHeader">
                        <CSControl:ResourceControl runat="server" ResourceName="Hubs_RecentGroupActivity" />
                    </h4>
                    <div class="CommonContentBoxContent">
            </LeaderTemplate>
            <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
            <ItemTemplate>
                <CSMessage:ActivityMessageData runat="server" Property="DateCreated" Tag="Li" CssClass="Header">
                    <DisplayConditions><CSControl:CustomCondition CustomResult='<%# ShowDateHeader("HubActivity", Eval("DateCreated")) %>' runat="server" /></DisplayConditions>
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
            <NoneTemplate></NoneTemplate>
            <FooterTemplate></ul></FooterTemplate>
            <TrailerTemplate>
                    </div>
            </TrailerTemplate>
        </CSMessage:ActivityMessageList>
    
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcrb" runat="server">
    <script type="text/javascript">
        function confirmCancelMembership()
        {
            return window.confirm('Are you sure you want to leave this group?');
        }
    </script>
    <CSControl:ConditionalContent runat="server">
        <ContentConditions Operator="Or">
            <CSHub:SectionMembershipPropertyValueComparison runat="server" ComparisonProperty="MembershipType" UseAccessingUser="true" Operator="EqualTo" ComparisonValue="Owner" />
            <CSHub:SectionMembershipPropertyValueComparison runat="server" ComparisonProperty="MembershipType" UseAccessingUser="true" Operator="EqualTo" ComparisonValue="Manager" />
            <CSHub:SectionMembershipPropertyValueComparison runat="server" ComparisonProperty="MembershipType" UseAccessingUser="true" Operator="EqualTo" ComparisonValue="Member" />
            <CSHub:SectionMembershipPropertyValueComparison runat="server" ComparisonProperty="MembershipType" UseAccessingUser="true" Operator="EqualTo" ComparisonValue="PendingMember" />
        </ContentConditions>
        <TrueContentTemplate>
            <div class="CommonContentBox">
                <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_MembersipStatus" /></h4>
                <div class="CommonContentBoxContent">
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions>
                            <CSHub:SectionMembershipPropertyValueComparison runat="server" ComparisonProperty="MembershipType" UseAccessingUser="true" Operator="EqualTo" ComparisonValue="Owner" />
                        </ContentConditions>
                        <TrueContentTemplate>
                            <CSControl:ResourceControl runat="server" ResourceName="Hubs_anOwnerCurrentMember" />
                        </TrueContentTemplate>
                        <FalseContentTemplate>
                            <CSControl:ConditionalContent runat="server">
                                <ContentConditions>
                                    <CSHub:SectionMembershipPropertyValueComparison runat="server" ComparisonProperty="MembershipType" UseAccessingUser="true" Operator="EqualTo" ComparisonValue="Member" />
                                </ContentConditions>
                                <TrueContentTemplate>
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_aMemberCurrentMember" />
                                </TrueContentTemplate>
                                <FalseContentTemplate>
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_aPendingMemberCurrentMember" />
                                </FalseContentTemplate>
                            </CSControl:ConditionalContent>
                        </FalseContentTemplate>
                    </CSControl:ConditionalContent>
                    <CSHub:CancelMembershipForm runat="server" DeleteButtonId="CancelMembership">
                        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                        <FormTemplate>
                            <br /><br />
                            <CSControl:ResourceLinkButton ID="CancelMembership" OnClientClick="return confirmCancelMembership()" CausesValidation="false" ResourceName="Hubs_LeaveGroup" runat="server" />
                        </FormTemplate>
                    </CSHub:CancelMembershipForm>
                </div>
            </div>
        </TrueContentTemplate>
        <FalseContentTemplate>
            <CSControl:ConditionalContent runat="server">
                <ContentConditions>
                    <CSHub:HubPropertyValueComparison runat="server" ComparisonProperty="MembershipIsOpen" Operator="issetortrue" />    
                </ContentConditions>
                <TrueContentTemplate>
                    <CSHub:RequestMembershipForm runat="server" MessageTextBoxId="RequestAccessMessage" SubmitButtonId="RequestButton">
                        <DisplayConditions Operator="Not">
                            <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="AccessRequestSent" Operator="IsSetOrTrue" />
                        </DisplayConditions>
                        <RequestSentActions>
                            <CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="AccessRequestSent=true" />
                        </RequestSentActions>
                        <RequestAcceptedActions>
                            <CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="AccessRequestAccepted=true" />
                        </RequestAcceptedActions>
                        <FormTemplate>
                             <div class="CommonContentBox">
                                <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_JoinGroup" /></h4>
                                <div class="CommonContentBoxContent">
                                <CSControl:ResourceControl runat="server" ResourceName="Hubs_JoinMembership_Desc" />
                                <div class="CommonFormArea">
                                    <div class="CommonFormFieldName">
                                        <CSControl:ResourceButton runat="server" ID="RequestButton" ResourceName="Hubs_JoinGroup" />
                                    </div>
                                </div>
                                </div>
                            </div>
                        </FormTemplate>
                    </CSHub:RequestMembershipForm>  
                </TrueContentTemplate>
                <FalseContentTemplate>
                    <CSHub:RequestMembershipForm runat="server" MessageTextBoxId="RequestAccessMessage" SubmitButtonId="RequestButton">
                        <DisplayConditions Operator="Not">
                            <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="AccessRequestSent" Operator="IsSetOrTrue" />
                        </DisplayConditions>
                        <RequestSentActions>
                            <CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="AccessRequestSent=true" />
                        </RequestSentActions>
                        <RequestAcceptedActions>
                            <CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="AccessRequestAccepted=true" />
                        </RequestAcceptedActions>
                        <FormTemplate>
                            <div class="CommonContentBox">
                                <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_RequestMembership" /></h4>
                                <div class="CommonContentBoxContent">
                                <CSControl:ResourceControl runat="server" ResourceName="Hubs_RequestMembership_Desc" />
                                <div class="CommonFormArea">                    
                                    <CSControl:PlaceHolder runat="server">
                                        <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="RequestAccessMessage" ControlVisiblilityEquals="true" /></DisplayConditions>
                                        <ContentTemplate>
                                            <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_Body" LabelForId="RequestAccessMessage" CssClass="CommonFormFieldName" />
                                            <div class="CommonFormField">
                                                <asp:TextBox runat="server" TextMode="MultiLine" Rows="5" style="width: 90%;" ID="RequestAccessMessage" />
                                            </div>
                                        </ContentTemplate>
                                    </CSControl:PlaceHolder>
                                    <div class="CommonFormFieldName">
                                        <CSControl:ResourceButton runat="server" ID="RequestButton" ResourceName="Hubs_RequestMembership" />
                                    </div>
                                </div>
                                </div>
                            </div>
                        </FormTemplate>
                    </CSHub:RequestMembershipForm>
                </FalseContentTemplate>
            </CSControl:ConditionalContent>
        </FalseContentTemplate>
    </CSControl:ConditionalContent>
            
</asp:Content>