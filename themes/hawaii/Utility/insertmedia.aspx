<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="false" ResourceName="InsertMedia_Title" />

<script type="text/javascript">
// <![CDATA[

function ProcessContent(content)
{
	if (window.parent.ContentSelectorCallbackFunction)
		window.parent.ContentSelectorCallbackFunction(content);

	window.parent.Telligent_Modal.Close();		
}

function CloseModal()
{
    window.parent.location = window.parent.location;
    window.parent.Telligent_Modal.Close();
}

function IsValid()
{
    var urlInput = document.getElementById('<%= CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "Url").ClientID %>');
    var errorMessage = document.getElementById('UrlError');
    var valid = urlInput && urlInput.value.length > 0;
    
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
    
    return valid;
}

function Toggle(elementId)
{
    var elementToToggle = document.getElementById(elementId);
    if (elementToToggle)
    {
        if (elementToToggle.style.visibility == "hidden")
        {
            elementToToggle.style.visibility = "visible";
            elementToToggle.style.position = "relative";
        }
        else
        {
            elementToToggle.style.visibility = "hidden";
            elementToToggle.style.position = "absolute";
        }
    }
}

// ]]>
</script>

<CSControl:ConditionalAction runat="server">
    <Conditions Operator="Not">
        <CSControl:ApplicationPropertyValueComparison runat="server" ComparisonProperty="ApplicationType" ComparisonValue="Weblog" Operator="EqualTo" />
    </Conditions>
    <Actions>
        <CSControl:SetControlPropertyAction runat="server" ControlId="UploadTab" Property="Visible" Value="false" />
    </Actions>
</CSControl:ConditionalAction>

<CSControl:ConditionalAction runat="server">
    <Conditions>
        <CSControl:ControlVisibilityCondition runat="server" ControlId="FileUpload" ControlVisiblilityEquals="false" />
    </Conditions>
    <Actions>
        <CSControl:SetControlPropertyAction runat="server" ControlId="UploadTab" Property="Visible" Value="false" />
    </Actions>
</CSControl:ConditionalAction>

<div class="CommonContentArea">
    <div class="CommonContent">
        <TWC:TabbedPanes id="MediaTabs" runat="server"
        PanesCssClass="CommonPane"
        TabSetCssClass="CommonPaneTabSet"
        TabCssClasses="CommonPaneTab"
        TabSelectedCssClasses="CommonPaneTabSelected"
        TabHoverCssClasses="CommonPaneTabHover"
        >
            <TWC:TabbedPane runat="server" ID="UploadTab">
                <Tab><CSControl:ResourceControl runat="server" ResourceName="InsertMedia_FromComputer" /></Tab>
                <Content>
                    <CSControl:InsertMediaForm runat="server" 
                    WidthTextBoxId="UploadWidth" 
                    HeightTextBoxId="UploadHeight" 
                    SelectButtonId="Insert"
                    FileHtmlInputFileId="FileUpload"
                    MessageTextId="UploadMessage"
                    MediaInsertedClientFunction="ProcessContent"
	                >
                        <FormTemplate>
                            <CSControl:WrappedLiteral runat="server" ID="UploadMessage" CssClass="CommonMessageError" Tag="Div" />
                            <div class="CommonFormFieldName">
                                <CSControl:ResourceControl runat="server" ResourceName="InsertMedia_UploadMedia" />
                            </div>
                            <CSControl:ResourceControl runat="server" ResourceName="InsertMedia_UploadMedia_Desc" />
                            <div class="CommonFormField">
                                <input type="file" runat="server" id="FileUpload" size="40" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="FileUpload" ErrorMessage="<br/>Click browse to select an file from your computer." ValidationGroup="UploadGroup" />
                            </div>
                            <hr />
                            <div id="UploadOptions">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
		                        <tr valign="top">
		                            <td width="20%">
                                        <div class="CommonFormFieldName">
                                            <CSControl:ResourceControl runat="server" ResourceName="Maxwidth" />
                                        </div>
                                        <div class="CommonFormField">
                                            <asp:TextBox ID="UploadWidth" Columns="4" runat="server" />
                                        </div>
                                    </td>
		                            <td>
                                        <div class="CommonFormFieldName">
                                            <CSControl:ResourceControl runat="server" ResourceName="Maxheight" />
                                        </div>
                                        <div class="CommonFormField">
                                            <asp:TextBox ID="UploadHeight" Columns="4" runat="server" />
                                        </div>
                                    </td>
                                </tr>
                                </table>
                            </div>
                            <hr />
                            <div class="CommonFormFieldName">
                                <CSControl:ResourceButton runat="server" ResourceName="InsertMedia_UploadMedia_Button" ID="Insert"  />
                                <CSControl:ResourceButton runat="server" ResourceName="Cancel" OnClientClick="window.parent.Telligent_Modal.Close(); return false;" />
                            </div>
                        </FormTemplate>
                    </CSControl:InsertMediaForm>
                </Content>
            </TWC:TabbedPane>
            <TWC:TabbedPane runat="server">
                <Tab runat="server" ID="SelectTab"><CSControl:ResourceControl runat="server" ResourceName="InsertMedia_FromSite" /></Tab>
                <Content>
                    <div class="CommonFormFieldName">
                        <CSControl:ResourceControl runat="server" ResourceName="InsertMedia_SelectMedia" />
                    </div>
                    <CSControl:ResourceControl runat="server" ResourceName="InsertMedia_SelectMedia_Desc" />
                    <CSControl:SelectMediaForm runat="server"
                    ItemsAreaHtmlGenericControlId="ItemsArea"
                    ItemCategoryAreaHtmlGenericControlId="CategoryArea"
                    SelectButtonId="SelectButton"
                    ItemCssClass="CommonContentSelectorItem" 
	                SelectedItemCssClass="CommonContentSelectorItemSelected" 
	                ContentUrlSelectedClientFunction="ProcessContent"
	                ContentSelectedClientFunction="ProcessContent"
	                ItemNameCssClass="CommonContentSelectorItemName"
	                SelectedItemNameCssClass="CommonContentSelectorItemNameSelected"
	                ItemAreaCssClass="CommonContentSelectorItemArea"
	                ErrorMessageTextId="ErrorMessage"
	                SuccessMessageTextId="SuccessMessage"
	                WidthTextBoxId="SelectWidth"
	                HeightTextBoxId="SelectHeight"
	                ListCssClass="CommonListItemList"
	                ChildListCssClass="CommonSubListItemList"
	                >
                    <FormTemplate>
                        <CSControl:WrappedLiteral Tag="Div" CssClass="CommonMessageSuccess" ID="SuccessMessage" runat="server" />
                        <CSControl:WrappedLiteral Tag="Div" CssClass="CommonMessageError" ID="ErrorMessage" runat="server" />
		                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
		                        <tr valign="top"><td width="40%"><div class="CommonContentSelectorTreeArea" id="treeArea">
			                       <div runat="server" ID="CategoryArea" style="padding:0px;margin:0px;">
		                        </div></td>
		                        <td width="60%">
		                            <div class="CommonContentSelectorItemsArea" id="itemsArea"><div runat="server" ID="ItemsArea"></div></div>
		                        </td>
		                        </tr>
		                    </table>
		                    <hr />
                            <div id="SelectOptions">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
		                        <tr valign="top">
		                            <td width="20%">
		                                <div class="CommonFormFieldName">
                                            <CSControl:ResourceControl runat="server" ResourceName="Maxwidth" />
                                        </div>
                                        <div class="CommonFormField">
                                            <asp:TextBox ID="SelectWidth" Columns="4" runat="server" />
                                        </div>
		                            </td>
		                            <td>
		                                <div class="CommonFormFieldName">
                                            <CSControl:ResourceControl runat="server" ResourceName="Maxheight" />
                                        </div>
                                        <div class="CommonFormField">
                                            <asp:TextBox ID="SelectHeight" Columns="4" runat="server" />
                                        </div>
		                            </td>
		                        </tr>
		                        </table>
                            </div>
                            <hr />
                            <div class="CommonFormFieldName">
	                            <CSControl:ResourceButton ID="SelectButton" Runat="server" ResourceName="InsertMedia_SelectMedia_Button" />
	                            <CSControl:ResourceButton Runat="server" ResourceName="Cancel" OnClientClick="window.parent.Telligent_Modal.Close(); return false;" />
                            </div>
                    </FormTemplate>
                </CSControl:SelectMediaForm>
                </Content>
            </TWC:TabbedPane>
            <TWC:TabbedPane runat="server" ID="UrlTab">
                <Tab><CSControl:ResourceControl runat="server" ResourceName="InsertMedia_FromUrl" /></Tab>
                <Content>
                    <CSControl:InsertMediaForm runat="server" 
                    UrlTextBoxId="Url" 
                    WidthTextBoxId="UrlWidth" 
                    HeightTextBoxId="UrlHeight" 
                    SelectButtonId="UrlInsert"
	                MediaInsertedClientFunction="ProcessContent"
	                >
                    <FormTemplate>
                        <div class="CommonFormFieldName">
                            <CSControl:ResourceControl runat="server" ResourceName="InsertMedia_LinkMedia" />
                        </div>
                        <CSControl:ResourceControl runat="server" ResourceName="InsertMedia_LinkMedia_Desc" />
                        <div class="CommonFormField">
                            <asp:TextBox ID="Url" Columns="30" runat="server" />
                            <div id="UrlError" class="CommonValidationWarning" style="visibility: hidden; position:absolute;">
                                <CSControl:ResourceControl runat="server" ResourceName="InsertMedia_Error" />
                            </div>
                        </div>
                        <br />
                        <hr />
                        <div id="UrlOptions">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                        <tr valign="top">
	                            <td width="20%">
                                    <div class="CommonFormFieldName">
                                        <CSControl:ResourceControl runat="server" ResourceName="Maxwidth" />
                                    </div>
                                    <div class="CommonFormField">
                                        <asp:TextBox ID="UrlWidth" Columns="4" runat="server" />
                                    </div>
                                </td>
	                            <td>
                                    <div class="CommonFormFieldName">
                                        <CSControl:ResourceControl runat="server" ResourceName="Maxheight" />
                                    </div>
                                    <div class="CommonFormField">
                                        <asp:TextBox ID="UrlHeight" Columns="4" runat="server" />
                                    </div>
                                </td>
                            </tr>
                            </table>
                        </div>
                        <hr />
                        <div class="CommonFormFieldName">
                            <CSControl:ResourceButton runat="server" ResourceName="InsertMedia_LinkMedia_Button" ID="UrlInsert" OnClientClick="if (!IsValid()) { return false };" />
                            <CSControl:ResourceButton runat="server" ResourceName="Cancel" OnClientClick="window.parent.Telligent_Modal.Close(); return false;" />
                        </div>
                    </FormTemplate>
                </CSControl:InsertMediaForm>
                </Content>
            </TWC:TabbedPane>
        </TWC:TabbedPanes>
        
    </div>
</div>
      
</asp:Content>