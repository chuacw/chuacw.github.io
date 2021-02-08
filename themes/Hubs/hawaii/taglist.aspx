<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSHub:TagBreadCrumb runat="server" ShowHome="false" />
        <CSHub:TagRssLink runat="server"><LeaderTemplate>(</LeaderTemplate><TrailerTemplate>)</TrailerTemplate></CSHub:TagRssLink>
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" IncludeSectionOrHubName="true" Text="Browse by Tags" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
                    
	        <CSHub:TagCloud ID="TagCloud1" TagCssClasses="CommonTag6,CommonTag5,CommonTag4,CommonTag3,CommonTag2,CommonTag1" TagCloudCssClass="CommonTagCloud" runat="server" />

	        <CSControl:PlaceHolder ID="PlaceHolder1" runat="server">
	            <DisplayConditions><CSControl:QueryStringPropertyValueComparison ID="QueryStringPropertyValueComparison1" QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
	            <ContentTemplate>
	                <CSControl:TaggableContentList runat="server">
	                    <QueryOverrides PagerID="Pager" />
	                    <HeaderTemplate>
		                        <div class="CommonAvatarListItemsArea">
			                        <ul class="CommonAvatarListItemList">
		                    </HeaderTemplate>
		                    <ItemTemplate>
		                        <CSControl:TaggableContentData runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0} &quot;&gt;" />
		                            <CSControl:TaggableContentData runat="server" Property="TitleHtml" LinkTo="View" Tag="H4" CssClass="CommonAvatarListItemName" />
		                            <CSControl:TaggableContentData runat="server" Property="ContentHtml" TruncateAt="300" Tag="Div" CssClass="CommonAvatarListItem" />
		                            <div class="CommonAvatarListItemDetails">
    		                            <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile">
    		                                <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" /> </LeaderTemplate>
    		                            </CSControl:UserData>
    		                            <CSControl:TaggableContentData runat="server" Property="Date">
    		                                <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" /> </LeaderTemplate>
    		                            </CSControl:TaggableContentData>
		                            </div>
		                        </li>
		                    </ItemTemplate>
		                    <AlternatingItemTemplate>
			                    <CSControl:TaggableContentData runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0} Alt&quot;&gt;" />
		                            <CSControl:TaggableContentData runat="server" Property="TitleHtml" LinkTo="View" Tag="H4" CssClass="CommonAvatarListItemName" />
		                            <CSControl:TaggableContentData runat="server" Property="ContentHtml" TruncateAt="300" Tag="Div" CssClass="CommonAvatarListItem" />
		                            <div class="CommonAvatarListItemDetails">
    		                            <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile">
    		                                <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" /> </LeaderTemplate>
    		                            </CSControl:UserData>
    		                            <CSControl:TaggableContentData runat="server" Property="Date">
    		                                <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" /> </LeaderTemplate>
    		                            </CSControl:TaggableContentData>
		                            </div>
		                        </li>
		                    </AlternatingItemTemplate>
		                    <FooterTemplate>
			                        </ul>
			                    </div>
		                    </FooterTemplate>
	                    </CSControl:TaggableContentList>
	                </div>
                    <div class="CommonContentBoxFooter">
	                    <CSControl:Pager id="Pager" runat="server" ShowTotalSummary="true" />
	            </ContentTemplate>
	        </CSControl:PlaceHolder>
        </div>
    </div>		

</asp:Content>
