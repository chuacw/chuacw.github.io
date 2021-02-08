<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="false">
    <ContentTemplate><CSControl:ContentData runat="server" Property="Name"><LeaderTemplate><CSControl:ResourceControl ResourceName="Editing" runat="server" /> </LeaderTemplate></CSControl:ContentData></ContentTemplate>
</CSControl:Title>

<div class="CommonContentArea">
	<div class="CommonContent">
	    <CSControl:CreateEditContentForm runat="server" 
	        BodyEditorId="content" 
	        TitleTextBoxId="" 
	        NameTextBoxId="" 
	        SaveButtonId="SaveButton" 
	        DeleteButtonId="DeleteButton"
	        >
	        <SaveSuccessActions>
	            <CSControl:ExecuteScriptAction runat="server" Script="window.parent.Telligent_Modal.Close(true);" />
	        </SaveSuccessActions>
	        <DeleteSuccessActions>
                <CSControl:ExecuteScriptAction runat="server" Script="window.parent.Telligent_Modal.Close(true);" />	        
	        </DeleteSuccessActions>
	        <FormTemplate>
		        <div class="CommonFormArea">
		        <table width="100%" cellpadding="0" cellspacing="0" border="0">
			        <tr>
				        <td colspan="2" class="CommonFormField">
					        <CSControl:Editor runat="server" id="content" Width="610" Height="400">
					            <EditorOptions runat="server">
					                <CSControl:EditorOption runat="server" Name="theme_advanced_resize_horizontal" Value="true" />
					            </EditorOptions>
					        </CSControl:Editor>
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
