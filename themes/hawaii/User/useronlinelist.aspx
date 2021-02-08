<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="WhoIsOnlineView_Title" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
            <div class="CommonDescription">
                There are currently <CSControl:UsersOnlineData Property="MemberCount" runat="server" /> members online and <CSControl:UsersOnlineData Property="GuestCount" runat="server" /> guests online.
            </div>
		    <CSControl:UserOnlineList runat="server">
		        <QueryOverrides QueryType="AuthenticatedUsers" PageSize="9999" />
		        <ItemTemplate>
                    <div class="CommonSideListArea">
                        <div class="CommonSideListImage">
                            <CSControl:UserData runat="server" LinkTo="Profile"><ContentTemplate><CSControl:UserAvatar runat="server" Height="60" Width="60" ShowAnonymousAvatar="true" /></ContentTemplate></CSControl:UserData>
                        </div>
                        <div class="CommonSideListContent">
                            <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Strong" />
                            <CSControl:UserOnlineData Property="Location" LinkTo="CurrentLocation" runat="server" Tag="Div" />
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <div style="clear: both;"></div>
                </FooterTemplate>
		    </CSControl:UserOnlineList>
	    </div>
    </div>

</asp:Content>
