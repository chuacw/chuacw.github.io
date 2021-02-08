<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="PostPreview" Src="post-preview.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSForum:BreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSForum:BreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" Tag="h1" CssClass="CommonTitle" IncludeSiteName="true" ResourceName="Report" EnableRendering="true" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
	
            <CSForum:ReportAbuseForm runat="server"
                ID="PostForm"
                IsAnonymousPostCheckBoxId="IsAnonymousPost" 
                IsLockedCheckBoxId="IsLocked" 
                PinnedPostDropDownListId="PinnedPost" 
                PostBodyEditorId="PostBody" 
                PostIconRadioButtonListId="PostIcon" 
                PostSubjectTextBoxId="PostSubject" 
                PreviewForumPostListId="PreviewPostList"
                SubFormIds="TagsSubForm,AttachmentSubForm" 
                SubmitButtonId="PostButton" 
                SubscribeToThreadCheckBoxId="SubscribeToThread"
                ValidationGroup="PostFormValidation"
                >
                <ModeratedSuccessActions>
                    <CSControl:GoToSiteUrlAction UrlName="home" runat="server" />
                </ModeratedSuccessActions>
                <UnmoderatedSuccessActions>
                    <CSControl:GoToSiteUrlAction UrlName="home" runat="server" />
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
				                <div class="CommonFormArea">
              					           					
					                <div class="CommonFormFieldName">
						                <CSControl:FormLabel LabelForId="PostSubject" runat="server" ResourceName="CreateEditPost_Inline7" /> <asp:requiredfieldvalidator id="postSubjectValidator" runat="server" CssClass="validationWarning" ControlToValidate="PostSubject" ErrorMessage="*" ValidationGroup="PostFormValidation" />
					                </div>
					                <div class="CommonFormField">
						                <asp:textbox autocomplete="off" id="PostSubject" runat="server" style="width:80%;" />	
					                </div>
                					
					                <div class="CommonFormFieldName">
						                <CSControl:FormLabel LabelForId="PostBody" runat="server" ResourceName="CreateEditPost_Body" />
						                <asp:requiredfieldvalidator id="postBodyValidator" runat="server" CssClass="validationWarning" ControlToValidate="PostBody" EnableClientScript="False" ValidationGroup="PostFormValidation">*</asp:requiredfieldvalidator>
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
						                    <CSControl:ResourceLinkButton runat="server" ID="RemoveAttachment" CssClass="CommonTextButton" ResourceName="CreateEditPost_RemoveAttachment" />
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
				                    <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="SubscribeToThread" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
				                    <ContentTemplate>
					                    <asp:checkbox id="SubscribeToThread" Checked="true" runat="server"/><CSControl:FormLabel runat="server" LabelForId="SubscribeToThread" ResourceName="CreateEditPost_SubscribeToThread" />
				                    </ContentTemplate>
				                </CSControl:PlaceHolder>
            					
				                <CSControl:PlaceHolder Tag="div" CssClass="CommonFormField" runat="server">
				                    <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="IsAnonymousPost" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
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
		                <TWC:TabbedPane runat="server" id="RelatedPane">
			                <Tab OnClickClientFunction="LoadRelatedPosts"><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Tab_Related" /></Tab>
			                <Content>
			                    <script type="text/javascript">
			                    // <![CDATA[
			                        function LoadRelatedPosts()
			                        {
			                            document.getElementById('relatedpostsloading').style.display = 'block';
			                            var subject = document.getElementById('<%# ((TextBox) ForumControlUtility.Instance().FindControl(this, "PostSubject")).ClientID %>').value;
			                            <%# ((RelatedIndexPostList) ForumControlUtility.Instance().FindControl(this, "RelatedPosts")).GetRelatedIndexPostsScript("subject", "LoadRelatedPostsCallback();") %>
			                        }
    			                    
			                        function LoadRelatedPostsCallback()
			                        {
			                            document.getElementById('relatedpostsloading').style.display = 'none';
			                        }
			                    // ]]>
			                    </script>
    			            
			                    <div id="relatedpostsloading" style="display:none"><CSControl:ResourceControl runat="server" ResourceName="Loading" /> <CSControl:Image runat="server" ImageUrl="~/utility/spinner.gif" /></div>
			                    <CSControl:RelatedIndexPostList id="RelatedPosts" runat="server" ShowHeaderFooterOnNone="false">
			                        <QueryOverrides PageSize="15" />
			                        <HeaderTemplate>
			                            <ul class="CommonAvatarListItemList">
			                        </HeaderTemplate>
			                        <ItemTemplate>
			                            <li>
						                    <div class="CommonAvatarListItemArea">
							                    <CSControl:IndexPostData runat="server" LinkTo="Post" Property="Title" Tag="H4" CssClass="CommonAvatarListItemName" LinkTarget="_blank" />
    					                        <CSControl:IndexPostData runat="server" Property="BestMatch" TruncateAt="350" Tag="Div" CssClass="CommonAvatarListItem" />
							                    <div class="CommonAvatarListItemDetails">
							                        <CSControl:ResourceControl runat="server" ResourceName="Postedto" /> <CSControl:IndexPostData runat="server" LinkTo="Application" LinkTarget="_blank">
							                            <ContentTemplate>
							                                <CSControl:IndexPostData runat="server" Property="SectionName" /> 
							                                (<CSControl:IndexPostData runat="server" Property="ApplicationType" />)
							                            </ContentTemplate>
							                        </CSControl:IndexPostData> <CSControl:ResourceControl runat="server" ResourceName="by" /> <CSControl:IndexPostData runat="server" Property="UserName" /> <CSControl:ResourceControl runat="server" ResourceName="on" /> <CSControl:IndexPostData runat="server" Property="PostDate" />
							                    </div>
						                    </div>
						                </li>
			                        </ItemTemplate>
			                        <FooterTemplate>
			                            </ul>
			                        </FooterTemplate>
			                        <NoneTemplate>
			                            <CSControl:ResourceControl runat="server" ResourceName="Forums_NoRelatedPosts" />
			                        </NoneTemplate>
			                    </CSControl:RelatedIndexPostList>
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
                                    <HeaderTemplate><ul class="ForumPostList"></HeaderTemplate>
                                                <ItemTemplate>
			                                        <li>
				                                        <CSUserControl:PostPreview runat="server" />
			                                        </li>
                                                </ItemTemplate>
                                                <FooterTemplate>
		                                            </ul>
		                                        </FooterTemplate>
				                </CSForum:ForumPostList>
			                </Content>
		                </TWC:TabbedPane>
	                </TWC:TabbedPanes>

                    <div id="inkWrapper" class="CommonPane" style="position:absolute;left:-5000px;">
                        <asp:PlaceHolder runat="Server" id="InkEditor" />
                    </div>
    		
	                <div class="CommonFormArea">
		                <div id="Buttons" class="CommonFormFieldName">
			                <CSControl:ResourceButton ResourceName="CreateEditPost_PostButton" id="PostButton" runat="server" ValidationGroup="PostFormValidation" />
		                </div>
	                </div>
                
                </FormTemplate>
            </CSForum:ReportAbuseForm>
        
        </div>
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server" />

