<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" ResourceName="ApiKeys_AuthorizedApplications" Tag="H2" CssClass="CommonTitle" EnableRendering="true" IncludeSiteName="true" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
			        
    <div class="CommonContentBox">
        <div class="CommonContentBoxHeaderForm">
            <CSControl:CreateApiKeyForm runat="server" NameTextBoxId="ApiKeyName" GenerateButtonId="GenerateApiKey">
                <SuccessActions>
                    <CSControl:GoToModifiedUrlAction runat="server" />
                </SuccessActions>
                <FormTemplate>
                    <CSControl:ResourceControl runat="server" ResourceName="Name" />:  
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ApiKeyName" ErrorMessage="*" Display="static" />
                    <CSControl:DefaultButtonTextBox runat="server" ID="ApiKeyName" ButtonId="GenerateApiKey" />&nbsp;
                    <CSControl:ResourceButton runat="server" ID="GenerateApiKey" ResourceName="Generate" />
                </FormTemplate>
            </CSControl:CreateApiKeyForm>
        </div>
        <div class="CommonContentBoxContent">
			<div class="CommonListArea">
	            <CSControl:ApiKeyList runat="server" ShowHeaderFooterOnNone="false">
	                <HeaderTemplate>
		                <table cellpadding="0" cellspacing="0" border="0" width="100%">
			                <thead>
			                <tr>
			                    <th class="CommonListHeader"><CSControl:ResourceControl runat="server" ResourceName="Name" /></th>
			                    <th class="CommonListHeader"><CSControl:ResourceControl runat="server" ResourceName="ApiKeys_APIKey" /></th>
				                <th class="CommonListHeader"><CSControl:ResourceControl runat="server" ResourceName="DateCreated" /></th>
				                <th class="CommonListHeader"><CSControl:ResourceControl runat="server" ResourceName="Status" /></th>
				                <th class="CommonListHeader"><CSControl:ResourceControl runat="server" ResourceName="Actions" /></th>
			                </tr>
			                </thead>
			                <tbody>
	                </HeaderTemplate>
	                <ItemTemplate>
			                <tr>
			                    <td class="CommonListCell"><CSControl:ApiKeyData Property="Name" runat="server" /></td>
                                <td class="CommonListCell"><CSControl:ApiKeyData Property="Value" runat="server" /></td>
				                <td class="CommonListCell"><CSControl:ApiKeyData Property="DateCreated" runat="server" /></td>
				                <td class="CommonListCell">
				                    <CSControl:PlaceHolder runat="server">
				                        <DisplayConditions><CSControl:ApiKeyPropertyValueComparison runat="server" ComparisonProperty="Enabled" Operator="issetortrue" /></DisplayConditions>
				                        <ContentTemplate><CSControl:ThemeImage runat="server" ImageUrl="~/images/common/approved.png" /></ContentTemplate>
				                    </CSControl:PlaceHolder>
				                    <CSControl:PlaceHolder runat="server">
				                        <DisplayConditions Operator="not"><CSControl:ApiKeyPropertyValueComparison runat="server" ComparisonProperty="Enabled" Operator="issetortrue" /></DisplayConditions>
				                        <ContentTemplate><CSControl:ThemeImage runat="server" ImageUrl="~/images/common/unapproved.png" /></ContentTemplate>
				                    </CSControl:PlaceHolder>
				                </td>
				                <td class="CommonListCell">
				                    <CSControl:ApiKeyData LinkTo="Edit" ResourceName="Edit" runat="server" />
				                    |
				                    <CSControl:DeleteApiKeyForm runat="server" SubmitButtonId="DeleteButton">
				                        <SuccessActions>
				                            <CSControl:GoToModifiedUrlAction runat="server" />
				                        </SuccessActions>
				                        <FormTemplate>
				                            <CSControl:ResourceLinkButton runat="server" id="DeleteButton" ResourceName="Delete" OnClientClick="return confirm('Are you sure you want to remove this API key?  This action cannot be undone.');" CausesValidation="false" />
				                        </FormTemplate>
				                    </CSControl:DeleteApiKeyForm>
								</td>
			                </tr>
	                </ItemTemplate>
	                <FooterTemplate>
			                </tbody>
		                </table>
	                </FooterTemplate>
	                <NoneTemplate>
			                <div class="CommonWarning">
				                <CSControl:ResourceControl runat="server" ResourceName="ApiKeys_None" />
			                </div>
	                </NoneTemplate>
                </CSControl:ApiKeyList>
			</div>
        </div>
    </div>

</asp:Content>