<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSForum:BreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSForum:BreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSForum:ForumData runat="server" Property="Name" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

	<div class="CommonContentBox">
	    <div class="CommonContentBoxHeaderForm">
	        <div style="float: right;">
	            <CSForum:ForumData ID="PostCreateLink" LinkTo="PostCreate" IgnoreLinkPermissions="true" ResourceName="Button_NewPost" runat="server" LinkCssClass="ForumLinkUnread" />
	            <CSControl:PlaceHolder runat="server">
					<DisplayConditions>
						<CSControl:ControlVisibilityCondition runat="server" ControlId="PostCreateLink" ControlVisiblilityEquals="true" />
						<CSControl:ControlVisibilityCondition runat="server" ControlId="MarkAllRead" ControlVisiblilityEquals="true" />
					</DisplayConditions>
					<ContentTemplate> | </ContentTemplate>
				</CSControl:PlaceHolder>
	            <CSForum:MarkAllReadForm runat="server" SubmitButtonId="MarkAllRead">
                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                    <FormTemplate><CSControl:ResourceLinkButton ID="MarkAllRead" ResourceName="MarkAllRead_Threads" runat="server" LinkCssClass="ForumLinkUnread" /></FormTemplate>
                </CSForum:MarkAllReadForm>
            </div>
	        
	        <a href="#options" onclick="var fo = document.getElementById('ForumOptions'); if (fo.style.display=='none') { fo.style.display='block'; return true; } else { fo.style.display='none'; return false; }; ">
                <CSControl:ResourceControl runat="server" ResourceName="SortingFiltering" />
            </a>
            
            
	        <CSForum:ThreadListFilterForm runat="server"
                DateFilterDropDownListId="DateFilter" 
                 SortThreadByDropDownListId="SortBy"
                 SortOrderDropDownListId="SortOrder"
                 HideReadPostsDropDownListId="HideRead"
                 ApplyButtonId="Apply"
                 ApplyTemporarilyButtonId="ApplyTemp"
                 ControlIdsToHideFromAnonymousUsers="UserFilterArea,EmailArea"
                ThreadListId="FilteredThreadList"
                Tag="Div" ContainerId="ForumOptions"
                style="display: none;"
                >
                <FormTemplate>
                    <div class="CommonFormArea">
                        <div class="CommonFormFieldName">
                            <CSControl:ResourceControl runat="server" ResourceName="Sortby" />
                        </div>
                        <div class="CommonFormField">
                            <asp:DropDownList runat="server" ID="SortBy" />
                            <CSControl:ResourceControl runat="server" ResourceName="ViewThreads_In" />
                            <asp:DropDownList runat="server" ID="SortOrder" />
                            <CSControl:ResourceControl runat="server" ResourceName="ViewThreads_OrderFrom" />
                        </div>
                        <div class="CommonFormFieldName">
                            <CSControl:ResourceControl runat="server" ResourceName="SearchAdvanced_Date" />
                        </div>
                        <div class="CommonFormField">
                            <asp:DropDownList runat="server" ID="DateFilter" />
                        </div>
                        <div class="CommonFormFieldName">
                            <CSControl:ResourceControl runat="server" ResourceName="Forums_WithReadStatus" />
                        </div>
                        <div class="CommonFormField">
                            <asp:DropDownList runat="server" ID="HideRead" />
                        </div>
                        <div class="CommonFormFieldName">
                            <asp:Button ID="ApplyTemp" Text="Apply" runat="server" />
                            <asp:Button ID="Apply" Text="Apply and Save" runat="server" />
    				    </div>               
                    </div>
	            </FormTemplate>
            </CSForum:ThreadListFilterForm>
	    </div>
	    <div class="CommonContentBoxContent">

            <CSForum:ForumData runat="server" Property="Description" Tag="Div" CssClass="CommonDescription" />

	        <CSForum:ThreadList runat="server" ID="FilteredThreadList" ShowHeaderFooterOnNone="false">
	            <QueryOverrides PagerID="ThreadsPager" AnnouncementsThreadListId="" />
		        <HeaderTemplate>
			        <div class="CommonListArea">
			        <table width="100%" cellpadding="0" cellspacing="0" border="0">
				        <thead>
					        <tr>
    					        <th id="CommonListHeader" class="CommonListHeader" runat="server" Visible='<%# MoveThreadsForm.Visible %>'>&nbsp;</th> 
						        <th class="CommonListHeader" colspan="2"><CSControl:ResourceControl runat="server" ResourceName="ViewThreads_Posts" /></th>
						        <th class="CommonListHeader ForumMyRepliesHeader"><CSControl:ResourceControl runat="server" ResourceName="ViewThreads_TitleReplies" /></th>
					        </tr>
				        </thead>
				        <tbody>
		        </HeaderTemplate>
		        <ItemTemplate>
				        <tr class="CommonListRow">
					        <CSForum:ThreadCheckbox runat="server" Visible='<%# MoveThreadsForm.Visible %>'><LeaderTemplate><td class="CommonListCell ForumMyMoveColumn"></LeaderTemplate><TrailerTemplate></td></TrailerTemplate></CSForum:ThreadCheckbox>
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
  					        <CSForum:ThreadCheckbox runat="server" Visible='<%# MoveThreadsForm.Visible %>'><LeaderTemplate><td class="CommonListCell ForumMyMoveColumn"></LeaderTemplate><TrailerTemplate></td></TrailerTemplate></CSForum:ThreadCheckbox>
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
                                                    <<CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="ThreadType" ComparisonValue="QuestionAndAnswer" Operator="EqualTo" />
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
        	
	        <CSForum:MoveThreadsForm id="MoveThreadsForm" runat="server" SubmitButtonId="MoveThreads">
	            <FormTemplate>
	                <div class="CommonFormArea">
		                <div class="CommonFormFieldName">
                            <CSControl:ResourceButton id="MoveThreads" runat="server" ResourceName="Move" CausesValidation="false" />
				        </div>
	                </div>
                </FormTemplate>
            </CSForum:MoveThreadsForm>
            
        </div>            
	    <div class="CommonContentBoxFooter">
	        <CSControl:Pager runat="server" ID="ThreadsPager" ShowTotalSummary="true">
                <TrailerTemplate> | </TrailerTemplate>
            </CSControl:Pager>
	        
	        <CSForum:ForumData LinkTo="EmailInformation" runat="server">
	            <DisplayConditions Operator="And">
	                <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsMailingList" Operator="IsSetOrTrue" />
	                <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsActive" Operator="IsSetOrTrue" />
	            </DisplayConditions>
	            <ContentTemplate><CSControl:ResourceControl runat="server" ResourceName="Forums_EmailAccessEnabled" /></ContentTemplate>
	            <TrailerTemplate> | </TrailerTemplate>
	        </CSForum:ForumData>
	        
	        <CSForum:ForumData LinkTo="NntpInformation" runat="server">
	            <ContentTemplate><CSControl:ResourceControl runat="server" ResourceName="Forums_NNTPAccessEnabled" /></ContentTemplate>
	            <TrailerTemplate> | </TrailerTemplate>
	        </CSForum:ForumData>
	        
	        <CSForum:ForumData LinkTo="Rss" runat="server">
	            <ContentTemplate><CSControl:ResourceControl runat="server" ResourceName="Rss" /></ContentTemplate>
	        </CSForum:ForumData>
	    </div>
	</div>
	
    <CSForum:ForumList runat="server" ShowHeaderFooterOnNone="false" ItemsPerRow="2">
        <DisplayConditions><CSForum:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
        <QueryOverrides ApplyUserSectionFilter="false" PageSize="999999" />
        <HeaderTemplate>
            <div class="CommonContentBox">
                <h2 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Forums_BrowseDiscussions" /></h2>
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
                    <QueryOverrides ApplyUserSectionFilter="false" SortBy="Name" SortOrder="Ascending" PageSize="4" PagerID="ForumPager" />
                    <ItemTemplate>
			            <CSForum:ForumData LinkCssClass="ForumGroupNameRead" Property="Name" LinkTo="HomePage" runat="server"><DisplayConditions><CSForum:ForumPropertyValueComparison ComparisonProperty="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ForumData>
			            <CSForum:ForumData LinkCssClass="ForumGroupNameUnRead" Property="Name" LinkTo="HomePage" runat="server"><DisplayConditions Operator="Not"><CSForum:ForumPropertyValueComparison ComparisonProperty="HasRead" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSForum:ForumData>
                    </ItemTemplate>
                    <SeparatorTemplate>, </SeparatorTemplate>
                </CSForum:ForumList><CSControl:Pager runat="server" ID="ForumPager" ShowNext="true" ShowLast="false" ShowFirst="false" ShowPrevious="false" ShowIndividualPages="false">
                    <NextLinkTemplate>, <CSForum:GroupData LinkTo="GroupHome" runat="server" ResourceName="More" /></NextLinkTemplate>
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

<asp:Content ID="RightColumnRegion" ContentPlaceHolderID="rcr" runat="server">
    <div class="CommonSidebar">
    
        <div class="CommonContentBox">
            <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Shortcuts" /></h4>
            <div class="CommonContentBoxContent">
                <ul class="CommonSidebarList">
			        <CSControl:SiteUrl UrlName="user_List" ResourceName="Utility_ForumAnchorType_MenuMemberList" Tag="Li" runat="server" />
                    <CSControl:PlaceHolder runat="Server">
                        <DisplayConditions><CSControl:UserInRoleCondition Role="Registered Users" UseAccessingUser="true" runat="server" /></DisplayConditions>        
                        <ContentTemplate>
                            <CSControl:SiteUrl UrlName="post_NotRead" Parameter1="-1" ResourceName="Utility_ForumAnchorType_PostsNotRead" Tag="Li" runat="server" />
			                <CSControl:SiteUrl UrlName="forumSubscriptions" ResourceName="Utility_ForumAnchorType_ForumSubscriptions" Tag="Li" runat="server" />
                        </ContentTemplate>
                    </CSControl:PlaceHolder>
                    <CSForum:ForumData runat="server" LinkTo="ForumControlPanel" ResourceName="CF_ForumSettings" Tag="Li" />
                 </ul>
            </div>
        </div>
    
        <CSControl:TagCloud EnableNoTagsMessage="false" runat="server" ApplicationType="Forum" IgnoreFilterTags="true" TagCssClasses="CommonTag6,CommonTag5,CommonTag4,CommonTag3,CommonTag2,CommonTag1" TagCloudCssClass="CommonSidebarTagCloud" MaximumNumberOfTags="25">
            <LeaderTemplate>
                <div class="CommonContentBox">
                    <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl ResourceName="PopularTags" runat="server" /></h4>
                    <div class="CommonContentBoxContent">
            </LeaderTemplate>
            <TrailerTemplate>
                    </div>
                    <div class="CommonContentBoxFooter">
                        <CSControl:SiteUrl ID="SiteUrl1" ResourceName="ViewMore" UrlName="tags_home" runat="server" />
                    </div>
                </div>
            </TrailerTemplate>
        </CSControl:TagCloud>
    </div>
</asp:Content>