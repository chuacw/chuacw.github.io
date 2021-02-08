<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" />

    <CSControl:WrappedLiteral Tag="h2" ContainerId="titleWrapper" CssClass="pageTitle" runat="server" Text="Search Results" />
    <CSControl:IndexPostList id="EntryItems" Runat="server">
        <QueryOverrides PagerID="pager" />
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <div class="post">
               <CSControl:IndexPostData runat="server" Property="Title" LinkTo="Post" Tag="H5" CssClass="posthead" />

               <CSControl:IndexPostData Property="FormattedBody" TruncateAt="300" runat="server" />

                <p class="postfoot">	
                    <span class="em">Posted:</span>
                    <CSControl:IndexPostData Property="PostDate" LinkTo="Post" FormatString="dd MMM yyyy @ hh:mm tt" runat="server" />
					<CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
					<CSControl:IndexPostData Property="UserName" runat="server" /> 
                </p>                            
            </div>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </CSControl:IndexPostList>
    <CSControl:SinglePager id = "pager" runat = "Server"  />
</asp:Content>
