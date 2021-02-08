<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="wikis.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="Tabs" Src="tabs.ascx" %>
<%@ Import Namespace = "CommunityServer.Components" %>
<%@ Import Namespace = "CommunityServer.Wikis.Components" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSControl:SiteUrl UrlName="wikishome" runat="server" ResourceName="wikis"  />
        &raquo;
        <CSWiki:WikiData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSWiki:PageData runat="server" LinkTo="Page" Property="Title" />
        &raquo;
        <CSWiki:PageRevisionData runat="server" Property="RevisionNumber">
           <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_Revision" /> #</LeaderTemplate>
        </CSWiki:PageRevisionData>
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
                <h2 class="CommonContentBoxHeaderSmall"><CSWiki:PageData runat="server" Property="Title" Tag="Span" LinkTo="Page" /></h2>
                <div class="CommonDescription" style="font-size: 90%;">
                    <CSWiki:PageRevisionTagList runat="server" />
                </div>
                <CSWiki:PageRevisionData runat="server" Property="Body" Tag="Div" IncrementViewCount="true" />
            </div>
        </div>

    </div>
</div>

</asp:Content>