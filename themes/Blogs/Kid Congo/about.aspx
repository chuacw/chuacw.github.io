<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="Main" runat="Server">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false">
        <ContentTemplate><CSBlog:WeblogData runat="server" Property="AboutTitle" /></ContentTemplate>
    </CSControl:Title>
    <div class="entryview">
        <CSBlog:WeblogData Property="AboutTitle" runat="server" Tag="h3" CssClass="contentheading" />
        <CSBlog:WeblogData Property="AboutDescription" runat="server" />
    </div>
</asp:Content>