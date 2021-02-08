<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSBlog:WeblogData LinkTo="HomePage" ResourceName="Button_Weblog" runat="server" />
        &raquo;
        <CSControl:ConditionalContent runat="server">
            <ContentConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></ContentConditions>
            <TrueContentTemplate><CSBlog:WeblogPostData runat="server" LinkTo="PostEditor" Text="Edit Post" /></TrueContentTemplate>
            <FalseContentTemplate><CSBlog:WeblogData runat="server" LinkTo="PostEditor" Text="Create Post" /></FalseContentTemplate>
        </CSControl:ConditionalContent>
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" IncludeSectionOrHubName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate>Editing <CSBlog:WeblogPostData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>
    <CSControl:Title runat="server" IncludeSiteName="true" IncludeSectionOrHubName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions Operator="Not"><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate>Create New Post</ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <CSBlog:CreateEditWeblogPostForm runat="server" ID="BlogPostForm" BlogPostType="Post" 
                PreviewWeblogPostListId="PreviewList"
                PostSubjectTextBoxId="Subject" 
                PostBodyEditorId="Body" 
                SubmitButtonId="Submit"
                SubFormIds="PostTags,PostAttachment"
                CustomValidatorId="PostValidator">
                <SuccessActions>
                    <CSControl:GoToCurrentViewableContentAction runat="server" />
                </SuccessActions>
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
                                <asp:CustomValidator runat="server" id="PostValidator" />
                                
                                <CSControl:FormLabel runat="server" Text="Subject" LabelForId="Subject" CssClass="CommonFormFieldName" />
                                <div class="CommonFormField"><asp:TextBox runat="server" ID="Subject" Columns="40" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Subject" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                                
                                <CSControl:FormLabel runat="server" Text="Body" LabelForId="Body" CssClass="CommonFormFieldName" />                       
                                <div class="CommonFormField"><CSControl:Editor runat="server" ID="Body" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Body" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                            
                                <CSBlog:WeblogPostTagsSubForm runat="server" ID="PostTags" 
                                    SelectTagsModalButtonId="TagsModal" 
                                    TagsTextBoxId="Tags">
                                    <FormTemplate>
                                        <CSControl:FormLabel runat="server" Text="Tags" LabelForId="Tags" CssClass="CommonFormFieldName" />
                                        <div class="CommonFormField">
                                            <asp:TextBox runat="server" ID="Tags" />
                                            <CSControl:Modal runat="server" ModalType="Button" ID="TagsModal" Width="400" Height="350" ResourceName="TagEditor_SelectTags" />
                                        </div>
                                    </FormTemplate>
                                </CSBlog:WeblogPostTagsSubForm>
                                
                                <CSBlog:WeblogPostAttachmentSubForm runat="server" ID="PostAttachment"
                                    AddUpdateAttachmentModalId="AddUpdateAttachment" 
                                    FilenameLabelId="Filename" 
                                    RemoveAttachmentButtonId="RemoveAttachment">
                                    <FormTemplate>
                                        <CSControl:FormLabel runat="serveR" Text="Attachment" LabelForId="AddUpdateAttachment" CssClass="CommonFormFieldName" />
                                        <div class="CommonFormField">
	                                        <asp:Label id="Filename" runat="server" />
	                                        &nbsp;<CSControl:modal modaltype="Button" width="640" height="180" runat="Server" id="AddUpdateAttachment" ResourceName="CreateEditPost_AddUpdateAttachment" />
	                                        <CSControl:ResourceLinkButton runat="server" ID="RemoveAttachment" CssClass="CommonTextButton" ResourceName="CreateEditPost_RemoveAttachment" />
                                        </div>
                                    </FormTemplate>
                                </CSBlog:WeblogPostAttachmentSubForm>
                            </Content>
                         </TWC:TabbedPane>
                         <TWC:TabbedPane runat="server" ID="PreviewPane">
                            <Tab OnClickClientFunction="Preview"><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Tab_Preview" /></Tab>
                            <Content>
                                <script type="text/javascript">
		                        // <![CDATA[
		                            function Preview()
		                            {
		                                document.getElementById('previewloading').style.display = 'block';
		                                <%# ((CreateEditWeblogPostForm) WeblogControlUtility.Instance().FindControl(this, "BlogPostForm")).GetPreviewScript("PreviewCallback();") %>
		                            }
        		                    
		                            function PreviewCallback()
		                            {
		                                document.getElementById('previewloading').style.display = 'none';
		                            }
		                        // ]]>
		                        </script>
                            
                                <div id="previewloading" style="display:none"><CSControl:ResourceControl runat="server" ResourceName="Hub_Loading" /><CSControl:Image runat="server" ImageUrl="~/utility/spinner.gif" /></div>
                                <CSBlog:WeblogPostList runat="server" ID="PreviewList">
                                    <ItemTemplate>
                                        <CSBlog:WeblogPostData runat="server" Property="Subject" Tag="H1" CssClass="CommonTitle" />
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
                                    </ItemTemplate>
                                </CSBlog:WeblogPostList>
                            </Content>
                         </TWC:TabbedPane>
                    </TWC:TabbedPanes>
                    
                    <div class="CommonFormFieldName">
                        <asp:Button runat="server" ID="Submit" Text="Save" />
                    </div>
                
                </FormTemplate>
            </CSBlog:CreateEditWeblogPostForm>    
            
        </div>
    </div>    

</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server" />