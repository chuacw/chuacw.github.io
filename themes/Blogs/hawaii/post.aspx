<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<script runat="server" language="C#">

    bool IsAuthor(object user)
    {
        CommunityServer.Components.User u = user as CommunityServer.Components.User;
        CommunityServer.Blogs.Components.WeblogPost p = CommunityServer.Blogs.Controls.WeblogControlUtility.Instance().GetCurrentWeblogPost(this);
        return (u != null && p.User != null && !u.IsAnonymous && u.UserID == p.UserID);
    }

</script>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSBlog:WeblogData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSBlog:WeblogPostData LinkTo="Post" Property="Subject" runat="server" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <div class="CommonTitle">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" EnableRendering="true">
        <ContentTemplate><CSBlog:WeblogPostData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>
    <CSBlog:WeblogPostRating runat="server" RatingCssClass="RateControl" RatingReadOnlyCssClass="RateControlReadOnly" RatingActiveCssClass="RateControlActive" ImagesBaseUrl="~/utility/images/" />
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="Server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
            <CSControl:ResourceControl runat="server" ResourceName="Blog_Pending_Comment" Tag="Div" CssClass="CommonMessageSuccess">
                <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="CommentPosted" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>    
                <LeaderTemplate><a name="commentmessage"></a></LeaderTemplate>
            </CSControl:ResourceControl>
        
		    <CSBlog:WeblogPostData Property="FormattedBody" runat="server" IncrementViewCount="true" />
		    <CSBlog:WeblogPostData ResourceName="Weblog_ReadMirroredPost" Property="TitleUrl" runat="server">
		        <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
		        <LeaderTemplate><p><i></LeaderTemplate>
		        <TrailerTemplate></i></p></TrailerTemplate>
		    </CSBlog:WeblogPostData>
            <hr />
	        <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_Posted" />
		    <CSBlog:WeblogPostData Property="UserTime" LinkTo="Post" IncludeTimeInDate="true" runat="server" />
			<CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" />
		    <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
		    <CSBlog:WeblogPostFavoriteToggleButton runat="server">
                <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="Weblog_AddPostToFavs" /></OffTemplate>
                <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="Weblog_RemovePostFromFavs" /></OnTemplate>
                <LeaderTemplate> | </LeaderTemplate>
            </CSBlog:WeblogPostFavoriteToggleButton>
            <CSBlog:WeblogFavoriteToggleButton runat="server">
                <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="Weblog_AddToFavs" /></OffTemplate>
                <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="Weblog_RemoveFromFavs" /></OnTemplate>
                <LeaderTemplate> | </LeaderTemplate>
            </CSBlog:WeblogFavoriteToggleButton>
            <CSBlog:WeblogPostTagEditableList runat="server" EditorCssClass="CommonInlineTagEditor" Tag="Div" CssClass="em" />
		    <CSBlog:PostAttachmentData runat="server" LinkTo="Attachment" Tag="Div" Property="FileName"><LeaderTemplate><span class="em"><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Inline12" /></span> </LeaderTemplate></CSBlog:PostAttachmentData>	
        </div>
        
        <CSControl:PlaceHolder runat="server">
		    <DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
            <ContentTemplate>
                <CSBlog:WeblogFeedbackList runat="server" ShowHeaderFooterOnNone="false">
                    <QueryOverrides PageSize="999999" />
                    <HeaderTemplate>
	                    <h4 class="CommonContentBoxHeader" id="comments"><CSControl:ResourceControl runat="server" ResourceName="Comments" /></h4>
                        <div class="CommonContentBoxContent">    
                    </HeaderTemplate>
                    <ItemTemplate>
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions><CSControl:CustomCondition runat="server" CustomResult='<%# IsAuthor(Eval("User")) %>' /></ContentConditions>
                            <TrueContentTemplate><div class="CommonCommentArea Owner"></TrueContentTemplate>
                            <FalseContentTemplate><div class="CommonCommentArea"></FalseContentTemplate>
                        </CSControl:ConditionalContent>
                            <div class="CommonCommentUser">
                                <CSControl:UserData runat="server" LinkTo="Profile">
                                	<DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
                                    <ContentTemplate>
                                        <CSControl:UserAvatar runat="server" BorderWidth="0" Width="60" Height="60" />
                                    </ContentTemplate>
                                </CSControl:UserData>
                                <CSControl:UserAvatar runat="server" BorderWidth="0" Width="60" Height="60">                                
									<DisplayConditions><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
								</CSControl:UserAvatar>
                            </div>
                            <div class="CommonCommentArrow"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div><div class="r5"></div><div class="r6"></div><div class="r7"></div><div class="r8"></div><div class="r9"></div><div class="r10"></div></div>
                            <div class="CommonCommentBubble">
                                <div class="CommonCommentBubbleRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                                <div class="CommonCommentContent">
                                    <CSBlog:DeleteWeblogPostFeedbackForm DeleteButtonId="DeleteComment" Tag="Div" CssClass="CommonMessageActions" ConfirmationResourceName="Weblog_Comment_DeleteVerify" runat="server">
		                                <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
		                                <FormTemplate><asp:LinkButton runat="server" Text="Delete" ID="DeleteComment" /></FormTemplate>
		                            </CSBlog:DeleteWeblogPostFeedbackForm>
                                    <div class="CommonMessageHeader">
                                        <CSBlog:WeblogPostFeedbackData runat="server" Property="DisplayName" LinkTo="User" Tag="Strong" />
                                        <CSControl:ResourceControl runat="server" ResourceName="Wrote" />
                                        <CSBlog:WeblogPostFeedbackData runat="server" Property="Subject" Tag="Strong" />
                                    </div>
                                    <div class="CommonMessageDate">
                                        <CSControl:ResourceControl runat="server" ResourceName="on" /> <CSBlog:WeblogPostFeedbackData runat="server" Property="PostDate" IncludeTimeInDate="true" />
                                    </div>
                                    
                                    <CSBlog:WeblogPostFeedbackData runat="server" Property="FormattedBody" Tag="Div" />
                                </div>
                                <div class="CommonCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                            </div>
                            <div style="clear: both;"></div>
                        </div>     
                     </ItemTemplate>
                    <FooterTemplate>
	                    </div>
                    </FooterTemplate>
                    <NoneTemplate></NoneTemplate>
                </CSBlog:WeblogFeedbackList>
                
                <CSBlog:WeblogPostCommentForm runat="server"
                    MessageTextBoxId="tbComment" 
                    NameTextBoxId="tbName" 
                    RememberCheckboxId="chkRemember" 
                    SubjectTextBoxId="tbTitle" 
                    SubmitButtonId="btnSubmit" 
                    UrlTextBoxId="tbUrl" 
                    ControlIdsToHideFromRegisteredUsers="RememberWrapper"
                    CustomValidatorId="AnonymousPostValidator"
                >
                    <SuccessActions>
                        <CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="CommentPosted=true" TargetLocationModification="commentmessage" />
                    </SuccessActions>
                    <FormTemplate>
                        <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="AddAComment" /></h4>
                        <div class="CommonContentBoxContent">    
                    
                            <div class="CommonFormArea">
                                <div class="CommonFormFieldName" id="NameTitle" runat="server">
                                    <CSControl:FormLabel LabelForId="tbName" runat="server" ResourceName="Weblog_CommentForm_Name" /> 
                                    <CSControl:ConditionalContent runat="server">
                                        <ContentConditions>
                                            <CSBlog:WeblogPropertyValueComparison runat="server" ComparisonProperty="EnableAnonymousPosting" Operator="IsSetOrTrue" />
                                        </ContentConditions>
                                        <TrueContentTemplate>
                                            <em>(<CSControl:ResourceControl runat="server" ResourceName="Optional" />)</em>
                                        </TrueContentTemplate>
                                        <FalseContentTemplate>
                                            <em>(<CSControl:ResourceControl runat="server" ResourceName="Required" />)</em>
                                        </FalseContentTemplate>
                                    </CSControl:ConditionalContent>
                                    <asp:CustomValidator runat="server" ID="AnonymousPostValidator" />
		                        </div>
	                            <div class="CommonFormField" id="NameDesc" runat="server">
	                                <asp:TextBox id="tbName" runat="server" Columns="60" ValidationGroup="CreateCommentForm" />
	                            </div>
        	                    
	                            <div class="CommonFormFieldName">
	                                 <CSControl:FormLabel LabelForId="tbUrl" runat="server" ResourceName="Weblog_CommentForm_YourUrl" />
	                                 <em>(<CSControl:ResourceControl runat="server" ResourceName="Optional" />)</em>
		                        </div>
	                            <div class="CommonFormField">
	                                <asp:TextBox id="tbUrl" runat="server" Columns="60" ValidationGroup="CreateCommentForm" />
	                             </div>
        	                        
	                             <div class="CommonFormFieldName">
	                                <CSControl:FormLabel LabelForId="tbComment" runat="server" ResourceName="Weblog_CommentForm_Comments" />
	                                <em>(<CSControl:ResourceControl runat="server" ResourceName="Required" />)</em>
	                                <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbComment" ValidationGroup="CreateCommentForm" />
		                         </div>
		                         <div class="CommonFormField">
		                            <asp:TextBox id="tbComment" runat="server" Columns="60" Rows="8" TextMode="MultiLine" ValidationGroup="CreateCommentForm" />
		                         </div>

                                 <div class="CommonFormField" id="Remember" runat="server">
                                    <asp:CheckBox id="chkRemember" runat="server" /><CSControl:ResourceControl runat="server" ResourceName="Weblog_CommentForm_RememberMe" />
                                 </div>
                                 
                                 <div class="CommonFormField">
	                                <CSControl:ResourceButton runat="server" id="btnSubmit" ResourceName="Add" ValidationGroup="CreateCommentForm" />
                                 </div>
                            </div>
                        </div>
                    </FormTemplate>
                </CSBlog:WeblogPostCommentForm>
            </ContentTemplate>
        </CSControl:PlaceHolder>
    </div>

</asp:Content>
