<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="false" ResourceName="TagSelector_Title" />

<div class="CommonContentArea">
<div class="CommonContent">

<CSControl:SelectTagsForm runat="server" SelectButtonId="OK" TagListPlaceHolderId="CheckboxListContainer">
    <FormTemplate>
        <div class="CommonDescription">
	        <CSControl:ResourceControl ResourceName="TagSelector_Instructions" runat="server" />
        </div>

        <p />
        <asp:PlaceHolder Runat="server" ID="CheckboxListContainer" />
        <p />

        <div class="CommonContentSelectorButtonArea">
	        <CSControl:ResourceButton ID="OK" Runat="server" ResourceName="OK" />
	        <CSControl:ResourceButton ID="CancelButton" Runat="server" ResourceName="Cancel" OnClientClick="window.parent.Telligent_Modal.Close(); return false;" />
        </div>
    </FormTemplate>
</CSControl:SelectTagsForm>

</div>
</div>
        
</asp:Content>