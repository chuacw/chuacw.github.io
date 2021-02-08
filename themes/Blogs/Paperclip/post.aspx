<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false">
        <ContentTemplate><CSBlog:WeblogPostData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>

    <div class="post">
       <CSBlog:WeblogPostData runat="server" Property="Subject" Tag="H2" CssClass="pageTitle" />

       <CSBlog:WeblogPostData Property="FormattedBody" IncrementViewCount="true" runat="server" />
       <CSBlog:WeblogPostData ResourceName="Weblog_ReadMirroredPost" Property="TitleUrl" runat="server">
	        <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
	        <LeaderTemplate><p><i></LeaderTemplate>
	        <TrailerTemplate></i></p></TrailerTemplate>
	    </CSBlog:WeblogPostData>

        <div class="postfoot">
            <CSBlog:PostAttachmentData runat="server" LinkTo="Attachment" Tag="Div" Property="FileName"><LeaderTemplate><span class="em">Attachment:</span> </LeaderTemplate></CSBlog:PostAttachmentData>	
            <span class="em">Posted:</span>
            <CSBlog:WeblogPostData Property="UserTime" LinkTo="Post" IncludeTimeInDate="true" runat="server" />
			<CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
			<CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" /> 
			<CSControl:PlaceHolder runat="server">
				<DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
                <ContentTemplate>
                    <CSBlog:WeblogPostData Text="{0} comment(s)" Property="Replies" LinkTo="PostComments" runat="server">
                        <LeaderTemplate>| <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_With" id="CommentDesc"/> </LeaderTemplate>
                        <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="GreaterThan" /></DisplayConditions>
                    </CSBlog:WeblogPostData>
                    <CSBlog:WeblogPostData Text="no comments" Property="Replies" LinkTo="PostComments" runat="server">
                        <LeaderTemplate>| <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_With" id="CommentDesc"/> </LeaderTemplate>
                        <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="Replies" ComparisonValue="0" Operator="LessThanOrEqualTo" /></DisplayConditions>
                    </CSBlog:WeblogPostData>
                </ContentTemplate>
            </CSControl:PlaceHolder>
            <CSBlog:WeblogPostRating runat="server" RatingCssClass="RateControl" RatingReadOnlyCssClass="RateControlReadOnly" RatingActiveCssClass="RateControlActive" ImagesBaseUrl="~/utility/images/">
                <LeaderTemplate>| </LeaderTemplate>
            </CSBlog:WeblogPostRating>
            <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_EditPost" runat="server"><LeaderTemplate>| </LeaderTemplate></CSBlog:WeblogPostData>
            <CSBlog:WeblogPostTagEditableList runat="server" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />
        </div>    
    </div>
    
    <CSControl:PlaceHolder runat="server">
		<DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate>
            <CSBlog:WeblogFeedbackList runat="server">
                <QueryOverrides PageSize="999999" />
                <HeaderTemplate>
                    <div id="comments">
                    <a name="Comments"></a>
                    <CSControl:ResourceControl runat="server" ResourceName="Weblog_CommentForm_Comments" Tag="H2" />
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="<%# ((bool) Eval("IsOwner")) ? "CommentAreaOwner" : "CommentArea" %>">
			            <h4 class="CommentTitle">
				            <CSBlog:WeblogPostFeedbackData runat="server" LinkTo="User" Property="DisplayName" />
				            <CSControl:resourcecontrol runat="server" resourcename="Weblog_CommentForm_Said" ID="Resourcecontrol1" />
				            <CSBlog:ThemeImage runat="server" ImageUrl="~/images/spacer.gif" ImageAlign="bottom" CssClass="CommentArrow" AlternateText=" " />
			            </h4>
			            <div class="CommentText">
				            <div class="CommentText2">
					            <div class="CommentText3"><CSBlog:WeblogPostFeedbackData runat="server" Property="FormattedBody" /></div>
				            </div>
			            </div>
			            <div class="CommentFooter">
			                <CSBlog:WeblogPostFeedbackData runat="server" LinkTo="Feedback" Text="#" />
			                <CSBlog:WeblogPostFeedbackData runat="server" Property="PostDate" FormatString="MMMM d, yyyy h:mm tt" />
                            <CSBlog:DeleteWeblogPostFeedbackForm DeleteButtonId="DeleteComment" ConfirmationResourceName="Weblog_Comment_DeleteVerify" runat="server">
                                <SuccessActions>
	                                <CSControl:GoToModifiedUrlAction runat="server" />
	                            </SuccessActions>
                                <FormTemplate>
                                    [<asp:LinkButton runat="server" Text="Delete" ID="DeleteComment" />]
                                </FormTemplate>
                            </CSBlog:DeleteWeblogPostFeedbackForm>
                        </div>
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
                    <fieldset id="commentform">
                    <legend><CSControl:ResourceControl runat="server" ResourceName="Weblog_CommentForm_WhatDoYouThink" id="rc_think"/></legend>
	                    <asp:Panel runat="server" ID="RegisteredWrapper">
	                    <p />
                        <div><CSControl:FormLabel runat="server" ResourceName="Title" LabelForId="tbTitle" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Required"/>)</em><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbTitle" ValidationGroup="CreateCommentForm" /></div>
	                    <div><asp:TextBox id="tbTitle" runat="server" CssClass="smallbox" ValidationGroup="CreateCommentForm" /></div>
	                    <p />
                        <div id="NameTitle" runat="server"><CSControl:FormLabel LabelForId="tbName" runat="server" ResourceName="Weblog_CommentForm_Name" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Required" />)</em><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbName" ValidationGroup="CreateCommentForm" /></div>
                        <div id="NameDesc" runat="server"><asp:TextBox id="tbName" runat="server" CssClass="smallbox" ValidationGroup="CreateCommentForm" /></div>
                        <p />
                        <div><CSControl:FormLabel runat="server" LabelForId="tbUrl" ResourceName="Weblog_CommentForm_YourUrl" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Optional" /></em>)</div>
                        <div><asp:TextBox id="tbUrl" runat="server" CssClass="smallbox" ValidationGroup="CreateCommentForm" /></div>
                        </asp:Panel>
                        <p />
                        <div><CSControl:FormLabel LabelForId="tbComment" runat="server" ResourceName="Weblog_CommentForm_Comments" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Required" />)</em><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbComment" ValidationGroup="CreateCommentForm" /></div>
                        <div><asp:TextBox id="tbComment" runat="server" Rows="5" Columns="25" TextMode="MultiLine" ValidationGroup="CreateCommentForm" /></div>
	                    <asp:PlaceHolder runat="server" id="RememberWrapper">
	                        <p />
                            <div><asp:CheckBox id="chkRemember" runat="server" Text="Remember Me?" ValidationGroup="CreateCommentForm"></asp:CheckBox></div>
                        </asp:PlaceHolder>
	                    <p />
                        <asp:Button id="btnSubmit" runat="server" Text="Submit" ValidationGroup="CreateCommentForm"></asp:Button>
                    </fieldset>
                </FormTemplate>
            </CSBlog:WeblogPostCommentForm>
        </ContentTemplate>
    </CSControl:PlaceHolder>
</asp:Content>
