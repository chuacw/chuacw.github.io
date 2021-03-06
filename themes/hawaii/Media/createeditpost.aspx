<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" MasterPageFile="mediagalleries.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea">
        <div class="Common">
            <CSControl:SiteUrl UrlName="mediagallerieshome" ResourceName="media" runat="server" />
            &raquo;
            <CSMedia:GroupData LinkTo="GroupHome" Property="Name" runat="server" />
            &raquo;
            <CSMedia:MediaGalleryData LinkTo="MediaGalleryHome" Property="Name" runat="server" />        
            &raquo;
            <CSControl:ConditionalContent runat="server">
                <ContentConditions><CSMedia:MediaGalleryPostPropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></ContentConditions>
                <TrueContentTemplate>
                    <CSMedia:MediaGalleryPostData LinkTo="Edit" runat="server" ResourceName="MediaGallery_EditFile" />
                </TrueContentTemplate>
                <FalseContentTemplate>
                    <CSMedia:MediaGalleryData LinkTo="addMediaGalleryPost" runat="server" ResourceName="UploadAttachment_File" />
                </FalseContentTemplate>
            </CSControl:ConditionalContent>
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions><CSMedia:MediaGalleryPostPropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate>Edit <CSMedia:MediaGalleryPostData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" ResourceName="MediaGalleries_UploadFile" ResourceFile="MediaGallery.xml">
        <DisplayConditions Operator="Not"><CSMedia:MediaGalleryPostPropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></DisplayConditions>
    </CSControl:Title>   
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    
    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
    
	        <CSMedia:CreateEditMediaGalleryPostForm runat="server" PreviewMediaGalleryPostListId="PreviewList" ID="MediaGalleryPostForm"
	            FileCountQuotaExceededErrorMessageControlId="FileCountQuotaExceeded" 
	            FileStorageQuotaExceededErrorMessageControlId="StorageQuotaExceeded"
	            NoFileErrorMessageControlId="NoFileUploaded"
	            AddUpdateAttachmentModalId="UploadFile" 
	            MediaGalleryPostBodyEditorId="MediaGalleryPostDescription" 
	            MediaGalleryPostSubjectTextBoxId="MediaGalleryPostName" 
	            FilenameLabelId="FileName" 
	            SharePointMessagePanelId="SharePointMessagePanel"
	            SubFormIds="TagsSubForm" 
	            SubmitButtonId="MediaGalleryPostSave">
	            <ModeratedSuccessActions>
	                <CSControl:GoToSiteUrlAction UrlName="files_ViewMediaGallery" Parameter1='<%# CurrentSection.ApplicationKey %>' runat="server" />
                </ModeratedSuccessActions>
                <UnmoderatedSuccessActions>
                    <CSControl:GoToCurrentViewableContentAction runat="server" />
                </UnmoderatedSuccessActions>
	            <FormTemplate>
	            
                    <CSControl:ResourceControl ID="NoFileUploaded" ResourceName="MediaGalleryPostAdmin_NoFileUploaded" ResourceFile="MediaGallery.xml" runat="server" Tag="Div" CssClass="CommonMessageError" Visible="false" />
                    <CSControl:ResourceControl ID="StorageQuotaExceeded" ResourceName="MediaGalleryPostAdmin_StorageQuotaExceeded" ResourceFile="MediaGallery.xml" runat="server" Tag="Div" CssClass="CommonMessageError" Visible="false" />
                    <CSControl:ResourceControl ID="FileCountQuotaExceeded" ResourceName="MediaGalleryPostAdmin_FileCountQuotaExceeded" ResourceFile="MediaGallery.xml" runat="server" Tag="Div" CssClass="CommonMessageError" Visible="false" />
                    
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
				                        <CSControl:ResourceControl runat="server" ResourceName="MediaGalleryPostAdmin_FileOrUrl" ResourceFile="MediaGallery.xml" />
			                        </div>
			                        <div class="CommonFormField">
				                        <asp:Label id="FileName" runat="server" />
				                        &nbsp;<CSControl:Modal ModalType="Button" ID="UploadFile" Runat="server" Width="500" Height="300" ResourceName="MediaGalleryPostAdmin_FileOrUrl_Upload" ResourceFile="MediaGallery.xml" />
			                        </div>

			                        <div class="CommonFormFieldName">
				                        <CSControl:FormLabel LabelForId="MediaGalleryPostName" runat="server" ResourceName="MediaGalleryPostAdmin_Name" ResourceFile="MediaGallery.xml" />
			                        </div>
			                        <CSControl:ResourceControl runat="server" ResourceName="MediaGalleryPostAdmin_Name_Detail" ResourceFile="MediaGallery.xml" Tag="Div" CssClass="CommonFormFieldDescription" />
			                        <div class="CommonFormField">
				                        <asp:TextBox id="MediaGalleryPostName" Columns="70" MaxLength="256" runat="server" />
				                        <asp:requiredfieldvalidator runat="server" Cssclass="CommonValidationWarning" ControlToValidate="MediaGalleryPostName">*</asp:requiredfieldvalidator>
			                        </div>

			                        <div class="CommonFormFieldName">
				                        <CSControl:FormLabel LabelForId="MediaGalleryPostDescription" runat="server" ResourceName="MediaGalleryPostAdmin_Desc" ResourceFile="MediaGallery.xml" />
			                        </div>
			                        <CSControl:ResourceControl runat="server" ResourceName="MediaGalleryPostAdmin_Desc_Detail" ResourceFile="MediaGallery.xml" Tag="Div" CssClass="CommonFormFieldDescription" />
			                        <div class="CommonFormField">
				                        <CSControl:Editor runat="Server" id="MediaGalleryPostDescription" width="100%" columns="110" />
			                        </div>

                                    <CSMedia:MediaGalleryPostTagsSubForm runat="server" ID="TagsSubForm" SelectTagsModalButtonId="SelectTags" TagsTextBoxId="Tags">
    					                <FormTemplate>
    					                    <div class="CommonFormFieldName">
				                                <CSControl:FormLabel LabelForId="Tags" runat="server" ResourceName="MediaGalleryPostAdmin_Categories" ResourceFile="MediaGallery.xml" />
			                                </div>
			                                <CSControl:ResourceControl runat="server" ResourceName="MediaGalleryPostAdmin_Categories_Detail" ResourceFile="MediaGallery.xml" Tag="Div" CssClass="CommonFormFieldDescription" />
    					                    <div class="CommonFormField">
    					                        <asp:TextBox runat="server" ID="Tags" Columns="70" /> <CSControl:Modal ModalType="Button" Width="400" Height="350" ID="SelectTags" ResourceName="TagEditor_SelectTags" runat="server" />
    					                    </div>
    					                </FormTemplate>
    					            </CSMedia:MediaGalleryPostTagsSubForm>
    					            <!-- ADD SharePoint Drop Down List here. -->
    					            
    					            <asp:panel id="SharePointMessagePanel" runat="server" visible="false">
    					                <p>*Please note that this Media Gallery is current Syncing all new documents with SharePoint.</p>
    					            </asp:panel>
    					            
                                 </div>
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
		                                <%# ((CreateEditMediaGalleryPostForm) MediaGalleryControlUtility.Instance().FindControl(this, "MediaGalleryPostForm")).GetPreviewScript("PreviewCallback();") %>
		                            }
        		                    
		                            function PreviewCallback()
		                            {
		                                document.getElementById('previewloading').style.display = 'none';
		                            }
		                        // ]]>
		                        </script>
                            
                                <div id="previewloading" style="display:none"><CSControl:ResourceControl runat="server" ResourceName="Hub_Loading" /> <CSControl:Image runat="server" ImageUrl="~/utility/spinner.gif" /></div>
                                <CSMedia:MediaGalleryPostList runat="server" ID="PreviewList">
                                    <ItemTemplate>
	                                    <CSControl:ConditionalContent runat="server">
                                            <ContentConditions Operator="Or">
                                                <CSMedia:MediaGalleryPostViewerMediaTypeCondition runat="server" MediaType="Video" />
                                                <CSMedia:MediaGalleryPostViewerMediaTypeCondition runat="server" MediaType="Image" />
                                            </ContentConditions>
                                            <TrueContentTemplate>
                                                <div style="float: left; width: 500px; height: 400px; overflow: hidden; overflow-x: hidden; overflow-y: visible; border: solid 1px #000; background-color: #000;">
                                                    <table cellpadding="0" cellspacing="0" border="0" width="500" height="400"><tr><td valign="middle" align="center">
                                                        <CSMedia:MediaGalleryPostViewer runat="server" ViewType="View" Width="500" Height="400" ID="PostViewer" />
                                                    </td></tr></table>
                                                </div>
                                                <div style="overflow: hidden; padding-left: 10px; width: 150px; word-wrap: break-word;">
                                                    <CSMedia:MediaGalleryPostData runat="server" Property="Subject" Tag="Strong" style="font-size: 120%;" />
                                                    <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Div" style="margin: 4px 0;">                	        
                                                        <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="postedby" /> </LeaderTemplate>
                                                    </CSControl:UserData>
                                                    <CSMedia:MediaGalleryPostData runat="server" Property="PostDate" Tag="Div" style="margin: 4px 0;" />
                                                    <CSMedia:MediaGalleryPostRating runat="server" Tag="Div" style="margin: 4px 0;" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" />
                                                    
                                                     <hr />
                                                    <CSMedia:MediaGalleryPostData runat="server" Property="Downloads" ResourceName="MediaGallery_Downloads" Tag="Div" style="margin: 4px 0;" />
                                                    <CSMedia:MediaGalleryPostData runat="server" Property="FileSize" ResourceName="MediaGallery_FileSize" Tag="Div" style="margin: 4px 0;" />
                                                    <CSMedia:MediaGalleryPostData runat="server" Property="Views" ResourceName="MediaGallery_Views" Tag="Div" style="margin: 4px 0;" />
                                                </div>
	                                            <div style="clear: both; margin-top: 1em;">
	                                                <CSMedia:MediaGalleryPostTagEditableList ReadOnly="true" runat="server" Tag="Div" EditorCssClass="CommonInlineTagEditor" />
		                                            <CSMedia:MediaGalleryPostData runat="server" Property="FormattedBody" IncrementViewCount="true" Tag="Div" />
	                                            </div>
                                            </TrueContentTemplate>
                                            <FalseContentTemplate>
                                                <div style="float: right; width: 180px; background-color: #f7f7f7; padding: 10px; margin: 0 0 2em 2em;">
                                                    
                                                    <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Div" style="margin: 4px 0;">                	        
                                                        <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="postedby" /> </LeaderTemplate>
                                                    </CSControl:UserData>
                                                    <CSMedia:MediaGalleryPostData runat="server" Property="PostDate" Tag="Div" style="margin: 4px 0;" />
                                                    <CSMedia:MediaGalleryPostRating runat="server" Tag="Div" style="margin: 4px 0;" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" />
                                                    
                                                    <hr />
                                                    <CSMedia:MediaGalleryPostData runat="server" Property="Downloads" ResourceName="MediaGallery_Downloads" Tag="Div" style="margin: 4px 0;" />
                                                    <CSMedia:MediaGalleryPostData runat="server" Property="FileSize" ResourceName="MediaGallery_FileSize" Tag="Div" style="margin: 4px 0;" />
                                                    <CSMedia:MediaGalleryPostData runat="server" Property="Views" ResourceName="MediaGallery_Views" Tag="Div" style="margin: 4px 0;" />
                                                </div>
                                                
                                                <div style="width: 450px; overflow:hidden;">
                                                    <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 2em;"><tr valign="middle">
                                                        <CSMedia:MediaGalleryPostViewer runat="server" ViewType="Preview" Width="48" Height="48" Tag="Td" style="padding-right: 10px;" />
                                                        <td><CSMedia:MediaGalleryPostData runat="server" Property="Subject" Tag="Strong" style="font-size: 160%;" /></td>
                                                    </tr></table>
                                                    
                                                    <CSMedia:MediaGalleryPostViewer runat="server" ViewType="View" Width="450" ID="PostViewer" Tag="Div" style="margin-bottom: 2em;" />
                                                    
                                                    <CSMedia:MediaGalleryPostTagEditableList ReadOnly="true" runat="server" Tag="Div" EditorCssClass="CommonInlineTagEditor" />

                                                    <CSMedia:MediaGalleryPostData runat="server" Property="FormattedBody" IncrementViewCount="true" Tag="Div" />
                                                </div>
                                                
                                                <div style="clear: both;"></div>
                                            </FalseContentTemplate>
                                        </CSControl:ConditionalContent>
                                    </ItemTemplate>
                                </CSMedia:MediaGalleryPostList>
                            </Content>
                         </TWC:TabbedPane>
                    </TWC:TabbedPanes>    					            

                    <div class="CommonFormArea">
			            <div class="CommonFormFieldName">
				            <CSControl:ResourceButton id="MediaGalleryPostSave" runat="server" ResourceName="Save" />
			            </div>
		            </div>	            
	            </FormTemplate>
	        </CSMedia:CreateEditMediaGalleryPostForm>
	        
	    </div>
    </div>
    
</asp:Content>