<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" MasterPageFile="mediagalleries.Master" %>

<script runat="server" language="C#">

    bool IsAuthor(object user)
    {
        CommunityServer.Components.User u = user as CommunityServer.Components.User;
        CommunityServer.MediaGalleries.Components.MediaGalleryPost p = CommunityServer.MediaGalleries.Controls.MediaGalleryControlUtility.Instance().GetCurrentMediaGalleryPost(this);
        return (u != null && p.User != null && !u.IsAnonymous && u.UserID == p.UserID);
    }

</script>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea">
        <div class="Common">
            <CSControl:SiteUrl UrlName="mediagallerieshome" ResourceName="media" runat="server" />
            &raquo;
            <CSMedia:GroupData LinkTo="GroupHome" Property="Name" runat="server" />
            &raquo;
            <CSMedia:MediaGalleryData LinkTo="MediaGalleryHome" Property="Name" runat="server" />        
            &raquo;
            <CSMedia:MediaGalleryPostData LinkTo="View" Property="Subject" runat="server" />
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" Tag="H1" CssClass="CommonTitle" EnableRendering="true">
        <ContentTemplate><CSMedia:MediaGalleryPostData Property="Subject" runat="server" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxHeaderForm">
            <CSMedia:MediaGalleryPostData LinkTo="ViewPrevious" ResourceName="Button_PreviousTopic" runat="server" /> |
            <CSMedia:MediaGalleryPostData LinkTo="ViewNext" ResourceName="Button_NextTopic" runat="server" /> |
            <CSMedia:MediaGalleryData LinkTo="MediaGalleryHome" ResourceName="MediaGallery_ViewFiles" runat="server" /> |
            <CSMedia:MediaGalleryData LinkTo="Slideshow" ResourceName="MediaGallery_ViewSlideshow" runat="server" />
        </div>
        <div class="CommonContentBoxContent">
        
            <CSControl:ResourceControl runat="server" ResourceName="MediaGalleries_Comment_Pending" ResourceFile="MediaGallery.xml" Tag="Div" CssClass="CommonMessageSuccess">
                <DisplayConditions>
                    <CSControl:QueryStringPropertyValueComparison QueryStringProperty="CommentPosted" Operator="IsSetOrTrue" runat="server" />
                </DisplayConditions>
                <LeaderTemplate><a name="commentmessage"></a></LeaderTemplate>
            </CSControl:ResourceControl>
            
            <CSControl:ConditionalContent runat="server">
                <ContentConditions Operator="Or">
                    <CSMedia:MediaGalleryPostViewerMediaTypeCondition runat="server" MediaType="Video" />
                    <CSMedia:MediaGalleryPostViewerMediaTypeCondition runat="server" MediaType="Image" />
                </ContentConditions>
                <TrueContentTemplate>
                    <div style="float: left; width: 500px; height: 400px; overflow: hidden; overflow-x: hidden; overflow-y: visible; border: solid 1px #000; background-color: #000;">
                        <table cellpadding="0" cellspacing="0" border="0" width="500" height="400"><tr><td valign="middle" align="center">
                            <CSControl:ConditionalContent runat="server">
                                <ContentConditions Operator="Or">
                                    <CSMedia:MediaGalleryPostViewerMediaTypeCondition runat="server" MediaType="Image" />
                                </ContentConditions>
                                <TrueContentTemplate>
                                    <CSMedia:MediaGalleryPostData runat="server" CssClass="CommonImageDownloadLink" LinkTo="Download" Border="0">
                                        <ContentTemplate>
                                            <CSMedia:MediaGalleryPostViewer runat="server" Border="0" ViewType="View" Width="500" Height="400" ID="PostViewer" />
                                        </ContentTemplate>
                                    </CSMedia:MediaGalleryPostData>
                                </TrueContentTemplate>
                                <FalseContentTemplate>
                                    <CSMedia:MediaGalleryPostViewer runat="server" ViewType="View" Width="500" Height="400" ID="PostViewer" />
                                </FalseContentTemplate>
                            </CSControl:ConditionalContent>
                        </td></tr></table>
                    </div>
                    <div style="overflow: hidden; padding-left: 10px; width: 150px; word-wrap: break-word;">
                        <CSMedia:MediaGalleryPostData runat="server" Property="Subject" Tag="Strong" style="font-size: 120%;" />
                        <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Div" style="margin: 4px 0;">                	        
                            <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="postedby" /> </LeaderTemplate>
                        </CSControl:UserData>
                        <CSMedia:MediaGalleryPostData runat="server" Property="PostDate" Tag="Div" style="margin: 4px 0;" />
                        <CSMedia:MediaGalleryPostRating runat="server" Tag="Div" style="margin: 4px 0;" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" />
                        <CSMedia:MediaGalleryPostData runat="server" Property="Replies" LinkTargetLocationModification="comments" LinkTo="View" ResourceName="MediaGallery_Comments" Tag="Div" style="margin: 4px 0;">
                            <DisplayConditions><CSMedia:MediaGalleryPostPropertyValueComparison runat="server" ComparisonProperty="Replies" Operator="GreaterThan" ComparisonValue="0" /></DisplayConditions>
                        </CSMedia:MediaGalleryPostData>
                        
                        <hr />
                        <CSMedia:MediaGalleryPostData Tag="Div" LinkCssClass="CommonImageTextButton CommonDownloadButton" LinkTo="Download" IgnoreLinkPermissions="true" ResourceName="MediaGalleries_Button_Download" ResourceFile="MediaGallery.xml" runat="server" />
                        
                        <CSControl:PlaceHolder runat="server">
                            <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
                            <ContentTemplate><hr /></ContentTemplate>
                        </CSControl:PlaceHolder>
                        <CSMedia:MediaGalleryPostSubscriptionToggleButton Tag="Div" runat="server" ButtonOnCssClass="CommonTextButton" ButtonOffCssClass="CommonTextButton" ButtonProcessingCssClass="CommonTextButton">
                            <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="StopEmailingReplies" /></OnTemplate>
		                    <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="EmailReplies" /></OffTemplate>
                        </CSMedia:MediaGalleryPostSubscriptionToggleButton>
                        <CSMedia:MediaGalleryPostFavoriteToggleButton Tag="Div" ButtonOffCssClass="CommonTextButton" ButtonOnCssClass="CommonTextButton" ButtonProcessingCssClass="CommonTextButton" runat="server">
                            <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="Favorites_MediaGallery_AddFile" /></OffTemplate>
                            <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="Favorites_MediaGallery_RemoveFile" /></OnTemplate>
                        </CSMedia:MediaGalleryPostFavoriteToggleButton>
                        <CSMedia:MediaGalleryFavoriteToggleButton Tag="Div" ButtonOffCssClass="CommonTextButton" ButtonOnCssClass="CommonTextButton" ButtonProcessingCssClass="CommonTextButton" runat="server">
                            <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="Favorites_MediaGallery_AddGallery" /></OffTemplate>
                            <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="Favorites_MediaGallery_Remove" /></OnTemplate>
                        </CSMedia:MediaGalleryFavoriteToggleButton>
	                    <CSMedia:MediaGalleryPostData Tag="Div" LinkCssClass="CommonTextButton" LinkTo="Edit" ResourceName="MediaGalleries_Button_Edit" ResourceFile="MediaGallery.xml" runat="server" />
	                    <CSMedia:MediaGalleryPostData Tag="Div" LinkCssClass="CommonTextButton" LinkTo="Delete" ResourceName="MediaGalleries_Button_Delete" ResourceFile="MediaGallery.xml" runat="server" />

                        <hr />
                        <CSMedia:MediaGalleryPostData runat="server" Property="Downloads" ResourceName="MediaGallery_Downloads" Tag="Div" style="margin: 4px 0;" />
                        <CSMedia:MediaGalleryPostData runat="server" Property="FileSize" ResourceName="MediaGallery_FileSize" Tag="Div" style="margin: 4px 0;" />
                        <CSMedia:MediaGalleryPostData runat="server" Property="Views" ResourceName="MediaGallery_Views" Tag="Div" style="margin: 4px 0;" />
                        
                        <CSMedia:MediaGalleryPostData Property="EmbedCode" Encoding="HTML" runat="server">
                            <DisplayConditions Operator="Or">
                                <CSMedia:MediaGalleryPostViewerMediaTypeCondition runat="server" MediaType="Video" />
                                <CSMedia:MediaGalleryPostViewerMediaTypeCondition runat="server" MediaType="Audio" />
                            </DisplayConditions>
                            <LeaderTemplate>
                                <hr />
                                <CSControl:ResourceControl runat="server" ResourceName="Embed" /><br />
                                <input type="text" onclick="this.select();" oncontextmenu="this.select();" style="width: 130px;" value="</LeaderTemplate>
                            <TrailerTemplate>" /></TrailerTemplate>
                        </CSMedia:MediaGalleryPostData>
                    </div>
	                <div style="clear: both; margin-top: 1em;">
	                    <CSMedia:MediaGalleryPostTagEditableList runat="server" Tag="Div" EditorCssClass="CommonInlineTagEditor" />
		                <CSMedia:MediaGalleryPostData runat="server" Property="FormattedBody" IncrementViewCount="true" Tag="Div" />
	                </div>
                </TrueContentTemplate>
                <FalseContentTemplate>
                    <div style="float: right; width: 180px; background-color: #f7f7f7; padding: 10px; margin: 0 0 0 10px;">
                            
                        <CSMedia:MediaGalleryPostData Tag="Div" LinkCssClass="CommonImageTextButton CommonDownloadButton" LinkTo="Download" IgnoreLinkPermissions="true" ResourceName="MediaGalleries_Button_Download" ResourceFile="MediaGallery.xml" runat="server" />
                        
                        <hr />
                        
                        <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Div" style="margin: 4px 0;">                	        
                            <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="postedby" /> </LeaderTemplate>
                        </CSControl:UserData>
                        <CSMedia:MediaGalleryPostData runat="server" Property="PostDate" Tag="Div" style="margin: 4px 0;" />
                        <CSMedia:MediaGalleryPostRating runat="server" Tag="Div" style="margin: 4px 0;" RatingCssClass="CommonRateControl" RatingReadOnlyCssClass="CommonRateControlReadOnly" RatingActiveCssClass="CommonRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" />
                        <CSMedia:MediaGalleryPostData runat="server" Property="Replies" LinkTargetLocationModification="comments" LinkTo="View" ResourceName="MediaGallery_Comments" Tag="Div" style="margin: 4px 0;">
                            <DisplayConditions><CSMedia:MediaGalleryPostPropertyValueComparison runat="server" ComparisonProperty="Replies" Operator="GreaterThan" ComparisonValue="0" /></DisplayConditions>
                        </CSMedia:MediaGalleryPostData>
                        
                        <CSControl:PlaceHolder runat="server">
                            <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
                            <ContentTemplate><hr /></ContentTemplate>
                        </CSControl:PlaceHolder>
                        <CSMedia:MediaGalleryPostSubscriptionToggleButton Tag="Div" runat="server" ButtonOnCssClass="CommonTextButton" ButtonOffCssClass="CommonTextButton" ButtonProcessingCssClass="CommonTextButton">
                            <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="StopEmailingReplies" /></OnTemplate>
                            <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="EmailReplies" /></OffTemplate>
                        </CSMedia:MediaGalleryPostSubscriptionToggleButton>
                        <CSMedia:MediaGalleryPostFavoriteToggleButton Tag="Div" ButtonOffCssClass="CommonTextButton" ButtonOnCssClass="CommonTextButton" ButtonProcessingCssClass="CommonTextButton" runat="server">
                            <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="Favorites_MediaGallery_AddFile" /></OffTemplate>
                            <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="Favorites_MediaGallery_RemoveFile" /></OnTemplate>
                        </CSMedia:MediaGalleryPostFavoriteToggleButton>
                        <CSMedia:MediaGalleryFavoriteToggleButton Tag="Div" ButtonOffCssClass="CommonTextButton" ButtonOnCssClass="CommonTextButton" ButtonProcessingCssClass="CommonTextButton" runat="server">
                            <OffTemplate><CSControl:ResourceControl runat="server" ResourceName="Favorites_MediaGallery_AddGallery" /></OffTemplate>
                            <OnTemplate><CSControl:ResourceControl runat="server" ResourceName="Favorites_MediaGallery_Remove" /></OnTemplate>
                        </CSMedia:MediaGalleryFavoriteToggleButton>
                        <CSMedia:MediaGalleryPostData Tag="Div" LinkCssClass="CommonTextButton" LinkTo="Edit" ResourceName="MediaGalleries_Button_Edit" ResourceFile="MediaGallery.xml" runat="server" />
                        <CSMedia:MediaGalleryPostData Tag="Div" LinkCssClass="CommonTextButton" LinkTo="Delete" ResourceName="MediaGalleries_Button_Delete" ResourceFile="MediaGallery.xml" runat="server" />

                        <hr />
                        <CSMedia:MediaGalleryPostData runat="server" Property="Downloads" ResourceName="MediaGallery_Downloads" Tag="Div" style="margin: 4px 0;" />
                        <CSMedia:MediaGalleryPostData runat="server" Property="FileSize" ResourceName="MediaGallery_FileSize" Tag="Div" style="margin: 4px 0;" />
                        <CSMedia:MediaGalleryPostData runat="server" Property="Views" ResourceName="MediaGallery_Views" Tag="Div" style="margin: 4px 0;" />
                        
                        <CSMedia:MediaGalleryPostData Property="EmbedCode" Encoding="HTML" runat="server">
                            <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="PostViewer" ControlVisiblilityEquals="true" /></DisplayConditions>
                            <LeaderTemplate>
                                <hr />
                                <CSControl:ResourceControl runat="server" ResourceName="Embed" /><br />
                                <input type="text" onclick="this.select();" oncontextmenu="this.select();" style="width: 130px;" value="</LeaderTemplate>
                            <TrailerTemplate>" /></TrailerTemplate>
                        </CSMedia:MediaGalleryPostData>
                    </div>
                    
                    <div style="width: 450px; overflow:hidden;">
                        <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 2em;"><tr valign="middle">
                            <CSMedia:MediaGalleryPostViewer runat="server" ViewType="Preview" Width="48" Height="48" Tag="Td" style="padding-right: 10px;" />
                            <td><CSMedia:MediaGalleryPostData runat="server" Property="Subject" Tag="Strong" style="font-size: 160%;" /></td>
                        </tr></table>
                        
                        <CSMedia:MediaGalleryPostViewer runat="server" ViewType="View" Width="450" ID="PostViewer" Tag="Div" style="margin-bottom: 2em;" />
                        
                        <CSMedia:MediaGalleryPostTagEditableList runat="server" Tag="Div" EditorCssClass="CommonInlineTagEditor" />

                        <CSMedia:MediaGalleryPostData runat="server" Property="FormattedBody" IncrementViewCount="true" Tag="Div" />
                    </div>
                    
                    <div style="clear: both;"></div>
                </FalseContentTemplate>
            </CSControl:ConditionalContent>
            
        </div>            
        
        <CSMedia:MediaGalleryPostFeedbackList runat="server" ShowHeaderFooterOnNone="false">
            <HeaderTemplate>
                <h4 class="CommonContentBoxHeader" id="comments"><CSControl:ResourceControl runat="server" ResourceName="Comments" /></h4>
                <div class="CommonContentBoxContent">     
            </HeaderTemplate>
            <ItemTemplate>
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:CustomCondition runat="server" CustomResult='<%# IsAuthor(Eval("User")) %>' /></ContentConditions>
                    <TrueContentTemplate><div class="CommonCommentArea Owner"></TrueContentTemplate>
                    <FalseContentTemplate><div class="CommonCommentArea"></FalseContentTemplate>
                </CSControl:ConditionalContent>
                    <div class="CommonCommentUser">
                        <CSControl:UserData runat="server" LinkTo="Profile">
                        	<DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
                            <ContentTemplate>
                                <CSControl:UserAvatar runat="server" BorderWidth="0" Width="60" Height="60" />
                            </ContentTemplate>
                        </CSControl:UserData>
                        <CSControl:UserAvatar runat="server" BorderWidth="0" Width="60" Height="60">                                
							<DisplayConditions><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
						</CSControl:UserAvatar>
                    </div>
                    <div class="CommonCommentArrow"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div><div class="r5"></div><div class="r6"></div><div class="r7"></div><div class="r8"></div><div class="r9"></div><div class="r10"></div></div>
                    <div class="CommonCommentBubble">
                        <div class="CommonCommentBubbleRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                        <div class="CommonCommentContent">
                            <CSMedia:DeleteMediaGalleryPostFeedbackForm DeleteButtonId="DeleteComment" Tag="Div" CssClass="CommonMessageActions" ConfirmationResourceName="MediaGallery_Comment_DeleteVerify" runat="server">
		                        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
		                        <FormTemplate><asp:LinkButton runat="server" Text="Delete" ID="DeleteComment" /></FormTemplate>
		                    </CSMedia:DeleteMediaGalleryPostFeedbackForm>
                            <div class="CommonMessageHeader">
                                <CSMedia:MediaGalleryPostFeedbackData runat="server" Property="DisplayName" LinkTo="User" Tag="Strong" />
                                <CSControl:ResourceControl runat="server" ResourceName="Wrote" />
                                <CSMedia:MediaGalleryPostFeedbackData runat="server" Property="Subject" Tag="Strong" />
                            </div>
                            <div class="CommonMessageDate">
                                <CSControl:ResourceControl runat="server" ResourceName="on" /> <CSMedia:MediaGalleryPostFeedbackData runat="server" Property="PostDate" IncludeTimeInDate="true" />
                            </div>
                            
                            <CSMedia:MediaGalleryPostFeedbackData runat="server" Property="FormattedBody" Tag="Div" />
                        </div>
                        <div class="CommonCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                    </div>
                    <div style="clear: both;"></div>
                </div>     
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </CSMedia:MediaGalleryPostFeedbackList>

            <CSMedia:CreateMediaGalleryPostFeedbackForm runat="server" 
                    MessageTextBoxId="CommentBody" 
                    NameTextBoxId="CommentName" 
                    RememberCheckboxId="CommentRemember" 
                    SubjectTextBoxId="" 
                    SubmitButtonId="CommentSubmit" 
                    UrlTextBoxId="CommentWebsite" 
                    ControlIdsToHideFromRegisteredUsers="RememberWrapper,AnonymousUser"
                    ValidationGroup="CreateCommentForm"
                >
                    <SuccessActions>
                        <CSControl:GoToModifiedUrlAction runat="server" QueryStringModification="CommentPosted=true" TargetLocationModification="commentmessage" />
                    </SuccessActions>
                    <FormTemplate>
                        <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="AddAComment" /></h4>
                        <div class="CommonContentBoxContent">    
                    
                            <div class="CommonFormArea">
		                        <asp:PlaceHolder id="AnonymousUser" runat="server">
			                        <div class="CommonFormFieldName"><CSControl:FormLabel LabelForId="CommentName" runat="server" ResourceName="CommentListing_Name" ResourceFile="MediaGallery.xml" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Required" />)</em></div>
			                        <div class="CommonFormField"><asp:TextBox id="CommentName" runat="server" Columns="40" MaxLength="256" ValidationGroup="CreateCommentForm" /></div>
		                        </asp:PlaceHolder>
                    			
		                        <div class="CommonFormFieldName"><CSControl:FormLabel LabelForId="CommentWebsite" runat="server" ResourceName="CommentListing_Website" ResourceFile="MediaGallery.xml" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Optional" />)</em></div>
		                        <div class="CommonFormField"><asp:TextBox id="CommentWebsite" runat="server" Columns="60" MaxLength="256" ValidationGroup="CreateCommentForm" /></div>

		                        <div class="CommonFormFieldName"><CSControl:FormLabel LabelForId="CommentBody" runat="server" ResourceName="CommentListing_Body" ResourceFile="MediaGallery.xml" /> <em>(<CSControl:ResourceControl runat="server" ResourceName="Required" />)</em><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="CommentBody" ValidationGroup="CreateCommentForm" /></div>
		                        <div class="CommonFormField"><asp:TextBox id="CommentBody" runat="server" Columns="60" Rows="8" MaxLength="3000" TextMode="MultiLine" ValidationGroup="CreateCommentForm" /></div>

                                <asp:PlaceHolder runat="server" id="RememberWrapper">
                                    <div class="CommonFormField"><asp:CheckBox id="CommentRemember" runat="server" Text="Remember Me?" ValidationGroup="CreateCommentForm"></asp:CheckBox></div>
                                </asp:PlaceHolder>

                                <div class="CommonFormFieldName">
		                            <CSControl:ResourceButton runat="server" id="CommentSubmit" ResourceName="Add" ResourceFile="MediaGallery.xml" ValidationGroup="CreateCommentForm" />
                                </div>
	                        </div>
                        </div>
                    </FormTemplate>
            </CSMedia:CreateMediaGalleryPostFeedbackForm>
        
    </div>        
    	
</asp:Content>
