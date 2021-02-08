<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="../../Hawaii/Common/modal.Master" %>
<%@ Import Namespace = "CommunityServer.Components" %>
<%@ Import Namespace = "CommunityServer.Wikis.Components" %>
<asp:Content ID="Content1" ContentPlaceHolderID="bcr" runat="server">
<script type="text/javascript" language="javascript">
    function CloseModal() 
    {
        <CSControl:ConditionalContent runat="server">
        <ContentConditions><CSWiki:WikiPropertyValueComparison ComparisonProperty="HubID" ComparisonValue="1" Operator="LessThan" runat="server" /></ContentConditions>
        <TrueContentTemplate>window.parent.location = '<%= WikiUrls.Instance().View(this.CurrentWiki) %>';</TrueContentTemplate>
        <FalseContentTemplate>window.parent.location = '<%= WikiUrls.Instance().HubWiki(this.CurrentWiki.Hub.ApplicationKey) %>';</FalseContentTemplate>
        </CSControl:ConditionalContent>
        
        window.parent.Telligent_Modal.Close();
    }
</script>

<div class="CommonContentArea">
    <div class="CommonContent">
        <CSControl:Title ID="Title1" runat="server" IncludeSiteName="false" EnableRendering="false">
            <ContentTemplate><CSControl:ResourceControl ID="ResourceControl1" runat="server" ResourceName="Wikis_Page_Delete" /></ContentTemplate>
        </CSControl:Title>

        <CSWiki:DeletePageForm ID="DeletePageForm1" runat="server" DeleteSinglePageButtonId="DeleteSinglePage" DeleteWithChildrenButtonId="DeleteWithChildren">
           <SuccessActions>
                <CSControl:ExecuteScriptAction ID="ExecuteScriptAction1" runat="server" Script="CloseModal();" />
            </SuccessActions>
            <FormTemplate>
                <div class="CommonFormFieldName"><CSControl:ResourceControl ID="ResourceControl2" runat="server" ResourceName="Wikis_Page_Delete_Header" /></div>

                <div class="CommonFormFieldName">
                    <CSControl:ResourceButton runat="server" ResourceName="Wikis_Page_Delete_SingePage" ID="DeleteSinglePage" />
                    <CSControl:ResourceButton runat="server" ResourceName="Wikis_Page_Delete_WithChildren" ID="DeleteWithChildren" />
                    <CSControl:ResourceButton runat="server" ResourceName="Cancel" OnClientClick="window.parent.Telligent_Modal.Close(); return false;" />
                </div>
            </FormTemplate>
        </CSWiki:DeletePageForm>
    </div>
</div>
</asp:Content>