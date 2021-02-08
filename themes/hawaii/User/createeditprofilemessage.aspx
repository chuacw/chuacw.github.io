<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="false">
    <ContentTemplate>
        <CSControl:ConditionalContent runat="server">
            <ContentConditions><CSMessage:ProfileMessagePropertyValueComparison runat="server" ComparisonProperty="ID" Operator="IsSetOrTrue" /></ContentConditions>
            <TrueContentTemplate><CSControl:ResourceControl ResourceName="EditMessage_Title" runat="server" /></TrueContentTemplate>
            <FalseContentTemplate>
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:CurrentUserIsAccessingUserCondition runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ResourceControl ResourceName="CreateAnnouncement_Title" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ResourceControl ResourceName="CreateMessage_Title" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent>
            </FalseContentTemplate>
        </CSControl:ConditionalContent>
    </ContentTemplate>
</CSControl:Title>

<div class="CommonContentArea">
	<div class="CommonContent">
	    <CSMessage:CreateEditProfileMessageForm runat="server" 
	            MessageBodyEditorId="Message"
	            MessageSubjectTextBoxId="MessageSubject"
	            SubmitButtonId="CreateButton" 
	            ValidationGroup="messageValidationGroup">
	        <SuccessActions>
                <CSControl:RefreshPageAction runat="server" WindowNameScript="window.parent" />
            </SuccessActions>
            <FormTemplate>
                <div class="CommonFormArea">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
		            <tr>
			            <td class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Inline7" /> </td>
			            <td class="CommonFormField">
			                <asp:TextBox runat="server" ID="MessageSubject" autocomplete="off" columns="60" />
			                <asp:requiredfieldvalidator runat="server" ValidationGroup="messageValidationGroup" Cssclass="CommonValidationWarning" ControlToValidate="MessageSubject" >*</asp:requiredfieldvalidator>
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
					        <CSControl:ResourceButton id="CreateButton" Runat="server" ResourceName="CreateMessage_Button" />
				        </td>
			        </tr>
		        </table>
		        </div>
			</FormTemplate>         
	    </CSMessage:CreateEditProfileMessageForm>
    </div>
</div>
</asp:Content>