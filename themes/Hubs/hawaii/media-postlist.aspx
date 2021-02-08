<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" %>
<%@ Register TagPrefix="CSUserControl" TagName="AggregateMediaGalleryPostList" Src="~/themes/hawaii/media/aggregatepostlist.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSMedia:MediaGalleryData runat="server" ResourceName="Hubs_Files" LinkTo="MediaGalleryHome" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" ResourceName="Hubs_Files" IncludeSectionOrHubName="true" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    <CSUserControl:AggregateMediaGalleryPostList runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderID="rcrc" runat="server">
    
    <CSControl:PlaceHolder runat="server" Tag="UL" CssClass="CommonContentBoxList Seperator">
        <DisplayConditions Operator="Or">
            <CSHub:HubPermissionCondition runat="server" Permission="Administer" />
            <CSMedia:MediaGalleryPermissionCondition runat="server" Permission="Post" />
        </DisplayConditions>
        <ContentTemplate>
            <CSMedia:MediaGalleryData runat="server" LinkTo="AddMediaGalleryPost" ResourceName="Hubs_FilesUploadFile" Tag="Li" />
        </ContentTemplate>
    </CSControl:PlaceHolder>

</asp:Content>