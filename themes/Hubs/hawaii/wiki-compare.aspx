<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="theme.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="Tabs" Src="~/themes/hawaii/wikis/tabs.ascx" %>
<%@ Import Namespace = "CommunityServer.Components" %>
<%@ Import Namespace = "CommunityServer.Wikis.Components" %>

<script runat="server">

    void Page_Load(object sender, EventArgs e)
    {
        CSContext cntx = CSContext.Current;
        
        int revA = cntx.GetIntFromQueryString("revA", -1);
        int revB = cntx.GetIntFromQueryString("revB", -1);

        PageMerger1.RevisionA = revA;
        PageMerger1.RevisionB = revB;

        PageMergeStatus1.RevisionA = revA;
        PageMergeStatus1.RevisionB = revB;
    }
</script>


<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSWiki:PageData ID="PageData3" runat="server" LinkTo="Page" Property="Title" />
        &raquo;
        <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_Compare" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSWiki:PageData runat="server" Property="Title" /></ContentTemplate>
        <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="Wikis_History_Compare_Prefix" />: </LeaderTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSWiki:PageMergeStatus runat="server" id="PageMergeStatus1" Tag="Div" CssClass="CommonMessageWarning" />

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

                <CSWiki:PageMerger id="PageMerger1" TitleTag="h2" TitleCssClass="CommonContentBoxHeaderSmall" runat="server" />

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