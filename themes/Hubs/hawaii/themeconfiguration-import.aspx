<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/hawaii/Common/modal.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:Title runat="server" IncludeSiteName="true" Text="Import" />

    <CSHub:ImportHubThemeConfigurationForm runat="server" FileHtmlInputFileId="File" SubmitButtonId="Submit">
        <FormTemplate>
            <div class="CommonFormDescription">
                Browse for the XML file containing your theme configuration information and click 'Import'. Note that the imported values will be saved immediately. 
            </div>
            <table cellspacing="0" border="0" cellpadding="0">
                <tr>
                    <td class="CommonFormFieldName">
                        <CSControl:ResourceControl runat="server" ResourceName="Hubs_Import" />
                    </td>
                    <td class="CommonFormField">
                        <input type="file" id="File" runat="server" />
                    </td>
                </tr>
            </table>
            <p />
            <div class="CommonFormFieldName">
                <asp:Button ID="Submit" Text="Import" runat="server" />
            </div>
        </FormTemplate>
    </CSHub:ImportHubThemeConfigurationForm>    

</asp:Content>

