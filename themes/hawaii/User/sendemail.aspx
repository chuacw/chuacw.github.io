<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="false" ResourceName="SendEmail_Title" />

<div class="CommonContentArea">
	<div class="CommonContent">
		<CSControl:SendEmailForm runat="server" MessageEditorId="Message" SubjectTextBoxId="Subject" SubmitButtonId="SendButton">
            <SuccessActions>
                <CSControl:ExecuteScriptAction runat="server" Script="window.parent.Telligent_Modal.Close();" />
            </SuccessActions>
            <FormTemplate>
		        <div class="CommonFormArea">
		        <table width="100%" cellpadding="0" cellspacing="0" border="0">
			        <tr>
				        <td class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="SendEmail_From" /></td>
				        <td class="CommonFormField"><CSControl:UserData UseAccessingUser="true" Property="DisplayName" runat="server" /> (<CSControl:UserData UseAccessingUser="true" Property="Email" runat="server" />)</td>
			        </tr>
			        <tr>
				        <td class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="SendEmail_To" id="rc_send_to" /></td>
				        <td class="CommonFormField"><CSControl:UserData Property="DisplayName" runat="server" /></td>
			        </tr>
			        <tr>
				        <td class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="SendEmail_Subject" id="rc_send_subject" /></td>
				        <td class="CommonFormField"><asp:textbox autocomplete="off" id="Subject" runat="server" columns="60" /><asp:requiredfieldvalidator id="SubjectValidator" runat="server" Cssclass="CommonValidationWarning" ControlToValidate="Subject" >*</asp:requiredfieldvalidator></td>
			        </tr>
			        <tr>
				        <td colspan="2" class="CommonFormField">
					        <CSControl:Editor runat="Server" id="Message" Width="500" Height="180" />
				        </td>
			        </tr>
			        <tr>
				        <td colspan="2" class="CommonFormField">
					        <CSControl:ResourceButton id="SendButton" Runat="server" ResourceName="SendEmail_Send" />
				        </td>
			        </tr>
		        </table>
		        </div>
            </FormTemplate>
        </CSControl:SendEmailForm>
    </div>
</div>
</asp:Content>