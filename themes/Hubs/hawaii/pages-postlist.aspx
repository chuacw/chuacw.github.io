<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSHub:HubData Text="Pages" LinkTo="PageList" runat="server" />
    </div></div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="tr">
    <CSControl:Title runat="server" IncludeSiteName="true" IncludeSectionOrHubName="true" Text="Pages" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxHeaderForm">
            <div style="float: right;">
	            <CSHub:HubData runat="server" LinkTo="CreatePage" ResourceName="Hubs_CreatePage" />
            </div>
            &nbsp;
        </div>
        
        <div class="CommonContentBoxContent">

            <CSHub:HubPageList runat="server">
                <QueryOverrides SortOrder="Descending" SortBy="PostDate" PageSize="10" PagerID="Pager" />
	            <HeaderTemplate>
		            <div class="CommonAvatarListItemsArea">
		                <ul class="CommonAvatarListItemList">
	            </HeaderTemplate>
	            <ItemTemplate>
	                <li class="CommonAvatarListItemArea Custom">
	                    <CSControl:UserAvatar runat="server" Tag="Div" CssClass="CustomAvatarListItemCustomAvatar" Width="60" Height="60" />
	                    <div class="CustomAvatarListCustomContent">
	                        <CSHub:HubPageData Property="Subject" LinkTo="ViewPage" Tag="H4" CssClass="CommonAvatarListItemName" runat="server" />
		                    <CSHub:HubPageData Property="FormattedBody" Tag="Div" CssClass="CommonAvatarListItem" runat="server" TruncateAt="150" />
		                    <div class="CommonAvatarListItemDetails">
			                    <div>
			                        <CSControl:ResourceControl runat="server" ResourceName="Weblog_ContentList_Published" />
			                        <CSHub:HubPageData Property="UserTime" LinkTo="ViewPage" IncludeTimeInDate="true" FormatString="ddd, MMM MM yyyy h:mm tt" runat="server" />
        				            <CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_By" /> 
		                            <CSControl:UserData LinkTo="Profile" Property="DisplayName" runat="server" />
			                    </div>
		                    </div>
                        </div>
		            </li>
	            </ItemTemplate>
	            <AlternatingItemTemplate>
	                <li class="CommonAvatarListItemArea Custom Alt">
                        <CSControl:UserAvatar runat="server" Tag="Div" CssClass="CustomAvatarListItemCustomAvatar" Width="60" Height="60" />
                        <div class="CustomAvatarListCustomContent">
                            <CSHub:HubPageData Property="Subject" LinkTo="ViewPage" Tag="H4" CssClass="CommonAvatarListItemName" runat="server" />
	                        <CSHub:HubPageData Property="FormattedBody" Tag="Div" CssClass="CommonAvatarListItem" runat="server" TruncateAt="150" />
	                        <div class="CommonAvatarListItemDetails">
		                        <div>
		                            <CSControl:ResourceControl runat="server" ResourceName="Weblog_ContentList_Published" />
		                            <CSHub:HubPageData Property="UserTime" LinkTo="ViewPage" IncludeTimeInDate="true" FormatString="ddd, MMM MM yyyy h:mm tt" runat="server" />
		                            <CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_By" /> 
		                            <CSControl:UserData LinkTo="Profile" Property="DisplayName" runat="server" />
		                        </div>
	                        </div>
                        </div>
		            </li>
	            </AlternatingItemTemplate>
	            <NoneTemplate>
	                <div class="CommonMessageWarning">
	                    No pages have yet been created.
	                </div>
	            </NoneTemplate>
	            <FooterTemplate>
		                </ul>
                    </div>
	            </FooterTemplate>
            </CSHub:HubPageList>
            
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:Pager runat="Server" id="Pager" />
        </div>
    
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcrc" runat="server">
    
    <CSControl:PlaceHolder runat="server" Tag="UL" CssClass="CommonContentBoxList Seperator">
        <DisplayConditions Operator="Or">
            <CSHub:HubPermissionCondition runat="server" Permission="Administer" />
            <CSHub:HubPermissionCondition runat="server" Permission="Post" />
        </DisplayConditions>
        <ContentTemplate>
            <CSHub:HubData runat="server" LinkTo="CreatePage" ResourceName="Hubs_CreatePage" Tag="Li" />
        </ContentTemplate>
    </CSControl:PlaceHolder>

</asp:Content>