<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="UserBadgeArea" Src="UserBadgeArea.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea">
        <div class="Common">
            <CSControl:UserData runat="server" LinkTo="profile" Property="DisplayName" />
             &raquo;
             <CSControl:UserData runat="server" LinkTo="favorites" ResourceName="EditProfile_Favorites_Title" />
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" Tag="H1" CssClass="CommonTitle" EnableRendering="true" IncludeSiteName="true">
        <ContentTemplate><CSControl:UserData Property="DisplayName" runat="server" />'s <CSControl:ResourceControl runat="server" ResourceName="EditProfile_Favorites_Title" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">

    <div class="CommonSidebar">
        <CSUserControl:UserBadgeArea runat="server" />
    </div>    

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

	<div class="CommonContentBox">
        <div class="CommonContentBoxContent">
            
            <CSControl:ConditionalContent runat="server">
                <DisplayConditions Operator="Or">
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="EqualTo" ComparisonValue="Posts" />
                    <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Show" Operator="IsSetOrTrue" /></CSControl:Conditions>
                </DisplayConditions>
                <ContentConditions Operator="Or">
    	            <CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="EnableFavoriteSharing" Operator="IsSetOrTrue" />
    	            <CSControl:CurrentUserIsAccessingUserCondition runat="server" />
                </ContentConditions>
                <TrueContentTemplate>
                    <CSControl:FavorableContentList runat="server">
                        <QueryOverrides QueryType="CurrentUserFavorites" PagerId="Pager" PageSize="10" />
                        <HeaderTemplate>
	                        <div class="CommonAvatarListItemsArea">
		                        <ul class="CommonAvatarListItemList">
	                    </HeaderTemplate>
	                    <ItemTemplate>
	                        <CSControl:FavorableContentData runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0}&quot;&gt;" />
	                            <CSControl:FavorableContentData runat="server" Property="TitleHtml" LinkTo="View" Tag="h4" CssClass="CommonAvatarListItemName" />
		                        <div class="CommonAvatarListItem">
			                        <CSControl:FavorableContentData runat="server" Property="ContentHtml" TruncateAt="250" />
		                        </div>
		                        <div class="CommonAvatarListItemDetails">
			                        <CSControl:UserData LinkTo="Profile" runat="server" Property="DisplayName">
			                            <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" /> </LeaderTemplate>
			                        </CSControl:UserData>
		                        </div>
		                        <CSControl:FavorableContentToggleButton runat="server">
		                            <DisplayConditions><CSControl:CurrentUserIsAccessingUserCondition runat="server" UsePageLevelContext="true" /></DisplayConditions>
		                            <LeaderTemplate><div class="CommonFormArea"><div class="CommonFormFieldName"></LeaderTemplate>
		                            <OnTemplate>Remove from favorites</OnTemplate>
		                            <OffTemplate></OffTemplate>
		                            <TrailerTemplate></div></div></TrailerTemplate>
		                        </CSControl:FavorableContentToggleButton>
		                    </li>
	                    </ItemTemplate>
	                    <AlternatingItemTemplate>
	                        <CSControl:FavorableContentData runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0} Alt&quot;&gt;" />
	                            <CSControl:FavorableContentData runat="server" Property="TitleHtml" LinkTo="View" Tag="h4" CssClass="CommonAvatarListItemName" />
		                        <div class="CommonAvatarListItem">
			                        <CSControl:FavorableContentData runat="server" Property="ContentHtml" TruncateAt="250" />
		                        </div>
		                        <div class="CommonAvatarListItemDetails">
			                        <CSControl:UserData LinkTo="Profile" runat="server" Property="DisplayName">
			                            <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" /> </LeaderTemplate>
			                        </CSControl:UserData>
		                        </div>
		                        <CSControl:FavorableContentToggleButton runat="server">
		                            <DisplayConditions><CSControl:CurrentUserIsAccessingUserCondition runat="server" UsePageLevelContext="true" /></DisplayConditions>
		                            <LeaderTemplate><div class="CommonFormArea"><div class="CommonFormFieldName"></LeaderTemplate>
		                            <OnTemplate>Remove from favorites</OnTemplate>
		                            <OffTemplate></OffTemplate>
		                            <TrailerTemplate></div></div></TrailerTemplate>
		                        </CSControl:FavorableContentToggleButton>
		                    </li>
	                    </AlternatingItemTemplate>
	                    <FooterTemplate>
		                        </ul>
                            </div>
	                    </FooterTemplate>
                        <NoneTemplate>
                            <CSControl:UserData runat="server" Property="DisplayName" /> has not identified any favorites.
                        </NoneTemplate>
                    </CSControl:FavorableContentList>
                    
                    <CSControl:Pager runat="server" ShowTotalSummary="true" ID="Pager">
                        <LeaderTemplate></div><div class="CommonContentBoxFooter"></LeaderTemplate>
                    </CSControl:Pager>
                    
                </TrueContentTemplate>
                <FalseContentTemplate>
                    <CSControl:UserData runat="server" Property="DisplayName" /> is not sharing favorites.
                </FalseContentTemplate>
            </CSControl:ConditionalContent>
             
        </div>
    </div>
	
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server"></asp:Content>