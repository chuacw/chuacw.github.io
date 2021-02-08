<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>
<%@ Register TagPrefix="CSUserControl" TagName="AdTop" Src="/Themes/CS2008-Common/Ad-Top.ascx" %>
<%@ Register TagPrefix="CSUserControl" TagName="AdBottom" Src="/Themes/CS2008-Common/Ad-Bottom.ascx" %>
<%@ Register TagPrefix="th" Namespace="TimothyHumphrey.CommunityServer.WebControls" Assembly="TimothyHumphrey.CommunityServer" %>
<%@ Register TagPrefix="th" Namespace="TimothyHumphrey.WebControls" Assembly="TimothyHumphrey.CommunityServer" %>
<%@ Import Namespace = "CommunityServer.Components" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false">
        <ContentTemplate><CSBlog:WeblogPostData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>

    <!-- AdPart chuacw -->
    <CSControl:AdPart runat = "Server" contentname="StandardTop" ContentCssClass="CommonContentPartBorderOff" ContentHoverCssClass="CommonContentPartBorderOn">
	<DefaultContentTemplate>
	<CSUserControl:AdTop runat="server" />
	</DefaultContentTemplate>
    </CSControl:AdPart>

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
            <span class="em">Published</span>
            <CSBlog:WeblogPostData Property="UserTime" LinkTo="Post" FormatString="ddd, d MMM yyyy @ h:mm tt" IncludeTimeInDate="true" runat="server" />
	    <CSControl:ResourceControl runat="server" ResourceName="Weblog_EntryList_By" id="PostByResource" />
	    <CSBlog:WeblogPostData Property="DisplayName" LinkTo="AuthorUrl" runat="server" />
<!-- chuacw Facebook Google+ Twitter -->
            <CSBlog:WeblogPostData LinkTo="PostEditor" ResourceName="Weblog_Link_EditPost" runat="server"><LeaderTemplate>| </LeaderTemplate></CSBlog:WeblogPostData>
            <CSBlog:WeblogPostRating runat="server" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/utility/images/" />
            <CSBlog:WeblogPostTagEditableList runat="server" EditorLinkCssClass="TextButton" EditorCssClass="InlineTagEditor" Tag="Div" CssClass="em" />

<CSControl:ConditionalContent runat="server">
    <ContentConditions><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></ContentConditions>
    <TrueContentTemplate>
        <script src="https://platform.linkedin.com/in.js" type="text/javascript">
         lang: en_US
        </script>
        <span><a href="https://twitter.com/share" class="twitter-share-button" data-via="chuacw">Tweet</a></span>
        <span>
        <script type="IN/Share" data-url="<%= HttpContext.Current.Request.Url.Scheme %>//<%= HttpContext.Current.Request.Url.Host %><CSBlog:WeblogPostData runat='server' Property='ViewPostURL' />" data-counter="top"></script>
        </span>

        <!-- share buttons here! chuacw 21 Jul 2020 -->

    </TrueContentTemplate>
    <FalseContentTemplate>
    <!-- the above code from CSControl:ConditionalContent to the below ending tag is added by chuacw 10 Feb 2014 ->
    </FalseContentTemplate>
</CSControl:ConditionalContent>

        </div>
    </div>

    <!-- blah Gertrude -->

    <CSControl:PlaceHolder runat="server">
		<DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate>            
            <CSBlog:WeblogFeedbackList runat="server">
                <QueryOverrides PageSize="999999" />
                <HeaderTemplate>
                    <a name="Comments"></a>
                    <CSControl:ResourceControl runat="server" ResourceName="Weblog_CommentForm_Comments" Tag="H3" />
                    <div id="comments">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="<%# ((bool) Eval("IsOwner")) ? "commentowner" : "comment" %>">
			            <h4>
				            <CSBlog:WeblogPostFeedbackData runat="server" LinkTo="Feedback" Text="#" />
				            <CSBlog:WeblogPostFeedbackData runat="server" Property="Subject" Tag="span" />
			            </h4>
			            <div class="commentssubhead">
			                <span class="commentspan">
			                    <CSBlog:DeleteWeblogPostFeedbackForm DeleteButtonId="DeleteComment" ConfirmationResourceName="Weblog_Comment_DeleteVerify" runat="server">
			                        <SuccessActions>
                                        <CSControl:GoToModifiedUrlAction runat="server" />
                                    </SuccessActions>
                                    <FormTemplate>
                                        <CSControl:ResourceLinkButton runat="server" ResourceName="Weblog_Link_RemoveComment" ID="DeleteComment" />
                                    </FormTemplate>
                                </CSBlog:DeleteWeblogPostFeedbackForm>
                            </span>
			                <CSBlog:WeblogPostFeedbackData runat="server" Property="PostDate" FormatString="f" />
			                by <CSBlog:WeblogPostFeedbackData runat="server" Property="DisplayName" LinkTo="User" />
        			        
                        </div>			
		                <div class="commentsbody">
		                    <CSBlog:WeblogPostFeedbackData runat="server" Property="FormattedBody" Tag="p" />
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

<CSControl:ConditionalContent runat="server">
    <ContentConditions><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></ContentConditions>
    <TrueContentTemplate>
<!--
                    <dt>Enter the following code to ensure that your comment reaches the intended party:</dt>
                    <dd><th:Captcha runat="server" id="captcha1" ValidationGroup="CreateCommentForm" /></dd>
21 Jul 2020, chuacw
-->
    </TrueContentTemplate>
    <FalseContentTemplate>
    <!-- the above code from CSControl:ConditionalContent to the below ending tag is added by chuacw 16 Mar 2012-->
    </FalseContentTemplate>
</CSControl:ConditionalContent>

                            <dt><asp:Button id="btnSubmit" runat="server" Text="Submit" ValidationGroup="CreateCommentForm"></asp:Button></dt>
	                    </dl>
                    </div>
                </FormTemplate>
            </CSBlog:WeblogPostCommentForm>    
        </ContentTemplate>
     </CSControl:PlaceHolder>

        <!-- AdPart chuacw 1 May 2011 -->
        <CSControl:AdPart runat="Server" ContentName="StandardBottom" ContentCssClass="CommonContentPartBorderOff" ContentHoverCssClass="CommonContentPartBorderOn">
          <DefaultContentTemplate>
        	<CSUserControl:AdBottom runat="server" />
          </DefaultContentTemplate>
        </CSControl:AdPart>


</asp:Content>
