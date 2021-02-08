<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" ResourceName="MediaGalleries_Title_UploadFile" ResourceFile="MediaGallery.xml" />

<div class="CommonContentArea">
	<div class="CommonContent">
	
	    <CSMedia:UploadPostAttachmentForm id="AttachmentForm" runat="server" 
	        ErrorTextId="Error" 
	        FileHtmlInputFileId="File" 
	        LinkToUrlRadioButtonId="LinkToUrl" 
	        UploadFileRadioButtonId="UploadFile" 
	        SaveButtonId="Save" 
	        UrlTextBoxId="Url"
	        ControlIdsToHideWhenLocalAttachmentsNotAllowed="LocalLinkArea"
	        ControlIdsToHideWhenRemoteAttachmentsNotAllowed="RemoteLinkArea"
	        >
	        <FormTemplate>
    	        <div class="CommonFormArea">
    	        
    	        <CSControl:WrappedLiteral runat="server" ID="Error" Tag="Div" CssClass="CommonValidationWarning" />
        				
		        <table width="100%" cellpadding="0" cellspacing="0" border="0">
			        <tr>
				        <td class="CommonFormDescription" colspan="3">
					        <CSControl:ValueSelectedContent runat="server">
					            <ValueTemplate><CSControl:ControlData runat="server" ControlId="AttachmentForm" Property="AllowLocalAttachment" /><CSControl:ControlData runat="server" ControlId="AttachmentForm" Property="AllowRemoteAttachment" /></ValueTemplate>
					            <Content>
					                <CSControl:ValueContent Value="TrueTrue" runat="server"><CSControl:ResourceControl runat="server" ResourceName="UploadAttachment_Description" /></CSControl:ValueContent>
					                <CSControl:ValueContent Value="TrueFalse" runat="server"><CSControl:ResourceControl runat="server" ResourceName="UploadAttachment_Description_FileOnly" /></CSControl:ValueContent>
					                <CSControl:ValueContent Value="FalseTrue" runat="server"><CSControl:ResourceControl runat="server" ResourceName="UploadAttachment_Description_UrlOnly" /></CSControl:ValueContent>
					                <CSControl:DefaultContent runat="server"><CSControl:ResourceControl runat="server" ResourceName="UploadAttachment_Description_NoAccess" /></CSControl:DefaultContent>
					            </Content>
					        </CSControl:ValueSelectedContent>
				        </td>
			        </tr>
			        <tr id="LocalLinkArea" runat="server">
		                <td class="CommonFormField">
			                <asp:RadioButton ID="UploadFile" runat="server" GroupName="UploadOption" Checked="True" />
		                </td>
		                <td>
		                    <div class="CommonFormFieldName">
			                    <CSControl:ResourceControl ResourceName="UploadAttachment_File" runat="server" />
			                </div>
			                <div class="CommonFormFieldDescription">
				                <CSControl:ResourceControl ResourceName="UploadAttachment_File_Description" runat="server" />				
			                </div>
		                </td>
		                <td class="CommonFormField"><input id="File" type="file" runat="server" /></td>
	                </tr>
	                <tr id="RemoteLinkArea" runat="server">
		                <td class="CommonFormField">
			                <asp:RadioButton ID="LinkToUrl" Runat="server" GroupName="UploadOption" />
		                </td>
		                <td>
		                    <div class="CommonFormFieldName">
			                    <CSControl:ResourceControl ResourceName="UploadAttachment_Url" runat="server" />
			                </div>
			                <div class="CommonFormFieldDescription">
				                <CSControl:ResourceControl ResourceName="UploadAttachment_Url_Description" runat="server" />
			                </div>
		                </td>
		                <td class="CommonFormField"><asp:TextBox ID="Url" Runat="server" Columns="40" /></td>
	                </tr>
			        <tr>
				        <td colspan="3" class="CommonFormFieldName">
					        <CSControl:ResourceButton id="Save" Runat="server" ResourceName="Save" />
				        </td>
			        </tr>
		        </table>
		        </div>
            </FormTemplate>
	    </CSMedia:UploadPostAttachmentForm>
	</div>
</div>

<script type="text/javascript">
// <![CDATA[
function enableFileUpload()
{
	var e = document.getElementById('<%= CSControlUtility.Instance().FindControl(this, "File").ClientID %>');
	if (e) { e.disabled = false; }
	e = document.getElementById('<%= CSControlUtility.Instance().FindControl(this, "Url").ClientID %>');
	if (e) { e.disabled = true; }
}

function enableLinkToUrl()
{
	var e = document.getElementById('<%= CSControlUtility.Instance().FindControl(this, "File").ClientID %>');
	if (e) { e.disabled = true; }
	e = document.getElementById('<%= CSControlUtility.Instance().FindControl(this, "Url").ClientID %>');
	if (e) { e.disabled = false; }
}

var e = document.getElementById('<%= CSControlUtility.Instance().FindControl(this, "UploadFile").ClientID %>');
if (e) { e.onclick = enableFileUpload; }
if (e && e.checked)
	enableFileUpload();

e = document.getElementById('<%= CSControlUtility.Instance().FindControl(this, "LinkToUrl").ClientID %>')
if (e) { e.onclick = enableLinkToUrl; }
if (e && e.checked)
	enableLinkToUrl();

// ]]>
</script>

</asp:Content>
