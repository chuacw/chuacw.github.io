<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSForum:BreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <DisplayConditions><CSControl:QueryStringPropertyComparison QueryStringProperty1="GroupID" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSForum:BreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">

    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="forums" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions Operator="Not"><CSForum:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
    </CSControl:Title>

    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions><CSForum:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate><CSForum:GroupData runat="server" Property="Name" /></ContentTemplate>
    </CSControl:Title>

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
    
        <div class="CommonContentBoxHeaderForm">
        
            <CSControl:ConditionalAction runat="server">
                <Conditions Operator="Or">
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="Active" />
                    <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="IsSetOrTrue" /></CSControl:Conditions>
                </Conditions>
                <Actions>
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="ActiveTopics" QueryOverrideValue="true" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UnAnsweredOnly" QueryOverrideValue="false" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UnReadOnly" QueryOverrideValue="false" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UserFilter" QueryOverrideValue="All" />
                    <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="Threads" />
                </Actions>
            </CSControl:ConditionalAction>
            
            <CSControl:ConditionalAction runat="server">
                <Conditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="Unanswered" /></Conditions>
                <Actions>
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UnAnsweredOnly" QueryOverrideValue="true" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="ActiveTopics" QueryOverrideValue="false" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UnReadOnly" QueryOverrideValue="false" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UserFilter" QueryOverrideValue="All" />
                    <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="Threads" />
                </Actions>
            </CSControl:ConditionalAction>
            
            <CSControl:ConditionalAction runat="server">
                <Conditions Operator="And">
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="UnReadOnly" />
                    <CSControl:Conditions Operator="Not" runat="server"><CSControl:UserPropertyValueComparison UseAccessingUser="true" runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></CSControl:Conditions>
                </Conditions>
                <Actions>
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UnReadOnly" QueryOverrideValue="true" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UnAnsweredOnly" QueryOverrideValue="false" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="ActiveTopics" QueryOverrideValue="false" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UserFilter" QueryOverrideValue="All" />
                    <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="Threads" />
                </Actions>
            </CSControl:ConditionalAction>
            
            <CSControl:ConditionalAction runat="server">
                <Conditions Operator="And">
                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="Your" />
                    <CSControl:Conditions Operator="Not" runat="server"><CSControl:UserPropertyValueComparison UseAccessingUser="true" runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></CSControl:Conditions>
                </Conditions>
                <Actions>
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UserFilter" QueryOverrideValue="ShowTopicsParticipatedIn" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UnReadOnly" QueryOverrideValue="false" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="UnAnsweredOnly" QueryOverrideValue="false" />
                    <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="Threads" QueryOverrideProperty="ActiveTopics" QueryOverrideValue="false" />
                    <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="Threads" />
                </Actions>
            </CSControl:ConditionalAction>
        
            <table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td align="left">
                <CSControl:ResourceControl runat="server" ResourceName="Filter" />:
                
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions Operator="Or">
                        <CSControl:ControlPropertyValueComparison ComparisonControlId="ThreadsQuery" ComparisonProperty="ActiveTopics" Operator="IsSetOrTrue" runat="server" />
                        <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Sort" Operator="IsSetOrTrue" /></CSControl:Conditions>
                    </ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="AllRecent" QueryStringModification="Sort=Active&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="AllRecent" QueryStringModification="Sort=Active&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent> |
                
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="ThreadsQuery" ComparisonProperty="UnAnsweredOnly" Operator="IsSetOrTrue" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Unanswered" QueryStringModification="Sort=Unanswered&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Unanswered" QueryStringModification="Sort=Unanswered&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent>
                
                <CSControl:ConditionalContent runat="server">
                    <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
                    <LeaderTemplate> | </LeaderTemplate>
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="ThreadsQuery" ComparisonProperty="UnReadOnly" Operator="IsSetOrTrue" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Unread" QueryStringModification="Sort=UnReadOnly&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Unread" QueryStringModification="Sort=UnReadOnly&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent>
                
                <CSControl:ConditionalContent runat="server">
                    <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
                    <LeaderTemplate> | </LeaderTemplate>
                    <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="ThreadsQuery" ComparisonProperty="UserFilter" Operator="EqualTo" ComparisonValue="ShowTopicsParticipatedIn" runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Forums_YourDiscussions" QueryStringModification="Sort=Your&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Forums_YourDiscussions" QueryStringModification="Sort=Your&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                </CSControl:ConditionalContent>
            </td><td align="right">
                <CSForum:CreateForumPostClickPopup PopupHeaderCssClass="CommonPostPopupHeader" PopupHeaderResourceName="CreateForumPostClickPopup_Description" PopupListWrapperCssClass="CommonPostPopupListArea" PopupActivatorTag="Span" PopupActivatorActiveCssClass="CommonTextButtonHighlight" PopupActivatorCssClass="CommonTextButton" runat="server" PopupCssClass="CommonPostPopupArea" ListCssClass="CommonPostPopupList" MaximumNumberOfForums="50" />
            </td></tr></table>
        </div>
        <div class="CommonContentBoxContent">

		    <CSForum:ThreadList runat="Server" ID="Threads" ShowHeaderFooterOnNone="false">
		        <QueryOverrides SortBy="LastPost" SortOrder="Descending" PagerID="Pager" ID="ThreadsQuery" PageSize="5" />
		        <HeaderTemplate>
			        <div class="CommonListArea">
			        <table width="100%" cellpadding="0" cellspacing="0" border="0">
				        <thead>
					        <tr>
						        <th class="CommonListHeader" colspan="2"><CSControl:ResourceControl runat="server" ResourceName="ViewThreads_Posts" /></th>
						        <th class="CommonListHeader ForumMyRepliesHeader"><CSControl:ResourceControl runat="server" ResourceName="ViewThreads_TitleReplies" /></th>
					        </tr>
				        </thead>
				        <tbody>
		        </HeaderTemplate>
		        <ItemTemplate>
				        <tr class="CommonListRow">
					        <td class="CommonListCell ForumMyImageColumn">
						        <CSForum:ThreadStatusIcon runat="server" />
					        </td>
					        <td class="CommonListCell ForumMyNameColumn">
						        <table width="100%" cellpadding="0" cellspacing="0" border="0">
							        <tr>
								        <td class="ForumSubListCellLeftMost">
								            <CSForum:ThreadEmoticon runat="server" />
								            <CSForum:ThreadData Property="Subject" TruncateAt="65" LinkTo="Thread" LinkCssClass="ForumNameRead" runat="server"><DisplayConditions><CSForum:ThreadPropertyComparison ComparisonProperty1="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ThreadData>
								            <CSForum:ThreadData Property="Subject" TruncateAt="65" LinkTo="Thread" LinkCssClass="ForumNameUnRead" runat="server"><DisplayConditions Operator="Not"><CSForum:ThreadPropertyComparison ComparisonProperty1="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ThreadData>
								        </td>
								        <td class="ForumSubListCell" align="right" nowrap="nowrap">
								            <CSForum:ThreadRating runat="server" IsReadOnly="true" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" />

									        <CSControl:PlaceHolder runat="server">
									            <DisplayConditions Operator="And">
									                <CSForum:ForumConfigurationPropertyValueComparison ComparisonProperty="EnableThreadStatus" Operator="IsSetOrTrue" runat="server" />
									                <CSForum:ThreadPropertyValueComparison ComparisonProperty="Status" Operator="EqualTo" ComparisonValue="NotAnswered" runat="server" />
                                                    <CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="ThreadType" ComparisonValue="QuestionAndAnswer" Operator="EqualTo" />
                                                </DisplayConditions>
									            <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_NotAnswered.gif" runat="server" AlternateTextResourceName="Unanswered" /></ContentTemplate>
									        </CSControl:PlaceHolder>
    									    
									        <CSControl:PlaceHolder runat="server">
									            <DisplayConditions Operator="And">
									                <CSForum:ForumConfigurationPropertyValueComparison ComparisonProperty="EnableThreadStatus" Operator="IsSetOrTrue" runat="server" />
									                <CSForum:ThreadPropertyValueComparison ComparisonProperty="Status" Operator="EqualTo" ComparisonValue="Answered" runat="server" />
									                <CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="ThreadType" ComparisonValue="QuestionAndAnswer" Operator="EqualTo" />
                                                </DisplayConditions>
									            <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_Answered.gif" runat="server" AlternateTextResourceName="Status_VerifiedAnswer" /></ContentTemplate>
									        </CSControl:PlaceHolder>

									        <CSControl:PlaceHolder runat="server">
									            <DisplayConditions Operator="And">
									                <CSForum:ForumConfigurationPropertyValueComparison ComparisonProperty="EnableThreadStatus" Operator="IsSetOrTrue" runat="server" />
									                <CSForum:ThreadPropertyValueComparison ComparisonProperty="Status" Operator="EqualTo" ComparisonValue="AnsweredNotVerified" runat="server" />
									                <CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="ThreadType" ComparisonValue="QuestionAndAnswer" Operator="EqualTo" />
                                                </DisplayConditions>
									            <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_SuggestedAnswer.gif" runat="server" AlternateTextResourceName="Status_SuggestedAnswer" /></ContentTemplate>
									        </CSControl:PlaceHolder>	

								        </td>
							        </tr>
						        </table>
						        <table width="100%" cellpadding="0" cellspacing="0" border="0">
							        <tr>
								        <td class="ForumSubListCellLeftMost ForumLastPost">
									        <CSControl:PlaceHolder runat="server">
						                        <DisplayConditions><CSForum:ThreadPropertyValueComparison ComparisonProperty="ThreadDate" ComparisonValue="6/8/1980" Operator="GreaterThan" runat="server" /></DisplayConditions>
						                        <ContentTemplate>
    					                            <CSForum:ThreadData LinkTo="MostRecentPost" ResourceName="ForumGroupView_Inline4" runat="server" />
                                                    <CSForum:ThreadData LinkTo="MostRecentPostAuthor" Property="MostRecentPostAuthor" runat="server" TruncateAt="15"><LeaderTemplate>by </LeaderTemplate></CSForum:ThreadData><CSForum:ThreadData Property="ThreadDate" runat="server" IncludeTimeInDate="true"><LeaderTemplate>, </LeaderTemplate></CSForum:ThreadData>
                                                </ContentTemplate>
                                            </CSControl:PlaceHolder>
								        </td>
								        <td class="ForumSubListCellPager">
									        <CSForum:ThreadPostPageLinks runat="server" />
								        </td>
							        </tr>
						        </table>
					        </td>
					        <td class="CommonListCell ForumMyRepliesColumn">
					            <CSForum:ThreadData Property="Replies" runat="server" />
					        </td>
				        </tr>				
		        </ItemTemplate>
		        <AlternatingItemTemplate>
		               <tr class="CommonListRowAlt">
					        <td class="CommonListCell ForumMyImageColumn">
						        <CSForum:ThreadStatusIcon runat="server" />
					        </td>
					        <td class="CommonListCell ForumMyNameColumn">
						        <table width="100%" cellpadding="0" cellspacing="0" border="0">
							        <tr>
								        <td class="ForumSubListCellLeftMost">
								            <CSForum:ThreadEmoticon runat="server" />
								            <CSForum:ThreadData Property="Subject" TruncateAt="65" LinkTo="Thread" LinkCssClass="ForumNameRead" runat="server"><DisplayConditions><CSForum:ThreadPropertyComparison ComparisonProperty1="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ThreadData>
								            <CSForum:ThreadData Property="Subject" TruncateAt="65" LinkTo="Thread" LinkCssClass="ForumNameUnRead" runat="server"><DisplayConditions Operator="Not"><CSForum:ThreadPropertyComparison ComparisonProperty1="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ThreadData>
								        </td>
								        <td class="ForumSubListCell" align="right" nowrap="nowrap">
								            <CSForum:ThreadRating runat="server" IsReadOnly="true" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" />

									        <CSControl:PlaceHolder runat="server">
									            <DisplayConditions Operator="And">
									                <CSForum:ForumConfigurationPropertyValueComparison ComparisonProperty="EnableThreadStatus" Operator="IsSetOrTrue" runat="server" />
									                <CSForum:ThreadPropertyValueComparison ComparisonProperty="Status" Operator="EqualTo" ComparisonValue="NotAnswered" runat="server" />
                                                    <CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="ThreadType" ComparisonValue="QuestionAndAnswer" Operator="EqualTo" />
                                                </DisplayConditions>
									            <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_NotAnswered.gif" runat="server" AlternateTextResourceName="Unanswered" /></ContentTemplate>
									        </CSControl:PlaceHolder>
    									    
									        <CSControl:PlaceHolder runat="server">
									            <DisplayConditions Operator="And">
									                <CSForum:ForumConfigurationPropertyValueComparison ComparisonProperty="EnableThreadStatus" Operator="IsSetOrTrue" runat="server" />
									                <CSForum:ThreadPropertyValueComparison ComparisonProperty="Status" Operator="EqualTo" ComparisonValue="Answered" runat="server" />
									                <CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="ThreadType" ComparisonValue="QuestionAndAnswer" Operator="EqualTo" />
                                                </DisplayConditions>
									            <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_Answered.gif" runat="server" AlternateTextResourceName="Status_VerifiedAnswer" /></ContentTemplate>
									        </CSControl:PlaceHolder>

									        <CSControl:PlaceHolder runat="server">
									            <DisplayConditions Operator="And">
									                <CSForum:ForumConfigurationPropertyValueComparison ComparisonProperty="EnableThreadStatus" Operator="IsSetOrTrue" runat="server" />
									                <CSForum:ThreadPropertyValueComparison ComparisonProperty="Status" Operator="EqualTo" ComparisonValue="AnsweredNotVerified" runat="server" />
									                <CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="ThreadType" ComparisonValue="QuestionAndAnswer" Operator="EqualTo" />
                                                </DisplayConditions>
									            <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/status_SuggestedAnswer.gif" runat="server" AlternateTextResourceName="Status_SuggestedAnswer" /></ContentTemplate>
									        </CSControl:PlaceHolder>	

								        </td>
							        </tr>
						        </table>
						        <table width="100%" cellpadding="0" cellspacing="0" border="0">
							        <tr>
								        <td class="ForumSubListCellLeftMost ForumLastPost">
									        <CSControl:PlaceHolder runat="server">
						                        <DisplayConditions><CSForum:ThreadPropertyValueComparison ComparisonProperty="ThreadDate" ComparisonValue="6/8/1980" Operator="GreaterThan" runat="server" /></DisplayConditions>
						                        <ContentTemplate>
    					                            <CSForum:ThreadData LinkTo="MostRecentPost" ResourceName="ForumGroupView_Inline4" runat="server" />
                                                    <CSForum:ThreadData LinkTo="MostRecentPostAuthor" Property="MostRecentPostAuthor" runat="server" TruncateAt="15"><LeaderTemplate>by </LeaderTemplate></CSForum:ThreadData><CSForum:ThreadData Property="ThreadDate" runat="server" IncludeTimeInDate="true"><LeaderTemplate>, </LeaderTemplate></CSForum:ThreadData>
                                                </ContentTemplate>
                                            </CSControl:PlaceHolder>
								        </td>
								        <td class="ForumSubListCellPager">
									        <CSForum:ThreadPostPageLinks runat="server" />
								        </td>
							        </tr>
						        </table>
					        </td>
					        <td class="CommonListCell ForumMyRepliesColumn">
					            <CSForum:ThreadData Property="Replies" runat="server" />
					        </td>
				        </tr>			
		        </AlternatingItemTemplate>
		        <FooterTemplate>
			        </tbody>
			        </table>
			        </div>
		        </FooterTemplate>
		        <NoneTemplate>
                    <div class="CommonMessageWarning">
		                <CSControl:ResourceControl runat="server" ResourceName="ViewThreads_NoTopics" />
		            </div>
		        </NoneTemplate>
            </CSForum:ThreadList>
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:PostbackPager runat="Server" id="Pager" ShowFirst="false" ShowLast="false" ShowPrevious="false" ShowIndividualPages="false" ShowNext="true">
                <NextLinkTemplate>
                    <CSControl:SiteUrl UrlName="post_Active" runat="server" ResourceName="ViewMore">
                        <DisplayConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="ThreadsQuery" ComparisonProperty="ActiveTopics" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                        <UrlQueryStringModificationTemplate><CSForum:GroupData Property="GroupID" FormatString="0" Text="GroupID={0}" runat="server" /></UrlQueryStringModificationTemplate>
                    </CSControl:SiteUrl>
                    
                    <CSControl:SiteUrl UrlName="post_Unanswered" runat="server" ResourceName="ViewMore">
                        <DisplayConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="ThreadsQuery" ComparisonProperty="UnAnsweredOnly" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                        <UrlQueryStringModificationTemplate><CSForum:GroupData Property="GroupID" FormatString="0" Text="GroupID={0}" runat="server" /></UrlQueryStringModificationTemplate>
                    </CSControl:SiteUrl>
                    
                    <CSControl:SiteUrl UrlName="post_NotRead" runat="server" ResourceName="ViewMore">
                        <DisplayConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="ThreadsQuery" ComparisonProperty="UnReadOnly" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                        <UrlQueryStringModificationTemplate><CSForum:GroupData Property="GroupID" FormatString="0" Text="GroupID={0}" runat="server" /></UrlQueryStringModificationTemplate>
                    </CSControl:SiteUrl>
                    
                    <CSControl:SiteUrl UrlName="user_MyForums" runat="server" ResourceName="ViewMore">
                        <DisplayConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="ThreadsQuery" ComparisonProperty="UserFilter" Operator="EqualTo" ComparisonValue="ShowTopicsParticipatedIn" runat="server" /></DisplayConditions>
                        <UrlQueryStringModificationTemplate><CSForum:GroupData Property="GroupID" FormatString="0" Text="GroupID={0}" runat="server" /></UrlQueryStringModificationTemplate>
                    </CSControl:SiteUrl>
                </NextLinkTemplate>
            </CSControl:PostbackPager>
        </div>
    </div>
    
    <CSForum:GroupList runat="server" ShowHeaderFooterOnNone="false" ItemsPerRow="2">
        <DisplayConditions Operator="Not"><CSForum:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
        <QueryOverrides ApplyUserGroupFilter="false" PageSize="999999" />
        <HeaderTemplate>
            <div class="CommonContentBox">
                <h2 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Forums_BrowseDiscussions" /></h2>
                <div class="CommonContentBoxContent">
                    <div class="CommonDescription">
                        <CSControl:SiteStatisticsData runat="server" Property="TotalUsers" Tag="B" />
                        <CSControl:ResourceControl runat="server" ResourceName="SearchView_Inline1" />
                        <CSControl:SiteStatisticsData runat="server" Property="TotalThreads" Tag="B" />
                        <CSControl:ResourceControl runat="server" ResourceName="SearchView_Inline2" />
                        <CSControl:SiteStatisticsData runat="server" Property="TotalPosts" Tag="B" />
                        <CSControl:ResourceControl runat="server" ResourceName="SearchView_Inline3" />
                    </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="CommonHierarchalList">
                <h3 class="CommonHeader">
                    <CSForum:GroupData LinkTo="GroupHome" Property="Name" runat="server" />
                </h3>
                <CSForum:GroupData Property="Description" Tag="Div" runat="server" TruncateAt="100" />
                <CSForum:ForumList runat="server">
                    <QueryOverrides ApplyUserSectionFilter="false" PageSize="4" PagerID="ForumPager" />
                    <ItemTemplate><CSForum:ForumData LinkCssClass="ForumGroupNameRead" Property="Name" LinkTo="HomePage" runat="server"><DisplayConditions><CSForum:ForumPropertyValueComparison ComparisonProperty="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ForumData><CSForum:ForumData LinkCssClass="ForumGroupNameUnRead" Property="Name" LinkTo="HomePage" runat="server"><DisplayConditions Operator="Not"><CSForum:ForumPropertyValueComparison ComparisonProperty="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ForumData></ItemTemplate>
                    <SeparatorTemplate><br /></SeparatorTemplate>
                </CSForum:ForumList><CSControl:Pager runat="server" ID="ForumPager" ShowNext="true" ShowLast="false" ShowFirst="false" ShowPrevious="false" ShowIndividualPages="false">
                    <NextLinkTemplate><br /><CSForum:GroupData LinkTo="GroupHome" runat="server" ResourceName="More" /></NextLinkTemplate>
                </CSControl:Pager>
            </div>
        </ItemTemplate>
        <RowSeparatorTemplate><div style="clear: both;"></div></RowSeparatorTemplate>
        <FooterTemplate>
                    <div style="clear: both;"></div>
                </div>
            </div>
        </FooterTemplate>
    </CSForum:GroupList>
	
	<CSForum:ForumList runat="server" ShowHeaderFooterOnNone="false" ItemsPerRow="2">
        <DisplayConditions><CSForum:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
        <QueryOverrides ApplyUserSectionFilter="false" PageSize="999999" />
        <HeaderTemplate>
            <div class="CommonContentBox">
                <h2 class="CommonContentBoxHeader">Browse Discussions</h2>
                <div class="CommonContentBoxContent">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="CommonHierarchalList">
                <h3 class="CommonHeader">
		            <CSForum:ForumData LinkCssClass="ForumGroupNameRead" Property="Name" LinkTo="HomePage" runat="server"><DisplayConditions><CSForum:ForumPropertyValueComparison ComparisonProperty="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ForumData>
		            <CSForum:ForumData LinkCssClass="ForumGroupNameUnRead" Property="Name" LinkTo="HomePage" runat="server"><DisplayConditions Operator="Not"><CSForum:ForumPropertyValueComparison ComparisonProperty="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ForumData>
                </h3>
                <CSForum:ForumData Property="Description" Tag="Div" runat="server" TruncateAt="100" />
                <CSForum:ForumList runat="server">
                    <QueryOverrides ApplyUserSectionFilter="false" PageSize="4" PagerID="ForumPager" />
                    <ItemTemplate><CSForum:ForumData LinkCssClass="ForumGroupNameRead" Property="Name" LinkTo="HomePage" runat="server"><DisplayConditions><CSForum:ForumPropertyValueComparison ComparisonProperty="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ForumData><CSForum:ForumData LinkCssClass="ForumGroupNameUnRead" Property="Name" LinkTo="HomePage" runat="server"><DisplayConditions Operator="Not"><CSForum:ForumPropertyValueComparison ComparisonProperty="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ForumData></ItemTemplate>
                    <SeparatorTemplate><br /></SeparatorTemplate>
                </CSForum:ForumList><CSControl:Pager runat="server" ID="ForumPager" ShowNext="true" ShowLast="false" ShowFirst="false" ShowPrevious="false" ShowIndividualPages="false">
                    <NextLinkTemplate><CSForum:GroupData LinkTo="GroupHome" runat="server" ResourceName="More" /></NextLinkTemplate>
                </CSControl:Pager>
            </div>
        </ItemTemplate>
        <RowSeparatorTemplate><div style="clear: both;"></div></RowSeparatorTemplate>
        <FooterTemplate>
                    <div style="clear: both;"></div>
                </div>
            </div>
        </FooterTemplate>
    </CSForum:ForumList>

</asp:Content>