<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSHub:HubData runat="server" LinkTo="PageList" ResourceName="Pages" />
        &raquo;
        <CSHub:HubPageData runat="server" LinkTo="ViewPage" Property="Subject" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" IncludeSectionOrHubName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSHub:HubPageData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
		    <CSHub:HubPageData Property="FormattedBody" runat="server" IncrementViewCount="true" />
            <hr />
	        <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_Posted" />
		    <CSHub:HubPageData Property="PostDate" LinkTo="ViewPage" FormatString="MMM dd yyyy, hh:mm tt" runat="server" />
			<CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" />
		    <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" />
        </div>
    </div>        

</asp:Content>

<asp:Content ContentPlaceHolderID="rcrc" runat="server">
    
    <CSControl:PlaceHolder runat="server" Tag="UL" CssClass="CommonContentBoxList Seperator">
        <DisplayConditions Operator="Or">
            <CSHub:HubPermissionCondition runat="server" Permission="Administer" />
            <CSHub:HubPermissionCondition runat="server" Permission="Post" />
        </DisplayConditions>
        <ContentTemplate>
            <CSHub:HubPageData runat="server" LinkTo="EditPage" ResourceName="Hubs_EditPage" Tag="Li" />
            <CSHub:DeleteHubPageForm runat="server" DeleteButtonId="Delete" Tag="Li">
                <SuccessActions>
                    <CSControl:GoToSiteUrlAction UrlName="hub_pages" runat="server">
                        <Parameter1Template><CSHub:HubData Property="ApplicationKey" runat="server" /></Parameter1Template>
                    </CSControl:GoToSiteUrlAction>
                 </SuccessActions>
                <FormTemplate><asp:LinkButton runat="server" ID="Delete" Text="Delete this Page" OnClientClick="if (!confirm('Are you sure you want to delete this page?\n(this action cannot be undone)')) { return false; }" /></FormTemplate>
            </CSHub:DeleteHubPageForm>
            <CSHub:HubData runat="server" LinkTo="CreatePage" ResourceName="Hubs_CreatePage" Tag="Li" />
        </ContentTemplate>
    </CSControl:PlaceHolder>

</asp:Content>
