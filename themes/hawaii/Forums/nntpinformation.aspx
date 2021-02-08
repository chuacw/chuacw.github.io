<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="NntpInformation_Title" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:ConditionalAction runat="server">
        <Conditions Operator="Not">
            <CSControl:Conditions runat="server" Operator="And">
                <CSControl:SiteHasLicenseCondition runat="server" ProductName="NewsGateway" />
                <CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="NntpServerLocation" Operator="IsSetOrTrue" />
            </CSControl:Conditions>
        </Conditions>
        <Actions><CSControl:GoToMessageAction runat="server" MessageType="AccessDenied" /></Actions>
    </CSControl:ConditionalAction>

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <CSControl:ResourceControl runat="server" ResourceName="NntpInformation_Content">
                <Parameter1Template><CSControl:SiteSettingsData runat="server" Property="NntpServerLocation" /></Parameter1Template>
                <Parameter2Template><CSControl:SiteUrl runat="server" UrlName="home" RenderRawUrl="true" Encoding="HTML" /></Parameter2Template>
            </CSControl:ResourceControl>
            
        </div>
	</div>
	
</asp:Content>