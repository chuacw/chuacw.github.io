<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" MasterPageFile="mediagalleries.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSMedia:TagBreadCrumb runat="server" ShowHome="false" Tag="Div" CssClass="CommonBreadCrumbArea">
        <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate>
            <CSMedia:TagRssLink runat="server"><LeaderTemplate>(</LeaderTemplate><TrailerTemplate>)</TrailerTemplate></CSMedia:TagRssLink>
            </div>
        </TrailerTemplate>
    </CSMedia:TagBreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" Tag="H1" CssClass="CommonTitle" EnableRendering="true" ResourceName="TagBrowser_Media_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

	        <div class="CommonDescription">
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSMedia:MediaGalleryPropertyValueComparison ComparisonProperty="SectionID" Operator="IsSetOrTrue" runat="server" /></ContentConditions>
                    <TrueContentTemplate>
                        <CSControl:ResourceControl ResourceName="TagBrowser_ShowingTagsForMediaGallery" runat="server">
                            <Parameter1Template><CSMedia:MediaGalleryData Property="Name" LinkTo="MediaGalleryHome" runat="server" /></Parameter1Template>
                        </CSControl:ResourceControl>
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions><CSMedia:GroupPropertyValueComparison ComparisonProperty="GroupID" Operator="IsSetOrTrue" runat="server" /></ContentConditions>
                            <TrueContentTemplate>
                                <CSControl:ResourceControl ResourceName="TagBrowser_ShowingTagsForGroup" runat="server">
                                    <Parameter1Template><CSMedia:GroupData Property="Name" LinkTo="GroupHome" runat="server" /></Parameter1Template>
                                </CSControl:ResourceControl>
                            </TrueContentTemplate>
                            <FalseContentTemplate>
                                <CSControl:ResourceControl ResourceName="TagBrowser_ShowingTagsForApplication" runat="server">
                                    <Parameter1Template><CSControl:SiteUrl UrlName="mediagallerieshome" ResourceName="media" runat="server" /></Parameter1Template>
                                </CSControl:ResourceControl>
                            </FalseContentTemplate>
                        </CSControl:ConditionalContent>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
                <CSControl:ResourceControl ResourceName="TagBrowser_ShowAllTagsInTheSite" runat="server">
                    <Parameter1Template><CSControl:SiteUrl UrlName="tags_home" RenderRawUrl="true" Encoding="HTML" runat="server" /></Parameter1Template>
                </CSControl:ResourceControl>
            </div>    	    
            
		    <CSMedia:TagCloud TagCssClasses="CommonTag6,CommonTag5,CommonTag4,CommonTag3,CommonTag2,CommonTag1" TagCloudCssClass="CommonTagCloud" runat="server" NoTagsResourceName="" />

            <CSControl:PlaceHolder runat="server">
                <DisplayConditions><CSControl:CSContextPropertyValueComparison ComparisonProperty="Tags" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                <ContentTemplate>
                            <CSMedia:MediaGalleryPostList runat="server" ShowHeaderFooterOnNone="false">
                            <QueryOverrides SortBy="Subject" PageSize="20" PagerID="Pager" />
                            <ItemTemplate>
                                <div class="CommonFileArea">
                                    <div class="CommonFileRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                                    <div class="CommonFileContent">
                                        <div class="CommonFile"><table cellpadding="0" cellspacing="0" border="0"><tr><td class="CommonFileInner">
                                            <CSMedia:MediaGalleryPostData LinkTo="View" runat="server">
                                                <ContentTemplate><CSMedia:MediaGalleryPostViewer runat="server" ViewType="Preview" Width="131" Height="94" /></ContentTemplate>
                                            </CSMedia:MediaGalleryPostData>
                                            <CSMedia:MediaGalleryPostData LinkTo="View" runat="server" Text="&amp;nbsp;" LinkCssClass="CommonFileLink" />
                                        </td></tr></table></div>
                                        <div class="CommonFileDetails">
                                            <CSMedia:MediaGalleryPostData runat="server" Property="Subject" LinkTo="View" Tag="Strong" TruncateAt="15" />
                                            <div style="font-size: 90%; height: 5em; overflow: hidden;">
                                                <CSControl:UserData Property="DisplayName" LinkTo="Profile" Text="{0}" Tag="Div" runat="server"><LeaderTemplate>by </LeaderTemplate></CSControl:UserData>
                                                <CSMedia:MediaGalleryPostData runat="server" Property="PostDate" Tag="Div" />
                                                <CSMedia:MediaGalleryPostRating runat="server" IsReadOnly="true" Tag="Div" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" />
                                                <CSMedia:MediaGalleryPostData runat="server" Property="Replies" ResourceName="MediaGallery_Comments" LinkTo="View" Tag="Div" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="CommonFileRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>                        
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                <div style="clear:both;"></div>
                            </FooterTemplate>       
                        </CSMedia:MediaGalleryPostList>
                    </div>
                    <div class="CommonContentBoxFooter">
                        <CSControl:Pager runat="server" ID="Pager" ShowTotalSummary="true" />
                </ContentTemplate>
            </CSControl:PlaceHolder>	    
            
        </div>
    </div>
       	
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="lcr"></asp:Content>