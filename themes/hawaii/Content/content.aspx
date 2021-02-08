<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">

    <CSControl:Title runat="server" IncludeSiteName="true">
        <ContentTemplate><CSControl:ContentData runat="server" Property="Title" /></ContentTemplate>
    </CSControl:Title>

    <CSControl:ContentData runat="server" LinkTo="EditContent" ResourceName="Edit">
        <LeaderTemplate>
            <div class="CommonBreadCrumbArea">
                <div class="Common">
                    <CSControl:SiteUrl runat="server" UrlName="tools_ControlPanel_Articles" ResourceName="Article_Title" />
                    <CSControl:ResourceControl runat="server" ResourceName="BreadCrumb_Seperator" />
                    <CSControl:ContentData runat="server" Property="Title" /> (
        </LeaderTemplate>
        <TrailerTemplate>
                    )
                </div>
            </div>
        </TrailerTemplate>
    </CSControl:ContentData>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<div class="CommonContentArea">
	<CSControl:ContentData runat="server" Property="Title" Tag="H2" CssClass="CommonTitle" />
	<CSControl:ContentData runat="server" Property="FormattedBody" Tag="Div" CssClass="CommonContent" />
</div>

</asp:Content>