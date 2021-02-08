<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="true">
    <ContentTemplate><CSControl:ContentData runat="server" Property="Name"><LeaderTemplate><CSControl:ResourceControl ResourceName="Editing" runat="server" /> </LeaderTemplate></CSControl:ContentData></ContentTemplate>
</CSControl:Title>

<div class="CommonContentArea">
	<div class="CommonContent">
	    <CSControl:CreateEditContentForm runat="server" 
	        BodyEditorId="content" 
	        TitleTextBoxId="headline" 
	        NameTextBoxId="name" 
	        SaveButtonId="SaveButton" 
	        DeleteButtonId="DeleteButton"
	        >
	        <SaveSuccessActions>
	            <CSControl:GoToCurrentContentAction runat="server" />
	        </SaveSuccessActions>
	        <DeleteSuccessActions>
	            <CSControl:GoToSiteUrlAction runat="server" UrlName="home" />
	        </DeleteSuccessActions>
	        <FormTemplate>
		        <div class="CommonFormArea">
		        <table width="100%" cellpadding="0" cellspacing="0" border="0">
			        <tr>
				        <td class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="Content_Name" /></td>
				        <td class="CommonFormField">
				            <asp:textbox id="name" runat="server" columns="60" />
				            <asp:requiredfieldvalidator id="NameValidator" runat="server" Cssclass="CommonValidationWarning" ControlToValidate="name" >*</asp:requiredfieldvalidator>
				        </td>
			        </tr>
			        <tr>
				        <td class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="Content_Headline" /></td>
				        <td class="CommonFormField">
				            <asp:textbox id="headline" runat="server" columns="60" />
				        </td>
			        </tr>
			        <tr>
				        <td colspan="2" class="CommonFormField">
					        <CSControl:Editor runat="server" id="content" Width="610" Height="400" />
				        </td>
			        </tr>
			        <tr>
				        <td colspan="2" class="CommonFormField">
					        <CSControl:ResourceButton id="SaveButton" Runat="server" ResourceName="Content_Save" />
					        <CSControl:ResourceButton id="DeleteButton" Runat="server" ResourceName="Content_Delete" />
				        </td>
			        </tr>
		        </table>
		        </div>
            </FormTemplate>
        </CSControl:CreateEditContentForm>
    </div>
</div>
</asp:Content>
