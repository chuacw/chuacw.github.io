<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="master.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server">
    <ContentTemplate><CSControl:SiteSettingsData runat="server" Property="SiteName" /></ContentTemplate>
</CSControl:Title>

<CSControl:LogOutForm runat="server">
    <SuccessActions>
        <CSControl:GoToModifiedUrlAction runat="server" />
    </SuccessActions>
    <ImpersonatedSuccessActions>
        <CSControl:GoToSiteUrlAction UrlName="home" runat="server" />
    </ImpersonatedSuccessActions>
    <FormTemplate>
        <div style="width: 50%; margin: 100px auto;">
            <div class="CommonContentBox">
                <CSControl:ResourceControl runat="server" ResourceName="Logout_Title" Tag="H2" CssClass="CommonContentBoxHeader" />
                <div class="CommonContentBoxContent">
                    <CSControl:SiteSettingsData runat="server" ResourceName="Logout_Status" Property="SiteName" />
                </div>
                <div class="CommonContentBoxFooter">
                    <CSControl:SiteUrl runat="server" UrlName="login_clean" ResourceName="login" /> |
                    <CSControl:SiteUrl runat="server" UrlName="home" ResourceName="Logout_ReturnHome" />
                </div>
            </div>
        </div>
    </FormTemplate>
</CSControl:LogOutForm>

</asp:Content>

