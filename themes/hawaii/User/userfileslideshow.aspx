<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="AjaxUserFileSlideshow" Src="~/utility/usercontrols/ajaxuserfileslideshow.ascx" %>
<%@ Register TagPrefix="CSUserControl" TagName="UserBadgeArea" Src="UserBadgeArea.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSControl:UserFileBreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <LeaderTemplate>
            <div class="Common">
                <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" />
                <CSControl:ResourceControl ResourceName="BreadCrumb_Seperator" runat="server" />
        </LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSControl:UserFileBreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSControl:UserFolderData runat="server" Property="Name" /> Slideshow</ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">

    <div class="CommonSidebar">
        <CSUserControl:UserBadgeArea runat="server" />
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <CSUserControl:AjaxUserFileSlideshow runat="server" />

        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:UserFolderData runat="server" LinkTo="View" ResourceName="MediaGallery_ViewFiles" />
        </div>
    </div>

</asp:Content>

