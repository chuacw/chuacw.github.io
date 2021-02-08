<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
<script type="text/javascript">
// <![CDATA[
function ProcessContent(content)
{
    if (window.parent.ContentSelectorCallbackFunction)
        window.parent.ContentSelectorCallbackFunction(content);

    window.parent.Telligent_Modal.Close();		
}

function IsValid()
{
    var urlField = document.getElementById('<%= CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "Url").ClientID %>');
    var errorMessage = document.getElementById('UrlError');
    var valid = true;
    
    if(urlField && urlField.value.length < 1)
        valid = false;
    
    if (!valid && errorMessage)
    {
        errorMessage.style.visibility = "visible";
        errorMessage.style.position = "relative";
    }
    else if (errorMessage)
    {
        errorMessage.style.visibility = "hidden";
        errorMessage.style.position = "absolute";
    }
    
    return true;
}
// ]]>
</script>

<CSControl:Title runat="server" IncludeSiteName="false" Text="Create a Link" />

<div class="CommonContentArea">
    <div class="CommonContent">
        <CSWiki:InsertPageLinkForm runat="server"
             LinkNameTextBoxId="LinkName"
             UrlPageTextBoxId="Url"
             SelectButtonId="Insert"
             LinkInsertedClientFunction="ProcessContent"
        >
            <FormTemplate>
                    <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="Wikis_PageLink_LinkText" />:</div>
                    <div class="CommonFormField"><asp:TextBox ID="LinkName" Columns="30" runat="server" /></div>

                    <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="Wikis_PageLink_PageText" /></div>
                    <div class="CommonFormField">
                        <CSControl:ResourceControl runat="server" ResourceName="Wikis_PageLink_PageText_Desc" />
                        <br />
                        <div style="padding-top: 3px;">
                            <asp:TextBox ID="Url" Columns="30" runat="server" />
                        </div>
                        <div id="UrlError" class="CommonValidationWarning" style="visibility: hidden; position:absolute;">
                            <CSControl:ResourceControl runat="server" ResourceName="Wikis_PageLink_Error" />    
                        </div>
                    </div>
                 <p />
                
                <div class="CommonFormFieldName">
                    <CSControl:ResourceButton runat="server" ResourceName="Wikis_PageLink_CreateLink" ID="Insert" />
                    <CSControl:ResourceButton runat="server" ResourceName="Cancel" OnClientClick="window.parent.Telligent_Modal.Close(); return false;" />
                </div>
            </FormTemplate>
        </CSWiki:InsertPageLinkForm>
    </div>
</div>
<script type="text/javascript">
// <![CDATA[
var ed = window.parent.tinyMCE_CommunityServerOptions._currentEditor;
var urlInput = document.getElementById('<%= CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "Url").ClientID %>');
var titleInput = document.getElementById('<%= CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "LinkName").ClientID %>');
var sel = ed.selection.getNode();
var content = window.parent.tinyMCE_CommunityServerOptions._currentEditor.selection.getContent({ format: 'text' });

if(sel.nodeName == "A" && urlInput)
{
    urlInput.value = ed.dom.getAttrib(sel, 'href', '');
    if (titleInput)
        titleInput.value = ed.dom.get(sel).innerHTML;
}
else if (urlInput)
{
    urlInput.value = content;
        
    if (titleInput)
        titleInput.value = content;
}
else if (titleInput)
    titleInput.value = content;
// ]]>
</script>
</asp:Content>