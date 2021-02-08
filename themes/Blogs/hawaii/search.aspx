<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSBlog:WeblogData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        Search
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" Text="Search" EnableRendering="true" ContainerId="titleWrapper" CssClass="CommonTitle" Tag="H1" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="Server">
    
    <div class="CommonContentBox">
        <div class="CommonContentBoxHeaderForm">
            <CSBlog:SearchForm runat="server" QueryTextBoxId="SearchTextTop" SubmitButtonId="SearchButtonTop" Tag="Div" CssClass="CommonFormArea">
                <FormTemplate>
	                <CSControl:DefaultButtonTextBox ButtonId="SearchButtonTop" id="SearchTextTop" runat="server"  columns="55" />
	                <CSControl:ResourceButton id="SearchButtonTop" ResourceName="Search" runat="server" /> 
		        </FormTemplate>
		    </CSBlog:SearchForm>
        </div>
        <div class="CommonContentBoxContent">

            <CSControl:IndexPostList runat="server" ShowHeaderFooterOnNone="false">
                <QueryOverrides PagerID="PagerBottom" />
                <HeaderTemplate>
                    <div class="CommonAvatarListItemsArea">
                    <ul class="CommonAvatarListItemList">
                </HeaderTemplate>
                <ItemTemplate>
                    <li class="CommonAvatarListItemArea Unknown">
                        <CSControl:IndexPostData runat="server" Property="Title" LinkTo="Post" Tag="h4" CssClass="CommonAvatarListItemName" />
                        <div class="CommonAvatarListItem">
                            <CSControl:IndexPostData runat="server" Property="FormattedBody" TruncateAt="300" />
                        </div>
                        <div class="CommonAvatarListItemDetails">
                            <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
                            <CSControl:IndexPostData Property="UserName" LinkTo="Author" runat="server" />
                            <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
                            <CSControl:IndexPostData Property="PostDate" runat="server" FormatString="MMM dd yyyy @ hh:mm tt" />
                        </div>
                    </li>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <li class="CommonAvatarListItemArea Unknown Alt">
                        <CSControl:IndexPostData runat="server" Property="Title" LinkTo="Post" Tag="h4" CssClass="CommonAvatarListItemName" />
                        <div class="CommonAvatarListItem">
                            <CSControl:IndexPostData runat="server" Property="FormattedBody" TruncateAt="300" />
                        </div>
                        <div class="CommonAvatarListItemDetails">
                            <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
                            <CSControl:IndexPostData Property="UserName" LinkTo="Author" runat="server" />
                            <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
                            <CSControl:IndexPostData Property="PostDate" runat="server" FormatString="dd MMM yyyy @ hh:mm tt" />
                        </div>
                    </li>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </ul>
                    </div>
                </FooterTemplate>
                <NoneTemplate>
                    <CSControl:ResourceControl runat="server" ResourceName="SearchView_NoResults" Tag="Div" CssClass="CommonMessageError" />
                </NoneTemplate>
            </CSControl:IndexPostList>
   		    
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:Pager id="PagerBottom" runat="server" ShowTotalSummary="true" />
            <CSControl:IndexPostRssLink runat="server" Tag="Div" Text="RSS">
                <LeaderTemplate> | </LeaderTemplate>
            </CSControl:IndexPostRssLink>
        </div>
    </div>

</asp:Content>
