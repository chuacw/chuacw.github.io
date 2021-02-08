<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false">
        <ContentTemplate><CSBlog:WeblogPostData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>

    <div class="post">
        <div class="postsub">
            <CSBlog:WeblogPostData runat="server" Property="Subject" Tag="h2" />
            <CSBlog:WeblogPostData Property="FormattedBody" IncrementViewCount="true" runat="server" />
            <CSBlog:WeblogPostData ResourceName="Weblog_ReadMirroredPost" Property="TitleUrl" runat="server">
		        <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
		        <LeaderTemplate><p><i></LeaderTemplate>
		        <TrailerTemplate></i></p></TrailerTemplate>
		    </CSBlog:WeblogPostData>

            <div class="postfoot">
                <CSBlog:PostAttachmentData runat="server" LinkTo="Attachment" Tag="Div" Property="FileName"><LeaderTemplate><span class="em">Attachment:</span> </LeaderTemplate></CSBlog:PostAttachmentData>	
                <span class="em">Published</span>
                <CSBlog:WeblogPostData Property="UserTime" IncludeTimeInDate="true" runat="server" />
			    <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
			    <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
<g:plusone annotation="inline"></g:plusone>

<!-- Google+ -->
<script type="text/javascript">
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
                <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_Edit" runat="server"><LeaderTemplate>| </LeaderTemplate></CSBlog:WeblogPostData>
                <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />            
                <CSBlog:WeblogPostTagEditableList runat="server" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />
            </div>
        </div>    
    </div>
    
    <!-- blah Marvin3 -->
    
    <CSControl:PlaceHolder runat="server">
		<DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate>
            <CSBlog:WeblogFeedbackList runat="server">
                <QueryOverrides PageSize="999999" />
                <HeaderTemplate>
                    <CSControl:ResourceControl runat="server" ResourceName="Weblog_CommentForm_Comments" Tag="H3" />
                    <div id="comments">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="<%# ((bool) Eval("IsOwner")) ? "commentowner" : "comment" %>">
			            <div class="commentssubhead">
			                <CSBlog:DeleteWeblogPostFeedbackForm DeleteButtonId="DeleteComment" ConfirmationResourceName="Weblog_Comment_DeleteVerify" runat="server" Tag="span" CssClass="commentspan">
	                            <SuccessActions>
                                    <CSControl:GoToModifiedUrlAction runat="server" />
                                </SuccessActions>
                                <FormTemplate>
                                    <CSControl:ResourceLinkButton runat="server" ResourceName="Weblog_Link_RemoveComment" ID="DeleteComment" />
                                </FormTemplate>
                            </CSBlog:DeleteWeblogPostFeedbackForm>
                            <CSBlog:WeblogPostFeedbackData runat="server" Property="PostDate" FormatString="f" />
                            <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
                            <CSBlog:WeblogPostFeedbackData runat="server" Property="DisplayName" LinkTo="User" />
			            </div>
			            <h4>
			                <CSBlog:WeblogPostFeedbackData runat="server" LinkTo="Feedback" Text="#" />
			                <CSBlog:WeblogPostFeedbackData runat="server" Property="Subject" />
			            </h4>
		                <CSBlog:WeblogPostFeedbackData runat="server" Property="FormattedBody" CssClass="commentsbody" Tag="div" />  
  		            </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </CSBlog:WeblogFeedbackList>
            
            <CSControl:ResourceControl runat="server" ResourceName="Blog_Pending_Comment" Tag="Strong">
                <DisplayConditions>
                    <CSControl:QueryStringPropertyValueComparison QueryStringProperty="CommentPosted" Operator="IsSetOrTrue" runat="server" />
                </DisplayConditions>
                <LeaderTemplate><a name="commentmessage"></a></LeaderTemplate>
            </CSControl:ResourceControl>
            
            <CSBlog:WeblogPostCommentForm runat="server"
                MessageTextBoxId="tbComment" 
                NameTextBoxId="tbName" 
                RememberCheckboxId="chkRemember" 
                SubjectTextBoxId="tbTitle" 
                SubmitButtonId="btnSubmit" 
                UrlTextBoxId="tbUrl" 
                ControlIdsToHideFromRegisteredUsers="RegisteredWrapper,RememberWrapper"
            >
                <SuccessActions>
                    <CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="CommentPosted=true" TargetLocationModification="commentmessage" />
                </SuccessActions>
                <FormTemplate>
                    <div id="commentform">
                    <CSControl:ResourceControl runat="server" ResourceName="Weblog_CommentForm_WhatDoYouThink" id="rc_think" Tag="h3"/>
	                    <dl>
	                        <asp:Panel runat="server" ID="RegisteredWrapper">
                            <dt><CSControl:FormLabel runat="server" ResourceName="Title" LabelForId="tbTitle" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Required"/>)</em><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbTitle" ValidationGroup="CreateCommentForm" /></dt>
	                        <dd><asp:TextBox id="tbTitle" runat="server" CssClass="smallbox" ValidationGroup="CreateCommentForm" /></dd>

                            <dt id="NameTitle" runat="server"><CSControl:FormLabel LabelForId="tbName" runat="server" ResourceName="Weblog_CommentForm_Name" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Required" />)</em><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbName" ValidationGroup="CreateCommentForm" /></dt>
                            <dd id="NameDesc" runat="server"><asp:TextBox id="tbName" runat="server" CssClass="smallbox" ValidationGroup="CreateCommentForm" /></dd>

                            <dt><CSControl:FormLabel runat="server" LabelForId="tbUrl" ResourceName="Weblog_CommentForm_YourUrl" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Optional" /></em>)</dt>
                            <dd><asp:TextBox id="tbUrl" runat="server" CssClass="smallbox" ValidationGroup="CreateCommentForm" /></dd>
                            </asp:Panel>
                            
                            <dt><CSControl:FormLabel LabelForId="tbComment" runat="server" ResourceName="Weblog_CommentForm_Comments" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Required" />)</em><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbComment" ValidationGroup="CreateCommentForm" /></dt>
                            <dd><asp:TextBox id="tbComment" runat="server" Rows="5" Columns="25" TextMode="MultiLine" ValidationGroup="CreateCommentForm" /></dd>

                            <dt id="RememberWrapper" runat="server"><asp:CheckBox id="chkRemember" runat="server" Text="Remember Me?" ValidationGroup="CreateCommentForm"></asp:CheckBox></dt>
               
                            <dt><asp:Button id="btnSubmit" runat="server" Text="Submit" ValidationGroup="CreateCommentForm"></asp:Button></dt>
	                    </dl>
                    </div>
                </FormTemplate>
            </CSBlog:WeblogPostCommentForm>    
        </ContentTemplate>
    </CSControl:PlaceHolder>
</asp:Content>
