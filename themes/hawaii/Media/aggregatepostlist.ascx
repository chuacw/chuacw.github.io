<%@ Control Language="C#" AutoEventWireup="true"  %>

<div class="CommonContentBox">
    <div class="CommonContentBoxHeaderForm">
        <CSControl:ConditionalAction runat="server">
            <Conditions Operator="Or">
                <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="Subject" />
                <CSControl:Conditions runat="server" Operator="And">
                    <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="IsSetOrTrue" /></CSControl:Conditions>
                    <CSMedia:MediaGalleryPropertyValueComparison runat="server" ComparisonProperty="SectionID" Operator="IsSetOrTrue" />
                </CSControl:Conditions>
             </Conditions>
            <Actions>
                <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="AggregateMediaGalleryPostList" QueryOverrideProperty="SortBy" QueryOverrideValue="Subject" />
                <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="AggregateMediaGalleryPostList" QueryOverrideProperty="SortOrder" QueryOverrideValue="Ascending" />
                <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="AggregateMediaGalleryPostList" />
            </Actions>
        </CSControl:ConditionalAction>
        
        <CSControl:ConditionalAction runat="server">
            <Conditions Operator="Or">
                <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="PostDate" />
                <CSControl:Conditions runat="server" Operator="And">
                    <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="IsSetOrTrue" /></CSControl:Conditions>
                    <CSControl:Conditions runat="server" Operator="Not"><CSMedia:MediaGalleryPropertyValueComparison runat="server" ComparisonProperty="SectionID" Operator="IsSetOrTrue" /></CSControl:Conditions>
                </CSControl:Conditions>
                <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="IsSetOrTrue" /></CSControl:Conditions>
            </Conditions>
            <Actions>
                <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="AggregateMediaGalleryPostList" QueryOverrideProperty="SortBy" QueryOverrideValue="PostDate" />
                <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="AggregateMediaGalleryPostList" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
                <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="AggregateMediaGalleryPostList" />
            </Actions>
        </CSControl:ConditionalAction>
        
        <CSControl:ConditionalAction runat="server">
            <Conditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="Downloads" /></Conditions>
            <Actions>
                <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="AggregateMediaGalleryPostList" QueryOverrideProperty="SortBy" QueryOverrideValue="Downloads" />
                <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="AggregateMediaGalleryPostList" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
                <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="AggregateMediaGalleryPostList" />
            </Actions>
        </CSControl:ConditionalAction>
        
        <CSControl:ConditionalAction runat="server">
            <Conditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="Rating" /></Conditions>
            <Actions>
                <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="AggregateMediaGalleryPostList" QueryOverrideProperty="SortBy" QueryOverrideValue="Rating" />
                <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="AggregateMediaGalleryPostList" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
                <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="AggregateMediaGalleryPostList" />
            </Actions>
        </CSControl:ConditionalAction>
        
        <CSControl:ConditionalAction runat="server">
            <Conditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="Comments" /></Conditions>
            <Actions>
                <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="AggregateMediaGalleryPostList" QueryOverrideProperty="SortBy" QueryOverrideValue="Comments" />
                <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="AggregateMediaGalleryPostList" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
                <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="AggregateMediaGalleryPostList" />
            </Actions>
        </CSControl:ConditionalAction>    
    
        <table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td align="left">
            <div>
                <CSControl:ResourceControl runat="server" ResourceName="Sortby" />: 
                
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="MediaQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="Subject" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Name" QueryStringModification="Sort=Subject&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Name" QueryStringModification="Sort=Subject&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent> |
                
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="MediaQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="PostDate" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="MediaGalleries_PortalMediaGalleryPostListing_TitlePostDate" ResourceFile="MediaGallery.xml" QueryStringModification="Sort=PostDate&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="MediaGalleries_PortalMediaGalleryPostListing_TitlePostDate" ResourceFile="MediaGallery.xml" QueryStringModification="Sort=PostDate&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent> |
                
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="MediaQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="Downloads" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="MediaGalleries_PortalMediaGalleryPostListing_TitleDownloads" ResourceFile="MediaGallery.xml" QueryStringModification="Sort=Downloads&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="MediaGalleries_PortalMediaGalleryPostListing_TitleDownloads" ResourceFile="MediaGallery.xml" QueryStringModification="Sort=Downloads&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent> |
                
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="MediaQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="Rating" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="MediaGalleries_PortalMediaGalleryPostListing_TitleRating" ResourceFile="MediaGallery.xml" QueryStringModification="Sort=Rating&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="MediaGalleries_PortalMediaGalleryPostListing_TitleRating" ResourceFile="MediaGallery.xml" QueryStringModification="Sort=Rating&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent> |
                
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="MediaQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="Comments" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="MediaGalleries_PortalMediaGalleryPostListing_TitleReplies" ResourceFile="MediaGallery.xml" QueryStringModification="Sort=Comments&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="MediaGalleries_PortalMediaGalleryPostListing_TitleReplies" ResourceFile="MediaGallery.xml" QueryStringModification="Sort=Comments&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent>
            </div>
            <div style="margin-top: .25em;">
                <CSControl:ResourceControl runat="server" ResourceName="ShowAs" />:
                
                <CSMedia:SetUserMediaGalleryViewTypeForm runat="server" SubmitButtonId="Button" ViewType="Thumbnail">
                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                    <FormTemplate>
                        <CSControl:ConditionalContent runat="server">
		                    <ContentConditions><CSMedia:CurrentMediaGalleryViewTypeCondition runat="server" ViewType="Thumbnail" /></ContentConditions>
		                    <TrueContentTemplate><span style="font-weight: bold;"></TrueContentTemplate>
		                    <FalseContentTemplate><span></FalseContentTemplate>
		                </CSControl:ConditionalContent>
                            <CSControl:ResourceLinkButton ResourceName="MediaGalleryViewType_Thumbnail" ResourceFile="MediaGallery.xml" runat="server" ID="Button" />
                        </span>
                    </FormTemplate>
                </CSMedia:SetUserMediaGalleryViewTypeForm>
                |                
                <CSMedia:SetUserMediaGalleryViewTypeForm runat="server" SubmitButtonId="Button" ViewType="List">
                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                    <FormTemplate>
                        <CSControl:ConditionalContent runat="server">
		                    <ContentConditions><CSMedia:CurrentMediaGalleryViewTypeCondition runat="server" ViewType="List" /></ContentConditions>
		                    <TrueContentTemplate><span style="font-weight: bold;"></TrueContentTemplate>
		                    <FalseContentTemplate><span></FalseContentTemplate>
		                </CSControl:ConditionalContent>
                            <CSControl:ResourceLinkButton ResourceName="MediaGalleryViewType_List" ResourceFile="MediaGallery.xml" runat="server" ID="Button" />
                        </span>
                    </FormTemplate>
                </CSMedia:SetUserMediaGalleryViewTypeForm>
            </div>
        </td><td align="right">
            <CSMedia:MediaGalleryData runat="server" LinkTo="AddMediaGalleryPost" ResourceName="MediaGalleries_Button_Upload" ResourceFile="MediaGallery.xml" />
            <CSMedia:CreateMediaGalleryPostClickPopup PopupHeaderCssClass="CommonPostPopupHeader" PopupHeaderResourceName="CreateMediaGalleryPostClickPopup_Description" PopupListWrapperCssClass="CommonPostPopupListArea" PopupActivatorTag="Span" PopupActivatorActiveCssClass="CommonTextButtonHighlight" PopupActivatorCssClass="CommonTextButton" runat="server" PopupCssClass="CommonPostPopupArea" ListCssClass="CommonPostPopupList" MaximumNumberOfMediaGalleries="50">
                <DisplayConditions Operator="Not"><CSMedia:MediaGalleryPropertyValueComparison runat="server" ComparisonProperty="SectionID" Operator="IsSetOrTrue" /></DisplayConditions>
            </CSMedia:CreateMediaGalleryPostClickPopup>
        </td></tr></table>
    </div>

    <div class="CommonContentBoxContent">
    
        <CSMedia:MediaGalleryData runat="server" Property="Description" Tag="Div" CssClass="CommonDescription" />
		
        <CSMedia:MediaGalleryPostList runat="server" ID="AggregateMediaGalleryPostList">
            <QueryOverrides SortBy="Downloads" PageSize="20" PagerID="FilesPager" SortOrder="Descending" ID="MediaQuery" />
            <HeaderTemplate>
                <CSControl:ConditionalContent runat="server">
		            <ContentConditions><CSMedia:CurrentMediaGalleryViewTypeCondition runat="server" ViewType="Thumbnail" /></ContentConditions>
		            <TrueContentTemplate></TrueContentTemplate>
		            <FalseContentTemplate>
		                <div class="CommonListArea">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <thead>
                                    <tr>
                                        <th colspan="2" class="CommonListHeader"><CSControl:ResourceControl runat="server" ResourceName="MediaGalleries_FileList_Name" ResourceFile="Mediagallery.xml" /></th>
                                        <th class="CommonListHeader" style="text-align: center;"><CSControl:ResourceControl runat="server" ResourceName="MediaGalleries_FileList_Date" ResourceFile="Mediagallery.xml" /></th>
                                        <th class="CommonListHeader" style="text-align: center;"><CSControl:ResourceControl runat="server" ResourceName="MediaGalleries_FileList_Downloads" ResourceFile="Mediagallery.xml" /></th>
                                        <th class="CommonListHeader" style="text-align: center;"><CSControl:ResourceControl runat="server" ResourceName="MediaGalleries_FileList_Comments" ResourceFile="Mediagallery.xml" /></th>
                                    </tr>
                                </thead>
                                <tbody>
		            </FalseContentTemplate>
		        </CSControl:ConditionalContent>
            </HeaderTemplate>
            <ItemTemplate>
                <CSControl:ConditionalContent runat="server">
		            <ContentConditions><CSMedia:CurrentMediaGalleryViewTypeCondition runat="server" ViewType="Thumbnail" /></ContentConditions>
		            <TrueContentTemplate>
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
                                    <div style="font-size: 90%; height: 6.5em; overflow: hidden;">
                                        <CSControl:UserData Property="DisplayName" LinkTo="Profile" Text="{0}" Tag="Div" runat="server"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" /> </LeaderTemplate></CSControl:UserData>
                                        <CSMedia:MediaGalleryPostData runat="server" Property="PostDate" Tag="Div" />
                                        <CSMedia:MediaGalleryPostRating runat="server" IsReadOnly="true" Tag="Div" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" />
                                        <CSMedia:MediaGalleryPostData runat="server" Property="Downloads" ResourceName="MediaGallery_ListDownloads">
                                            <DisplayConditions><CSMedia:MediaGalleryPostPropertyValueComparison runat="server" ComparisonProperty="Downloads" Operator="greaterthan" ComparisonValue="0" /></DisplayConditions>
                                        </CSMedia:MediaGalleryPostData>
                                        <CSMedia:MediaGalleryPostData runat="server" Property="Replies" ResourceName="MediaGallery_Comments" LinkTo="View" Tag="Div">
                                            <DisplayConditions><CSMedia:MediaGalleryPostPropertyValueComparison runat="server" ComparisonProperty="Replies" Operator="GreaterThan" ComparisonValue="0" /></DisplayConditions>
                                        </CSMedia:MediaGalleryPostData>
                                    </div>
                                </div>
                            </div>
                            <div class="CommonFileRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>                        
                        </div>
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <tr class="CommonListRow">
                            <td class="CommonListCell CommonFileContainer">
                                <CSMedia:MediaGalleryPostData LinkTo="View" runat="server">
                                    <ContentTemplate><CSMedia:MediaGalleryPostViewer runat="server" ViewType="Preview" Width="48" Height="48" /></ContentTemplate>
                                </CSMedia:MediaGalleryPostData>
                            </td>
                            <td class="CommonListCell">
                                <CSMedia:MediaGalleryPostRating runat="server" IsReadOnly="true" Tag="Div" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/">
                                    <LeaderTemplate><div style="float: right; margin: 0 .5em;"></LeaderTemplate>
                                    <TrailerTemplate></div></TrailerTemplate>
                                </CSMedia:MediaGalleryPostRating>
                                                            
                                <CSMedia:MediaGalleryPostData runat="server" Property="Subject" LinkTo="View" Tag="Strong" TruncateAt="55" />
                                <CSControl:UserData Property="DisplayName" LinkTo="Profile" Text="{0}" Tag="Div" runat="server">
                                    <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" /> </LeaderTemplate>
                                </CSControl:UserData>
                                <CSMedia:MediaGalleryPostData runat="server" Property="FormattedBody" TruncateAt="95" TruncationEllipsisText="..." Tag="Div" />
                            </td>
                            <td class="CommonListCell" style="white-space: nowrap;text-align: center;">
                                <CSMedia:MediaGalleryPostData runat="server" Property="PostDate" />
                            </td>                                    
                            <td class="CommonListCell" style="text-align: center;">
                                <CSMedia:MediaGalleryPostData runat="server" Property="Downloads" />
                            </td>    
                            <td class="CommonListCell" style="text-align: center;">
                                <CSMedia:MediaGalleryPostData runat="server" Property="Replies" LinkTo="View" />
                            </td>
                        </tr>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <CSControl:ConditionalContent runat="server">
		            <ContentConditions><CSMedia:CurrentMediaGalleryViewTypeCondition runat="server" ViewType="Thumbnail" /></ContentConditions>
		            <TrueContentTemplate>
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
                                    <div style="font-size: 90%; height: 6.5em; overflow: hidden;">
                                        <CSControl:UserData Property="DisplayName" LinkTo="Profile" Text="{0}" Tag="Div" runat="server"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" /> </LeaderTemplate></CSControl:UserData>
                                        <CSMedia:MediaGalleryPostData runat="server" Property="PostDate" Tag="Div" />
                                        <CSMedia:MediaGalleryPostRating runat="server" IsReadOnly="true" Tag="Div" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" />
                                        <CSMedia:MediaGalleryPostData runat="server" Property="Downloads" ResourceName="MediaGallery_ListDownloads">
                                            <DisplayConditions><CSMedia:MediaGalleryPostPropertyValueComparison runat="server" ComparisonProperty="Downloads" Operator="greaterthan" ComparisonValue="0" /></DisplayConditions>
                                        </CSMedia:MediaGalleryPostData>
                                        <CSMedia:MediaGalleryPostData runat="server" Property="Replies" ResourceName="MediaGallery_Comments" LinkTo="View" Tag="Div">
                                            <DisplayConditions><CSMedia:MediaGalleryPostPropertyValueComparison runat="server" ComparisonProperty="Replies" Operator="GreaterThan" ComparisonValue="0" /></DisplayConditions>
                                        </CSMedia:MediaGalleryPostData>
                                    </div>
                                </div>
                            </div>
                            <div class="CommonFileRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>                        
                        </div>
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <tr class="CommontListRowAlt">
                            <td class="CommonListCell CommonFileContainer">
                                <CSMedia:MediaGalleryPostData LinkTo="View" runat="server">
                                    <ContentTemplate><CSMedia:MediaGalleryPostViewer runat="server" ViewType="Preview" Width="48" Height="48" /></ContentTemplate>
                                </CSMedia:MediaGalleryPostData>
                            </td>
                            <td class="CommonListCell">
                                <CSMedia:MediaGalleryPostRating runat="server" IsReadOnly="true" Tag="Div" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/">
                                    <LeaderTemplate><div style="float: right; margin: 0 .5em;"></LeaderTemplate>
                                    <TrailerTemplate></div></TrailerTemplate>
                                </CSMedia:MediaGalleryPostRating>
                                                            
                                <CSMedia:MediaGalleryPostData runat="server" Property="Subject" LinkTo="View" Tag="Strong" TruncateAt="55" />
                                <CSControl:UserData Property="DisplayName" LinkTo="Profile" Text="{0}" Tag="Div" runat="server">
                                    <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="SearchResults_By" /> </LeaderTemplate>
                                </CSControl:UserData>
                                <CSMedia:MediaGalleryPostData runat="server" Property="FormattedBody" TruncateAt="95" TruncationEllipsisText="..." Tag="Div" />
                            </td>
                            <td class="CommonListCell" style="white-space: nowrap;text-align: center;">
                                <CSMedia:MediaGalleryPostData runat="server" Property="PostDate" />
                            </td>                                    
                            <td class="CommonListCell" style="text-align: center;">
                                <CSMedia:MediaGalleryPostData runat="server" Property="Downloads" />
                            </td>    
                            <td class="CommonListCell" style="text-align: center;">
                                <CSMedia:MediaGalleryPostData runat="server" Property="Replies" LinkTo="View" />
                            </td>
                        </tr>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
            </AlternatingItemTemplate>
            <FooterTemplate>
                <CSControl:ConditionalContent runat="server">
		            <ContentConditions><CSMedia:CurrentMediaGalleryViewTypeCondition runat="server" ViewType="Thumbnail" /></ContentConditions>
		            <TrueContentTemplate>
		                <div style="clear:both;"></div>
		            </TrueContentTemplate>
		            <FalseContentTemplate>
		                        </tbody>
                            </table>
                        </div>
		            </FalseContentTemplate>
		        </CSControl:ConditionalContent>
            </FooterTemplate>            
             <NoneTemplate>
                <CSControl:ResourceControl runat="server" ResourceName="NoRecords" ResourceFile="MediaGallery.xml" />
            </NoneTemplate>
        </CSMedia:MediaGalleryPostList>
        
    </div>
    <div class="CommonContentBoxFooter">
        <CSControl:Pager runat="server" ID="FilesPager" ShowTotalSummary="true" />
        <CSMedia:MediaGalleryData LinkTo="Slideshow" ResourceName="MediaGallery_ViewSlideshow" runat="server"><LeaderTemplate> | </LeaderTemplate></CSMedia:MediaGalleryData>
        <CSMedia:MediaGalleryData LinkTo="rss" ResourceName="Rss" runat="server">
            <LeaderTemplate>| </LeaderTemplate>
        </CSMedia:MediaGalleryData>
    </div>
</div>