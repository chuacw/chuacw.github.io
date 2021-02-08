<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="PostPreview" Src="post-preview.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSForum:BreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSForum:BreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" EnableRendering="true" Tag="H1" IncludeSiteName="true" CssClass="CommonTitle">
        <ContentTemplate>
            <CSControl:ConditionalContent runat="server">
                <ContentConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></ContentConditions>
                <TrueContentTemplate><CSControl:ResourceControl ResourceName="CreateEditPost_Title_EditMessage" runat="server" /></TrueContentTemplate>
                <FalseContentTemplate>
                    <CSForum:ForumPostList runat="server">
                        <QueryOverrides QueryType="Parent" />
                        <ItemTemplate><CSForum:ForumPostData ResourceName="CreateEditPost_Title_ReplyMessage" Property="Subject" runat="server" /></ItemTemplate>                    
                        <NoneTemplate><CSControl:ResourceControl ResourceName="CreateEditPost_Title_PostNewMessage" runat="server" /></NoneTemplate>
                    </CSForum:ForumPostList>
                </FalseContentTemplate>
            </CSControl:ConditionalContent>
        </ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
    
            <div class="CommonDescription">
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></ContentConditions>
                    <TrueContentTemplate><CSForum:ForumPostData ResourceName="CreateEditPost_Title_EditMessageDesc" Property="Subject" runat="server" /></TrueContentTemplate>
                    <FalseContentTemplate>
                        <CSForum:ForumPostList runat="server">
                            <QueryOverrides QueryType="Parent" />
                            <ItemTemplate><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Inline1" /></ItemTemplate>                    
                            <NoneTemplate><CSControl:ResourceControl ResourceName="CreateEditPost_Title_PostNewMessageDesc" runat="server" /></NoneTemplate>
                        </CSForum:ForumPostList>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
            </div>    
       
            <CSForum:CreateEditForumPostForm runat="server"
                ID="PostForm"
                CurrentEditNotesTextBoxId="CurrentEditNotesBody" 
                EditNotesBodyTextBoxId="EditNotesBody" 
                IsAnonymousPostCheckBoxId="IsAnonymousPost" 
                IsLockedCheckBoxId="IsLocked" 
                PinnedPostDropDownListId="PinnedPost" 
                PostBodyEditorId="PostBody" 
                PostIconRadioButtonListId="PostIcon" 
                PostSubjectTextBoxId="PostSubject" 
                PreviewForumPostListId="PreviewPostList"
                ReplyToAuthorTextId="" 
                ReplyToBodyTextId="ReplyBody" 
                SubFormIds="TagsSubForm,AttachmentSubForm,VideoSubForm,PollSubForm" 
                SubmitButtonId="PostButton" 
                SubscribeToThreadCheckBoxId="SubscribeToThread"
                ValidationGroup="PostFormValidation"
                EditNotesValidationGroup="EditNotesValidation"
                QuoteButtonId="QuoteButton"
                TypeQuestionAndAnswerRadioButtonId="TypeQuestionAndAnswer"
                TypeDiscussionRadioButtonId="TypeDiscussion"
                ThreadTypeOptionsControlId="ThreadTypeOptions"
                >
                <ModeratedSuccessActions>
                    <CSControl:GoToSiteUrlAction UrlName="post_PendingModeration" runat="server">
                        <Parameter1Template><CSForum:ForumData Property="SectionID" FormatString="0" runat="server" /></Parameter1Template>
                    </CSControl:GoToSiteUrlAction>
                </ModeratedSuccessActions>
                <UnmoderatedSuccessActions>
                    <CSForum:GoToCurrentPostAction runat="server" />
                </UnmoderatedSuccessActions>
                <FormTemplate>
                
                    <TWC:TabbedPanes id="EditorTabs" runat="server"
		                PanesCssClass="CommonPane"
		                TabSetCssClass="CommonPaneTabSet"
		                TabCssClasses="CommonPaneTab"
		                TabSelectedCssClasses="CommonPaneTabSelected"
		                TabHoverCssClasses="CommonPaneTabHover"
		                >
		                <TWC:TabbedPane runat="server" ID="ComposePane">
			                <Tab><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Tab_Compose" /></Tab>
			                <Content>			                                       
                        
                                <div class="CommonCommentArea Normal Editor"> 
                                    <div class="CommonCommentArrow"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div><div class="r5"></div><div class="r6"></div><div class="r7"></div><div class="r8"></div><div class="r9"></div><div class="r10"></div></div>
                                        <div class="CommonCommentBubble">
                                            <div class="CommonCommentBubbleRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                                            <div class="CommonCommentContent"><div style="width: 100%; overflow: hidden;">   

                                                <CSControl:PlaceHolder runat="server" ID="ThreadTypeOptions">
                                                    <DisplayConditions runat="server" Operator="Not">
                                                        <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="ReplyToPostID" Operator="IsSetOrTrue" />
                                                        <CSForum:ForumConfigurationPropertyValueComparison ID="ForumConfigurationPropertyComparison2" ComparisonProperty="EnableThreadStatus" Operator="EqualTo" ComparisonValue="False" runat="server" />
                                                    </DisplayConditions>
                                                    <ContentTemplate>
                                                        <div class="ForumCreateEditPostTypeBanner">
                                                            <CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_ThisPostIsA" />&nbsp;&nbsp;&nbsp;
                                                            <asp:RadioButton runat="server" GroupName="ThreadType" ID="TypeQuestionAndAnswer" /> <CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Question" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:RadioButton runat="server" GroupName="ThreadType" ID="TypeDiscussion" /> <CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Discussion" />                                                       
                                                        </div>                                                                                    
                                                    </ContentTemplate>
                                                </CSControl:PlaceHolder>
                                        
				                                <CSControl:PlaceHolder runat="server">
				                                    <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="ReplyBody" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
				                                    <ContentTemplate>
				                                        <CSForum:ForumPostList runat="server">
				                                            <QueryOverrides QueryType="Parent" />
				                                            <ItemTemplate>
				                                                <CSControl:ResourceControl ResourceName="CreateEditPost_ReplyFormat" runat="server" Tag="Strong">
				                                                    <Parameter1Template><CSControl:UserData Property="DisplayName" runat="server" /></Parameter1Template>    
				                                                    <Parameter2Template><CSForum:ForumPostData Property="PostDate" runat="server" IncludeTimeInDate="true" /></Parameter2Template>
				                                                </CSControl:ResourceControl>
				                                            </ItemTemplate>
				                                        </CSForum:ForumPostList>
					                                    <div class="ForumReplyToPostArea">
					                                        <div>
					                                            <asp:Literal id="ReplyBody" runat="server" />
					                                        </div>
                    					                    
					                                        <CSControl:ResourceLinkButton ID="QuoteButton" runat="server" CssClass="CommonTextButton" ResourceName="Button_Quote" />
					                                    </div>
					                                 </ContentTemplate>
				                                </CSControl:PlaceHolder>

				                                <div class="CommonFormArea">
                              					           					
					                                <CSControl:ConditionalContent runat="server">
                                                        <ContentConditions><CSControl:ControlPropertyValueComparison runat="server" ComparisonProperty="ReplyToPost" Operator="IsSetOrTrue" ComparisonControlId="PostForm" /></ContentConditions>
                                                        <TrueContentTemplate><div style="display: none;"></TrueContentTemplate>
                                                        <FalseContentTemplate><div></FalseContentTemplate>
                                                    </CSControl:ConditionalContent>
                                                            <div class="CommonFormField">
                                                               <strong><CSControl:FormLabel LabelForId="PostSubject" runat="server" ResourceName="CreateEditPost_Inline7" /> <asp:requiredfieldvalidator id="postSubjectValidator" runat="server" CssClass="validationWarning" ControlToValidate="PostSubject" ErrorMessage="*" ValidationGroup="PostFormValidation" /></strong><br />
                                                               <asp:textbox autocomplete="off" id="PostSubject" runat="server" style="width:80%;" onChange="LoadRelatedPosts(this.value);" />       
                                                            </div>
                                                        </div>
                                                        
					                                <div class="CommonFormFieldName">
						                                <strong>Description: </strong> <asp:requiredfieldvalidator id="postBodyValidator" runat="server" CssClass="validationWarning" ControlToValidate="PostBody" EnableClientScript="False" ValidationGroup="PostFormValidation">*</asp:requiredfieldvalidator>
						                                <CSControl:QuoteValidator id="postBodyQuoteValidator" runat="server" CssClass="validationWarning" ControlToValidate="PostBody" EnableClientScript="false" ValidationGroup="PostFormValidation">Non matching quote blocks in post</CSControl:QuoteValidator>
					                                </div>
					                                <div class="CommonFormField">
						                                <CSControl:Editor Width="100%" runat="Server" id="PostBody" />
					                                </div>
                                					
            					                    <CSForum:PostTagsSubForm runat="server" ID="TagsSubForm" SelectTagsModalButtonId="SelectTags" TagsTextBoxId="Tags">
            					                        <FormTemplate>
            					                            <div class="CommonFormFieldName">
            					                                <CSControl:FormLabel LabelForId="Tags" runat="server" ResourceName="CreateEditPost_Tags" />
            					                            </div>
            					                            <div class="CommonFormField">
            					                                <asp:TextBox runat="server" ID="Tags" Columns="70" /> <CSControl:Modal ModalType="Button" Width="400" Height="350" ID="SelectTags" ResourceName="TagEditor_SelectTags" runat="server" />
            					                            </div>
            					                        </FormTemplate>
            					                    </CSForum:PostTagsSubForm>
                                					
            		                                <CSControl:PlaceHolder ID="PlaceHolder1" Tag="div" CssClass="CommonFormField" runat="server">
					                                    <DisplayConditions><CSControl:ControlVisibilityCondition ID="ControlVisibilityCondition1" ControlId="SubscribeToThread" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
					                                    <ContentTemplate>
						                                    <asp:checkbox id="SubscribeToThread" Checked="true" runat="server"/><CSControl:FormLabel ID="FormLabel1" runat="server" LabelForId="SubscribeToThread" ResourceName="CreateEditPost_SubscribeToThread" />
					                                    </ContentTemplate>
					                                </CSControl:PlaceHolder>

					                                <CSControl:PlaceHolder Runat="server" ID="EditNotesArea">
					                                    <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="EditNotesBody" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
					                                    <ContentTemplate>
						                                    <div class="CommonFormFieldName">
							                                    <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_EditNotes" LabelForId="EditNotesBody" />
						                                    </div>
						                                    <div class="CommonFormField">
							                                    <asp:requiredfieldvalidator id="editNotesValidator" runat="server" CssClass="validationWarning" ControlToValidate="EditNotesBody" ValidationGroup="EditNotesValidation">
													                <CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_EditNotesRequired" /><br />
							                                    </asp:requiredfieldvalidator>
							                                    <asp:textbox id="EditNotesBody" runat="server" columns="90" TextMode="MultiLine" rows="5"></asp:textbox>
						                                    </div>
						                                    <div class="CommonFormFieldName">
							                                    <CSControl:FormLabel LabelForId="CurrentEditNotesBody" runat="server" ResourceName="CreateEditPost_CurrentEditNotes" />
						                                    </div>
						                                    <div class="CommonFormField">
							                                    <asp:textbox ReadOnly="true" id="CurrentEditNotesBody" runat="server" columns="90" TextMode="MultiLine" rows="5"></asp:textbox>
						                                    </div>
						                                </ContentTemplate>
					                                </CSControl:PlaceHolder>
					                                
					                            </div>
				                            </div></div>
                                            <div class="CommonCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                                        </div>
                                    </div>
                                    <div style="clear: both;"></div>
                                </div>

			                </Content>
		                </TWC:TabbedPane>
		                <TWC:TabbedPane runat="server" id="OptionsPane">
			                <Tab><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Tab_Options" /></Tab>
			                <Content>
			                    <CSForum:PostAttachmentSubForm ID="AttachmentSubForm" runat="server" AddUpdateAttachmentModalId="AddUpdateAttachment" FilenameLabelId="Filename" RemoveAttachmentButtonId="RemoveAttachment">
		                            <FormTemplate>
		                                <div class="CommonFormFieldName">
						                    <CSControl:FormLabel LabelForId="Filename" runat="server" ResourceName="CreateEditPost_Attachment" />
					                    </div>
					                    <div class="CommonFormField">
						                    <asp:Label id="Filename" runat="server" />
						                    &nbsp;<CSControl:modal modaltype="Button" width="640" height="180" runat="Server" id="AddUpdateAttachment" ResourceName="CreateEditPost_AddUpdateAttachment" />
						                    <CSControl:ResourceButton runat="server" ID="RemoveAttachment" ResourceName="CreateEditPost_RemoveAttachment" />
					                    </div>
					                    <p />
		                            </FormTemplate>
		                        </CSForum:PostAttachmentSubForm>

				                <CSControl:PlaceHolder Tag="div" CssClass="CommonFormField" runat="server">
				                    <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="IsLocked" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
				                    <ContentTemplate>
					                    <asp:checkbox id="IsLocked" runat="server" /><CSControl:FormLabel runat="server" LabelForId="IsLocked" ResourceName="CreateEditPost_IsLocked" />
					                </ContentTemplate>
				                </CSControl:PlaceHolder>
            					
				                <CSControl:PlaceHolder Tag="div" CssClass="CommonFormField" runat="server">
				                    <DisplayConditions>
				                        <CSControl:Conditions Operator="not" runat="server">
				                            <CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" />
				                        </CSControl:Conditions>
				                        <CSForum:ForumConfigurationPropertyValueComparison runat="server" ComparisonProperty="EnableUserPostingAsAnonymous" Operator="issetortrue" />
				                        <CSForum:ForumPropertyValueComparison runat="server" ComparisonProperty="EnableAnonymousPosting" Operator="issetortrue" />
				                        <CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="EnableAnonymousUserPosting" Operator="issetortrue" />
				                    </DisplayConditions>
				                    <ContentTemplate>
					                    <asp:checkbox id="IsAnonymousPost" runat="server" /><CSControl:FormLabel runat="server" LabelForId="IsAnonymousPost" ResourceName="CreateEditPost_IsAnonymousPost" />
				                    </ContentTemplate>
				                </CSControl:PlaceHolder>
    				            
                                <CSControl:PlaceHolder runat="server">
				                    <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="PinnedPost" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
				                    <ContentTemplate>
			                            <p />
				                        <div class="CommonFormFieldName">
					                        <CSControl:FormLabel runat="server" LabelForId="PinnedPost" ResourceName="CreateEditPost_Stickiness" />
				                        </div>
				                        <div class="CommonFormField">
					                        <asp:dropdownlist id="PinnedPost" runat="server" />
				                        </div>
				                    </ContentTemplate>
				                </CSControl:PlaceHolder>
            					
        					    <CSControl:PlaceHolder runat="server">
				                    <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="PostIcon" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
				                    <ContentTemplate>
				                        <p />
					                    <div class="CommonFormFieldName">
					                        <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_PostIcon" LabelForId="PostIcon"><TrailerTemplate>:</TrailerTemplate></CSControl:FormLabel>
					                    </div>
					                    <div class="CommonFormField">
						                    <asp:RadioButtonList id="PostIcon" cellpadding="0" cellspacing="0" width="400" RepeatColumns="18" runat="server" />
					                    </div>
				                    </ContentTemplate>
				                 </CSControl:PlaceHolder>
			                </Content>
		                </TWC:TabbedPane>
		                <TWC:TabbedPane runat="server" id="VideoPane">
			                <Tab><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Tab_Video" /></Tab>
			                <Content>
			                    <CSForum:PostVideoSubForm runat="server" id="VideoSubForm" ControlIdsToHideWhenNotVisible="VideoPane"
			                        IncludeVideoCheckBoxId="IncludeVideo" 
			                        VideoDurationTextBoxId="VideoDuration" 
			                        VideoHeightTextBoxId="VideoHeight" 
			                        VideoImageUrlTextBoxId="VideoImageUrl" 
			                        VideoUrlTextBoxId="VideoUrl" 
			                        VideoWidthTextBoxId="VideoWidth"
			                        Tag="Div" CssClass="CommonFormArea" ValidationGroup="VideoValidationGroup">
			                        <FormTemplate>
			                            <CSControl:ConditionalAction runat="server">
                                            <Conditions Operator="Not"><CSControl:ControlPropertyValueComparison runat="server" ComparisonControlId="IncludeVideo" ComparisonProperty="Checked" Operator="IsSetOrTrue" /></Conditions>
                                            <Actions><CSControl:ExecuteScriptAction runat="server" Script="document.getElementById('VideoContainer').style.display = 'none';" /></Actions>
                                        </CSControl:ConditionalAction>
    			                    
		                                <div class="CommonFormFieldName">
				                            <asp:CheckBox Runat="server" ID="IncludeVideo" onclick="if (this.checked) { document.getElementById('VideoContainer').style.display = 'block'; } else { document.getElementById('VideoContainer').style.display = 'none'; }" /> <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_IncludeVideo" LabelForId="IncludeVideo" />
			                            </div>
			                            <div class="CommonFormField">
					                        <CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_IncludeVideo_Details" />
				                        </div>
			                            <CSControl:PlaceHolder ContainerId="VideoContainer" Tag="Div" ID="VideoContainer" runat="server"><ContentTemplate>
			                                <div class="CommonFormFieldName">
						                        <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_VideoUrl" LabelForId="VideoUrl" />
					                        </div>
					                        <div class="CommonFormField">
						                        <asp:textbox id="VideoUrl" runat="server" autocomplete="off" style="width:80%" />
					                        </div>
                        					
					                        <div class="CommonFormFieldName">
						                        <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_PreviewImageUrl" LabelForId="VideoImageUrl" />
					                        </div>
					                        <div class="CommonFormField">
						                        <asp:textbox id="VideoImageUrl" runat="server" autocomplete="off" style="width:80%" />
					                        </div>
                        					
					                        <div class="CommonFormFieldName">
						                        <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_VideoDuration" LabelForId="VideoDuration" />
					                        </div>
					                        <div class="CommonFormField">
						                        <asp:textbox id="VideoDuration" runat="server" autocomplete="off" style="width:80%" />
					                        </div>
                        					
					                        <div class="CommonFormFieldName">
						                        <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_VideoWidth" LabelForId="VideoWidth" />
					                        </div>
					                        <div class="CommonFormField">
						                        <asp:textbox id="VideoWidth" runat="server" autocomplete="off" style="width:80%" />
						                        <asp:RegularExpressionValidator id="VideoWidthValidator" ControlToValidate="VideoWidth" ValidationExpression="^[0-9]*$" runat="server" ValidationGroup="VideoValidationGroup">*</asp:RegularExpressionValidator>
					                        </div>
                        					
					                        <div class="CommonFormFieldName">
						                        <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_VideoHeight" LabelForId="VideoHeight" />
					                        </div>
					                        <div class="CommonFormField">
						                        <asp:textbox id="VideoHeight" runat="server" autocomplete="off" style="width:80%" />
						                        <asp:RegularExpressionValidator id="VideoHeightValidator" ControlToValidate="VideoHeight" ValidationExpression="^[0-9]*$" runat="server" ValidationGroup="VideoValidationGroup">*</asp:RegularExpressionValidator>
					                        </div>
                                        </ContentTemplate></CSControl:PlaceHolder>
			                        </FormTemplate>
			                    </CSForum:PostVideoSubForm>
			                </Content>
		                </TWC:TabbedPane>
		                <TWC:TabbedPane runat="server" id="PollPane">
			                <Tab><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Tab_Poll" /></Tab>
			                <Content>
			                    <CSForum:PostPollSubForm id="PollSubForm" runat="server" 
			                        AddButtonId="AddButton" 
			                        ControlIdsToHideWhenNotVisible="PollPane" 
			                        ExpireAfterDaysTextBoxId="ExpireAfterDays" 
			                        IncludePollCheckBoxId="IncludePoll" 
			                        NewAnswerTextBoxId="NewAnswer"
			                        PollAnswerRepeaterAnswerTextBoxId="Answer" 
			                        PollAnswerRepeaterDeleteButtonId="DeleteButton" 
			                        PollAnswerWrappedRepeaterId="PollAnswerRepeater" 
			                        PollAnswerRepeaterMoveDownButtonId="MoveDownButton" 
			                        PollAnswerRepeaterMoveUpButtonId="MoveUpButton" 
			                        PollDescriptionEditorId="PollDescription" 
			                        PollTitleTextBoxId="PollTitle"
			                        ValidationGroup="PollValidationGroup">
			                        <FormTemplate>
			                            <CSControl:ConditionalAction runat="server">
                                            <Conditions Operator="Not"><CSControl:ControlPropertyValueComparison runat="server" ComparisonControlId="IncludePoll" ComparisonProperty="Checked" Operator="IsSetOrTrue" /></Conditions>
                                            <Actions><CSControl:ExecuteScriptAction runat="server" Script="document.getElementById('PollContainer').style.display = 'none';" /></Actions>
                                        </CSControl:ConditionalAction>
    			                    
			                            <div class="CommonFormFieldName">
				                            <asp:CheckBox Runat="server" ID="IncludePoll" onclick="if (this.checked) { document.getElementById('PollContainer').style.display = 'block'; } else { document.getElementById('PollContainer').style.display = 'none'; }" /> <CSControl:FormLabel runat="server" ResourceName="CreateEditPost_IncludePoll" LabelForId="IncludeVideo" />
			                            </div>
			                             <div class="CommonFormField">
					                        <CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_IncludePoll_Details" />
				                        </div>
			                            <CSControl:PlaceHolder ContainerId="PollContainer" Tag="Div" ID="PollContainer" runat="server"><ContentTemplate>
                                            <div class="CommonFormFieldName"><CSControl:FormLabel runat="server" ResourceName="PollEditor_Title" LabelForId="PollTitle" /></div>
                                            <div class="CommonFormField">
		                                            <asp:TextBox runat="server" ID="PollTitle" Style="width: 520px;" />
		                                            <asp:RequiredFieldValidator runat="server" CssClass="CommonValidationWarning"  ValidationGroup="PollValidationGroup" ControlToValidate="PollTitle">*</asp:RequiredFieldValidator>
                                            </div>

                                            <div class="CommonFormFieldName"><CSControl:FormLabel runat="server" ResourceName="PollEditor_Description" LabelForId="PollDescription" /></div>
                                            <div class="CommonFormField"><CSControl:Editor runat="server" ID="PollDescription" Width="650" Height="175" /></div>

                                            <div class="CommonFormFieldName">
                                                <CSControl:FormLabel runat="server" ResourceName="PollEditor_Answers" />
                                            </div>
                                            <div class="CommonFormField">
	                                            <CSControl:WrappedRepeater id="PollAnswerRepeater" runat="Server" EnableViewState="false" ShowHeaderFooterOnNone="false">
		                                            <HeaderTemplate>
			                                            <ol class="CommonPollAnswerList">
		                                            </HeaderTemplate>
		                                            <ItemTemplate>
			                                            <li>
				                                            <asp:TextBox runat="server" Columns="70" ID="Answer" />
				                                            <asp:LinkButton CssClass="CommonPollMoveUpButton" ID="MoveUpButton" runat="server">&nbsp;</asp:LinkButton>
				                                            <asp:LinkButton CssClass="CommonPollMoveDownButton" ID="MoveDownButton" runat="server">&nbsp;</asp:LinkButton>
				                                            <asp:LinkButton CssClass="CommonPollDeleteButton" ID="DeleteButton" runat="server">&nbsp;</asp:LinkButton>
			                                            </li>
		                                            </ItemTemplate>
		                                            <FooterTemplate>
			                                            </ol>
		                                            </FooterTemplate>
		                                            <NoneTemplate>
		                                                <CSControl:ResourceControl ResourceName="PollEditor_NoAnswers" runat="server" />
		                                            </NoneTemplate>
	                                            </CSControl:WrappedRepeater>
                                            </div>

                                            <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="PollEditor_AddAnswer" /></div>
                                            <div class="CommonFormField">
                                                <script type="text/javascript">
                                                    // <![CDATA[
                                                    function clickAddPollButton(e)
                                                    {
                                                        if (e && e.keyCode && e.keyCode == 13) 
                                                        { 
                                                            var buttonToFire = document.getElementById('<%= CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "AddButton").ClientID %>');
                                                            if (buttonToFire)
                                                                buttonToFire.click();
                                                            
                                                            return false;
                                                        }
                                                        else if (e && e.which && e.which == 13)
                                                        {
                                                            var buttonToFire = document.getElementById('<%= CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "AddButton").ClientID %>');
                                                            if (buttonToFire)
                                                                buttonToFire.click();
                                                                
                                                            return false;
                                                        }
                                                    }
                                                    // ]]>
                                                </script>
                                                <asp:TextBox Runat="server" ID="NewAnswer" onkeypress="return clickAddPollButton(event);" Columns="70" /> 
                                                <asp:Button Runat="server" ID="AddButton" ValidationGroup="PollValidationGroup" />
                                            </div>

                                            <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="PollEditor_ExpiresAfter" /></div>
                                            <div class="CommonFormField">
	                                            <asp:TextBox Runat="server" ID="ExpireAfterDays" Columns="3" /> <CSControl:FormLabel runat="server" ResourceName="PollEditor_ExpiresAfterDays" LabelForId="ExpireAfterDays" />
	                                            <asp:CustomValidator id="ExpireAfterDaysValidator" runat="server" CssClass="CommonValidationWarning" ValidationGroup="PollValidationGroup">*</asp:CustomValidator>
                                            </div>
			                            </ContentTemplate></CSControl:PlaceHolder>
			                        </FormTemplate>
			                    </CSForum:PostPollSubForm>
			                </Content>
		                </TWC:TabbedPane>
		                <TWC:TabbedPane runat="server" id="PreviewPane">
			                <Tab OnClickClientFunction="Preview"><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Tab_Preview" /></Tab>
			                <Content>
			                    <script type="text/javascript">
			                    // <![CDATA[
			                        function Preview()
			                        {
			                            document.getElementById('previewloading').style.display = 'block';
			                            <%# ((CreateEditForumPostForm) ForumControlUtility.Instance().FindControl(this, "PostForm")).GetPreviewScript("PreviewCallback();") %>
			                        }
    			                    
			                        function PreviewCallback()
			                        {
			                            document.getElementById('previewloading').style.display = 'none';
			                        }
			                    // ]]>
			                    </script>
    			            
				                <div id="previewloading" style="display:none">Loading <CSControl:Image runat="server" ImageUrl="~/utility/spinner.gif" /></div>
				                <CSForum:ForumPostList runat="server" ID="PreviewPostList">
                                    <ItemTemplate>
                                        <CSUserControl:PostPreview runat="server" />
                                    </ItemTemplate>
				                </CSForum:ForumPostList>
			                </Content>
		                </TWC:TabbedPane>
	                </TWC:TabbedPanes>

	                <div class="CommonFormFieldName">
		                <CSControl:ResourceButton ResourceName="CreateEditPost_PostButton" id="PostButton" runat="server" ValidationGroup="PostFormValidation" />
	                </div>

	                </div>
    		
                
                </FormTemplate>
            </CSForum:CreateEditForumPostForm>
        </div>
    </div>
</asp:Content>

<asp:Content ID="RightColumnRegion" ContentPlaceHolderID="rcr" runat="server">
    <CSControl:PlaceHolder runat="server">
        <ContentTemplate>
            <div class="CommonSidebar">
                <CSForum:ThreadList runat="server" ID="TopAnswerThreads">
                    <DisplayConditions Operator="And">                
                        <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="ReplyToPostID" Operator="EqualTo" ComparisonValue="" />
                        <CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="LessThanOrEqualTo" ComparisonValue="0" />   
                    </DisplayConditions>
                    <QueryOverrides PageSize="5" Status="Answered" SortBy="TotalViews" SortOrder="Descending"  />
                    <HeaderTemplate>
                        <div class="CommonContentBox" id="TopAnswers">
                            <h4 class="CommonContentBoxHeader">Top Answers</h4>
                            <div class="CommonContentBoxContent">
                                <ul class="CommonSidebarList">                                            
                    </HeaderTemplate>			                        
                    <ItemTemplate>
                        <CSForum:ForumPostList runat="server" ID="TopAnswers">
                            <QueryOverrides QueryType="ThreadAnswers" />
                            <ItemTemplate>
                                <CSForum:ForumPostData runat="server" LinkTo="Post" Property="Subject" Tag="Li" />
                            </ItemTemplate>
                        </CSForum:ForumPostList>
                    </ItemTemplate>
                    <FooterTemplate>
                                </ul>
                            </div>
                        </div>
                    </FooterTemplate>			                                 
                </CSForum:ThreadList>

                <script type="text/javascript">
                // <![CDATA[
                    function LoadRelatedPosts(subject)
                    {
                        document.getElementById('relatedpostsloading').style.display = 'block';
                        var topanswers = document.getElementById('TopAnswers');
                        if (topanswers) topanswers.style.display = 'none';
                        <%# ((RelatedIndexPostList) ForumControlUtility.Instance().FindControl(this, "RelatedPosts")).GetRelatedIndexPostsScript("subject", "LoadRelatedPostsCallback();") %>
                    }
                    
                    function LoadRelatedPostsCallback()
                    {
                        document.getElementById('relatedpostsloading').style.display = 'none';
                    }
                // ]]>
                </script>
            
                <div id="relatedpostsloading" style="display:none"><CSControl:ResourceControl ID="ResourceControl1" runat="server" ResourceName="Loading" /> <CSControl:Image ID="Image1" runat="server" ImageUrl="~/utility/spinner.gif" /></div>
                <CSControl:RelatedIndexPostList id="RelatedPosts" runat="server" ShowHeaderFooterOnNone="True" AlwaysBindData="false">
                    <DisplayConditions Operator="And">
                        <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="ReplyToPostID" Operator="EqualTo" ComparisonValue="" />
                        <CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="LessThanOrEqualTo" ComparisonValue="0" />   
                    </DisplayConditions>
                    <QueryOverrides PageSize="10" ApplicationTypes="Forum" />
                    <HeaderTemplate>
                         <div class="CommonContentBox">
                            <h4 class="CommonContentBoxHeader">Related Posts</h4>
                            <div class="CommonContentBoxContent">
                                <ul class="CommonSidebarList">   
                    </HeaderTemplate>
                    <ItemTemplate>
                        <CSControl:IndexPostData runat="server" LinkTo="Post" Property="Title" Tag="Li" LinkTarget="_blank" />
                    </ItemTemplate>
                    <FooterTemplate>
                                </ul>
                            </div>
                        </div>
                    </FooterTemplate>
                    <NoneTemplate>No Related Posts</NoneTemplate>
                </CSControl:RelatedIndexPostList>
            </div>        
        </ContentTemplate>
    </CSControl:PlaceHolder>



</asp:Content>
