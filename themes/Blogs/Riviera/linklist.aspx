<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" />

    <CSBlog:LinkCategoryList ID="LinkCategoryList1" runat="Server">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <CSBlog:LinkCategoryData runat="server" Property="Name" Tag="H4" CssClass="contentsubheading" />
            <CSBlog:LinkList runat="server">
                <HeaderTemplate><ul></HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <div><CSBlog:LinkData runat="server" Property="Title" LinkTo="Link" /></div>
                        <div><CSBlog:LinkData runat="server" Property="Description" /></div>
                    </li>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </CSBlog:LinkList>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSBlog:LinkCategoryList>
</asp:Content>