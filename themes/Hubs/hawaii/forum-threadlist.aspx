<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" %>
<%@ Import Namespace="CommunityServer.Components" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSForum:ForumData LinkTo="HomePage" Text="Discussions" runat="server" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" Text="Discussions" EnableRendering="true" IncludeSectionOrHubName="true" IncludeSiteName="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

 	<div class="CommonContentBox">
	    <div class="CommonContentBoxHeaderForm">
	        <div style="float: right;">
	            <CSForum:ForumData LinkTo="PostCreate" IgnoreLinkPermissions="true" ResourceName="Button_NewPost" runat="server" />
	            <CSForum:MarkAllReadForm runat="server" SubmitButtonId="MarkAllRead">
                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                    <FormTemplate> | <CSControl:ResourceLinkButton ID="MarkAllRead" ResourceName="MarkAllRead_Threads" runat="server" /></FormTemplate>
                </CSForum:MarkAllReadForm>
            </div>
	        
	        <a href="#options" onclick="var fo = document.getElementById('ForumOptions'); if (fo.style.display=='none') { fo.style.display='block'; return true; } else { fo.style.display='none'; return false; }; ">
                Sorting and Filtering
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
                            With date
                        </div>
                        <div class="CommonFormField">
                            <asp:DropDownList runat="server" ID="DateFilter" />
                        </div>
                        <div class="CommonFormFieldName">
                            With read status
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
                                                    <CSForum:ThreadPropertyValueComparison runat="server" runat="server" ComparisonProperty="ThreadType" ComparisonValue="QuestionAndAnswer" Operator="EqualTo" />
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
	        <CSControl:Pager runat="server" ID="ThreadsPager" ShowTotalSummary="true">
                <TrailerTemplate> | </TrailerTemplate>
            </CSControl:Pager>
	        
	        <CSForum:ForumData LinkTo="EmailInformation" runat="server">
	            <DisplayConditions Operator="And">
	                <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsMailingList" Operator="IsSetOrTrue" />
	                <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsActive" Operator="IsSetOrTrue" />
	            </DisplayConditions>
	            <ContentTemplate>Email access enabled</ContentTemplate>
	            <TrailerTemplate> | </TrailerTemplate>
	        </CSForum:ForumData>
	        
	        <CSForum:ForumData LinkTo="Rss" runat="server">
	            <ContentTemplate>RSS</ContentTemplate>
	        </CSForum:ForumData>
	    </div>
	</div>
	
</asp:Content>

<asp:Content ContentPlaceHolderID="rcrc" runat="server">
    
    <CSControl:PlaceHolder runat="server" Tag="UL" CssClass="CommonContentBoxList Seperator">
        <DisplayConditions Operator="Or">
            <CSForum:ForumPermissionCondition runat="server" Permission="Post" />
        </DisplayConditions>
        <ContentTemplate>
            <CSForum:ForumData runat="server" LinkTo="PostCreate" Text="Write a New Post" Tag="Li" />
        </ContentTemplate>
    </CSControl:PlaceHolder>

</asp:Content>