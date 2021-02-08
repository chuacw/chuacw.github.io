<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>
<%@ Import Namespace="CommunityServer.Components" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
        
<div style="width: 70%; margin: 20px auto 0 auto;">
    <div class="CommonContentBox">
        <CSControl:Title runat="server" IncludeSiteName="false" EnableRendering="true" Tag="H2" CssClass="CommonContentBoxHeader">
            <ContentTemplate><CSControl:MessageData runat="server" Property="Title" /></ContentTemplate>
        </CSControl:Title>
	    <div class="CommonContentBoxContent">
            <CSControl:MessageData Property="Body" runat="server" />
        </div>
    </div>
</div>

</asp:Content>