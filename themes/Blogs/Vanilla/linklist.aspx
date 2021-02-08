<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" />

    <CSBlog:LinkCategoryList ID="LinkCategoryList1" runat="Server">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <div class="linklist">
            <CSBlog:LinkCategoryData runat="server" Property="Name" Tag="H4" />
            <CSBlog:LinkList runat="server">
                <HeaderTemplate><ul></HeaderTemplate>
                <ItemTemplate>
                    <dl>
                        <dt><CSBlog:LinkData runat="server" Property="Title" LinkTo="Link" /></dt>
                        <dd><CSBlog:LinkData runat="server" Property="Description" /></dd>
                    </dl>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </CSBlog:LinkList>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </CSBlog:LinkCategoryList>
</asp:Content>