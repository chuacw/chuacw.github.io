<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSControl:ConditionalContent runat="server">
           <ContentConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="UserID" Operator="IsSetOrTrue" runat="server" /></ContentConditions>
           <TrueContentTemplate><CSHub:HubData LinkTo="MemberList" runat="server" ResourceName="Role_Members" /> &raquo; <CSHub:SectionMembershipData runat="server" LinkTo="Edit" ResourceName="Hubs_EditMember" /></TrueContentTemplate>
           <FalseContentTemplate><CSHub:HubData LinkTo="MemberList" runat="server" ResourceName="Role_Members" /></FalseContentTemplate>
        </CSControl:ConditionalContent>
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" IncludeSectionOrHubName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate>
            <CSControl:ConditionalContent runat="server">
                <ContentConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="UserID" Operator="IsSetOrTrue" runat="server" /></ContentConditions>
                <TrueContentTemplate><CSControl:ResourceControl runat="server" ResourceName="Hubs_EditMember" /></TrueContentTemplate>
                <FalseContentTemplate>Members</FalseContentTemplate>
            </CSControl:ConditionalContent>
        </ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="SortBy" ComparisonValue="Username" Operator="EqualTo" /></Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="sectionMembers" QueryOverrideProperty="SortBy" QueryOverrideValue="Username" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="sectionMembers" QueryOverrideProperty="SortOrder" QueryOverrideValue="Ascending" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="sectionMembers" />
        </Actions>
    </CSControl:ConditionalAction>
    
    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="SortBy" ComparisonValue="Activity" Operator="EqualTo" /></Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="sectionMembers" QueryOverrideProperty="SortBy" QueryOverrideValue="UserLastActiveDate" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="sectionMembers" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="sectionMembers" />
        </Actions>
    </CSControl:ConditionalAction>
    
    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="SortBy" ComparisonValue="Recent" Operator="EqualTo" /></Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="sectionMembers" QueryOverrideProperty="SortBy" QueryOverrideValue="UserJoinedDate" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="sectionMembers" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="sectionMembers" />
        </Actions>
    </CSControl:ConditionalAction>
    
    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="SortBy" ComparisonValue="MembershipType" Operator="EqualTo" /></Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="sectionMembers" QueryOverrideProperty="SortBy" QueryOverrideValue="MembershipType" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="sectionMembers" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="sectionMembers" />
        </Actions>
    </CSControl:ConditionalAction>
    
    <div class="CommonContentBox">
    
        <CSControl:PlaceHolder runat="server">
            <DisplayConditions Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="UserID" Operator="IsSetOrTrue" /></DisplayConditions>
            <ContentTemplate>
                <div class="CommonContentBoxHeaderForm">
                    <CSControl:PlaceHolder runat="server" Tag="Div" CssClass="CommonMessageSuccess">
                        <DisplayConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="InviteSent" Operator="IsSetOrTrue" /></DisplayConditions>
                        <ContentTemplate>
                            <CSControl:ResourceControl runat="server" ResourceName="Hubs_InvitationSentMessage" />
                        </ContentTemplate>
                    </CSControl:PlaceHolder>

                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_SortBy" />
                    
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions Operator="Or">
                            <CSControl:QueryStringPropertyValueComparison QueryStringProperty="SortBy" Operator="EqualTo" ComparisonValue="Username" runat="server" />
                            <CSControl:Conditions runat="server" Operator="And">
                                <CSControl:Conditions Operator="Not" runat="server"><CSControl:QueryStringPropertyValueComparison QueryStringProperty="SortBy" Operator="IsSetOrTrue" runat="server" /></CSControl:Conditions>
                                <CSControl:Conditions Operator="Not" runat="server"><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Pending" runat="server" /></CSControl:Conditions>
                            </CSControl:Conditions>
                        </ContentConditions>
                        <TrueContentTemplate><CSControl:SiteUrl runat="server" Tag="B" ResourceName="Hubs_Username" UrlName="hub_members" UrlQueryStringModification="SortBy=Username&amp;PageIndex=1"><Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" Encoding="URL" /></Parameter1Template></CSControl:SiteUrl></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:SiteUrl runat="server" ResourceName="Hubs_Username" UrlName="hub_members" UrlQueryStringModification="SortBy=Username&amp;PageIndex=1"><Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" Encoding="URL" /></Parameter1Template></CSControl:SiteUrl></FalseContentTemplate>
                    </CSControl:ConditionalContent> |
                    
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="SortBy" Operator="EqualTo" ComparisonValue="Activity" runat="server" /></ContentConditions>
                        <TrueContentTemplate><CSControl:SiteUrl runat="server" Tag="B" ResourceName="Hubs_RecentActivity" UrlName="hub_members" UrlQueryStringModification="SortBy=Activity&amp;PageIndex=1"><Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" Encoding="URL" /></Parameter1Template></CSControl:SiteUrl></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:SiteUrl runat="server" ResourceName="Hubs_RecentActivity" UrlName="hub_members" UrlQueryStringModification="SortBy=Activity&amp;PageIndex=1"><Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" Encoding="URL" /></Parameter1Template></CSControl:SiteUrl></FalseContentTemplate>
                    </CSControl:ConditionalContent> |
                    
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="SortBy" Operator="EqualTo" ComparisonValue="Recent" runat="server" /></ContentConditions>
                        <TrueContentTemplate><CSControl:SiteUrl runat="server" Tag="B" ResourceName="Hubs_RecentUsers" UrlName="hub_members" UrlQueryStringModification="SortBy=Recent&amp;PageIndex=1"><Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" Encoding="URL" /></Parameter1Template></CSControl:SiteUrl></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:SiteUrl runat="server" ResourceName="Hubs_RecentUsers" UrlName="hub_members" UrlQueryStringModification="SortBy=Recent&amp;PageIndex=1"><Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" Encoding="URL" /></Parameter1Template></CSControl:SiteUrl></FalseContentTemplate>
                    </CSControl:ConditionalContent> | 
                    
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="SortBy" Operator="EqualTo" ComparisonValue="MembershipType" runat="server" /></ContentConditions>
                        <TrueContentTemplate><CSControl:SiteUrl runat="server" Tag="B" ResourceName="Hubs_MembershipType" UrlName="hub_members" UrlQueryStringModification="SortBy=MembershipType&amp;PageIndex=1"><Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" Encoding="URL" /></Parameter1Template></CSControl:SiteUrl></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:SiteUrl runat="server" ResourceName="Hubs_MembershipType" UrlName="hub_members" UrlQueryStringModification="SortBy=MembershipType&amp;PageIndex=1"><Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" Encoding="URL" /></Parameter1Template></CSControl:SiteUrl></FalseContentTemplate>
                    </CSControl:ConditionalContent>
                    
                    <CSControl:ConditionalContent runat="server">
                        <DisplayConditions><CSHub:HubPermissionCondition runat="server" Permission="Administer" /></DisplayConditions>
                        <LeaderTemplate> | </LeaderTemplate>
                        <ContentConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Pending" runat="server" /></ContentConditions>
                        <TrueContentTemplate><CSControl:SiteUrl runat="server" Tag="B" Text="Pending Users" UrlName="hub_members" UrlQueryStringModification="Show=Pending&amp;PageIndex=1"><Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" Encoding="URL" /></Parameter1Template></CSControl:SiteUrl></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:SiteUrl runat="server" Text="Pending Users" UrlName="hub_members" UrlQueryStringModification="Show=Pending&amp;PageIndex=1"><Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" Encoding="URL" /></Parameter1Template></CSControl:SiteUrl></FalseContentTemplate>
                    </CSControl:ConditionalContent>
                    
                </div>
            </ContentTemplate>
        </CSControl:PlaceHolder>
    
        <CSControl:PlaceHolder runat="server">
            <DisplayConditions Operator="Not">
                <CSControl:Conditions runat="server" Operator="Or">
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Pending" />
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="UserID" Operator="IsSetOrTrue" />
                </CSControl:Conditions>
            </DisplayConditions>
            <ContentTemplate>
                <div class="CommonContentBoxContent">            
                
                    <CSHub:SectionMembershipList runat="server" ID="sectionMembers">
                        <QueryOverrides PageSize="21" PagerID="MembershipPager" MembershipType="Manager,Member,Owner" SortBy="Username" SortOrder="Ascending" />
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="CommonSideListArea">
                                <div class="CommonSideListImage">
                                    <CSControl:UserData runat="server" LinkTo="Profile"><ContentTemplate><CSControl:UserAvatar runat="server" Height="60" Width="60" ShowAnonymousAvatar="true" /></ContentTemplate></CSControl:UserData>
                                </div>
                                <div class="CommonSideListContent">
                                    <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Strong" />
                                    <CSHub:SectionMembershipData Property="MembershipType" runat="server" Tag="Div" />
                                    <CSControl:PlaceHolder runat="server" Tag="Div">
                                        <DisplayConditions><CSHub:HubPermissionCondition runat="server" Permission="Administer" /></DisplayConditions>
                                        <ContentTemplate>
                                            <CSHub:DeleteMemberForm runat="server" DeleteButtonId="Delete">
                                                <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                                <FormTemplate><asp:LinkButton runat="server" ID="Delete" Text="Remove" OnClientClick="if (!confirm('Are you sure you want to remove this member?\n(this action cannot be undone)')) { return false; }" /></FormTemplate>
                                            </CSHub:DeleteMemberForm>   
                                            | <CSHub:SectionMembershipData runat="server" LinkTo="Edit" Text="Edit" />
                                        </ContentTemplate>
                                    </CSControl:PlaceHolder>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="clear: both;"></div>
                        </FooterTemplate>
                    </CSHub:SectionMembershipList>
                </div>
                <div class="CommonContentBoxFooter">
                    <CSControl:Pager ID="MembershipPager" runat="server" ShowTotalSummary="true" />
                </div>
            </ContentTemplate>
        </CSControl:PlaceHolder>                
            
        <CSControl:PlaceHolder runat="server">
            <DisplayConditions Operator="And">
                <CSHub:HubPermissionCondition runat="server" Permission="Administer" />
                <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Pending" />
            </DisplayConditions>
            <ContentTemplate>
                <div class="CommonContentBoxContent">
                    <CSHub:SectionMembershipList runat="server" ShowHeaderFooterOnNone="false">
                        <QueryOverrides PageSize="21" PagerID="MembershipPager2" MembershipType="PendingMember" SortBy="Username" SortOrder="Ascending" />
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="CommonSideListArea">
                                <div class="CommonSideListImage">
                                    <CSControl:UserData runat="server" LinkTo="Profile"><ContentTemplate><CSControl:UserAvatar runat="server" Height="60" Width="60" ShowAnonymousAvatar="true" /></ContentTemplate></CSControl:UserData>
                                </div>
                                <div class="CommonSideListContent">
                                    <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Strong" />
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_PendingMember" Tag="Div" />
                                    <CSHub:AcceptRejectMembershipRequestForm runat="server" AcceptButtonId="Accept" RejectButtonId="Reject" Tag="Div">
                                        <RequestAcceptedActions><CSControl:GoToModifiedUrlAction runat="server" /></RequestAcceptedActions>
                                        <RequestRejectedActions><CSControl:GoToModifiedUrlAction runat="server" /></RequestRejectedActions>
                                        <FormTemplate>
                                            <asp:LinkButton runat="server" ID="Accept" Text="Accept" /> |
                                            <asp:LinkButton runat="server" ID="Reject" Text="Reject" />
                                        </FormTemplate>
                                    </CSHub:AcceptRejectMembershipRequestForm>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                        </ItemTemplate>
                        <NoneTemplate>
                            There are no pending membership requests.
                        </NoneTemplate>
                        <FooterTemplate>
                            <div style="clear: both;"></div>
                        </FooterTemplate>
                    </CSHub:SectionMembershipList>
                </div>
                <div class="CommonContentBoxFooter">
                    <CSControl:Pager ID="MembershipPager2" runat="server" ShowTotalSummary="true" />
                </div>
            </ContentTemplate>
        </CSControl:PlaceHolder>
            
        <CSHub:EditMemberForm runat="server" SaveButtonId="Save" SectionMembershipTypeDropDownListId="MembershipType" ValidationGroup="EditMember">
            <DisplayConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="UserID" Operator="IsSetOrTrue" /></DisplayConditions>
            <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="UserID=" TargetLocationModification="" /></SuccessActions>
            <FormTemplate>
                <div class="CommonContentBoxContent">
                    <div class="CommonFormArea">
                        <div class="CommonFormFieldName">
                            <CSControl:UserData runat="server" LinkTo="Profile" Tag="Div" style="margin-bottom: 4px;"><ContentTemplate>
                                <CSControl:UserAvatar runat="server" BorderWidth="0" />
                            </ContentTemplate></CSControl:UserData>
                            <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Strong" />
                        </div>
                        
                        <CSControl:FormLabel runat="server" ResourceName="Hubs_MembershipType" LabelForId="MembershipType" CssClass="CommonFormFieldName" />
                        <div class="CommonFormField"><asp:DropDownList ID="MembershipType" runat="server" /></div>
                        
                        <div class="CommonFormFieldName">
                            <asp:Button runat="server" ID="Save" Text="Save" />
                            
                            <CSControl:ButtonActionForm runat="server" ButtonId="Button">
                                <Actions><CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="UserID=" TargetLocationModification="" /></Actions>
                                <FormTemplate><asp:Button ValidationGroup="EditMember" runat="server" ID="Button" Text="Cancel" /></FormTemplate>
                            </CSControl:ButtonActionForm>
                        </div>
                    </div>
                </div>
            </FormTemplate>
        </CSHub:EditMemberForm>                        
                                
    </div>        
    
    <CSControl:PlaceHolder runat="server">
        <DisplayConditions Operator="And">
            <CSHub:HubPermissionCondition runat="server" Permission="Administer" />
            <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="UserID" Operator="IsSetOrTrue" /></CSControl:Conditions>
        </DisplayConditions>
        <ContentTemplate>
    
            <div style="width: 49%; float: left;">
            
            <CSHub:AddMemberForm runat="server" SaveButtonId="Save" SectionMembershipTypeDropDownListId="MembershipType" UserLookUpTextBoxId="UserName" ValidationGroup="AddMember">
                <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="UserID=" TargetLocationModification="" /></SuccessActions>
                <FormTemplate>
                    <div class="CommonContentBox">
                        <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_AddMember" /></h4>
                        <div class="CommonContentBoxContent" style="min-height: 300px;">
                            <div class="CommonFormArea">
                                <CSControl:FormLabel runat="server" ResourceName="Hubs_NewUserNames" LabelForId="UserName" CssClass="CommonFormFieldName" />
                                <div class="CommonFormField"><CSControl:UserLookUpTextBox runat="server" ID="UserName" Width="260px" /> <asp:requiredfieldvalidator runat="server" Cssclass="validationWarning" ControlToValidate="UserName" ValidationGroup="AddMember">*</asp:requiredfieldvalidator></div>
                            
                                <CSControl:FormLabel runat="server" ResourceName="Hubs_MembershipType" LabelForId="MembershipType" CssClass="CommonFormFieldName" />
                                <div class="CommonFormField"><asp:DropDownList runat="server" ValidationGroup="AddMember" ID="MembershipType" /></div>
                          
                                <div class="CommonFormFieldName"><asp:Button runat="server" ID="Save" Text="Add Member(s)" ValidationGroup="AddMember" /></div>
                            </div>
                        </div>
                    </div>
                </FormTemplate>
            </CSHub:AddMemberForm>
            
            </div><div style="width: 49%; float: right;">
            
            <CSHub:InviteUserForm runat="server" EmailAddressTextBoxId="EmailAddress" MessageTextBoxId="Message" SectionMembershipTypeDropDownListId="MembershipType" SubmitButtonId="Save" ValidationGroup="InviteMember">
                <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="UserID=&amp;InviteSent=true" TargetLocationModification="" /></SuccessActions>
                <FormTemplate>
                    <div class="CommonContentBox">
                        <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_InviteMemberByEmail" /></h4>
                        <div class="CommonContentBoxContent" style="min-height: 300px;">
                            <div class="CommonFormArea">
                                <CSControl:FormLabel runat="server" ResourceName="Hubs_EmailAddresses" LabelForId="EmailAddress" CssClass="CommonFormFieldName" />
                                <div class="CommonFormField"><asp:TextBox runat="server" ValidationGroup="InviteMember" TextMode="MultiLine" Rows="3" Columns="50" ID="EmailAddress" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailAddress" ValidationGroup="InviteMember" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                            
                                <CSControl:FormLabel runat="server" ResourceName="Hubs_MembershipType" LabelForId="MembershipType" CssClass="CommonFormFieldName" />
                                <div class="CommonFormField"><asp:DropDownList runat="server" ValidationGroup="InviteMember" ID="MembershipType" /></div>
                                
                                <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_Body" LabelForId="Message" CssClass="CommonFormFieldName" />
                                <div class="CommonFormField"><asp:TextBox runat="server" TextMode="MultiLine" Rows="5" Columns="50" ValidationGroup="InviteMember" ID="Message" /></div>
                          
                                <div class="CommonFormFieldName"><asp:Button runat="server" ID="Save" Text="Send Invitation" ValidationGroup="InviteMember" /></div>
                            </div>
                        </div>
                    </div>
                </FormTemplate>
            </CSHub:InviteUserForm>
            
            <CSHub:AddMemberForm runat="server" IsLdapGroup="true" SaveButtonId="Save" SectionMembershipTypeDropDownListId="MembershipType" UserLookUpTextBoxId="GroupName" ValidationGroup="AddGroupMembers">
                <FormTemplate>
                    <div class="CommonContentBox">
                        <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_Ldap_AddGroup" /></h4>
                        <div class="CommonContentBoxContent" style="min-height: 300px;">
                            <div class="CommonFormArea">
                                <CSControl:FormLabel runat="server" ResourceName="Hubs_Ldap_GroupName" LabelForId="UserName" CssClass="CommonFormFieldName" />
                                <div class="CommonFormField"><CSControl:UserLookUpTextBox runat="server" ID="GroupName" Width="260px" /><asp:requiredfieldvalidator runat="server" Cssclass="validationWarning" ControlToValidate="GroupName" ValidationGroup="AddGroupMembers">*</asp:requiredfieldvalidator></div>

                                <CSControl:FormLabel ID="FormLabel2" runat="server" ResourceName="Hubs_MembershipType" LabelForId="MembershipType" CssClass="CommonFormFieldName" />
                                <div class="CommonFormField"><asp:DropDownList runat="server" ValidationGroup="AddMember" ID="MembershipType" /></div>
                          
                                <div class="CommonFormFieldName"><asp:Button runat="server" ID="Save" Text="Add Member(s)" ValidationGroup="AddGroupMembers" /></div>
                            </div>
                        </div>
                    </div>
                </FormTemplate>
            </CSHub:AddMemberForm>

            </div>
            <div style="clear: both;"></div>
        </ContentTemplate>    
    </CSControl:PlaceHolder>
</asp:Content>

<asp:Content ContentPlaceHolderID="rcrb" runat="server">

    
</asp:Content>