<%@ Register TagPrefix="CSUserControl" TagName="AdTop" Src="/Themes/CS2008-Common/Ad-Top.ascx" %>
<%@ Register TagPrefix="CSUserControl" TagName="AdBottom" Src="/Themes/CS2008-Common/Ad-Bottom.ascx" %>
<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" MasterPageFile="blogs.Master" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="weblogs" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions Operator="Not"><CSBlog:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
    </CSControl:Title>

    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions><CSBlog:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate><CSBlog:GroupData runat="server" Property="Name" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

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
        
            <CSControl:ResourceControl runat="server" ResourceName="UserSearchControl_SortBy" />:
            
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

    <!-- AdPart chuacw -->
    <CSControl:AdPart runat = "Server" contentname="StandardTop" ContentCssClass="CommonContentPartBorderOff" ContentHoverCssClass="CommonContentPartBorderOn">
	<DefaultContentTemplate>
	<CSUserControl:AdTop runat="server" />
	</DefaultContentTemplate>
    </CSControl:AdPart>

		    <CSBlog:WeblogPostList runat="Server" ID="Posts">
		        <QueryOverrides PagerID="Pager" IsAggregate="true" SortBy="MostRecent" ID="PostsQuery" />
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
			                        <CSControl:ResourceControl runat="server" ResourceName="SearchResults_PostTo" />
				                    <CSBlog:WeblogData Property="Name" LinkTo="HomePage" runat="server" />
				                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
				                    <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
				                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
				                    <CSBlog:WeblogPostData runat="server" Property="PostDate" />
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
		                            <CSControl:ResourceControl runat="server" ResourceName="SearchResults_PostTo" />
				                    <CSBlog:WeblogData Property="Name" LinkTo="HomePage" runat="server" />
				                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
				                    <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
				                    <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
				                    <CSBlog:WeblogPostData runat="server" Property="PostDate" />
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
	            <NoneTemplate>
	                <CSControl:ResourceControl runat="server" ResourceName="Weblog_NoPosts_Created" />
	            </NoneTemplate>
            </CSBlog:WeblogPostList>

    <!-- AdPart chuacw 1 May 2011 -->
    <CSControl:AdPart runat="Server" ContentName="StandardBottom" ContentCssClass="CommonContentPartBorderOff" ContentHoverCssClass="CommonContentPartBorderOn">
      <DefaultContentTemplate>
    	<CSUserControl:AdBottom runat="server" />
      </DefaultContentTemplate>
    </CSControl:AdPart>
            
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:Pager runat="Server" id="Pager"  />
        </div>
    </div>
	
</asp:Content>