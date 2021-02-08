<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSMedia:MediaGalleryData runat="server" ResourceName="Hubs_Files" LinkTo="MediaGalleryHome" />
        &raquo;
        <CSMedia:MediaGalleryData LinkTo="moderate" runat="server" Text="Moderate Files" />
    </div></div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="tr">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" ResourceName="ModerateMediaGalleries_TitleName" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    
    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
             <CSMedia:MediaGalleryPostList runat="server">
                <QueryOverrides QueryType="ModeratedPosts" PageSize="20" PagerID="FilesPager" SortOrder="Descending"  />
                <ItemTemplate>
                    <div class="CommonFileArea">
                        <div class="CommonFileRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                        <div class="CommonFileContent">
                            <div class="CommonFile"><table cellpadding="0" cellspacing="0" border="0"><tr><td class="CommonFileInner">
                                <CSMedia:MediaGalleryPostData LinkTo="View" runat="server">
                                    <ContentTemplate>
                                        <CSMedia:MediaGalleryPostViewer runat="server" ViewType="Preview" Width="131" Height="94" />
                                    </ContentTemplate>
                                </CSMedia:MediaGalleryPostData>
                            </td></tr></table></div>
                            <div class="CommonFileDetails">
                                <CSMedia:MediaGalleryPostData runat="server" Property="Subject" LinkTo="View" Tag="Strong" TruncateAt="25" />
                                <div style="font-size: 90%; height: 60px; overflow: hidden;">
                                    <CSControl:UserData Property="DisplayName" LinkTo="Profile" Text="{0}" Tag="Div" runat="server"><LeaderTemplate>by </LeaderTemplate></CSControl:UserData>
                                    <CSMedia:MediaGalleryPostData runat="server" Property="PostDate" Tag="Div" />
                                    <CSMedia:MediaGalleryPostModerationPopupMenu runat="server" ResourceName="ModerationPopupMenu_Text" ButtonActiveCssClass="CommonTextButtonHighlight" ButtonInactiveCssClass="CommonTextButton" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" MenuItemExpandedCssClass="CommonContextMenuItemExpanded" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="UpDown" Tag="Div">
                                        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                    </CSMedia:MediaGalleryPostModerationPopupMenu>
                                </div>
                            </div>
                        </div>
                        <div class="CommonFileRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>                        
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <div style="clear:both;"></div>
                </FooterTemplate>            
                 <NoneTemplate>
	                There are no files to moderate.
                </NoneTemplate>
            </CSMedia:MediaGalleryPostList>
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:Pager runat="server" ID="FilesPager" ShowTotalSummary="true" />
        </div>
    </div>
    
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server" />