<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSForum:BreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSForum:BreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <%-- Set the title based on the URL we're viewing --%>
    <CSControl:Title ResourceName="ViewUnansweredThreads_Title" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" runat="server">
        <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_Unanswered" /></DisplayConditions>
    </CSControl:Title>
    <CSControl:Title ResourceName="ViewActiveThreads_Title" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" runat="server">
        <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_Active" /></DisplayConditions>
    </CSControl:Title>
    <CSControl:Title ResourceName="ViewNotReadThreads_Title" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" runat="server">
        <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_NotRead" /></DisplayConditions>
    </CSControl:Title>
    <CSControl:Title ResourceName="ViewVideos_Title" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" runat="server">
        <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_Videos" /></DisplayConditions>
    </CSControl:Title>
    <CSControl:Title ResourceName="Forums_YourDiscussions" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" runat="server">
        <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.user_MyForums" /></DisplayConditions>
    </CSControl:Title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="bcr" runat="server">

    <%-- If the user is not logged in and we're looking at the 'not read' or 'my forums' page, redirect to the login page --%>
    <CSControl:ConditionalAction runat="server">
        <Conditions Operator="And">
            <CSControl:UserPropertyValueComparison UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" runat="server" />
            <CSControl:Conditions Operator="Or" runat="server">
                <CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_NotRead" />
                <CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.user_MyForums" />
            </CSControl:Conditions>
        </Conditions>
        <Actions>
            <CSControl:GoToSiteUrlAction runat="server" UrlName="login">
                <Parameter1Template><CSControl:ModifiedUrl runat="server" Encoding="URL" RenderRawUrl="true" /></Parameter1Template>
            </CSControl:GoToSiteUrlAction>
        </Actions>
    </CSControl:ConditionalAction>

    <%-- Set the appropriate options on the thread list control based on the URL we're viewing --%>
    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_Unanswered" /></Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="FilteredThreadList" QueryOverrideProperty="UnAnsweredOnly" QueryOverrideValue="true" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="FilteredThreadList" />
        </Actions>
    </CSControl:ConditionalAction>
    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_Active" /></Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="FilteredThreadList" QueryOverrideProperty="ActiveTopics" QueryOverrideValue="true" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="FilteredThreadList" />
        </Actions>
    </CSControl:ConditionalAction>
    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_NotRead" /></Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="FilteredThreadList" QueryOverrideProperty="UnReadOnly" QueryOverrideValue="true" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="FilteredThreadList" />
        </Actions>
    </CSControl:ConditionalAction>
    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_Videos" /></Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="FilteredThreadList" QueryOverrideProperty="PostMedia" QueryOverrideValue="Video" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="FilteredThreadList" />
        </Actions>
    </CSControl:ConditionalAction>
    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.user_MyForums" /></Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="FilteredThreadList" QueryOverrideProperty="UserFilter" QueryOverrideValue="ShowTopicsParticipatedIn" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="FilteredThreadList" />
        </Actions>
    </CSControl:ConditionalAction>

    <div class="CommonContentBox">
	    <div class="CommonContentBoxHeaderForm">
	        <CSForum:ThreadListFilterForm runat="server" 
                Tag="Div" 
                CssClass="CommonFormArea" 
                ApplyChangesImmediately="true" 
                DateFilterDropDownListId="DateFilter" 
                ForumFilterDropDownListId="ForumFilter" 
                ThreadListId="FilteredThreadList">
                <FormTemplate>
                    <div class="CommonFormFieldName">
                        Forum/Group: 
                        <asp:DropDownList runat="server" ID="ForumFilter" />
                        <asp:DropDownList runat="server" ID="DateFilter" />
                    </div>
                </FormTemplate>
            </CSForum:ThreadListFilterForm>
	    </div>
	    <div class="CommonContentBoxContent">
	    
	        <%-- Set the description of the page based on the URL we're viewing --%>
            <CSControl:ResourceControl runat="server" Tag="Div" CssClass="CommonDescription" ResourceName="ViewUnansweredThreads_Description">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_Unanswered" /></DisplayConditions>
            </CSControl:ResourceControl>
            <CSControl:ResourceControl runat="server" Tag="Div" CssClass="CommonDescription" ResourceName="ViewActiveThreads_Description">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_Active" /></DisplayConditions>
            </CSControl:ResourceControl>
            <CSControl:ResourceControl runat="server" Tag="Div" CssClass="CommonDescription" ResourceName="ViewNotReadThreads_Description">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_NotRead" /></DisplayConditions>
            </CSControl:ResourceControl>
            <CSControl:ResourceControl runat="server" Tag="Div" CssClass="CommonDescription" ResourceName="ViewVideos_Description">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.post_Videos" /></DisplayConditions>
            </CSControl:ResourceControl>
            <CSControl:ResourceControl runat="server" Tag="Div" CssClass="CommonDescription" ResourceName="ViewMyForumsThreads_Description">
                <DisplayConditions><CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.user_MyForums" /></DisplayConditions>
            </CSControl:ResourceControl>
	    
	        <CSForum:ThreadList runat="server" ID="FilteredThreadList" ShowHeaderFooterOnNone="false">
	            <QueryOverrides PagerID="ThreadsPager" AnnouncementsThreadListId="" />
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
                                                    <CSForum:ThreadData LinkTo="MostRecentPostAuthor" Property="MostRecentPostAuthor" runat="server" TruncateAt="15"><LeaderTemplate>by </LeaderTemplate></CSForum:ThreadData>
                                                    <CSForum:ThreadData Property="ThreadDate" runat="server" IncludeTimeInDate="true"><LeaderTemplate>, </LeaderTemplate></CSForum:ThreadData>
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
                                                    <CSForum:ThreadData LinkTo="MostRecentPostAuthor" Property="MostRecentPostAuthor" runat="server" TruncateAt="15"><LeaderTemplate>by </LeaderTemplate></CSForum:ThreadData>
                                                    <CSForum:ThreadData Property="ThreadDate" runat="server" IncludeTimeInDate="true"><LeaderTemplate>, </LeaderTemplate></CSForum:ThreadData>
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
	        <CSControl:Pager runat="server" ID="ThreadsPager" ShowTotalSummary="true" />
	        
	        <CSForum:AggregateRss runat="server">
		        <DisplayConditions Operator="Not">
		            <CSControl:CurrentSiteUrlCondition runat="server" SiteUrlName="forums.user_MyForums" />
		        </DisplayConditions>
		        <LeaderTemplate> 
		        <CSControl:PlaceHolder runat="server">
                    <DisplayConditions>
                        <CSControl:ControlVisibilityCondition runat="server" ControlId="ThreadsPager" ControlVisiblilityEquals="true" />
                    </DisplayConditions>
                    <ContentTemplate>
                     | 
                    </ContentTemplate>
		        </CSControl:PlaceHolder>
		        </LeaderTemplate>
		        <ContentTemplate><CSControl:ResourceControl runat="server" ResourceName="Rss" /></ContentTemplate>
		    </CSForum:AggregateRss>
	    </div>
	</div>

</asp:Content>

<asp:Content ID="RightColumnRegion" ContentPlaceHolderID="rcr" runat="server">
</asp:Content>