<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="true" ResourceName="ChangePassword_Title" />  

<div style="width: 50%; margin: 100px auto;">
    <div class="CommonContentBox">
        <h2 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="ChangeYourPassword" /></h4>
	    <div class="CommonContentBoxContent">
	        <CSControl:ChangePasswordForm runat="server" CurrentPasswordTextBoxId="Password" NewPasswordTextBoxId="NewPassword1" ChangePasswordButtonId="ChangePasswordButton" ChangePasswordCustomValidatorId="ChangePasswordCustomValidator">
	            <SuccessActions>
	                <CSControl:GoToReferralUrlAction runat="server" />
	                <CSControl:GoToSiteUrlAction runat="server" UrlName="user_EditProfile_Clean" />
	            </SuccessActions>
	            <FormTemplate>
		            <div class="CommonFormArea">
		            <div class="CommonFormDescription">
			            <CSControl:ResourceControl runat="server" ResourceName="ChangePassword_Instructions" />
		            </div>
		            <table cellpadding="3" cellspacing="0" border="0" width="100%">            
		                <tr>
		                    <td align="right" class="CommonFormField" colspan="2">
					            <div>
						            <asp:CustomValidator id="ChangePasswordCustomValidator" runat="server" Width="100%" CssClass="validationWarning" />
					            </div>
				            </td>
			            </tr>
			            <CSControl:PlaceHolder runat="server">
			                <DisplayConditions>
			                    <CSControl:ControlVisibilityCondition runat="server" ControlId="Password" ControlVisiblilityEquals="true" />
			                </DisplayConditions>
			                <ContentTemplate>
			                    <tr>
				                    <td align="left" class="CommonFormFieldName" nowrap="nowrap">
					                    <CSControl:ResourceControl runat="server" ResourceName="ChangePassword_CurrentPassword" />
				                    </td>
				                    <td align="left" class="CommonFormField" nowrap="nowrap">
					                    <asp:TextBox TextMode="Password" runat="server" id="Password" Columns="30" MaxLength="64"/>
					                    <asp:RequiredFieldValidator id="ValidatePassword" runat="server" ControlToValidate="Password" Display=Dynamic Cssclass="validationWarning">*</asp:RequiredFieldValidator>
				                    </td>
			                    </tr>
			                </ContentTemplate>
			            </CSControl:PlaceHolder>
			            <tr>
				            <td align="left" nowrap="nowrap" class="CommonFormFieldName">
					            <CSControl:ResourceControl runat="server" ResourceName="ChangePassword_NewPassword" />
				            </td>
				            <td align="left" class="CommonFormField" nowrap="nowrap">
					            <asp:TextBox TextMode="Password" runat="server" id="NewPassword1" Columns="30" MaxLength="64"/>
					            <asp:RequiredFieldValidator id="ValidatePassword1" runat="server" ControlToValidate="NewPassword1" Display=Dynamic Cssclass="validationWarning">*</asp:RequiredFieldValidator>
				            </td>
			            </tr>        
			            <tr>
				            <td align="left" nowrap="nowrap" class="CommonFormFieldName">
					            <CSControl:ResourceControl runat="server" ResourceName="ChangePassword_ReEnterNewPassword" />
				            </td>
				            <td align="left" class="CommonFormField" nowrap="nowrap">
					            <asp:TextBox TextMode="Password" runat="server" id="NewPassword2" Columns="30" MaxLength="64"/>
					            <asp:RequiredFieldValidator id="ValidatePassword2" runat="server" ControlToValidate="NewPassword2" Display=Dynamic Cssclass="validationWarning">*</asp:RequiredFieldValidator>                 
					            <asp:CompareValidator id="ComparePassword" runat="server" ControlToValidate="NewPassword2" ControlToCompare="NewPassword1" Display=Dynamic Cssclass="validationWarning">*</asp:CompareValidator>
				            </td>        
			            </tr>
			            <tr>
				            <td class="CommonFormFieldName" colspan="2">
					            <CSControl:ResourceButton id="ChangePasswordButton" runat="server" ResourceName="ChangePassword_ChangePassword" />
				            </td>
			            </tr>            
		            </table>
		            </div>
                </FormTemplate>
            </CSControl:ChangePasswordForm>
	    </div>
    </div>	
</div>

</asp:Content>