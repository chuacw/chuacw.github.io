<%@ Page EnableViewState="true" Language="C#" AutoEventWireup="true" MasterPageFile="hubs.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" ResourceName="Hubs_GroupCreate" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    <script type = "text/javascript">
        function toggleAdvanced(shouldShow)
        {
            var advancedOptions = document.getElementById('advancedOptions');
            if (!advancedOptions)
                return;                                      
            
            if (shouldShow)
            {
                advancedOptions.style.position = 'static';
                advancedOptions.style.visibility = 'visible';
            }
            else if (!shouldShow)
            {
                advancedOptions.style.position = 'absolute';
                advancedOptions.style.visibility = 'hidden';
            }
        }
    </script>
    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
	        
            <CSHub:CreateHubForm runat="server" 
                CreateButtonId="Create" 
                HubTypeRadioButtonListId="HubType" 
                GroupDropDownListId="HubGroup" 
                NameTextBoxId="HubName"
                CustomValidatorId="CustomValidator"
                DescriptionEditorId="HubDescription"
                EnableContactCheckBoxId="HubEnableContact"
                EnablePagesCheckBoxId="HubEnablePages"
                SubFormIds="ForumConfiguration,BlogConfiguration,MediaConfiguration,EvolutionCreateHubSubForm,WikiConfiguration"
                >
                <SuccessActions>
                    <CSControl:GoToCurrentContentContainerAction runat="server" />        
                </SuccessActions>
                <FormTemplate>
                    <div class="CommonFormArea">
                        <asp:CustomValidator runat="server" ID="CustomValidator" />
                
                        <CSControl:FormLabel runat="server" LabelForId="HubName" ResourceName="Name" CssClass="CommonFormFieldName" />
                        <div class="CommonFormFieldDescription"><CSControl:ResourceControl runat="server" ResourceName="Hubs_Name_SubTitle" /></div>
                        <div class="CommonFormField"><asp:TextBox runat="server" ID="HubName" Columns="40" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="HubName" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                    
                        <CSControl:FormLabel ResourceName="Description" LabelForId="HubDescription" CssClass="CommonFormFieldName" runat="server" />
                        <CSControl:ResourceControl runat="server" ResourceName="Hubs_Description_Desc" CssClass="CommonFormFieldDescription" />
                        <div class="CommonFormField"><CSControl:Editor runat="server" ID="HubDescription" Height="150px" /></div>

                        <CSControl:FormLabel runat="server" LabelForId="HubType" ResourceName="Hubs_Type" CssClass="CommonFormFieldName" />
                        <div class="CommonFormFieldDescription"><CSControl:ResourceControl runat="server" ResourceName="Hubs_PublicPrivate" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="HubType" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                        <div class="CommonFormField"><asp:RadioButtonList runat="server" ID="HubType" /></div>
                        
                        <CSControl:PlaceHolder runat="server">
                            <DisplayConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="HubGroup" ComparisonProperty="Items" Operator="GreaterThan" ComparisonValue="1" runat="server" /></DisplayConditions>
                            <ContentTemplate>
                                <CSControl:FormLabel runat="server" LabelForId="HubGroup" ResourceName="Hubs_Group" CssClass="CommonFormFieldName" />            
                                <div class="CommonFormFieldDescription"><CSControl:ResourceControl runat="server" ResourceName="Hubs_SelectCategory" /></div>
                                <div class="CommonFormField"><asp:DropDownList runat="Server" ID="HubGroup" /></div>
                            </ContentTemplate>
                        </CSControl:PlaceHolder>
                        
						<CSMail:EvolutionCreateEditHubSubForm runat="server"
						  id="EvolutionCreateHubSubForm"
						  EvolutionEmailAddressId="EvolutionEmailAddress"
						  EvolutionEmailValidatorId="EvolutionEmailValidator"
						  EnableEvolutionListNameId="EnableEvolutionListName">
							<DisplayConditions>
								<CSControl:PackageInstalledCondition PackageName="Evolution" runat="server" />
							</DisplayConditions>
							<FormTemplate>
								<CSControl:FormLabel ResourceName="Hubs_EvolutionEmailAddress" LabelForId="EvolutionEmailAddress" runat="server" CssClass="CommonFormFieldName" />
								<div class="CommonFormFieldDescription"><CSControl:ResourceControl runat="server" ResourceName="Hubs_EvolutionEmailAddress_Desc" /></div>
								<div class="CommonFormField">
									<asp:TextBox runat="server" ID="EvolutionEmailAddress" Columns="20" /> <span class="CommonFormFieldDescription">@<CSControl:SiteSettingsData Property="MailGatewayEmailDomain" runat="server" /></span>
									<asp:RegularExpressionValidator id="EvolutionEmailRegExValidator" runat="server" ControlToValidate="EvolutionEmailAddress" ValidationExpression="\w+([-+.]\w+)*">*</asp:RegularExpressionValidator>
									<asp:customvalidator id="EvolutionEmailValidator" runat="server" controltovalidate="EvolutionEmailAddress" font-bold="True" errormessage="*"></asp:customvalidator>
								</div>

		                        <div id="advancedOptions" style="position: absolute; visibility: hidden;">

			                    <div class="CommonFormFieldName">
									<CSControl:FormLabel ResourceName="Hubs_EnableEvolutionListName" LabelForId="EnableEvolutionListName" runat="server" />
									<asp:CheckBox runat="server" ID="EnableEvolutionListName" Checked="true" />
									<CSControl:ResourceControl runat="server" ResourceName="Hubs_EnableEvolutionListName_Desc" CssClass="CommonFormFieldDescription" style="padding-left: 0px;" />
								</div>
							</FormTemplate>
						</CSMail:EvolutionCreateEditHubSubForm>
                        <CSControl:PlaceHolder runat="server">
                            <DisplayConditions Operator="Not">
								<CSControl:PackageInstalledCondition PackageName="Evolution" runat="server" />
							</DisplayConditions>
                            <ContentTemplate>
		                        <div id="advancedOptions" style="position: absolute; visibility: hidden;">
                            </ContentTemplate>
                        </CSControl:PlaceHolder>

                        <div class="CommonFormFieldName">
                            <CSControl:FormLabel ResourceName="Hubs_EnableContact" LabelForId="HubEnableContact" runat="server" />
                            <asp:CheckBox runat="server" ID="HubEnableContact" />
                            <CSControl:ResourceControl runat="server" ResourceName="Hubs_Contact_Desc" CssClass="CommonFormFieldDescription" />
                        </div>
                        <div class="CommonFormFieldName">
                            <CSControl:FormLabel ResourceName="Hubs_EnablePages" LabelForId="HubEnablePages" runat="server" />
                            <asp:CheckBox runat="server" ID="HubEnablePages" />
                            <CSControl:ResourceControl runat="server" ResourceName="Hubs_EnablePages_Desc" CssClass="CommonFormFieldDescription" />
                        </div>
                        
                        <CSForum:HubForumConfigurationSubForm runat="server" ID="ForumConfiguration"
                            EnableForumCheckBoxId="EnableForum" 
                            EnableModerationCheckBoxId="EnableModeration" 
                            MembersCanCreateThreadsCheckBoxId="MembersCanCreateThreads"
                            DefaultThreadTypeDropDownListId="DefaultThreadTypeDropDown"
                            AllowQuestionCheckBoxId="AllowQuestionCheckBox"
                            AllowDiscussionCheckBoxId="AllowDiscussionCheckBox"
                            SubFormIds="ForumMailingListConfiguration">
                            <FormTemplate>
                                <script type = "text/javascript">
                                    function toggleForumOptions(shouldShow)
                                    {
                                        var forumOptions = document.getElementById('forumOptions');
                                        if (!forumOptions)
                                            return;                                      
                                        
                                        if (shouldShow)
                                        {
                                            forumOptions.style.position = 'static';
                                            forumOptions.style.visibility = "visible";
                                        }
                                        else
                                        {
                                            forumOptions.style.position = 'absolute';
                                            forumOptions.style.visibility = "hidden";
                                        }
                                    }
                                    function canUncheckThreadType(control)
                                    {
                                        if (control.checked == true)
                                            return true;
                                        var questionAndAnswerInput = document.getElementById('<%= CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "AllowQuestionCheckBox").ClientID %>');
                                        var discussionInput = document.getElementById('<%= CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "AllowDiscussionCheckBox").ClientID %>');
                                        
                                        if ((questionAndAnswerInput && questionAndAnswerInput.checked == true) || (discussionInput && discussionInput.checked == true))
                                            return true;

                                        return false;
                                    }
                                </script>
                                <div class="CommonFormSubTitle"><CSControl:ResourceControl runat="server" ResourceName="Hubs_ForumOptions" /></div>
                                
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ResourceName="ForumAdmin_IsActive" LabelForId="EnableForum" runat="server" />
                                    <asp:CheckBox Checked="true" runat="server" ID="EnableForum" onclick="toggleForumOptions(this.checked)" />
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_EnableForum_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                
                                <div id="forumOptions">
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ResourceName="Hubs_EnableForumModeration" LabelForId="EnableModeration" runat="server" />
                                    <asp:CheckBox runat="server" ID="EnableModeration" />
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_EnableModeration_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                
                                <div class="CommonFormFieldName">
		                            <CSControl:ResourceControl runat="server" resourcename="Hubs_AllowedThreadType" Tag="Strong" />
		                            <CSControl:ResourceControl runat="Server" resourcename="Hubs_AllowedThreadType_Desc" CssClass="CommonFormFieldDescription" />
		                            <asp:CheckBox runat="server" ID="AllowQuestionCheckBox" onclick="return canUncheckThreadType(this);" /> 
                                    <CSControl:ResourceControl runat="server" resourcename="Forums_QuestionThreadType">
                                        <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="AllowQuestionCheckBox" ControlVisiblilityEquals="true" /></DisplayConditions>
                                        <TrailerTemplate><br /></TrailerTemplate>
                                    </CSControl:ResourceControl>
                                    <asp:CheckBox runat="server" ID="AllowDiscussionCheckBox" onclick="return canUncheckThreadType(this);" /> 
                                    <CSControl:ResourceControl runat="server" resourcename="Forums_DiscussionThreadType">
                                        <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="AllowDiscussionCheckBox" ControlVisiblilityEquals="true" /></DisplayConditions>
                                        <TrailerTemplate><br /></TrailerTemplate>
                                    </CSControl:ResourceControl>
                                </div>
                                <CSControl:PlaceHolder runat="server">
                                    <DisplayConditions>
                                        <CSControl:ControlVisibilityCondition runat="server" ControlId="DefaultThreadTypeDropDown" ControlVisiblilityEquals="true" />
                                    </DisplayConditions>
                                    <ContentTemplate>
                                        <div class="CommonFormFieldName">
		                                    <CSControl:FormLabel runat="server" resourcename="Hubs_DefaultThreadType" LabelForId="DefaultThreadTypeDropDown" />
                                            <asp:DropDownList runat="server" ID="DefaultThreadTypeDropDown" />
                                            <CSControl:ResourceControl runat="Server" resourcename="Hubs_DefaultThreadType_Desc" CssClass="CommonFormFieldDescription" />
                                        </div>
                                    </ContentTemplate>
                                </CSControl:PlaceHolder>
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ResourceName="Hubs_EnableMemberCreateThreads" LabelForId="MembersCanCreateThreads" runat="server" />
                                    <asp:CheckBox runat="server" Checked="true" ID="MembersCanCreateThreads" />
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_MembersCanCreateThreads_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                </div>
                            </FormTemplate>
                        </CSForum:HubForumConfigurationSubForm>
                    
                        <CSBlog:HubWeblogConfigurationSubForm runat="server" ID="BlogConfiguration" 
                                    EnableWeblogCheckBoxId="EnableBlog" 
                                    EnableWeblogCommentsCheckBoxId="EnableBlogComments"
                                    EnableWeblogRatingsCheckBoxId="EnableBlogRatings"
                                    EnableWeblogTrackbacksCheckBoxId="EnableBlogTrackbacks"
                                    SubFormIds="BlogMailingListConfiguration">
                            <FormTemplate>
                                <script type = "text/javascript">
                                    function toggleBlogOptions(shouldShow)
                                    {
                                        var blogOptions = document.getElementById('blogOptions');
                                        if (!blogOptions)
                                            return;                                      
                                        
                                        if (shouldShow)
                                        {
                                            blogOptions.style.position = 'static';
                                            blogOptions.style.visibility = "visible";
                                        }
                                        else
                                        {
                                            blogOptions.style.position = 'absolute';
                                            blogOptions.style.visibility = "hidden";
                                        }
                                    }
                                </script>
                                
                                <div class="CommonFormSubTitle"><CSControl:ResourceControl runat="server" ResourceName="Hubs_BlogOptions" /></div>            
                                
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ResourceName="BlogSettings_IsEnabled" LabelForId="EnableBlog" runat="server" />
                                    <asp:CheckBox runat="server" Checked="true" ID="EnableBlog" onclick="toggleBlogOptions(this.checked)" />
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_EnableBlog_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                
                                <div id="blogOptions">
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ResourceName="BlogSettings_EnableComments" LabelForId="EnableBlogComments" runat="server" />
                                    <asp:CheckBox runat="server" ID="EnableBlogComments" Checked="true" />
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_EnableBlogComments_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ResourceName="BlogSettings_EnableRatings" LabelForId="EnableBlogRatings" runat="server" />
                                    <asp:CheckBox runat="server" ID="EnableBlogRatings" />
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_EnableBlogRatings_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ResourceName="BlogSettings_EnableTrackbacks" LabelForId="EnableBlogTrackbacks" runat="server" />
                                    <asp:CheckBox runat="server" ID="EnableBlogTrackbacks" />
                                </div>
                                </div>
                            </FormTemplate>
                        </CSBlog:HubWeblogConfigurationSubForm>
                    
                        <CSMedia:HubMediaGalleryConfigurationSubForm runat="server" ID="MediaConfiguration"
                            EnableMediaGalleryCheckBoxId="EnableMedia" 
                            EnableModerationCheckBoxId="EnableModeration" 
                            MembersCanAddFilesCheckBoxId="MembersCanUpload">
                            <FormTemplate>
                                <script type = "text/javascript">
                                    function toggleMediaOptions(shouldShow)
                                    {
                                        var mediaOptions = document.getElementById('mediaOptions');
                                        if (!mediaOptions)
                                            return;                                      
                                        
                                        if (shouldShow)
                                        {
                                            mediaOptions.style.position = 'static';
                                            mediaOptions.style.visibility = "visible";
                                        }
                                        else
                                        {
                                            mediaOptions.style.position = 'absolute';
                                            mediaOptions.style.visibility = "hidden";
                                        }
                                    }
                                </script>
                                <div class="CommonFormSubTitle"><CSControl:ResourceControl runat="server" ResourceName="Hubs_FileOptions" /></div>
                                
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ResourceName="Hubs_EnableFiles" LabelForId="EnableFolder" runat="server" />
                                    <asp:CheckBox runat="server" Checked="true" ID="EnableMedia" onclick="toggleMediaOptions(this.checked)" />
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_EnableFolder_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                
                                 <div id="mediaOptions">
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ResourceName="Hubs_EnableFilesModeration" LabelForId="EnableModeration" runat="server" />
                                    <asp:CheckBox runat="server" ID="EnableModeration" />
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_EnableFolderModeration_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ResourceName="Hubs_EnableMemberUploadFiles" LabelForId="MembersCanUpload" runat="server" />
                                    <asp:CheckBox runat="server" ID="MembersCanUpload" Checked="true" />
                                    <CSControl:ResourceControl runat="server" ResourceName="Hubs_MembersCanUpload_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                </div>
                            </FormTemplate>
                        </CSMedia:HubMediaGalleryConfigurationSubForm>

                        <CSWiki:HubWikiConfigurationSubForm runat="server" ID="WikiConfiguration"
                            EnableWikiCheckBoxId="EnableWiki" 
                            MembersCanCreatePagesCheckBoxId="MembersCanCreatePages">
                            <FormTemplate>
                                <script type = "text/javascript">
                                    function toggleWikiOptions(shouldShow)
                                    {
                                        var wikiOptions = document.getElementById('wikiOptions');
                                        if (!wikiOptions)
                                            return;                                      
                                        
                                        if (shouldShow)
                                        {
                                            wikiOptions.style.position = 'static';
                                            wikiOptions.style.visibility = "visible";
                                        }
                                        else
                                        {
                                            wikiOptions.style.position = 'absolute';
                                            wikiOptions.style.visibility = "hidden";
                                        }
                                    }
                                </script>
                                <div class="CommonFormSubTitle"><CSControl:ResourceControl ID="ResourceControl1" runat="server" ResourceName="Hubs_WikiOptions" /></div>
                                
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ID="FormLabel1" ResourceName="Hubs_Wiki_IsActive" LabelForId="EnableWiki" runat="server" />
                                    <asp:CheckBox runat="server" ID="EnableWiki" onclick="toggleWikiOptions(this.checked)" Checked="true" />
                                    <CSControl:ResourceControl ID="ResourceControl2" runat="server" ResourceName="Hubs_Wiki_IsActive_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                
                                <div id="wikiOptions">
                                <div class="CommonFormFieldName">
                                    <CSControl:FormLabel ID="FormLabel2" ResourceName="Hubs_MembersCanCreatePages" LabelForId="MembersCanCreatePages" runat="server" />
                                    <asp:CheckBox runat="server" ID="MembersCanCreatePages" Checked="true" />
                                    <CSControl:ResourceControl ID="ResourceControl3" runat="server" ResourceName="Hubs_MembersCanCreatePages_Desc" CssClass="CommonFormFieldDescription" />
                                </div>
                                </div>
                            </FormTemplate>
                        </CSWiki:HubWikiConfigurationSubForm>
                        
                        </div>
                      
                      <div class="CommonFormFieldName">
                            <CSControl:FormLabel ResourceName="Hubs_AdvancedOptions" LabelForId="advancedCheckbox" runat="server" />
                            <asp:Checkbox runat="server" ID="advancedCheckbox" onclick="toggleAdvanced(this.checked)" />
                      </div>
                      <div class="CommonFormFieldName">
                        <asp:Button ID="Create" runat="server" Text="Create" />     
                    </div>
                    </div>
                </FormTemplate>
            </CSHub:CreateHubForm>
            
        </div>
    </div> 
       
</asp:Content>
