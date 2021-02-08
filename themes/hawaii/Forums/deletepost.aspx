<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="PostPreview" Src="post-preview.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSForum:BreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSForum:BreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="DeletePost_DeletePost" Tag="h1" CssClass="CommonTitle" EnableRendering="true" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <script type="text/javascript">
    // <!--

    function confirmDelete()
    {
        return window.confirm('<CSControl:ResourceControl ResourceName="DeletePost_PopupConfirmation" Encoding="JavaScript" runat="server" />');
    }

    // -->
    </script>

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
	
            <CSForum:DeleteForumPostForm runat="server" 
                DeleteButtonId="DeletePost" 
                DeleteChildrenCheckBoxId="DeleteChildren" 
                DeleteReasonTextBoxId="DeleteReason"
                SendAuthorDeleteNotificationCheckBoxId="SendAuthorDeleteNotification"
                >
                <SuccessActions>
                    <CSControl:GoToReferralUrlAction runat="server" />
                    <CSControl:GoToSiteUrlAction UrlName="forum" runat="server">            
                        <Parameter1Template><CSForum:ForumData Property="SectionID" runat="server" /></Parameter1Template>
                    </CSControl:GoToSiteUrlAction>           
                </SuccessActions>
                <FormTemplate>
                    <CSUserControl:PostPreview runat="server" />
                    
                    <div class="CommonDescription">
	                    <CSControl:ResourceControl runat="server" ResourceName="DeletePost_OptionDeleteChildren">
	                        <DisplayConditions Operator="And">
	                            <CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostLevel" Operator="GreaterThan" ComparisonValue="1" />
	                            <CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="Replies" Operator="GreaterThan" ComparisonValue="0" />
	                        </DisplayConditions>
	                    </CSControl:ResourceControl>
	                    <CSControl:ResourceControl runat="server" ResourceName="DeletePost_ForceDeleteChildren">
	                        <DisplayConditions>
	                            <CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostLevel" Operator="EqualTo" ComparisonValue="1" />
	                        </DisplayConditions>
	                    </CSControl:ResourceControl>
	                    <CSControl:ResourceControl runat="server" ResourceName="DeletePost_ForcePreserveChildren">
	                        <DisplayConditions Operator="And">
	                            <CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostLevel" Operator="GreaterThan" ComparisonValue="1" />
	                            <CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="Replies" Operator="EqualTo" ComparisonValue="0" />
	                        </DisplayConditions>
	                    </CSControl:ResourceControl>
                    </div>
                
		            <div class="CommonFormArea">
		                
			            <div class="CommonFormFieldName">
				            <CSControl:FormLabel LabelForId="DeleteChildren" runat="server" ResourceName="DeletePost_DeleteChildren" />
				            <asp:CheckBox id="DeleteChildren" runat="server" />
			            </div>
    			        
			            <div class="CommonFormFieldName">
                            <CSControl:FormLabel LabelForId="SendAuthorDeleteNotification" runat="server" ResourceName="DeletePost_SendAuthorDeleteNotification" />
				            <asp:CheckBox id="SendAuthorDeleteNotification" runat="server" />
				        </div>
                        
			            <div class="CommonFormFieldName">
				            <CSControl:ResourceControl runat="server" ResourceName="DeletePost_Reason" />
				            <asp:requiredfieldvalidator id="ValidateReason" runat="server" Cssclass="CommonValidationWarning" ControlToValidate="DeleteReason" EnableClientScript="False">You must supply a reason why you are deleting this post.</asp:requiredfieldvalidator>
			            </div>
			            <div class="CommonFormFieldDescription">
			                <CSControl:ResourceControl runat="server" ResourceName="DeletePost_ReasonText" />
                        </div>
			            <div class="CommonFormField">
				            <asp:textbox id="DeleteReason" runat="server" columns="100" TextMode="MultiLine" rows="12" />
			            </div>
    			        
			            <div class="CommonFormFieldName">
				            <CSControl:ResourceButton id="DeletePost" runat="server" ResourceName="DeletePost_DeletePost" OnClientClick="return confirmDelete();" />
			            </div>
			            
		            </div>
                </FormTemplate>
            </CSForum:DeleteForumPostForm>
	    </div>
    </div>
	
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server" />