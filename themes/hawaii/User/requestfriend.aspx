<%@ Page EnableViewState="true" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="false" ResourceName="FriendRequest_Title" />

<div class="CommonContentArea">
	<div class="CommonContent">
		<CSControl:RequestFriendshipForm runat="server" MessageEditorId="Message" SubmitButtonId="SendButton">
            <SuccessActions>
                <CSControl:RefreshPageAction runat="server" WindowNameScript="window.parent" />
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
				        <td colspan="2" class="CommonFormField">
				            <CSControl:Editor runat="Server" id="Message" Width="500" Height="180" />
				        </td>
			        </tr>
			        <tr>
				        <td colspan="2" class="CommonFormField">
					        <CSControl:ResourceButton id="SendButton" Runat="server" ResourceName="FriendRequest_Send" />
				        </td>
			        </tr>
		        </table>
		        </div>
            </FormTemplate>
        </CSControl:RequestFriendshipForm>
    </div>
</div>
</asp:Content>