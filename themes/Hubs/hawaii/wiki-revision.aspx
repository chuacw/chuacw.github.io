<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="theme.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="Tabs" Src="~/themes/hawaii/wikis/tabs.ascx" %>
<%@ Import Namespace = "CommunityServer.Components" %>
<%@ Import Namespace = "CommunityServer.Wikis.Components" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSWiki:WikiData LinkTo="HomePage" runat="server" ResourceName="Hubs_Wiki" />
        &raquo;
        <CSWiki:PageData runat="server" LinkTo="Page" Property="Title" />
        &raquo;
        <CSWiki:PageRevisionData runat="server" LinkTo="Revision" ResourceName="Wikis_PageRevisionLink" Property="RevisionNumber" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSWiki:PageRevisionData runat="server" Property="Title" />: </ContentTemplate>
        <TrailerTemplate>
            <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_Revision" /> #<CSWiki:PageRevisionData runat="server" Property="RevisionNumber" />
        </TrailerTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:ResourceControl ResourceName="Wikis_Compare_OldRevisionMessage" Tag="Div" CssClass="CommonMessageWarning" runat="server">
    <Parameter1Template>
        <CSWiki:PageData LinkTo="Page" ResourceName="Wikis_Compare_StatusMessageLink" runat="server" />
    </Parameter1Template>
</CSControl:ResourceControl>

<div class="CommonContentBox">
    <div class="CommonContentBoxContent">
        <div style="float: right">
            <CSWiki:WikiData ID="WikiData1" LinkTo="CreatePage" runat="server" LinkCssClass="WikiAddButton">
                <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Wikis_AddPage" /></span></ContentTemplate>
           </CSWiki:WikiData>
        </div>

        <CSUserControl:Tabs runat="server" SelectedTab="History" />

        <div class="CommonPane">
            <div class="CommonGroupedContentArea">
                <h2 class="CommonContentBoxHeaderSmall"><CSWiki:PageData ID="PageData5" runat="server" Property="Title" Tag="Span" LinkTo="Page" /></h2>
                <div class="CommonDescription" style="font-size: 90%;">
                    <CSWiki:PageRevisionTagList runat="server" />
                </div>
                <CSWiki:PageRevisionData runat="server" Property="Body" Tag="Div" />
            </div>
        </div>

    </div>
</div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcrc" runat="server">
    
    <CSWiki:DeletePageForm runat="server" DeleteSinglePageButtonId="DeletePageLink">
        <SuccessActions>
            <CSControl:GoToSiteUrlAction runat="server" UrlName="hub_wiki">
                <Parameter1Template><CSHub:HubData runat="server" Property="ApplicationKey" /></Parameter1Template>
            </CSControl:GoToSiteUrlAction>
        </SuccessActions>
        <LeaderTemplate>
            <script type="text/javascript">
                function confirmPageDelete()
                {
                    return window.confirm('Are you sure you want to delete this page?');
                }
            </script>
            <ul class="CommonContentBoxList Seperator"><li>
        </LeaderTemplate>
        <FormTemplate>
            <CSControl:ResourceLinkButton runat="server" OnClientClick="return confirmPageDelete();" ID="DeletePageLink" Text="Delete Page" />
        </FormTemplate>
        <TrailerTemplate></li></ul></TrailerTemplate>
    </CSWiki:DeletePageForm>
    
    <CSWiki:LockPageForm runat="server" LockButtonId="LockPageButton" UnlockButtonId="UnlockPageButton">
        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
        <LeaderTemplate><ul class="CommonContentBoxList Seperator"><li></LeaderTemplate>
        <FormTemplate>
            <CSControl:ResourceLinkButton runat="server" ID="LockPageButton" Text="Lock Page" />
            <CSControl:ResourceLinkButton runat="server" ID="UnlockPageButton" Text="Unlock Page" />
        </FormTemplate>
        <TrailerTemplate></li></ul></TrailerTemplate>
    </CSWiki:LockPageForm>
    
</asp:Content>