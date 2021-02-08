<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" MasterPageFile="mediagalleries.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="AggregateMediaGalleryPostList" Src="aggregatepostlist.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea">
        <div class="Common">
            <CSControl:SiteUrl UrlName="mediagallerieshome" ResourceName="media" runat="server" />
            &raquo;
            <CSMedia:GroupData Property="Name" LinkTo="GroupHome" runat="server" />
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSMedia:GroupData Property="Name" runat="server" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    <CSUserControl:AggregateMediaGalleryPostList runat="server" />
</asp:Content>