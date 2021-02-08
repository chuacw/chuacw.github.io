<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSControl:TagBreadCrumb runat="server" ShowHome="false" Tag="Div" CssClass="CommonBreadCrumbArea">
        <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate>
            <CSControl:TagRssLink runat="server"><LeaderTemplate>(</LeaderTemplate><TrailerTemplate>)</TrailerTemplate></CSControl:TagRssLink>
            </div>
        </TrailerTemplate>
    </CSControl:TagBreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="TagBrowser_Site_Title" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <div class="CommonDescription">
                <CSControl:ResourceControl runat="server" ResourceName="TagBrowser_ShowingTagsForSite" />
            </div>

	        <CSControl:TagCloud TagCssClasses="CommonTag6,CommonTag5,CommonTag4,CommonTag3,CommonTag2,CommonTag1" TagCloudCssClass="CommonTagCloud" runat="server" />

	        <CSControl:PlaceHolder runat="server" Tag="Div" CssClass="CommonAvatarListItemsArea">
                <DisplayConditions><CSControl:CSContextPropertyValueComparison ComparisonProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
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
    		                            <CSControl:ContentContainerData runat="server" Property="TitleHtml" LinkTo="View">
    		                                <LeaderTemplate><CSControl:ResourceControl ID="ResourceControl5" runat="server" ResourceName="SearchResults_PostTo" /> </LeaderTemplate>
    		                            </CSControl:ContentContainerData>
    		                            <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile">
    		                                <LeaderTemplate><CSControl:ResourceControl ID="ResourceControl6" runat="server" ResourceName="SearchResults_By" /> </LeaderTemplate>
    		                            </CSControl:UserData>
    		                            <CSControl:TaggableContentData runat="server" Property="Date">
    		                                <LeaderTemplate><CSControl:ResourceControl ID="ResourceControl7" runat="server" ResourceName="SearchResults_On" /> </LeaderTemplate>
    		                            </CSControl:TaggableContentData>
    		                            <CSControl:TaggableContentData runat="server" Property="Tags">
    		                                <LeaderTemplate><br /><CSControl:ResourceControl ID="ResourceControl2" runat="server" ResourceName="TagListTitle" /></LeaderTemplate>
    		                            </CSControl:TaggableContentData>
		                            </div>
		                        </li>
		                    </ItemTemplate>
		                    <AlternatingItemTemplate>
			                    <CSControl:TaggableContentData ID="TaggableContentData1" runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0} Alt&quot;&gt;" />
		                            <CSControl:TaggableContentData ID="TaggableContentData2" runat="server" Property="TitleHtml" LinkTo="View" Tag="H4" CssClass="CommonAvatarListItemName" />
		                            <CSControl:TaggableContentData ID="TaggableContentData3" runat="server" Property="ContentHtml" TruncateAt="300" Tag="Div" CssClass="CommonAvatarListItem" />
		                            <div class="CommonAvatarListItemDetails">
    		                            <CSControl:ContentContainerData ID="ContentContainerData1" runat="server" Property="TitleHtml" LinkTo="View">
    		                                <LeaderTemplate><CSControl:ResourceControl ID="ResourceControl5" runat="server" ResourceName="SearchResults_PostTo" /> </LeaderTemplate>
    		                            </CSControl:ContentContainerData>
    		                            <CSControl:UserData ID="UserData1" runat="server" Property="DisplayName" LinkTo="Profile">
    		                                <LeaderTemplate><CSControl:ResourceControl ID="ResourceControl6" runat="server" ResourceName="SearchResults_By" /> </LeaderTemplate>
    		                            </CSControl:UserData>
    		                            <CSControl:TaggableContentData ID="TaggableContentData4" runat="server" Property="Date">
    		                                <LeaderTemplate><CSControl:ResourceControl ID="ResourceControl7" runat="server" ResourceName="SearchResults_On" /> </LeaderTemplate>
    		                            </CSControl:TaggableContentData>
    		                            <CSControl:TaggableContentData ID="TaggableContentData5" runat="server" Property="Tags">
    		                                <LeaderTemplate><br /><CSControl:ResourceControl ID="ResourceControl1" runat="server" ResourceName="TagListTitle" /></LeaderTemplate>
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