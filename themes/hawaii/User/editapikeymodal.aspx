<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<script type="text/javascript" language="javascript">
    function CloseModal()
    {
        window.parent.location = window.parent.location;
        window.parent.Telligent_Modal.Close();
    }
</script>
     
<div>
    <CSControl:EditApiKeyForm runat="server" NameTextBoxId="ApiKeyName" IsEnabledCheckBoxId="IsEnabled" SaveButtonId="SaveApiKey">
        <SuccessActions>
            <CSControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
        </SuccessActions>
        <FormTemplate>
            <CSControl:ResourceControl runat="server" ResourceName="Name" />:  
            <asp:RequiredFieldValidator runat="server" ControlToValidate="ApiKeyName" ErrorMessage="*" Display="static" />
            <CSControl:DefaultButtonTextBox runat="server" ID="ApiKeyName" ButtonId="SaveApiKey" />
            <br />
            Enabled: 
            <CSControl:YesNoCheckBox runat="server" ID="IsEnabled" />
            <p />
            <CSControl:ResourceButton runat="server" ID="SaveApiKey" ResourceName="Save" />
        </FormTemplate>
    </CSControl:EditApiKeyForm>
</div>

</asp:Content>