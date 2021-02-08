<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<div style="width: 50%; margin: 100px auto;">
    <div class="CommonContentBox">
        <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="UserBanned_Title" EnableRendering="true" Tag="h2" CssClass="CommonContentBoxHeader" />  
        <CSControl:ResourceControl runat="server" ResourceName="UserBanned_Message" Tag="Div" CssClass="CommonContentBoxContent">
            <Parameter1Template><CSControl:UserData Property="BannedUntil" IncludeTimeInDate="true" runat="server" /></Parameter1Template>
            <Parameter2Template></Parameter2Template>
            <Parameter3Template>
                <CSControl:ValueSelectedContent runat="server">
                    <ValueTemplate><CSControl:UserData Property="BanReason" UseAccessingUser="true" runat="server" /></ValueTemplate>
                    <Content>
                        <CSControl:ValueContent Value="Profanity" runat="server"><CSControl:ResourceControl runat="server" ResourceName="Utility_UserBanReason_Profanity" /></CSControl:ValueContent>
                        <CSControl:ValueContent Value="Advertising" runat="server"><CSControl:ResourceControl runat="server" ResourceName="Utility_UserBanReason_Advertising" /></CSControl:ValueContent>
                        <CSControl:ValueContent Value="Spam" runat="server"><CSControl:ResourceControl runat="server" ResourceName="Utility_UserBanReason_Spam" /></CSControl:ValueContent>
                        <CSControl:ValueContent Value="Aggresive" runat="server"><CSControl:ResourceControl runat="server" ResourceName="Utility_UserBanReason_Aggresive" /></CSControl:ValueContent>
                        <CSControl:ValueContent Value="BadUsername" runat="server"><CSControl:ResourceControl runat="server" ResourceName="Utility_UserBanReason_BadUsername" /></CSControl:ValueContent>
                        <CSControl:ValueContent Value="BadSignature" runat="server"><CSControl:ResourceControl runat="server" ResourceName="Utility_UserBanReason_BadSignature" /></CSControl:ValueContent>
                        <CSControl:ValueContent Value="BanDodging" runat="server"><CSControl:ResourceControl runat="server" ResourceName="Utility_UserBanReason_BanDodging" /></CSControl:ValueContent>
                        <CSControl:DefaultContent runat="server"><CSControl:ResourceControl runat="server" ResourceName="Utility_UserBanReason_Other" /></CSControl:DefaultContent>
                    </Content>
                </CSControl:ValueSelectedContent>        
            </Parameter3Template>
        </CSControl:ResourceControl>
    </div>
</div>

</asp:Content>
