<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="Search" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<div class="CommonContentBox">    
    <div class="CommonContentBoxHeaderForm">
        <CSControl:SearchForm runat="server"
          QueryTextBoxId="SearchTextTop"
          SubmitButtonId="SearchButtonTop"
          Tag="Div"
          CssClass="CommonFormArea"
          DefaultSearchText="Search this site"
          >
            <FormTemplate>
	            <CSControl:DefaultButtonTextBox ButtonId="SearchButtonTop" id="SearchTextTop" runat="server"  columns="55" onkeyup="if (this.value == '') this.className = 'CommonSearchInputEmpty'; else this.className = 'CommonSearchInputNormal';" class="CommonSearchInputEmpty" />
	            <CSControl:ResourceButton id="SearchButtonTop" ResourceName="Search" runat="server" /> 
		    </FormTemplate>
		</CSControl:SearchForm>
    </div>
	<div class="CommonContentBoxContent">
	
        <CSControl:IndexPostList runat="server" ShowHeaderFooterOnNone="false">
            <QueryOverrides PagerID="SearchPager" />
	        <HeaderTemplate>
	            <div class="CommonAvatarListItemsArea">
		            <ul class="CommonAvatarListItemList">
	        </HeaderTemplate>
	        <ItemTemplate>
		        <CSControl:IndexPostData runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0}&quot;&gt;" />
		            <CSControl:IndexPostData runat="server" Property="Title" LinkTo="Post" Tag="h4" CssClass="CommonAvatarListItemName" />
			        <div class="CommonAvatarListItem">
				        <CSControl:IndexPostData runat="server" Property="BestMatch" />
			        </div>
			        <div class="CommonAvatarListItemDetails">
				        <CSControl:ResourceControl runat="server" ResourceName="SearchResults_PostTo" />
				        <CSControl:IndexPostData Property="SectionName" LinkTo="Section" runat="server" />
				        <CSControl:IndexPostData Property="ApplicationType" LinkTo="Application" Text="({0})" runat="server" />
				        <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
				        <CSControl:IndexPostData Property="UserName" LinkTo="Author" runat="server" />
				        <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
				        <CSControl:IndexPostData Property="PostDate" runat="server" />
				        <CSControl:IndexPostData Property="Tags" runat="server">
				            <LeaderTemplate><br /><CSControl:ResourceControl runat="server" ResourceName="TagListTitle" /></LeaderTemplate>
				        </CSControl:IndexPostData>
			        </div>
		        </li>
	        </ItemTemplate>
	        <AlternatingItemTemplate>
		        <CSControl:IndexPostData runat="server" Property="ApplicationType" Text="&lt;li class=&quot;CommonAvatarListItemArea {0} Alt&quot;&gt;" />
		            <CSControl:IndexPostData runat="server" Property="Title" LinkTo="Post" Tag="h4" CssClass="CommonAvatarListItemName" />
			        <div class="CommonAvatarListItem">
				        <CSControl:IndexPostData runat="server" Property="BestMatch" />
			        </div>
			        <div class="CommonAvatarListItemDetails">
				        <CSControl:ResourceControl runat="server" ResourceName="SearchResults_PostTo" />
				        <CSControl:IndexPostData Property="SectionName" LinkTo="Section" runat="server" />
				        <CSControl:IndexPostData Property="ApplicationType" LinkTo="Application" Text="({0})" runat="server" />
				        <CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" />
				        <CSControl:IndexPostData Property="UserName" LinkTo="Author" runat="server" />
				        <CSControl:ResourceControl runat="server" ResourceName="SearchResults_On" />
				        <CSControl:IndexPostData Property="PostDate" runat="server" />
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
	        <NoneTemplate>
	            <CSControl:ResourceControl runat="server" ResourceName="SearchView_NoResults" Tag="Div" CssClass="CommonMessageWarning" />
	        </NoneTemplate>
        </CSControl:IndexPostList>

	</div>
	<div class="CommonContentBoxFooter">
	    <CSControl:Pager id="SearchPager" runat="server" ShowTotalSummary="true">
	        <TrailerTemplate> | </TrailerTemplate>
	    </CSControl:Pager>
	    <CSControl:IndexPostRssLink runat="server">
            <TrailerTemplate> | </TrailerTemplate>
        </CSControl:IndexPostRssLink>
	    <CSControl:SiteUrl UrlName="search_Advanced" ResourceName="Search_MoreSearchOptions" runat="server">
            <UrlQueryStringModificationTemplate>q=<CSControl:QueryStringData Property="q" Encoding="URL" runat="server" /></UrlQueryStringModificationTemplate>
        </CSControl:SiteUrl>
	</div>
</div>

</asp:Content>

