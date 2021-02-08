<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" MasterPageFile="mediagalleries.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="AggregateMediaGalleryPostList" Src="aggregatepostlist.ascx" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="media" ResourceFile="MediaGallery.xml" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    <CSUserControl:AggregateMediaGalleryPostList runat="server" />
</asp:Content>
