<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSHub:HubData LinkTo="ContactRequests" runat="server" ResourceName="Hubs_ContactRequest" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="Hubs_ContactRequest" IncludeSectionOrHubName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" /> 
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
            <script type="text/javascript">
                function confirmRequestDelete()
                {
                    return window.confirm('Are you sure you want to delete this contact request?');
                }
            </script>
            
            <CSControl:ConditionalAction runat="server">
                <Conditions>
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="FilterType" Operator="EqualTo" ComparisonValue="All" />
                </Conditions>
                <Actions>
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="ContactRequests" QueryOverrideProperty="FilterType" QueryOverrideValue="All" />
                    <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="ContactRequests" />
                </Actions>
            </CSControl:ConditionalAction>
            
            <CSControl:ConditionalAction runat="server">
                <Conditions>
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="FilterType" Operator="EqualTo" ComparisonValue="Moderated" />
                </Conditions>
                <Actions>
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="ContactRequests" QueryOverrideProperty="FilterType" QueryOverrideValue="Moderated" />
                    <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="ContactRequests" />
                </Actions>
            </CSControl:ConditionalAction>
            
            <CSControl:ConditionalAction runat="server">
                <Conditions>
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="FilterType" Operator="EqualTo" ComparisonValue="UnModerated" />
                </Conditions>
                <Actions>
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="ContactRequests" QueryOverrideProperty="FilterType" QueryOverrideValue="UnModerated" />
                    <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="ContactRequests" />
                </Actions>
            </CSControl:ConditionalAction>
            
            <div>
                <CSControl:ResourceControl runat="server" ResourceName="Show" />: 
                
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="ContactRequestsQuery" ComparisonProperty="FilterType" Operator="EqualTo" ComparisonValue="All" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Wikis_PageSort_All" QueryStringModification="FilterType=All" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Wikis_PageSort_All" QueryStringModification="FilterType=All" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent>
                |
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="ContactRequestsQuery" ComparisonProperty="FilterType" Operator="EqualTo" ComparisonValue="Moderated" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Hubs_ContactRequest_Moderated" QueryStringModification="FilterType=Moderated" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Hubs_ContactRequest_Moderated" QueryStringModification="FilterType=Moderated" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent>
                |
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="ContactRequestsQuery" ComparisonProperty="FilterType" Operator="EqualTo" ComparisonValue="UnModerated" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Hubs_ContactRequest_UnModerated" QueryStringModification="FilterType=UnModerated" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Hubs_ContactRequest_UnModerated" QueryStringModification="FilterType=UnModerated" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent>
                
            </div>
            
            <CSHub:HubContactRequestList runat="server" ID="ContactRequests">
                <QueryOverrides runat="server" FilterType="All" ID="ContactRequestsQuery" PagerID="ContactRequestsPager" />
                <HeaderTemplate>
		            <div class="CommonAvatarListItemsArea">
		                <ul class="CommonAvatarListItemList">
	            </HeaderTemplate>
                <ItemTemplate>
                    <li class="CommonAvatarListItemArea Custom">
                        <div class="CustomAvatarListItemCustomAvatar">
                            <CSControl:ConditionalContent runat="server">
                                <ContentConditions>
                                    <CSHub:HubContactRequestPropertyValueComparison runat="server" ComparisonProperty="IsModerated" Operator="IsSetOrTrue" />
                                </ContentConditions>
                                <TrueContentTemplate>
                                    <CSControl:ThemeImage runat="server" ImageUrl="~/images/Common/spam.png" ToolTip="Possible Spam: Not Emailed" />
                                </TrueContentTemplate>
                                <FalseContentTemplate>
                                    <CSControl:ThemeImage runat="server" ImageUrl="~/images/Common/published.png" ToolTip="Message Emailed" />
                                </FalseContentTemplate>
                            </CSControl:ConditionalContent>
                            
                        </div>
                        <CSHub:HubContactRequestData runat="server" style="float:left;" LinkTo="ViewContactRequest" Property="Subject" Tag="H4" CssClass="CommonAvatarListItemName" />
                        <div style="float:right;width:100px;margin-top:0px;">
                            <CSHub:ApproveDeleteHubContactRequestForm runat="server" 
                                ApproveButtonId="ApproveRequest"
                                DeleteButtonId="DeleteRequest"
                            >
                                <SuccessActions>
                                    <CSControl:GoToModifiedUrlAction runat="server" />
                                </SuccessActions>
                                <FormTemplate>
                                    <CSControl:ResourceLinkButton runat="server" ID="DeleteRequest" OnClientClick="return confirmRequestDelete();" ResourceName="Delete" />
                                    <CSControl:PlaceHolder runat="server">
                                        <DisplayConditions>
                                            <CSControl:ControlVisibilityCondition runat="server" ControlId="ApproveRequest" ControlVisiblilityEquals="true" />
                                        </DisplayConditions>
                                        <ContentTemplate> | </ContentTemplate>
                                    </CSControl:PlaceHolder>
                                    <CSControl:ResourceLinkButton runat="server" ID="ApproveRequest" ResourceName="Approve" />
                                </FormTemplate>    
                            </CSHub:ApproveDeleteHubContactRequestForm>
                        </div>
                        <div style="margin-top:35px; padding-left: 70px;">
                            <CSHub:HubContactRequestData runat="server" Property="Excerpt" CssClass="CommonAvatarListItem" />
                            <div class="CommonAvatarListItemDetails">
                                <CSHub:HubContactRequestData runat="server" Property="CreationDate" FormatString="ddd, MMM MM yyyy h:mm tt" />
                                <CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_By" />
                                <CSHub:HubContactRequestData runat="server" Property="Name" LinkTo="MailTo" />
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <li class="CommonAvatarListItemArea Custom Alt">
                        <div class="CustomAvatarListItemCustomAvatar">
                            <CSControl:ConditionalContent runat="server">
                                <ContentConditions>
                                    <CSHub:HubContactRequestPropertyValueComparison runat="server" ComparisonProperty="IsModerated" Operator="IsSetOrTrue" />
                                </ContentConditions>
                                <TrueContentTemplate>
                                    <CSControl:ThemeImage runat="server" ImageUrl="~/images/Common/spam.png" ToolTip="Possible Spam: Not Emailed" />
                                </TrueContentTemplate>
                                <FalseContentTemplate>
                                    <CSControl:ThemeImage runat="server" ImageUrl="~/images/Common/published.png" ToolTip="Message Emailed" />
                                </FalseContentTemplate>
                            </CSControl:ConditionalContent>
                            
                        </div>
                        <CSHub:HubContactRequestData runat="server" style="float:left;" LinkTo="ViewContactRequest" Property="Subject" Tag="H4" CssClass="CommonAvatarListItemName" />
                        <div style="float:right;width:100px;margin-top:0px;">
                            <CSHub:ApproveDeleteHubContactRequestForm runat="server" 
                                ApproveButtonId="ApproveRequest"
                                DeleteButtonId="DeleteRequest"
                            >
                                <SuccessActions>
                                    <CSControl:GoToModifiedUrlAction runat="server" />
                                </SuccessActions>
                                <FormTemplate>
                                    <CSControl:ResourceLinkButton runat="server" ID="DeleteRequest" OnClientClick="return confirmRequestDelete();" ResourceName="Delete" />
                                    <CSControl:PlaceHolder runat="server">
                                        <DisplayConditions>
                                            <CSControl:ControlVisibilityCondition runat="server" ControlId="ApproveRequest" ControlVisiblilityEquals="true" />
                                        </DisplayConditions>
                                        <ContentTemplate> | </ContentTemplate>
                                    </CSControl:PlaceHolder>
                                    <CSControl:ResourceLinkButton runat="server" ID="ApproveRequest" ResourceName="Approve" />
                                </FormTemplate>    
                            </CSHub:ApproveDeleteHubContactRequestForm>
                        </div>
                        <div style="margin-top:35px; padding-left: 70px;">
                            <CSHub:HubContactRequestData runat="server" Property="Excerpt" CssClass="CommonAvatarListItem" />
                            <div class="CommonAvatarListItemDetails">
                                <CSHub:HubContactRequestData runat="server" Property="CreationDate" FormatString="ddd, MMM MM yyyy h:mm tt" />
                                <CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_By" />
                                <CSHub:HubContactRequestData runat="server" Property="Name" LinkTo="MailTo" />
                            </div>
                        </div>
                    </li>
                </AlternatingItemTemplate>
                <NoneTemplate>
                    <div class="CommonMessageWarning">
	                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_Contact_NoneExist" />
	                </div>
	            </NoneTemplate>
	            <FooterTemplate>
		                </ul>
                    </div>
	            </FooterTemplate>
            </CSHub:HubContactRequestList>
            <CSControl:Pager runat="server" ID="ContactRequestsPager" />
        </div>
    </div>

</asp:Content>