<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false">
        <ContentTemplate><CSBlog:WeblogPostData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>

    <div class="entryview">
        <CSBlog:WeblogPostData runat="server" Property="Subject" Tag="H1" CssClass="entryviewheading" />
        <div class="entryviewheadersub">
            <span class="entrylistheadersub">
                <CSBlog:WeblogPostData Property="UserTime" IncludeTimeInDate="true" runat="server"><LeaderTemplate>Published </LeaderTemplate></CSBlog:WeblogPostData>
                <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server"><LeaderTemplate>| </LeaderTemplate></CSBlog:WeblogPostData>
                <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />
                <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_Edit" runat="server" />                        
            </span>
        </div>
        <CSBlog:WeblogPostData Property="FormattedBody" IncrementViewCount="true" runat="server" />
        <CSBlog:WeblogPostData ResourceName="Weblog_ReadMirroredPost" Property="TitleUrl" runat="server">
	        <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
	        <LeaderTemplate><p><i></LeaderTemplate>
	        <TrailerTemplate></i></p></TrailerTemplate>
	    </CSBlog:WeblogPostData>

        <div class="entryviewfooter">
            <CSBlog:WeblogPostTagEditableList runat="server" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />
        </div>    
    </div>
    
    <CSControl:PlaceHolder runat="server">
		<DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate>
            <CSBlog:WeblogFeedbackList runat="server">
                <QueryOverrides PageSize="999999" />
                <LeaderTemplate>
                    <CSControl:ResourceControl runat="server" ResourceName="Weblog_CommentForm_Comments" Tag="H4" CssClass="contentsubheading" />
                    <dl class="comments">
                </LeaderTemplate>
                <ItemTemplate>
                        <dt class="<%# ((bool) Eval("IsOwner")) ? "owner" : "comment" %>">
				            <CSBlog:WeblogPostFeedbackData runat="server" LinkTo="Feedback" Text="#" />
				            <CSBlog:WeblogPostFeedbackData runat="server" Property="DisplayName" LinkTo="User" />
				            <CSBlog:WeblogPostFeedbackData runat="server" Property="PostDate" FormatString="MMMM d, yyyy h:mm tt" >
				                <LeaderTemplate> said on </LeaderTemplate>
				                <TrailerTemplate>: </TrailerTemplate>
                            </CSBlog:WeblogPostFeedbackData>
                        </dt>
                        <dd class="<%# ((bool) Eval("IsOwner")) ? "owner" : "comment" %>">
                            <CSBlog:WeblogPostFeedbackData runat="server" Property="FormattedBody" Tag="p" />
                            <CSBlog:DeleteWeblogPostFeedbackForm DeleteButtonId="DeleteComment" ConfirmationResourceName="Weblog_Comment_DeleteVerify" runat="server">
		                        <SuccessActions>
                                    <CSControl:GoToModifiedUrlAction runat="server" />
                                </SuccessActions>
                                <FormTemplate>
                                    <CSControl:ResourceLinkButton runat="server" ResourceName="Weblog_Link_RemoveComment" ID="DeleteComment" CssClass="commentsfooter" />
                                </FormTemplate>
                            </CSBlog:DeleteWeblogPostFeedbackForm>
                        </dd>
                </ItemTemplate>    
                <TrailerTemplate>
                    </dl>
                </TrailerTemplate>
            </CSBlog:WeblogFeedbackList>
            
            <CSControl:ResourceControl runat="server" ResourceName="Blog_Pending_Comment" Tag="Strong" CssClass="commentpending">
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
                ControlIdsToHideFromRegisteredUsers="RegisteredWrapper,AnonymousComment"
            >
                <SuccessActions>
                    <CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="CommentPosted=true" TargetLocationModification="commentmessage" />
                </SuccessActions>
                <FormTemplate>
                    
                    <CSControl:ResourceControl runat="server" ResourceName="Weblog_CommentForm_WhatDoYouThink" id="rc_think" Tag="h4" CssClass="contentsubheading" />
                    <dl class="commentform">
                        <table cellpadding="3">
                            <tr>
                                <td colspan="2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="A comment is required" ControlToValidate="tbComment" ValidationGroup="CreateCommentForm" />
                                    <asp:TextBox id="tbComment" runat="server" Rows="5" Columns="25" CssClass="textmultiline" TextMode="MultiLine" ValidationGroup="CreateCommentForm" />
                                </td>
                            </tr>
                            <asp:Panel runat="server" ID="RegisteredWrapper">
                            <tr>
                                <td>
                                    <CSControl:ResourceControl ID="FormLabel1" runat="server" ResourceName="Weblog_CommentForm_Name" /> 
                                </td>
                                
                                <td>
                                    <asp:TextBox id="tbName" runat="server" ValidationGroup="CreateCommentForm" /> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is required" ControlToValidate="tbName" ValidationGroup="CreateCommentForm"/>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <CSControl:ResourceControl ID="FormLabel2" runat="server" ResourceName="Weblog_CommentForm_YourUrl" /> 
                                </td>
                                
                                <td>
                                    <asp:TextBox id="tbUrl" runat="server" ValidationGroup="CreateCommentForm" />
                                </td>
                            </tr>
                            </asp:Panel>
                        </table>
                    

                        <asp:Panel ID="AnonymousComment" runat="server">
                            <dt></dt>
                            <dt></dt>
                            <dt><asp:CheckBox id="chkRemember" runat="server" Text="Remember Me?" ValidationGroup="CreateCommentForm"></asp:CheckBox></dt>
                        </asp:Panel>
           
                        <dt><asp:Button id="btnSubmit" runat="server" Text="Submit" ValidationGroup="CreateCommentForm"></asp:Button></dt>
                    </dl>
                </FormTemplate>
            </CSBlog:WeblogPostCommentForm>    
        </ContentTemplate>
     </CSControl:PlaceHolder>
</asp:Content>
