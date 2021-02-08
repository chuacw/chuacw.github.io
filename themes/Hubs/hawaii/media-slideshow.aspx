<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" %>
<%@ Register TagPrefix="CSUserControl" TagName="AjaxMediaSlideshow" Src="~/utility/usercontrols/ajaxmediaslideshow.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSMedia:MediaGalleryData runat="server" ResourceName="Hubs_Files" LinkTo="MediaGalleryHome" />
        &raquo;
        <CSMedia:MediaGalleryData runat="server" LinkTo="Slideshow" Text="Slideshow" />
    </div></div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="tr">
    <CSControl:Title runat="server" Text="Slideshow" IncludeSiteName="true" IncludeSectionOrHubName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
            <CSUserControl:AjaxMediaSlideshow runat="server" />
        </div>
        <div class="CommonContentBoxFooter">
            <CSMedia:MediaGalleryData runat="server" LinkTo="MediaGalleryHome" Text="View all files" />
        </div>
    </div>
</asp:Content>