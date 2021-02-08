<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>
<asp:Content ContentPlaceHolderID="Main" runat="Server">
<CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false">
    <ContentTemplate><CSBlog:WeblogData runat="server" Property="AboutTitle" /></ContentTemplate>
</CSControl:Title>
<div id="wrapper">
    <div id="content" class="clearfix">
        <div class="entryview">
            <CSBlog:WeblogData ID="WeblogData1" Property="AboutTitle" runat="server" Tag="h1" CssClass="entryviewheading" />
            <p>
            <CSBlog:WeblogData ID="WeblogData2" Property="AboutDescription" runat="server" />
            </p>
        </div>
    </div>
</div>
</asp:Content>