<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSBlog:WeblogData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        Links
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" Text="Links" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="Server">

    <div class="CommonContentBox">

        <CSBlog:LinkCategoryList runat="Server">
            <HeaderTemplate></HeaderTemplate>
            <ItemTemplate>
                <CSBlog:LinkCategoryData runat="server" Property="Name" Tag="H2" CssClass="CommonContentBoxHeader" />
                <div class="CommonContentBoxContent">
                    <CSBlog:LinkList runat="server">
                        <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <div><CSBlog:LinkData runat="server" Property="Title" LinkTo="Link" /></div>
                                <div><CSBlog:LinkData runat="server" Property="Description" /></div>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate></ul></FooterTemplate>
                    </CSBlog:LinkList>
                </div>  
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </CSBlog:LinkCategoryList>
        
    </div>
</asp:Content>