<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>
<%@ Import namespace="CommunityServer.Components"%>
<%@ Import namespace="CommunityServer.Blogs.Components"%>
<script runat="Server">

    void Page_Load(object sender, EventArgs e)
    {
        SetTitle(this.CurrentWeblog.AboutTitle, false);
    }

</script>
<asp:Content ContentPlaceHolderID="Main" runat="Server">
    <CSBlog:WeblogData Property="AboutTitle" runat="server" Tag="h2" CssClass="pageTitle" />
    <CSBlog:WeblogData Property="AboutDescription" runat="server" />
</asp:Content>