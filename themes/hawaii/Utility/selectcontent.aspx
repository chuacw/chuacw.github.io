<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="false" ResourceName="ContentSelector_Title" />

<script type="text/javascript">
// <![CDATA[

function ProcessContent(content)
{
	if (window.parent.ContentSelectorCallbackFunction)
		window.parent.ContentSelectorCallbackFunction(content);

	window.parent.Telligent_Modal.Close();		
}

// ]]>
</script>

<div class="CommonContentArea">
<div class="CommonContent">
<CSControl:SelectContentForm runat="server" 
    TabSetId="TabSet"
    ItemsAreaHtmlGenericControlId="ItemsArea" 
    NavigationTreeId="Tree" 
    OptionsAreaHtmlGenericControlId="OptionsArea" 
    SelectButtonId="SelectButton"
    ItemCssClass="CommonContentSelectorItem" 
	SelectedItemCssClass="CommonContentSelectorItemSelected" 
	ContentSelectedClientFunction="ProcessContent"
	ItemNameCssClass="CommonContentSelectorItemName"
	SelectedItemNameCssClass="CommonContentSelectorItemNameSelected"
	ItemAreaCssClass="CommonContentSelectorItemArea"
	ErrorMessageTextId="ErrorMessage"
	SuccessMessageTextId="SuccessMessage"
	>
    <FormTemplate>
        <CSControl:WrappedLiteral Tag="Div" CssClass="CommonMessageSuccess" ID="SuccessMessage" runat="server" />
        <CSControl:WrappedLiteral Tag="Div" CssClass="CommonMessageError" ID="ErrorMessage" runat="server" />
    
        <TWC:TabSet runat="server" id="TabSet"
			CssClass="CommonPaneTabSet"
			TabCssClasses="CommonPaneTab"
			TabSelectedCssClasses="CommonPaneTabSelected"
			TabHoverCssClasses="CommonPaneTabHover">
		</TWC:TabSet>
		<div class="CommonPane">
		    <table cellpadding="0" cellspacing="0" border="0" width="100%">
		        <tr valign="top"><td width="33%"><div class="CommonContentSelectorTreeArea" id="treeArea">
			        <TWC:Tree id="Tree" Width="100%" Height="100%" runat="server"  />
		        </div></td>
		        <td width="60%">
		            <div class="CommonContentSelectorItemsArea" id="itemsArea"><div runat="server" ID="ItemsArea"></div></div>
		            <div class="CommonContentSelectorOptionsArea" id="optionsArea"><div runat="server" id="OptionsArea"></div></div>
		        </td></tr></table>        
        </div>
        <div class="CommonContentSelectorButtonArea">
	        <CSControl:ResourceButton ID="SelectButton" Runat="server" ResourceName="OK" />
	        <CSControl:ResourceButton Runat="server" ResourceName="Cancel" OnClientClick="window.parent.Telligent_Modal.Close(); return false;" />
        </div>
    </FormTemplate>
</CSControl:SelectContentForm>
</div>
</div>

<script type="text/javascript">
// <![CDATA[

function resizeContent()
{
    try
    {
        var optionsArea = document.getElementById('optionsArea');
        var itemsArea = document.getElementById('itemsArea');
        var treeArea = document.getElementById('treeArea');

        if (optionsArea.childNodes[0].innerHTML == '')
        {
            optionsArea.style.display = 'none';
            itemsArea.style.height = '322px';
        }
        else
        {
            optionsArea.style.display = 'block';
            itemsArea.style.height = (316 - optionsArea.offsetHeight) + 'px';
        }
        
        <%= CSControlUtility.Instance().FindControl(this, "Tree").ClientID %>.Resize(treeArea.offsetWidth - 4, treeArea.offsetHeight - 4);
    }
    catch (e) {}
}

setInterval(resizeContent, 249);

// ]]>
</script>
        
</asp:Content>