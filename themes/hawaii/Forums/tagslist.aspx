<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true"  Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSForum:TagBreadCrumb runat="server" ShowHome="false" Tag="Div" CssClass="CommonBreadCrumbArea">
        <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate>
            <CSForum:TagRssLink runat="server"><LeaderTemplate>(</LeaderTemplate><TrailerTemplate>)</TrailerTemplate></CSForum:TagRssLink>
            </div>
        </TrailerTemplate>
    </CSForum:TagBreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="TagBrowser_Forums_Title" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <div class="CommonDescription">
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSForum:ForumPropertyValueComparison ComparisonProperty="SectionID" Operator="IsSetOrTrue" runat="server" /></ContentConditions>
                    <TrueContentTemplate>
                        <CSControl:ResourceControl ResourceName="TagBrowser_ShowingTagsForForum" runat="server">
                            <Parameter1Template><CSForum:ForumData Property="Name" LinkTo="HomePage" runat="server" /></Parameter1Template>
                        </CSControl:ResourceControl>
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions><CSForum:GroupPropertyValueComparison ComparisonProperty="GroupID" Operator="IsSetOrTrue" runat="server" /></ContentConditions>
                            <TrueContentTemplate>
                                <CSControl:ResourceControl ResourceName="TagBrowser_ShowingTagsForGroup" runat="server">
                                    <Parameter1Template><CSForum:GroupData Property="Name" LinkTo="GroupHome" runat="server" /></Parameter1Template>
                                </CSControl:ResourceControl>
                            </TrueContentTemplate>
                            <FalseContentTemplate>
                                <CSControl:ResourceControl ResourceName="TagBrowser_ShowingTagsForApplication" runat="server">
                                    <Parameter1Template><CSControl:SiteUrl UrlName="forumshome" ResourceName="forums" runat="server" /></Parameter1Template>
                                </CSControl:ResourceControl>
                            </FalseContentTemplate>
                        </CSControl:ConditionalContent>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
                <CSControl:ResourceControl ResourceName="TagBrowser_ShowAllTagsInTheSite" runat="server">
                    <Parameter1Template><CSControl:SiteUrl UrlName="tags_home" RenderRawUrl="true" Encoding="HTML" runat="server" /></Parameter1Template>
                </CSControl:ResourceControl>
            </div>

	        <CSForum:TagCloud TagCssClasses="CommonTag6,CommonTag5,CommonTag4,CommonTag3,CommonTag2,CommonTag1" TagCloudCssClass="CommonTagCloud" runat="server" />

	        <CSControl:PlaceHolder runat="server">
	            <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
	            <ContentTemplate>
                        <CSControl:IndexPostList runat="server">
                            <QueryOverrides PagerID="Pager" />
		                    <HeaderTemplate>
		                        <div class="CommonAvatarListItemsArea">
			                        <ul class="CommonAvatarListItemList">
		                    </HeaderTemplate>
		                    <ItemTemplate>
			                    <CSControl:IndexPostData runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0}&quot;&gt;" />
			                        <CSControl:IndexPostData runat="server" LinkTo="Post" Property="Title" Tag="H4" CssClass="CommonAvatarListItemName" />
			                        <CSControl:IndexPostData runat="server" Property="FormattedBody" TruncateAt="300" Tag="Div" CssClass="CommonAvatarListItem" />
				                    <div class="CommonAvatarListItemDetails">
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_PostTo" />
					                    <CSControl:IndexPostData Property="SectionName" LinkTo="Section" runat="server" />
					                    <CSControl:IndexPostData runat="server" LinkTo="Application" Property="ApplicationType" Text="({0})" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
					                    <CSControl:IndexPostData runat="Server" LinkTo="Author" Property="Username" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
					                    <CSControl:IndexPostData runat="server" Property="PostDate" />
					                    <CSControl:IndexPostData Property="Tags" runat="server">
				                            <LeaderTemplate><br /><CSControl:ResourceControl runat="server" ResourceName="TagListTitle" /></LeaderTemplate>
				                        </CSControl:IndexPostData>
				                    </div>
			                    </li>
		                    </ItemTemplate>
		                    <AlternatingItemTemplate>
			                    <CSControl:IndexPostData runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0} Alt&quot;&gt;" />
			                        <CSControl:IndexPostData runat="server" LinkTo="Post" Property="Title" Tag="H4" CssClass="CommonAvatarListItemName" />
			                        <CSControl:IndexPostData runat="server" Property="FormattedBody" TruncateAt="300" Tag="Div" CssClass="CommonAvatarListItem" />
				                    <div class="CommonAvatarListItemDetails">
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_PostTo" />
					                    <CSControl:IndexPostData Property="SectionName" LinkTo="Section" runat="server" />
					                    <CSControl:IndexPostData runat="server" LinkTo="Application" Property="ApplicationType" Text="({0})" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
					                    <CSControl:IndexPostData runat="Server" LinkTo="Author" Property="Username" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
					                    <CSControl:IndexPostData runat="server" Property="PostDate" />
					                    <CSControl:IndexPostData Property="Tags" runat="server">
				                            <LeaderTemplate><br /><CSControl:ResourceControl runat="server" ResourceName="TagListTitle" /></LeaderTemplate>
				                        </CSControl:IndexPostData>
				                    </div>
			                    </li>
		                    </AlternatingItemTemplate>
		                    <FooterTemplate>
			                        </ul>
			                    </div>
		                    </FooterTemplate>
                        </CSControl:IndexPostList>
                    </div>
                    <div class="CommonContentBoxFooter">
	                    <CSControl:Pager id="Pager" runat="server" ShowTotalSummary="true" />
	            </ContentTemplate>
	        </CSControl:PlaceHolder>
        </div>
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server"></asp:Content>