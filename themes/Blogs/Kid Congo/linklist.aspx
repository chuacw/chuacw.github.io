<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" />

    <CSBlog:LinkCategoryList ID="LinkCategoryList1" runat="Server" Tag="div" CssClass="entryview">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <CSBlog:LinkCategoryData runat="server" Property="Name" Tag="h3" CssClass="contentheading" />
            <CSBlog:LinkList runat="server">
                <HeaderTemplate><dl></HeaderTemplate>
                <ItemTemplate>
                    <dt><CSBlog:LinkData runat="server" Property="Title" LinkTo="Link" /></dt>
                    <dd><CSBlog:LinkData runat="server" Property="Description" /></dd>
                </ItemTemplate>
                <FooterTemplate></dl></FooterTemplate>
            </CSBlog:LinkList>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSBlog:LinkCategoryList>
</asp:Content>