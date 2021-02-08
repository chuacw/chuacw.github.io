<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:ConditionalAction runat="server">
        <Actions>
            <CSControl:GoToMessageAction runat="server" />
        </Actions>
        <Conditions Operator="not">
            <CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="EnableConversations" Operator="issetortrue" />
        </Conditions>
    </CSControl:ConditionalAction>
    
<CSControl:ConditionalAction runat="server">
    <Conditions><CSMessage:ConversationPropertyValueComparison runat="server" ComparisonProperty="ID" Operator="IsSetOrTrue" /></Conditions>
    <Actions><CSControl:SetControlPropertyAction runat="server" ControlId="SaveButton" Property="ResourceName" Value="ReplyMessage_Button" /></Actions>
</CSControl:ConditionalAction>

<CSControl:Title runat="server" IncludeSiteName="false">
    <ContentTemplate>
        <CSControl:ConditionalContent runat="server">
            <ContentConditions><CSMessage:ConversationPropertyValueComparison runat="server" ComparisonProperty="ID" Operator="IsSetOrTrue" /></ContentConditions>
            <TrueContentTemplate><CSControl:ResourceControl ResourceName="ReplyToConversation_Title" runat="server" /></TrueContentTemplate>
            <FalseContentTemplate><CSControl:ResourceControl ResourceName="CreateConversation_Title" runat="server" /></FalseContentTemplate>
        </CSControl:ConditionalContent>
    </ContentTemplate>
</CSControl:Title>

<div class="CommonContentArea">
	<div class="CommonContent">
	    <CSMessage:CreateEditConversationForm runat="server"
	         MessageBodyEditorId="Message"
	         MessageRecipientsUserLookUpTextBoxId="MessageRecipients"
	         MessageSubjectTextBoxId="MessageSubject"
	         SubmitButtonId="SaveButton"
	         id="CreateConversationForm"
	         ValidationGroup="messageValidationGroup"
	    >
	        <SuccessActions>
	            <CSControl:SetVisibilityAction runat="server" ControlIdsToHide="Message" />
                <CSControl:RefreshPageAction runat="server" WindowNameScript="window.parent" />
            </SuccessActions>
            <FormTemplate>
                <div class="CommonFormArea">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
		            <tr>
			            <td class="CommonFormFieldName" style="vertical-align: top;"><CSControl:ResourceControl runat="server" ResourceName="Recipients" />: </td>
			            <td class="CommonFormField">
			                <CSControl:UserLookUpTextBox ID="MessageRecipients" Width="300px" LookUpType="AccessingUserFriendsCanStartConversation" runat="server" />
			                <asp:requiredfieldvalidator runat="server" Cssclass="CommonValidationWarning" ID="RecipientsValidation" ValidationGroup="messageValidationGroup" ControlToValidate="MessageRecipients" >*</asp:requiredfieldvalidator>
			            </td>
		            </tr>
		            <tr>
			            <td class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="Subject" />: </td>
			            <td class="CommonFormField">
			                <asp:TextBox runat="server" ID="MessageSubject" autocomplete="off" columns="60" />
			                <asp:requiredfieldvalidator runat="server" Cssclass="CommonValidationWarning" ControlToValidate="MessageSubject" ValidationGroup="messageValidationGroup">*</asp:requiredfieldvalidator>
			            </td>
		            </tr>
		            <tr>
			            <td class="CommonFormField" colspan="2">
			                <asp:requiredfieldvalidator ValidationGroup="messageValidationGroup" runat="server" CssClass="CommonValidationWarning" ControlToValidate="Message" EnableClientScript="False">*</asp:requiredfieldvalidator>
			                <CSControl:Editor runat="Server" id="Message" Width="500" Height="180" />
			            </td>
		            </tr>
		            <tr>
				        <td colspan="2" class="CommonFormField">
					        <CSControl:ResourceButton id="SaveButton" Runat="server" ResourceName="CreateConversation_Button" />
				        </td>
			        </tr>
		        </table>
		        </div>
			</FormTemplate>
	    </CSMessage:CreateEditConversationForm>	   
    </div>
</div>
</asp:Content>