<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSectionOrHubName="false" IncludeSiteName="true" EnableRendering="true">
        <ContentTemplate>
            <CSBlog:WeblogData Property="Name" runat="server" Tag="H1" ContainerId="titleWrapper" CssClass="CommonTitle">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="weblogs.weblogday" /></DisplayConditions>
                <LeaderTemplate><CSControl:CSContextData runat="server" Property="Date" FormatString="MMMM dd, yyyy" /> - </LeaderTemplate>
            </CSBlog:WeblogData>
            <CSBlog:WeblogData Property="Name" runat="server" Tag="H1" ContainerId="titleWrapper" CssClass="CommonTitle">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="weblogs.weblogmonth" /></DisplayConditions>
                <LeaderTemplate><CSControl:CSContextData runat="server" Property="Date" FormatString="MMMM yyyy" /> - </LeaderTemplate>
           </CSBlog:WeblogData>
            <CSBlog:PostCategoryData Property="Name" runat="server" Tag="h1" ContainerId="titleWrapper" CssClass="CommonTitle">
                <DisplayConditions Operator="Or">
                    <CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="weblogs.weblogpostcategory" />
                    <CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="weblogs.weblogarticlecategory" />
                </DisplayConditions>
                <TrailerTemplate> - <CSBlog:WeblogData Property="Name" runat="server" /></TrailerTemplate>
            </CSBlog:PostCategoryData>
            <CSBlog:WeblogData Property="Name" runat="server" Tag="H1" ContainerId="titleWrapper" CssClass="CommonTitle">
                <DisplayConditions>
                    <CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="weblogs.weblogapplication" />
                </DisplayConditions>
            </CSBlog:WeblogData>
        </ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="Server">

     <div class="CommonContentBox">
        <div class="CommonContentBoxHeaderForm">
        
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
		                        <CSBlog:WeblogPostRating runat="server" IsReadOnly="true" RatingCssClass="RateControl" RatingReadOnlyCssClass="RateControlReadOnly" RatingActiveCssClass="RateControlActive" ImagesBaseUrl="~/utility/images/" />
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
	                            <CSBlog:WeblogPostRating runat="server" IsReadOnly="true" RatingCssClass="RateControl" RatingReadOnlyCssClass="RateControlReadOnly" RatingActiveCssClass="RateControlActive" ImagesBaseUrl="~/utility/images/" />
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
	                <CSControl:ResourceControl runat="server" ResourceName="Weblog_NoPosts_Created" />
	            </NoneTemplate>
	            <FooterTemplate>
		                </ul>
                    </div>
	            </FooterTemplate>
            </CSBlog:WeblogPostList>
            
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:Pager runat="Server" id="Pager"  />
        </div>
    </div>
       
</asp:Content>
