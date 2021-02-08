<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSControl:ResourceControl runat="server" ResourceName="Search" />    
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" Text="Search" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
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
        
            <CSControl:PlaceHolder runat="server">
                <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="q" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                <ContentTemplate>

                        <CSControl:IndexPostList runat="server" ShowHeaderFooterOnNone="false">
                            <QueryOverrides PagerID="PagerBottom" />
                            <HeaderTemplate>
                                <div class="CommonAvatarListItemsArea">
	                            <ul class="CommonAvatarListItemList">
                            </HeaderTemplate>
                            <ItemTemplate>
	                            <li>
	                            <CSControl:IndexPostData runat="server" Property="ApplicationType" Text="&lt;div class=&quot;CommonAvatarListItemArea {0}&quot;&gt;" />
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
	                            </div>
	                            </li>
                            </ItemTemplate>
                            <FooterTemplate>
	                            </ul>
	                            </div>
                            </FooterTemplate>
                            <NoneTemplate>
                                <CSControl:ResourceControl runat="server" ResourceName="SearchView_NoResults" Tag="Div" CssClass="CommonMessageError" />
                            </NoneTemplate>
                        </CSControl:IndexPostList>
           		    
   		            </div>
   		            <div class="CommonContentBoxFooter">
                        <CSControl:Pager id="PagerBottom" runat="server" ShowTotalSummary="true" />
                        <CSControl:IndexPostRssLink runat="server" Tag="Div" Text="RSS">
	                        <LeaderTemplate> | </LeaderTemplate>
	                    </CSControl:IndexPostRssLink>
                </ContentTemplate>
            </CSControl:PlaceHolder>
    
        </div>
    </div>
    
</asp:Content>