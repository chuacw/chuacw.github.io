<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSBlog:TagBreadCrumb runat="server" ShowHome="false" Tag="Div" CssClass="CommonBreadCrumbArea">
        <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
        <LeaderTemplate>
            <div class="Common">
                <CSBlog:WeblogData LinkTo="HomePage" Property="Name" runat="server" />
                &raquo;
        </LeaderTemplate>
        <TrailerTemplate>
            <CSBlog:TagRssLink runat="server"><LeaderTemplate>(</LeaderTemplate><TrailerTemplate>)</TrailerTemplate></CSBlog:TagRssLink>
            </div>
        </TrailerTemplate>
    </CSBlog:TagBreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" ResourceName="TagBrowser_Title" IncludeSectionOrHubName="true" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="Server">
    
    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
    
            <CSBlog:TagCloud runat="server" TagCssClasses="CommonTag6,CommonTag5,CommonTag4,CommonTag3,CommonTag2,CommonTag1" TagCloudCssClass="CommonTagCloud" NoRelatedTagsResourceName="TagCloud_NoSubTagsDefined" NoTagsResourceName="TagCloud_NoTagsDefined" />

            <CSBlog:WeblogPostList runat="server">
                <QueryOverrides PagerID="Pager" />
                <DisplayConditions>
                    <CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" />
                </DisplayConditions>
                <HeaderTemplate>
		            <div class="CommonAvatarListItemsArea">
		                <ul class="CommonAvatarListItemList">
	            </HeaderTemplate>
	            <ItemTemplate>
	                <li class="CommonAvatarListItemArea Custom">
	                    <CSControl:UserAvatar runat="server" Tag="Div" CssClass="CustomAvatarListItemCustomAvatar" Width="60" Height="60" />
	                    <div class="CustomAvatarListCustomContent">
	                        <CSBlog:WeblogPostData Property="Subject" LinkTo="Post" Tag="H4" CssClass="CommonAvatarListItemName" runat="server" />
		                    <CSBlog:WeblogPostData Property="Excerpt" Tag="Div" CssClass="CommonAvatarListItem" runat="server" />
		                    <div class="CommonAvatarListItemDetails">
			                    <div>
			                        <CSControl:ResourceControl runat="server" ResourceName="Weblog_ContentList_Published" />
			                        <CSBlog:WeblogPostData Property="UserTime" FormatString="ddd, d MMM yyyy @ h:mm tt" LinkTo="Post" IncludeTimeInDate="true" runat="server" />
        				            
			                        <CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_By" /> 
			                        <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
			                    </div>
		                        <CSBlog:WeblogPostTagEditableList runat="server" EditorCssClass="CommonInlineTagEditor" Tag="Div" />
		                    </div>
                        </div>
		            </li>
	            </ItemTemplate>
	            <AlternatingItemTemplate>
	                <li class="CommonAvatarListItemArea Custom Alt">
                        <CSControl:UserAvatar runat="server" Tag="Div" CssClass="CustomAvatarListItemCustomAvatar" Width="60" Height="60" />
                        <div class="CustomAvatarListCustomContent">
                            <CSBlog:WeblogPostData Property="Subject" LinkTo="Post" Tag="H4" CssClass="CommonAvatarListItemName" runat="server" />
	                        <CSBlog:WeblogPostData Property="Excerpt" Tag="Div" CssClass="CommonAvatarListItem" runat="server" />
	                        <div class="CommonAvatarListItemDetails">
		                        <div>
		                            <CSControl:ResourceControl runat="server" ResourceName="Weblog_ContentList_Published" />
		                            <CSBlog:WeblogPostData Property="UserTime" LinkTo="Post" IncludeTimeInDate="true" runat="server" />
        				            
		                            <CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_By" /> 
		                            <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
		                        </div>
	                            <CSBlog:WeblogPostTagEditableList runat="server" EditorCssClass="CommonInlineTagEditor" Tag="Div" />
	                        </div>
                        </div>
		            </li>
	            </AlternatingItemTemplate>
	            <FooterTemplate>
		                </ul>
                    </div>
	            </FooterTemplate>
            </CSBlog:WeblogPostList>

        </div>
        <CSControl:Pager runat="Server" id="Pager" Tag="Div" CssClass="CommonContentBoxFooter">
            <DisplayConditions>
                <CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" />
            </DisplayConditions>
        </CSControl:Pager>
    </div>
</asp:Content>
