<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">  
        <ContentTemplate>Edit Your Profile</ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">			        
        <div class="CommonContentBoxContent">

            <CSControl:ResourceControl runat="server" Tag="Div" CssClass="CommonMessageSuccess" ResourceName="EditProfile_UpdateSuccess">
	            <DisplayConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="ProfileSaved" Operator="EqualTo" ComparisonValue="true" /></DisplayConditions>
	        </CSControl:ResourceControl>
    		
		    <asp:ValidationSummary Runat="server" ID="ValidationSummary" DisplayMode="BulletList" Enabled="True" EnableClientScript="True" />
    		
		    <CSControl:EditUserForm ID="EditUserForm1" runat="server" 
		        RssFeedUrlsTextBoxId="rssFeeds"
                NameTextBoxId="CommonName"
                LocationTextBoxId="Location"
                OccupationTextBoxId=""
                InterestsTextBoxId=""
                WebAddressTextBoxId="WebAddress"
                WeblogTextBoxId="WebLog"
		        WebGalleryTextBoxId="WebGallery"
                SignatureEditorId="Signature"
                BioEditorId="bio"
                PublicEmailTextBoxId="PublicEmail"
                MsnIMTextBoxId=""
                AolIMTextBoxId=""
                YahooIMTextBoxId=""
                IcqIMTextBoxId=""
                UsernameTextBoxId=""
                HideReadPostsCheckBoxId=""
                GenderRadioButtonListId="Gender"
                LanguageDropDownListId="Language"
                DisableBirthdayRadioButtonId="DisableBirthday"
		        EnableBirthdayRadioButtonId="EnableBirthday"
		        BirthdayDateTimeSelectorId="Birthday"
                SignatureMaxLengthCustomValidatorId="SignatureMaxLengthValidator"
                EditUserCustomValidatorId="FormValidator"
                SubmitButtonId="UpdateButtonBottom"
                ShareFavoritesCheckBoxId="ShareFavorites"
                SubFormIds="UserLdapFields"
                DateFormatDropDownListId="DateFormat"
                TimeZoneDropDownListId="Timezone"
                SectionFilterLanguageCheckBoxListId="FilterLanguageList"
                AllowSitePartnersToContactCheckBoxId="AllowSitePartnersToContact"
                AllowSiteToContactCheckBoxId="AllowSiteToContact"
                ControlPanelPageSizeDropDownListId="PageSize"
                EnableUserSignatureCheckBoxId="enableUserSignatures"
                EnableUserAvatarsCheckBoxId="enableUserAvtars" 
                EnableEmoticonsCheckBoxId="EnableEmoticons"
                EnableConversationNotificationsCheckBoxId="EnableConversationNotifications"
                EnableCommentNotificationsCheckBoxId="EnableCommentNotifications"
                EnableCollapsingPanelsCheckBoxId="EnableCollapsingPanels"
                EnablePostPreviewPopupCheckBoxId="EnablePostPreviewPopup"
                DisplayInMemberListCheckBoxId="DisplayInMemberList"
                EnableDisplayNameCheckBoxId="enableDisplayNames"
                EditorDropDownListId="EditorList"
                FontSizeDropDownListId="FontSize"
                DefaultPostSortOrderDropDownListId="SortOrder"
                PrivateEmailTextBoxId="PrivateEmail"
                EnableEmailTrackingCheckBoxId="EnableEmailTracking"
                EnableHtmlEmailCheckBoxId="EnableHtmlEmail"
                EnableEmailCheckBoxId="ReceiveEmails"
                EnableStartConversationsRadioButtonListId="EnableStartConversations"
                
                ActivityLoggingNewProfileAnnouncementCheckboxId="ActivityLoggingNewProfileAnnouncement"
                ActivityLoggingNewProfileCommentCheckboxId="ActivityLoggingNewProfileComment"
                ActivityLoggingNewUserAvatarCheckboxId="ActivityLoggingNewUserAvatar"
                ActivityLoggingNewUserFileCheckboxId="ActivityLoggingNewUserFile"
                ActivityLoggingNewUserFolderCheckboxId="ActivityLoggingNewUserFolder"
                ActivityLoggingNewFriendshipCheckboxId="ActivityLoggingNewFriendship"
                ActivityLoggingNewBlogCheckboxId="ActivityLoggingNewBlog"
                ActivityLoggingNewBlogPostCheckboxId="ActivityLoggingNewBlogPost"
                ActivityLoggingNewBlogCommentCheckboxId="ActivityLoggingNewBlogComment"
                ActivityLoggingNewForumCheckboxId="ActivityLoggingNewForum"
                ActivityLoggingNewForumThreadCheckboxId="ActivityLoggingNewForumThread"
                ActivityLoggingNewForumPostCheckboxId="ActivityLoggingNewForumPost"
                ActivityLoggingNewMediaGalleryCheckboxId="ActivityLoggingNewMediaGallery"
                ActivityLoggingNewMediaGalleryPostCheckboxId="ActivityLoggingNewMediaGalleryPost"
                ActivityLoggingNewMediaGalleryCommentCheckboxId="ActivityLoggingNewMediaGalleryComment"
                ActivityLoggingNewGroupCheckboxId="ActivityLoggingNewGroup"
                ActivityLoggingNewGroupMemberCheckboxId="ActivityLoggingNewGroupMember"
                ActivityLoggingNewGroupPageCheckboxId="ActivityLoggingNewGroupPage"
                ActivityLoggingNewWikiPageCheckboxId="ActivityLoggingNewWikiPage"
                ActivityLoggingUpdatedWikiPageCheckboxId="ActivityLoggingUpdatedWikiPage"
                ActivityLoggingNewWikiCommentCheckboxId="ActivityLoggingNewWikiComment"
                ActivityLoggingThirdPartyMessageTypeCheckboxId="ActivityLoggingThirdPartyMessageType"   
                ActivityLoggingStatusCheckboxId="ActivityLoggingStatus"                
    		    >
    		    
    		    <SuccessActions>
    		        <CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="ProfileSaved=true" />
    		    </SuccessActions>
		        <FormTemplate>
		            <asp:CustomValidator runat="server" ID="FormValidator" />
    		    
		            <TWC:TabbedPanes id="ProfileTabs" runat="server"
			            PanesCssClass="CommonPane"
			            TabSetCssClass="CommonPaneTabSet"
			            TabCssClasses="CommonPaneTab"
			            TabSelectedCssClasses="CommonPaneTabSelected"
			            TabHoverCssClasses="CommonPaneTabHover"
			            >

		                <TWC:TabbedPane runat="server">
			                <Tab><CSControl:ResourceControl runat="server" ResourceName="EditProfile_Tab_About" /></Tab>
			                <Content>
			                    <div class="CommonGroupedContentArea">
			                        <h3 class="CommonSubTitle"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarTitle" /></h3>
			                        <div class="CommonFormField">
				                        <CSControl:UserAvatar runat="server" />
				                        <CSControl:UserData runat="server" LinkTo="ChangeAvatar" ResourceName="EditProfile_ChangeAvatar" Tag="Div" />
			                        </div>
			                    </div>
			                    
                                <div class="CommonGroupedContentArea">
			                        <h3 class="CommonSubTitle"><CSControl:ResourceControl ID="ResourceControl3" runat="server" ResourceName="ViewUserProfile_Tab_Bio" /></h3>
			                        <div class="CommonFormField">
				                        <CSControl:Editor ID="bio" Height="150px" runat="server" />
			                        </div>
			                    </div>
			                    <div class="CommonGroupedContentArea">
			                        <h3 class="CommonSubTitle"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_Tab_CommonProfileOptions" /></h3>
				                    <table cellspacing="0" cellpadding="0" border="0">
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl ID="ResourceControl6" runat="server" ResourceName="EditProfile_CommonName" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:Textbox id="CommonName" Columns="30" MaxLength="50" runat="server" /> 
						                    </td>
					                    </tr>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl ID="ResourceControl7" runat="server" ResourceName="EditProfile_AboutLocation" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:TextBox id="Location" Columns="30" runat="server" MaxLength="50"/>
						                    </td>
					                    </tr>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl ID="ResourceControl10" runat="server" ResourceName="EditProfile_Birthday" />
						                    </td>
						                    <td class="CommonFormField">
						                        <asp:RadioButton GroupName="Birthday" ID="EnableBirthday" runat="server" /><TWC:DateTimeSelector runat="server" id="Birthday" DateTimeFormat="MMMM d, yyyy" ShowCalendarPopup="true" /><br />
						                        <asp:RadioButton GroupName="Birthday" ID="DisableBirthday" runat="server" /><CSControl:ResourceControl ID="ResourceControl11" runat="server" ResourceName="NotSet" />
						                    </td>
					                    </tr>
					                    <CSControl:PlaceHolder ID="PlaceHolder1" runat="server">
					                        <DisplayConditions><CSControl:ControlVisibilityCondition ID="ControlVisibilityCondition1" runat="server" ControlId="Gender" ControlVisiblilityEquals="true" /></DisplayConditions>
					                        <ContentTemplate>
					                            <tr>
						                            <td class="CommonFormFieldName">
							                            <CSControl:ResourceControl ID="ResourceControl12" runat="server" ResourceName="EditProfile_AboutGender" />
						                            </td>
						                            <td class="CommonFormField">
							                            <asp:RadioButtonList id="Gender" RepeatColumns="3" runat="server" RepeatLayout="flow" />
						                            </td>
					                            </tr>
                                            </ContentTemplate>
                                        </CSControl:PlaceHolder>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl ID="ResourceControl13" runat="server" ResourceName="EditProfile_AboutWebAddress" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:TextBox id="WebAddress" Columns="30" runat="server" MaxLength="255" />
							                    <asp:RegularExpressionValidator id="editNameRegExVldt" 
								                    ControlToValidate="WebAddress" 
								                    ValidationExpression="^(http|https|ftp)\://([a-zA-Z0-9\.\-]+(\:[a-zA-Z0-9\.&%\$\-]+)*@)?((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9\-]+\.)*[a-zA-Z0-9\-]+)(\:[0-9]+)?((/|/[^/][a-zA-Z0-9\.\,\?\'\\/\+&%\$#\=~_\-@]*))*$"
								                    runat="server"><CSControl:ResourceControl ID="ResourceControl14" runat="server" ResourceName="EditProfile_InvalidUrl" /></asp:RegularExpressionValidator>
						                    </td>
					                    </tr>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl ID="ResourceControl15" runat="server" ResourceName="EditProfile_AboutWebLog" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:TextBox id="WebLog" Columns="30" runat="server" MaxLength="255" />
							                    <asp:RegularExpressionValidator id="editNameRegExVldt2" 
								                    ControlToValidate="WebLog" 
								                    ValidationExpression="^(http|https|ftp)\://([a-zA-Z0-9\.\-]+(\:[a-zA-Z0-9\.&%\$\-]+)*@)?((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9\-]+\.)*[a-zA-Z0-9\-]+)(\:[0-9]+)?((/|/[^/][a-zA-Z0-9\.\,\?\'\\/\+&%\$#\=~_\-@]*))*$"
								                    runat="server"><CSControl:ResourceControl ID="ResourceControl16" runat="server" ResourceName="EditProfile_InvalidUrl" /></asp:RegularExpressionValidator>
						                    </td>
					                    </tr>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl ID="ResourceControl17" runat="server" ResourceName="EditProfile_AboutWebGallery" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:TextBox id="WebGallery" Columns="30" runat="server" MaxLength="255" />
							                    <asp:RegularExpressionValidator id="editNameRegExVldt3" 
								                    ControlToValidate="WebGallery" 
								                    ValidationExpression="^(http|https|ftp)\://([a-zA-Z0-9\.\-]+(\:[a-zA-Z0-9\.&%\$\-]+)*@)?((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9\-]+\.)*[a-zA-Z0-9\-]+)(\:[0-9]+)?((/|/[^/][a-zA-Z0-9\.\,\?\'\\/\+&%\$#\=~_\-@]*))*$"
								                    runat="server"><CSControl:ResourceControl ID="ResourceControl18" runat="server" ResourceName="EditProfile_InvalidUrl" /></asp:RegularExpressionValidator>
						                    </td>
					                    </tr>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl ID="ResourceControl19" runat="server" ResourceName="EditProfile_OptionsLanguage" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:DropDownList id="Language" runat="server" />
						                    </td>
					                    </tr>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl ID="ResourceControl35" runat="server" ResourceName="EditProfile_ContactPublicEmail" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:TextBox id="PublicEmail" Columns="30" runat="server" MaxLength="50"/>
						                    </td>
					                    </tr>
                                        <tr>
                                            <td class="CommonFormFieldName">
                                                <CSControl:FormLabel runat="server" LabelForId="ShareFavorites" ResourceName="EditProfile_Favorites_Share" />
                                            </td>
                                            <td class="CommonFormField">
                                                <CSControl:YesNoCheckBox id="ShareFavorites" runat="server" />
                                            </td>
                                        </tr>
				                    </table>
				                </div>
				                <div class="CommonGroupedContentArea">
				                    <h3 class="CommonSubTitle"><CSControl:ResourceControl ID="ResourceControl20" runat="server" ResourceName="ViewUserProfile_Tab_RssFeeds" /></h3>
				                    <div class="CommonFormFieldName"><CSControl:ResourceControl ID="ResourceControl21" runat="server" ResourceName="EditProfile_RssFeeds" /></div>
				                    <div class="CommonFormField">
					                    <asp:TextBox id="rssFeeds" TextMode="MultiLine" Columns="100" Rows="5" runat="server" Wrap="false" />
				                    </div>
				                </div>
			                </Content>
			            </TWC:TabbedPane>
                        <TWC:TabbedPane runat="server">
			                <Tab><CSControl:ResourceControl runat="server" ResourceName="EditProfile_Tab_Options" /></Tab>
			                <Content>
				                <div class="CommonGroupedContentArea">
				                    <h3 class="CommonSubTitle"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_OptionsTitle" /></h3>
				                    <table cellspacing="0" border="0" cellpadding="0">
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="EditProfile_OptionsSortOrder" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:DropDownList id="SortOrder" runat="server" />
						                    </td>
					                    </tr>  
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="EditProfile_FontSize" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:DropDownList id="FontSize" runat="server" />
						                    </td>
					                    </tr>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="EditProfile_Editor" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:DropDownList id="EditorList" runat="server" />
						                    </td>
					                    </tr>
        					            <CSControl:PlaceHolder runat="server">
					                        <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="EnableDisplayNames" Operator="IsSetOrTrue" /></DisplayConditions>
					                        <ContentTemplate>
					                            <tr>
						                            <td class="CommonFormFieldName">
							                            <CSControl:ResourceControl runat="server" ResourceName="EditProfile_DisplayName" />
						                            </td>
						                            <td class="CommonFormField">
							                            <CSControl:YesNoCheckBox id="enableDisplayNames" runat="server" />
						                            </td>
					                            </tr>									
					                        </ContentTemplate>
					                    </CSControl:PlaceHolder>
					                    <tr>        
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="EditProfile_DisplayInMemberList" />
						                    </td>
						                    <td class="CommonFormField" nowrap="nowrap">
							                    <CSControl:YesNoCheckBox id="DisplayInMemberList" runat="server" />
						                    </td>
					                    </tr>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="Admin_SiteSettings_EnablePostPreviewPopup" />
						                    </td>
						                    <td class="CommonFormField" nowrap="nowrap">
							                    <CSControl:YesNoCheckBox id="EnablePostPreviewPopup" runat="server" />
						                    </td>
					                    </tr>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="Admin_SiteSettings_EnableCollapsingPanels" />
						                    </td>
						                    <td class="CommonFormField" nowrap="nowrap">
							                    <CSControl:YesNoCheckBox id="EnableCollapsingPanels" runat="server" />
						                    </td>
					                    </tr>
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="Admin_SiteSettings_EnableConversationNotifications" />
						                    </td>
						                    <td class="CommonFormField" nowrap="nowrap">
							                    <CSControl:YesNoCheckBox id="EnableConversationNotifications" runat="server" />
						                    </td>
					                    </tr>
                                        <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="Admin_SiteSettings_EnableCommentNotifications" />
						                    </td>
						                    <td class="CommonFormField" nowrap="nowrap">
							                    <CSControl:YesNoCheckBox id="EnableCommentNotifications" runat="server" />
						                    </td>
					                    </tr>
					                    <tr id="EmoticonRow" runat="Server">
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="Admin_SiteSettings_EnableEmoticons" />
						                    </td>
						                    <td class="CommonFormField" nowrap="nowrap">
							                    <CSControl:YesNoCheckBox id="EnableEmoticons" runat="server" />
						                    </td>
					                    </tr>
                    					
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="EditProfile_EnableUserAvtars" />
						                    </td>
						                    <td class="CommonFormField" nowrap="nowrap">
							                    <CSControl:YesNoCheckBox id="enableUserAvtars" runat="server" />
						                    </td>
					                    </tr>
                    					
					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:ResourceControl runat="server" ResourceName="EditProfile_EnableUserSignatures" />
						                    </td>
						                    <td class="CommonFormField" nowrap="nowrap">
							                    <CSControl:YesNoCheckBox id="enableUserSignatures" runat="server" />
						                    </td>
					                    </tr>																

					                    <tr>
						                    <td class="CommonFormFieldName">
							                    <CSControl:FormLabel runat="server" ResourceName="EditProfile_CPGridItemsPerPage" LabelForId="PageSize" />
						                    </td>
						                    <td class="CommonFormField">
							                    <asp:dropdownlist id="PageSize" runat="Server">
								                    <asp:listitem value="5">5</asp:listitem>
								                    <asp:listitem value="10">10</asp:listitem>
								                    <asp:listitem value="20">20</asp:listitem>
								                    <asp:listitem value="30">30</asp:listitem>
								                    <asp:listitem value="40">40</asp:listitem>
								                    <asp:listitem value="50">50</asp:listitem>
							                    </asp:dropdownlist>
						                    </td>
					                    </tr>

				                        <CSControl:PlaceHolder runat="server">
					                        <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="AllowSiteToContact" ControlVisiblilityEquals="true" /></DisplayConditions>
					                        <ContentTemplate>
					                            <tr>
						                            <td class="CommonFormFieldName">
							                            <CSControl:FormLabel runat="server" ResourceName="EditProfile_AllowSiteToContact" LabelForId="ynEnableHelp" />
						                            </td>
						                            <td class="CommonFormField">
							                            <CSControl:YesNoCheckBox id="AllowSiteToContact" runat="server" />
						                            </td>
					                            </tr>
					                        </ContentTemplate>
					                    </CSControl:PlaceHolder>
            					        
					                     <CSControl:PlaceHolder runat="server">
					                        <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="AllowSitePartnersToContact" ControlVisiblilityEquals="true" /></DisplayConditions>
					                        <ContentTemplate>
					                            <tr>
						                            <td class="CommonFormFieldName">
							                            <CSControl:FormLabel runat="server" ResourceName="EditProfile_AllowSitePartnersToContact" LabelForId="ynEnableHelp" />
						                            </td>
						                            <td class="CommonFormField">
							                            <CSControl:YesNoCheckBox id="AllowSitePartnersToContact" runat="server" />
						                            </td>
					                            </tr>
					                        </ContentTemplate>
					                    </CSControl:PlaceHolder>
				                    </table>
				                </div>
				                
				                <asp:Panel id="EnableSignature" Runat="server" cssclass="CommonGroupedContentArea">
			                        <h3 class="CommonSubTitle"><CSControl:ResourceControl ID="ResourceControl2" runat="server" ResourceName="EditProfile_AboutSignature" /></h3>
			                        <div class="CommonFormField">
				                        <CSControl:Editor ID="Signature" Height="150px" runat="server" />
				                        <asp:CustomValidator ControlToValidate="Signature" id="SignatureMaxLengthValidator" EnableClientScript="false" runat="server"/>
			                        </div>
			                    </asp:Panel>
                				
				                <CSControl:PlaceHolder runat="server">
					                <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="FilterLanguageList" ControlVisiblilityEquals="true" /></DisplayConditions>
					                <ContentTemplate>
					                    <div class="CommonGroupedContentArea">
						                    <h3 class="CommonSubTitle">
							                    <CSControl:ResourceControl runat="server" ResourceName="EditProfile_ContentLanguagesToExclude" />
						                    </h3>
						                    <div class="CommonFormField">
							                    <asp:CheckBoxList RepeatColumns="3" RepeatDirection="Horizontal" id="FilterLanguageList" runat="server" />
						                    </div>
					                    </div>
				                    </ContentTemplate>
				                </CSControl:PlaceHolder>
                				
				                <div class="CommonGroupedContentArea">
				                    <h3 class="CommonSubTitle"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_AboutTimeZone" /></h3>
				                    <asp:DropDownList id="Timezone" runat="server" />
				                </div>

				                <div class="CommonGroupedContentArea">
				                    <h3 class="CommonSubTitle"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_OptionsDateFormat" /></h3>
				                    <asp:DropDownList id="DateFormat" runat="server" />
				                </div>
				                
				                <div class="CommonGroupedContentArea">
                                    <h3 class="CommonSubTitle"><CSControl:ResourceControl runat="server" ResourceName="EditLoginPreferences_Email" /></h3>
	                                <table>
				                        <tr>
					                        <td>
						                        <div class="CommonFormFieldName"><CSControl:ResourceControl ID="ResourceControl41" runat="server" ResourceName="EditProfile_ContactPrivateEmail" /></div>
						                        <CSControl:ResourceControl runat="server" ResourceName="EditProfile_ContactPrivateEmailDesc" Tag="Div" CssClass="CommonFormFieldDescription" />
					                        </td>
					                        <td class="CommonFormField">
						                        <asp:TextBox id="PrivateEmail" Columns="30" runat="server" MaxLength="50"/>
						                        <asp:RequiredFieldValidator id="emailValidator" runat="server" ControlToValidate="PrivateEmail" Cssclass="validationWarning">*</asp:RequiredFieldValidator>
						                        <asp:RegularExpressionValidator id="emailRegExValidator" runat="server" ControlToValidate="PrivateEmail" Cssclass="validationWarning" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
					                        </td>
				                        </tr>
							            <CSControl:PlaceHolder ID="EmailOptionsPlaceholder" runat="server">
								            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="EnableEmail" Operator="issetortrue" /></DisplayConditions>
								            <ContentTemplate>
						                        <tr>
							                        <td>
										                <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_OptionsReceiveEmails" /></div>
								                        <CSControl:ResourceControl runat="server" ResourceName="EditProfile_OptionsReceiveEmailsDesc" Tag="Div" CssClass="CommonFormFieldDescription" />
							                        </td>
							                        <td class="CommonFormField">
										                <CSControl:YesNoCheckBox id="ReceiveEmails" runat="server" />
								                    </td>
						                        </tr>
						                        <tr>
							                        <td>
										                <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_OptionsHtmlEmail" /></div>
								                        <CSControl:ResourceControl ID="ResourceControl8" runat="server" ResourceName="EditProfile_OptionsHtmlEmailDesc" Tag="Div" CssClass="CommonFormFieldDescription" />
							                        </td>
							                        <td class="CommonFormField">
										                <CSControl:YesNoCheckBox id="EnableHtmlEmail" runat="server" />
								                    </td>
						                        </tr>
						                        <tr>
							                        <td>
										                <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_OptionsEmailTracking" /></div>
								                        <CSControl:ResourceControl runat="server" ResourceName="EditProfile_OptionsEmailTrackingDesc" Tag="Div" CssClass="CommonFormFieldDescription" />
							                        </td>
							                        <td class="CommonFormField">
									                    <CSControl:YesNoCheckBox id="EnableEmailTracking" runat="server" />
							                        </td>
						                        </tr>
								            </ContentTemplate>
					                    </CSControl:PlaceHolder>
                                    </table>
                                </div>
					                    
					            <CSControl:PlaceHolder ID="ConverstationsOptionsPlaceholder" runat="server">
						            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="EnableConversations" Operator="issetortrue" /></DisplayConditions>
						            <ContentTemplate>
				                        <div class="CommonGroupedContentArea">
                                            <h3 class="CommonSubTitle"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_ConversationsPreferences" /></h3>
	                                        <table>				                    
				                                <tr>
					                                <td>
								                        <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_AllowConversationsFrom" /></div>
						                                <div class="CommonFormFieldDescription"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_AllowConversationsFromDescription" /></div>
					                                </td>
					                                <td class="CommonFormField">
					                                    <asp:RadioButtonList id="EnableStartConversations" RepeatColumns="3" runat="server" RepeatLayout="flow" />
						                            </td>
				                                </tr>
                                            </table>
                                        </div>
						            </ContentTemplate>
			                    </CSControl:PlaceHolder>

					            <CSControl:PlaceHolder ID="ActivityMessageTypeOptionsPlaceholder" runat="server">
						            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="EnableActivityLogging" Operator="issetortrue" /></DisplayConditions>
						            <ContentTemplate>
                                        <div class="CommonGroupedContentArea">
                                            <h3 class="CommonSubTitle">Activity Message Configuration</h3>      
                                            <table>
                                                <tr>
                                                    <td valign="top">           
		                                                <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes" /></div>
		                                                <div class="CommonFormFieldDescription"><CSControl:ResourceControl runat="Server" resourcename="ActivityLoggingTypes_Desc" /></div>
		                                            </td>
		                                            <td valign="top" class="CommonFormField">
                                                        <table cellpadding="8" cellspacing="0" border="0">
				                                            <tr>
                                                                <CSControl:PlaceHolder runat="server">
						                                            <DisplayConditions runat="server" Operator="Or">
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewProfileAnnouncement" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewProfileComment" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewUserAvatar" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewUserFile" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewUserFolder" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewFriendship" ControlVisiblilityEquals="true" />
						                                            </DisplayConditions>
    					                                            <ContentTemplate>    					                                            				                                                
    					                                                <td valign="top">		                                                
				                                                            <strong> <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_UserActivities" /></strong><br />
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewProfileAnnouncement" />
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewProfileAnnouncement">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewProfileAnnouncement" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewProfileComment" /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewProfileComment">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewProfileComment" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewUserAvatar"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewUserAvatar">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewUserAvatar" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewUserFile"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewUserFile">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewUserFile" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewUserFolder"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewUserFolder">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewUserFolder" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewFriendship"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewFriendship">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewFriendship" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                        </td>
				                                                    </ContentTemplate>
				                                                </CSControl:PlaceHolder>
                                                                <CSControl:PlaceHolder runat="server">
						                                            <DisplayConditions runat="server" Operator="Or">
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewBlog" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewBlogPost" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewBlogComment" ControlVisiblilityEquals="true" />
						                                            </DisplayConditions>
    					                                            <ContentTemplate>	
			                                                            <td valign="top">
	        		                                                        <strong> <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_BlogActivities" /></strong><br />
			                                                                <asp:CheckBox runat="server" ID="ActivityLoggingNewBlog"  /> 
			                                                                    <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewBlog">
			                                                                        <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewBlog" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
			                                                                <asp:CheckBox runat="server" ID="ActivityLoggingNewBlogPost"  /> 
			                                                                    <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewBlogPost">
			                                                                        <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewBlogPost" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
			                                                                <asp:CheckBox runat="server" ID="ActivityLoggingNewBlogComment"  /> 
			                                                                    <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewBlogComment">    
			                                                                        <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewBlogComment" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
			                                                            </td>
			                                                        </ContentTemplate>
			                                                    </CSControl:PlaceHolder>				                                                
                                                                <CSControl:PlaceHolder runat="server">
						                                            <DisplayConditions runat="server" Operator="Or">
    						                                            <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewForum" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewForumThread" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewForumPost" ControlVisiblilityEquals="true" />
						                                            </DisplayConditions>
    					                                            <ContentTemplate>	
	    					                                            <td valign="top">
        				                                                    <strong> <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_ForumActivities" /></strong><br />
	            		                                                    <asp:CheckBox runat="server" ID="ActivityLoggingNewForum"  /> 
	            		                                                        <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewForum">
	            		                                                            <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewForum" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
	            		                                                    <asp:CheckBox runat="server" ID="ActivityLoggingNewForumThread"  /> 
	            		                                                        <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewForumThread">
	            		                                                            <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewForumThread" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
		    	                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewForumPost"  /> 
		    	                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewForumPost">
		    	                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewForumPost" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
			                                                            </td>
			                                                        </ContentTemplate>
			                                                    </CSControl:PlaceHolder>
				                                            </tr>
				                                            <tr>
                                                                <CSControl:PlaceHolder runat="server">
						                                            <DisplayConditions runat="server" Operator="Or">
    						                                            <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewMediaGallery" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewMediaGalleryPost" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewMediaGalleryComment" ControlVisiblilityEquals="true" />
						                                            </DisplayConditions>
    					                                            <ContentTemplate>	
				                                                        <td valign="top">
	    			                                                        <strong> <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_MediaGalleryActivities" /></strong><br />
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewMediaGallery"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewMediaGallery">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewMediaGallery" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewMediaGalleryPost"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewMediaGalleryPost">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewMediaGalleryPost" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewMediaGalleryComment"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewMediaGalleryComment">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewMediaGalleryComment" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                        </td>
				                                                    </ContentTemplate>
				                                                </CSControl:PlaceHolder>
                                                                <CSControl:PlaceHolder runat="server">
						                                            <DisplayConditions runat="server" Operator="Or">
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewGroup" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewGroupMember" ControlVisiblilityEquals="true" />
    						                                            <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewGroupPage" ControlVisiblilityEquals="true" />
						                                            </DisplayConditions>
    					                                            <ContentTemplate>	
        				                                                <td valign="top">
		        		                                                    <strong> <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_GroupActivities" /></strong><br />
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewGroup"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewGroup">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewGroup" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewGroupMember"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewGroupMember">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewGroupMember" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewGroupPage"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewGroupPage">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewGroupPage" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                        </td>
				                                                    </ContentTemplate>
				                                                </CSControl:PlaceHolder>
				                                                <CSControl:PlaceHolder runat="server">
						                                            <DisplayConditions runat="server" Operator="Or">
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewWikiPage" ControlVisiblilityEquals="true" />
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingUpdatedWikiPage" ControlVisiblilityEquals="true" />
    						                                            <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewWikiComment" ControlVisiblilityEquals="true" />
						                                            </DisplayConditions>
    					                                            <ContentTemplate>
        				                                                <td valign="top">
		        		                                                    <strong> <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_WikiActivities" /></strong><br />
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewWikiPage"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewWikiPage">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewWikiPage" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingUpdatedWikiPage"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_UpdatedWikiPage">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingUpdatedWikiPage" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                            <asp:CheckBox runat="server" ID="ActivityLoggingNewWikiComment"  /> 
				                                                                <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_NewWikiComment">
				                                                                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingNewWikiComment" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>				                                                    
				                                                        </td>
				                                                    </ContentTemplate>
				                                                </CSControl:PlaceHolder>
				                                            </tr>
				                                            <tr>
				                                                <CSControl:PlaceHolder runat="server">
						                                            <DisplayConditions runat="server" Operator="Or">
						                                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingThirdPartyMessageType" ControlVisiblilityEquals="true" />
						                                            </DisplayConditions>
    					                                            <ContentTemplate>
        				                                                <td valign="top">
		        		                                                    <asp:CheckBox runat="server" ID="ActivityLoggingThirdPartyMessageType"  /> 
		        		                                                        <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_ThirdPartyActivities">
		        		                                                            <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingThirdPartyMessageType" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                        </td>
        				                                                <td valign="top">
		        		                                                    <asp:CheckBox runat="server" ID="ActivityLoggingStatus"  /> 
		        		                                                        <CSControl:ResourceControl runat="server" resourcename="ActivityLoggingTypes_Status">
		        		                                                            <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ActivityLoggingStatus" ControlVisiblilityEquals="true" /></DisplayConditions>
				                                                                    <TrailerTemplate><br /></TrailerTemplate>
				                                                                </CSControl:ResourceControl>
				                                                        </td>
				                                                    </ContentTemplate>
				                                                </CSControl:PlaceHolder>
				                                            </tr>
				                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                </CSControl:PlaceHolder>		                    	
    				            
				                <div class="CommonGroupedContentArea">
				                    <h3 class="CommonSubTitle"><CSControl:ResourceControl runat="server" ResourceName="Profile_EditApiKeys" /></h3>
				                    <CSControl:SiteUrl  runat="server" UrlName="user_EditApiKeys" ResourceName="Profile_EditApiKeysDescription" />
                                </div>

			                </Content>
			            </TWC:TabbedPane>
                        <TWC:TabbedPane runat="server">
                            <Tab><CSControl:ResourceControl runat="server" ResourceName="EditLoginPreferences_Login" /></Tab>
                            <Content>
                                <div class="CommonGroupedContentArea">
                                    <h3 class="CommonSubTitle"><CSControl:ResourceControl runat="server" ResourceName="EditLoginPreferences_Login" /></h3>
			                        <table cellspacing="0" cellpadding="0" border="0">
                                        <CSControl:UserData UseAccessingUser="true" ID="UserData8" runat="server" Property="Username">
                                            <LeaderTemplate>
                                                <tr>
                                                    <td>
                                                        <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="EditLoginPreferences_SignInName" /></div>
                                                        <CSControl:ResourceControl runat="server" ResourceName="EditLoginPreferences_SignInNameDesc" Tag="Div" CssClass="CommonFormFieldDescription" />
                                                    </td>
                                                    <td class="CommonFormField">
                                            </LeaderTemplate>
                                            <TrailerTemplate>
                                                    </td>
                                                </tr>
                                            </TrailerTemplate>
                                        </CSControl:UserData>
                                        
	                                    <tr>
	                                        <td>
	                                            <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_Password" /></div>
                                                <CSControl:ResourceControl runat="server" ResourceName="EditLoginPreferences_PasswordDesc" Tag="Div" CssClass="CommonFormFieldDescription" />
	                                        </td>
                		                    
	                                        <td class="CommonFormField">
	                                            <CSControl:SiteUrl ID="SiteUrl1" runat="server" UrlName="user_ChangePassword" ResourceName="EditProfile_PasswordChange" />
	                                        </td>
	                                    </tr>
            	                        
	                                    <tr>
	                                        <td>
    					                        <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="EditLoginPreferences_LastSignIn" /></div>
    					                        <CSControl:ResourceControl runat="server" ResourceName="EditLoginPreferences_LastSignInDesc" Tag="Div" CssClass="CommonFormFieldDescription" />
    					                    </td>
                					        
    					                    <td class="CommonFormField">
				                                <CSControl:UserData ID="UserData1" runat="server" Property="LastLogin" />
				                            </td>
	                                    </tr>
	                                    
	                                    <CSControl:PlaceHolder runat="server">
				                            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PasswordRecovery" ComparisonValue="QuestionAndAnswer" Operator="EqualTo" /></DisplayConditions>
				                            <ContentTemplate>
				                                <tr>
					                                <td class="CommonFormFieldName">
						                                <CSControl:ResourceControl runat="server" ResourceName="EditProfile_PasswordAnswer" />
					                                </td>
					                                <td class="CommonFormField">
					                                    <CSControl:SiteUrl runat="server" UrlName="user_ChangePasswordAnswer" ResourceName="EditProfile_PasswordAnswerChange" />
					                                </td>
				                                </tr>
                                            </ContentTemplate>
                                        </CSControl:PlaceHolder>
	                                </table>
	                            </div>
	                            <CSControl:OpenIdAssociateUserForm runat="server" 
		                            AssociateUserOpenIDButtonId="AddOpenId" OpenIdTextBoxId="openId" StatusTextId="statusText">
			                    <FormTemplate>
		                        <div class="CommonGroupedContentArea">
			                        <h3 class="CommonSubTitle"><CSControl:ResourceControl runat="server" ResourceName="EditProfile_Tab_OpenId" /></h3>
			                        <asp:Panel runat="server" DefaultButton="AddOpenId">
			                        <div class="CommonValidationWarning"><CSControl:CSLiteral runat="server" ID="statusText" /></div>
			                        <br/>
			                        <asp:TextBox id="openId" runat="server" CssClass="CommonOpenIdBox" Columns="40" ToolTip="Example: http://yourname.myopenid.com" ValidationGroup="OpenIdGroup" />
				                    <asp:RegularExpressionValidator runat="server" ControlToValidate="OpenId" 
				                         ValidationExpression="(?:http://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*))*)(?:\?(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*))?)?)|(?:ftp://(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*)(?::(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*))?@)?(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))(?:/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*))*)(?:;type=[AIDaid])?)?)|(?:news:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;/?:&=])+@(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3})))|(?:[a-zA-Z](?:[a-zA-Z\d]|[_.+-])*)|\*))|(?:nntp://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)/(?:[a-zA-Z](?:[a-zA-Z\d]|[_.+-])*)(?:/(?:\d+))?)|(?:telnet://(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*)(?::(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*))?@)?(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))/?)|(?:gopher://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))*)(?:%09(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*)(?:%09(?:(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))*))?)?)?)?)|(?:wais://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)/(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)(?:(?:/(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)/(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*))|\?(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*))?)|(?:mailto:(?:(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))+))|(?:file://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))|localhost)?/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*))*))|(?:prospero://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*))*)(?:(?:;(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&])*)=(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&])*)))*)|(?:ldap://(?:(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))?/(?:(?:(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*))(?:(?:(?:%0[Aa])?(?:%20)*)\+(?:(?:%0[Aa])?(?:%20)*)(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)))*)(?:(?:(?:(?:%0[Aa])?(?:%20)*)(?:[;,])(?:(?:%0[Aa])?(?:%20)*))(?:(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*))(?:(?:(?:%0[Aa])?(?:%20)*)\+(?:(?:%0[Aa])?(?:%20)*)(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)))*))*(?:(?:(?:%0[Aa])?(?:%20)*)(?:[;,])(?:(?:%0[Aa])?(?:%20)*))?)(?:\?(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+)(?:,(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))*)?)(?:\?(?:base|one|sub)(?:\?(?:((?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))+)))?)?)?)|(?:(?:z39\.50[rs])://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+)(?:\+(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))*(?:\?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))?)?(?:;esn=(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))?(?:;rs=(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+)(?:\+(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))*)?))|(?:cid:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?:@&=])*))|(?:mid:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?:@&=])*))?)|(?:vemmi://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[/?:@&=])*)(?:(?:;(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[/?:@&])*)=(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[/?:@&])*))*))?)|(?:imap://(?:(?:(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+)(?:(?:;[Aa][Uu][Tt][Hh]=(?:\*|(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+))))?)|(?:(?:;[Aa][Uu][Tt][Hh]=(?:\*|(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+)))(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+))?))@)?(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))/(?:(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)?;[Tt][Yy][Pp][Ee]=(?:[Ll](?:[Ii][Ss][Tt]|[Ss][Uu][Bb])))|(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)(?:\?(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+))?(?:(?:;[Uu][Ii][Dd][Vv][Aa][Ll][Ii][Dd][Ii][Tt][Yy]=(?:[1-9]\d*)))?)|(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)(?:(?:;[Uu][Ii][Dd][Vv][Aa][Ll][Ii][Dd][Ii][Tt][Yy]=(?:[1-9]\d*)))?(?:/;[Uu][Ii][Dd]=(?:[1-9]\d*))(?:(?:/;[Ss][Ee][Cc][Tt][Ii][Oo][Nn]=(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)))?)))?)|(?:nfs:(?:(?://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:(?:/(?:(?:(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*)(?:/(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*))*)?)))?)|(?:/(?:(?:(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*)(?:/(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*))*)?))|(?:(?:(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*)(?:/(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*))*)?)))"
				                         ErrorMessage="<br/>URL not in correct format" Text="*" ValidationGroup="OpenIdGroup" />
				                    <asp:RequiredFieldValidator runat="server" ControlToValidate="openId" ValidationGroup="OpenIdGroup" Text="*" />
				                    <CSControl:ResourceButton id="AddOpenId" runat="server" ResourceName="Add_OpenId" ValidationGroup="OpenIdGroup" />
				                    </asp:Panel>
    				                
				                    <CSControl:OpenIdList runat="server">
				                        <HeaderTemplate>
			                                <br />
			                                <table cellpadding="0" cellspacing="0" border="0" width="80%">
			                                    <tr>
			                                        <td class="CommonListHeader">
			                                            <CSControl:ResourceControl runat="server" ResourceName="EditProfile_AssociateOpenIdsTitle" />
			                                        </td>
			                                        <td class="CommonListHeader">
    			                                    	&nbsp;
			                                        </td>
			                                    </tr>
			                            </HeaderTemplate>
				                        <ItemTemplate>
				                                <tr>
			                                        <td class="CommonListCell">
			                                            <CSControl:OpenIdData runat="server" Property="Url" />
			                                        </td>
			                                        <td class="CommonListCell">
			                                            <CSControl:DeleteOpenIdForm runat="server" SubmitButtonId="DeleteButton">
			                                                <FormTemplate>
			                                                    <CSControl:ResourceButton ID="DeleteButton" runat="server" OnClientClick="return confirm('Are you sure you want to remove this OpenID');" ResourceName="OpenId_Delete" />
			                                                </FormTemplate>
			                                                <SuccessActions>
			                                                    <CSControl:GoToModifiedUrlAction runat="server" />
			                                                </SuccessActions>
			                                            </CSControl:DeleteOpenIdForm>
			                                        </td>
			                                    </tr>
				                        </ItemTemplate>
				                        <AlternatingItemTemplate>
				                                <tr class="CommonListRowAlt">
			                                        <td class="CommonListCell">
			                                            <CSControl:OpenIdData runat="server" Property="Url" />
			                                        </td>
			                                        <td class="CommonListCell">
			                                            <CSControl:DeleteOpenIdForm runat="server" SubmitButtonId="DeleteButton">
			                                                <FormTemplate>
			                                                    <CSControl:ResourceButton ID="DeleteButton" runat="server" OnClientClick="return confirm('Are you sure you want to remove this OpenID');" ResourceName="OpenId_Delete" />
			                                                </FormTemplate>
			                                                <SuccessActions>
			                                                    <CSControl:GoToModifiedUrlAction runat="server" />
			                                                </SuccessActions>
			                                            </CSControl:DeleteOpenIdForm>
			                                        </td>
			                                    </tr>
				                        </AlternatingItemTemplate>
				                        <FooterTemplate></table></FooterTemplate>
				                    </CSControl:OpenIdList>
    				                
                                </div>   
                                </FormTemplate>
                                </CSControl:OpenIdAssociateUserForm>
                            </Content>
                        </TWC:TabbedPane>
                        <TWC:TabbedPane ID="LdapTab" runat="server">
                            <Tab><CSControl:ResourceControl runat="server" ResourceName="EditProfile_Tab_Ldap" /></Tab>
                            <Content>
                                <CSControl:UserLdapSubForm id="UserLdapFields" runat="server" 
                                                                    ControlIdsToHideWhenNotVisible="LdapTab"
                                                                    LdapConfigurationFormID="LdapConfigurationForm"
                                                                    LdapUpdateUserProfileID="UpdateUserProfile"
                                                                    LdapConnectionErrorControlID="LdapConnectionError">
                                <FormTemplate>
                                    <CSDynConfig:ConfigurationForm runat="server" id="LdapConfigurationForm" RenderGroupsInTabs="false">
                                        <PropertyFormGroupHeaderTemplate>
                                        <div class="CommonGroupedContentArea">
	                                        <h3 class="CommonSubTitle"><CSDynConfig:PropertyGroupData ID="PropertyGroupData1" Property="Name" runat="server" /></h3>
	                                        <table cellspacing="0" border="0" cellpadding="0">
                                        </PropertyFormGroupHeaderTemplate>
                                        <PropertyFormPropertyTemplate>
					                            <tr>
						                            <td class="CommonFormFieldName">
							                            <CSDynConfig:PropertyData Property="Name" runat="server" />
						                            </td>
						                            <td class="CommonFormField">
							                            <CSDynConfig:PropertyControl runat="server" />
						                            </td>
					                            </tr>
                                        </PropertyFormPropertyTemplate>
                                        <PropertyFormGroupFooterTemplate>
                                            </table>
                                        </div>
                                        </PropertyFormGroupFooterTemplate>
                                    </CSDynConfig:ConfigurationForm>
                                    <CSControl:ResourceControl id="LdapConnectionError" runat="server" ResourceName="EditProfile_Tab_Ldap_Connection_Error" cssclass="CommonMessageError" />
                                    <asp:CheckBox ID="UpdateUserProfile" runat="server" Text="Update Display Name and Email" />
                                </FormTemplate>
                                </CSControl:UserLdapSubForm>
                            </Content>
                        </TWC:TabbedPane>
                        
		            </TWC:TabbedPanes>
    		        
		            <div class="CommonFormFieldName">		
                        <CSControl:ResourceButton runat="server" id="UpdateButtonBottom" ResourceName="Save" />
		            </div>
                </FormTemplate>
		    </CSControl:EditUserForm>
		
        </div>
    </div>

</asp:Content>