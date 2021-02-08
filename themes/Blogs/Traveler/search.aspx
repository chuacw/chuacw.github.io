<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" />

    <CSControl:WrappedLiteral Tag="h2" CssClass="pageTitle" runat="server" Text="Search Results" />
    <CSControl:IndexPostList id="EntryItems" Runat="server">
        <QueryOverrides PagerID="pager" />
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <div class="post">
                <div class="postsub">
                       <h2>
                         <CSControl:IndexPostData runat="server" Property="Title" LinkTo="Post" />
                         <span>
                            <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" /> <CSControl:IndexPostData Property="UserName" runat="server" LinkTo="Author" />
                         </span>
                       </h2>
                       <CSControl:IndexPostData Property="FormattedBody" TruncateAt="300" runat="server" />

                        <div class="postfoot">	
                        </div>
                </div>                            
            </div>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSControl:IndexPostList>
    <CSControl:SinglePager id = "pager" runat = "Server"  />
</asp:Content>
