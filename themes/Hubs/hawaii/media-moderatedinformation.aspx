<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSMedia:MediaGalleryData runat="server" ResourceName="Hubs_Files" LinkTo="MediaGalleryHome" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    
    <div style="width: 50%; margin: 100px auto;">
        <div class="CommonContentBox">
            <CSControl:Title ResourceName="FilePendingModeration_Title" runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H2" CssClass="CommonContentBoxHeader" />
	        <div class="CommonContentBoxContent">
                <CSControl:ResourceControl runat="server" ResourceName="FilePendingModeration_Body">
                    <Parameter1Template><CSMedia:MediaGalleryData runat="server" Property="Name" LinkTo="MediaGalleryHome" /></Parameter1Template>
                </CSControl:ResourceControl>
            </div>
        </div>
    </div>
    
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server" />