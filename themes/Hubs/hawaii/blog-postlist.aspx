<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSBlog:WeblogData LinkTo="HomePage" ResourceName="Button_Weblog" runat="server" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" IncludeSectionOrHubName="true">
        <ContentTemplate>
            <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_Posts" Tag="h1" ContainerId="titleWrapper" CssClass="CommonTitle">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="hubs.hub_blog_day" /></DisplayConditions>
                <LeaderTemplate><CSControl:CSContextData runat="server" Property="Date" FormatString="MMMM dd, yyyy" /> - </LeaderTemplate>
            </CSControl:ResourceControl>
            <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_Posts" Tag="h1" ContainerId="titleWrapper" CssClass="CommonTitle">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="hubs.hub_blog_month" /></DisplayConditions>
                <LeaderTemplate><CSControl:CSContextData runat="server" Property="Date" FormatString="MMMM yyyy" /> - </LeaderTemplate>
            </CSControl:ResourceControl>
            <CSControl:ResourceControl runat="server" ResourceName="Button_Weblog" Tag="h1" ContainerId="titleWrapper" CssClass="CommonTitle">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="hubs.hub_blog" /></DisplayConditions>
            </CSControl:ResourceControl>
        </ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxHeaderForm">
            <div style="float: right;">
	            <CSBlog:WeblogData runat="server" LinkTo="PostEditor" ResourceName="Hubs_CreatePost" />
            </div>
            
            <CSControl:ConditionalAction runat="server">
                <Conditions Operator="Or">
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="MostRecent" />
                    <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="IsSetOrTrue" /></CSControl:Conditions>
                </Conditions>
                <Actions>
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Posts" QueryOverrideProperty="SortBy" QueryOverrideValue="MostRecent" />
                    <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="Posts" />
                </Actions>
            </CSControl:ConditionalAction>
            
            <CSControl:ConditionalAction runat="server">
                <Conditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="MostViewed" /></Conditions>
                <Actions>
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Posts" QueryOverrideProperty="SortBy" QueryOverrideValue="MostViewed" />
                    <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="Posts" />
                </Actions>
            </CSControl:ConditionalAction>
            
            <CSControl:ConditionalAction runat="server">
                <Conditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="MostComments" /></Conditions>
                <Actions>
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Posts" QueryOverrideProperty="SortBy" QueryOverrideValue="MostComments" />
                    <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="Posts" />
                </Actions>
            </CSControl:ConditionalAction>
        
            <CSControl:ResourceControl runat="server" ResourceName="Sortby" />: 
            
            <CSControl:ConditionalContent runat="server">
                <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="PostsQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="MostRecent" runat="server" /></ContentConditions>
                <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="MostRecent" QueryStringModification="Sort=MostRecent&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="MostRecent" QueryStringModification="Sort=MostRecent&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
            </CSControl:ConditionalContent> |
            
            <CSControl:ConditionalContent runat="server">
                <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="PostsQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="MostViewed" runat="server" /></ContentConditions>
                <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="MostViewed" QueryStringModification="Sort=MostViewed&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="MostViewed" QueryStringModification="Sort=MostViewed&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
            </CSControl:ConditionalContent> |
            
            <CSControl:ConditionalContent runat="server">
                <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="PostsQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="MostComments" runat="server" /></ContentConditions>
                <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="MostCommented" QueryStringModification="Sort=MostComments&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="MostCommented" QueryStringModification="Sort=MostComments&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
            </CSControl:ConditionalContent>
            
        </div>
        <div class="CommonContentBoxContent">

		    <CSBlog:WeblogPostList runat="Server" ID="Posts">
		        <QueryOverrides PagerID="Pager" BlogThreadType="AutoDetect" SortBy="MostRecent" ID="PostsQuery" />
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
			                        <CSBlog:WeblogPostData Property="UserTime" LinkTo="Post" IncludeTimeInDate="true" runat="server" />
        				            
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
	            <NoneTemplate>
	                <div class="CommonMessageWarning">
	                    <CSControl:ResourceControl runat="server" ResourceName="Weblog_NoPosts_Created" />
	                </div>
	            </NoneTemplate>
	            <FooterTemplate>
		                </ul>
                    </div>
	            </FooterTemplate>
            </CSBlog:WeblogPostList>
            
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:Pager runat="Server" id="Pager" ShowTotalSummary="true" />
            <CSBlog:WeblogData runat="server" LinkTo="rss" ResourceName="Rss">
                <LeaderTemplate>| </LeaderTemplate>
            </CSBlog:WeblogData>
        </div>
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcrc" runat="server">
    
    <CSControl:PlaceHolder runat="server" Tag="UL" CssClass="CommonContentBoxList Seperator">
        <DisplayConditions Operator="Or">
            <CSHub:HubPermissionCondition runat="server" Permission="Administer" />
            <CSBlog:WeblogPermissionCondition runat="server" Permission="Post" />
        </DisplayConditions>
        <ContentTemplate>
            <CSBlog:WeblogData runat="server" LinkTo="PostEditor" ResourceName="Hubs_CreatePost" Tag="Li" />
			<CSMail:MailingListData runat="server" LinkTo="MailingList" ResourceName="Hubs_CreatePostByEmail" Tag="LI" />
        </ContentTemplate>
    </CSControl:PlaceHolder>

</asp:Content>