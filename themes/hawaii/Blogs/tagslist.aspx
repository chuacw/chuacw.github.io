<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" MasterPageFile="blogs.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSBlog:TagBreadCrumb runat="server" ShowHome="false" Tag="Div" CssClass="CommonBreadCrumbArea">
        <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate>
            <CSBlog:TagRssLink runat="server"><LeaderTemplate>(</LeaderTemplate><TrailerTemplate>)</TrailerTemplate></CSBlog:TagRssLink>
            </div>
        </TrailerTemplate>
    </CSBlog:TagBreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" Tag="H1" CssClass="CommonTitle" EnableRendering="true" ResourceName="TagBrowser_Blogs_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <div class="CommonDescription">
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSBlog:GroupPropertyValueComparison ComparisonProperty="GroupID" Operator="IsSetOrTrue" runat="server" /></ContentConditions>
                    <TrueContentTemplate>
                        <CSControl:ResourceControl ResourceName="TagBrowser_ShowingTagsForGroup" runat="server">
                            <Parameter1Template><CSBlog:GroupData Property="Name" LinkTo="GroupHome" runat="server" /></Parameter1Template>
                        </CSControl:ResourceControl>
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <CSControl:ResourceControl ResourceName="TagBrowser_ShowingTagsForApplication" runat="server">
                            <Parameter1Template><CSControl:SiteUrl UrlName="webloghome" ResourceName="weblogs" runat="server" /></Parameter1Template>
                        </CSControl:ResourceControl>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
                <CSControl:ResourceControl ResourceName="TagBrowser_ShowAllTagsInTheSite" runat="server">
                    <Parameter1Template><CSControl:SiteUrl UrlName="tags_home" RenderRawUrl="true" Encoding="HTML" runat="server" /></Parameter1Template>
                </CSControl:ResourceControl>
            </div>

	        <CSBlog:TagCloud TagCssClasses="CommonTag6,CommonTag5,CommonTag4,CommonTag3,CommonTag2,CommonTag1" TagCloudCssClass="CommonTagCloud" runat="server" />

	        <CSControl:PlaceHolder runat="server" Tag="Div" CssClass="CommonAvatarListItemsArea">
                <DisplayConditions><CSControl:CSContextPropertyValueComparison ComparisonProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                    <ContentTemplate>

                        <CSBlog:WeblogPostList runat="server">
                            <QueryOverrides PagerID="Pager" />
		                    <HeaderTemplate>
		                        <div class="CommonAvatarListItemsArea">
			                        <ul class="CommonAvatarListItemList">
		                    </HeaderTemplate>
		                    <ItemTemplate>
    		                    <CSBlog:WeblogPostData runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0}&quot;&gt;" />
			                        <CSBlog:WeblogPostData runat="server" LinkTo="Post" Property="Subject" Tag="H4" CssClass="CommonAvatarListItemName" />
			                        <CSBlog:WeblogPostData runat="server" Property="FormattedBody" TruncateAt="300" Tag="Div" CssClass="CommonAvatarListItem" />
				                    <div class="CommonAvatarListItemDetails">
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_PostTo" />
					                    <CSBlog:WeblogData Property="Name" LinkTo="HomePage" runat="server" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
					                    <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
					                    <CSBlog:WeblogPostData runat="server" Property="PostDate" />
					                    <CSBlog:WeblogPostTagEditableList runat="server">
					                        <LeaderTemplate><br /><CSControl:ResourceControl runat="server" ResourceName="TagListTitle" /></LeaderTemplate>
					                    </CSBlog:WeblogPostTagEditableList>
				                    </div>
			                    </li>
		                    </ItemTemplate>
		                    <AlternatingItemTemplate>
    		                    <CSBlog:WeblogPostData runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0} Alt&quot;&gt;" />
			                        <CSBlog:WeblogPostData runat="server" LinkTo="Post" Property="Subject" Tag="H4" CssClass="CommonAvatarListItemName" />
			                        <CSBlog:WeblogPostData runat="server" Property="FormattedBody" TruncateAt="300" Tag="Div" CssClass="CommonAvatarListItem" />
				                    <div class="CommonAvatarListItemDetails">
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_PostTo" />
					                    <CSBlog:WeblogData Property="Name" LinkTo="HomePage" runat="server" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
					                    <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
					                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
					                    <CSBlog:WeblogPostData runat="server" Property="PostDate" />
					                    <CSBlog:WeblogPostTagEditableList runat="server">
					                        <LeaderTemplate><br /><CSControl:ResourceControl runat="server" ResourceName="TagListTitle" /></LeaderTemplate>
					                    </CSBlog:WeblogPostTagEditableList>
				                    </div>
			                    </li>
		                    </AlternatingItemTemplate>
		                    <FooterTemplate>
			                        </ul>
			                    </div>
		                    </FooterTemplate>
                        </CSBlog:WeblogPostList>
                    </div>
                    <div class="CommonContentBoxFooter">
            	        <CSControl:Pager id="Pager" runat="server" ShowTotalSummary="true" />
	            </ContentTemplate>
	        </CSControl:PlaceHolder>
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server">
</asp:Content>