<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="theme.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSWiki:TagBreadCrumb runat="server" ShowHome="false" Tag="Div" CssClass="CommonBreadCrumbArea">
        <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate>
            <CSWiki:TagRssLink runat="server"><LeaderTemplate>(</LeaderTemplate><TrailerTemplate>)</TrailerTemplate></CSWiki:TagRssLink>
            </div>
        </TrailerTemplate>
    </CSWiki:TagBreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="TagBrowser_Wikis_Title" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <div class="CommonDescription">
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSWiki:WikiPropertyValueComparison ComparisonProperty="ID" Operator="IsSetOrTrue" runat="server" /></ContentConditions>
                    <TrueContentTemplate>
                        <CSControl:ResourceControl ResourceName="TagBrowser_ShowingTagsForWiki" runat="server">
                            <Parameter1Template><CSWiki:WikiData Property="Name" LinkTo="HomePage" runat="server" /></Parameter1Template>
                        </CSControl:ResourceControl>
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <CSControl:ResourceControl ResourceName="TagBrowser_ShowingTagsForApplication" runat="server">
                            <Parameter1Template><CSControl:SiteUrl UrlName="wikishome" ResourceName="wikis" runat="server" /></Parameter1Template>
                        </CSControl:ResourceControl>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
                <CSControl:ResourceControl ResourceName="TagBrowser_ShowAllTagsInTheSite" runat="server">
                    <Parameter1Template><CSControl:SiteUrl UrlName="tags_home" RenderRawUrl="true" Encoding="HTML" runat="server" /></Parameter1Template>
                </CSControl:ResourceControl>
            </div>

	        <CSWiki:TagCloud TagCssClasses="CommonTag6,CommonTag5,CommonTag4,CommonTag3,CommonTag2,CommonTag1" TagCloudCssClass="CommonTagCloud" runat="server" />

	        <CSControl:PlaceHolder runat="server">
	            <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
	            <ContentTemplate>
	                <CSWiki:PageList runat="server">
	                    <QueryOverrides PagerID="Pager" />
		                    <HeaderTemplate>
		                        <div class="CommonAvatarListItemsArea">
			                        <ul class="CommonAvatarListItemList">
		                    </HeaderTemplate>
		                    <ItemTemplate>
		                        <li class="CommonAvatarListItemArea Wiki">
			                        <CSWiki:PageData runat="server" LinkTo="Page" Property="Title" Tag="H4" CssClass="CommonAvatarListItemName" />
			                        <CSWiki:PageData runat="server" Property="FormattedBody" TruncateAt="300" Tag="Div" CssClass="CommonAvatarListItem" />
				                    <div class="CommonAvatarListItemDetails">
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_PostTo" />
					                    <CSWiki:WikiData Property="Name" LinkTo="HomePage" runat="server" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
					                    <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
					                    <CSWiki:PageData runat="server" Property="LastModifiedDate" />
					                    <CSWiki:PageTagEditableList runat="server">
					                        <LeaderTemplate><br /><CSControl:ResourceControl runat="server" ResourceName="TagListTitle" /></LeaderTemplate>
					                    </CSWiki:PageTagEditableList>
				                    </div>
			                    </li>
		                    </ItemTemplate>
		                    <AlternatingItemTemplate>
		                        <li class="CommonAvatarListItemArea Wiki Alt">
			                        <CSWiki:PageData runat="server" LinkTo="Page" Property="Title" Tag="H4" CssClass="CommonAvatarListItemName" />
			                        <CSWiki:PageData runat="server" Property="FormattedBody" TruncateAt="300" Tag="Div" CssClass="CommonAvatarListItem" />
				                    <div class="CommonAvatarListItemDetails">
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_PostTo" />
					                    <CSWiki:WikiData Property="Name" LinkTo="HomePage" runat="server" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
					                    <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
					                    <CSWiki:PageData runat="server" Property="LastModifiedDate" />
					                    <CSWiki:PageTagEditableList runat="server">
					                        <LeaderTemplate><br /><CSControl:ResourceControl runat="server" ResourceName="TagListTitle" /></LeaderTemplate>
					                    </CSWiki:PageTagEditableList>
				                    </div>
			                    </li>
		                    </AlternatingItemTemplate>
		                    <FooterTemplate>
			                        </ul>
			                    </div>
		                    </FooterTemplate>
	                </CSWiki:PageList>
	            
                    </div>
                    <div class="CommonContentBoxFooter">
	                    <CSControl:Pager id="Pager" runat="server" ShowTotalSummary="true" />
	            </ContentTemplate>
	        </CSControl:PlaceHolder>
        </div>
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server"></asp:Content>