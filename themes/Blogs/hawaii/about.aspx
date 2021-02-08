<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSBlog:WeblogData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSBlog:WeblogData LinkTo="about" runat="server" Text="About" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSBlog:WeblogData runat="server" Property="AboutTitle" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="Server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
            <CSBlog:WeblogData Property="AboutDescription" runat="server" />
        </div>
    </div>
    
</asp:Content>