<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="false">
    <ContentTemplate>
        <CSForum:ForumPostList runat="server">
            <QueryOverrides QueryType="Parent" />
            <ItemTemplate><CSForum:ForumPostData ResourceName="CreateEditPost_Title_ReplyMessage" Property="Subject" runat="server" /></ItemTemplate>                    
        </CSForum:ForumPostList>
    </ContentTemplate>
</CSControl:Title>

<script type="text/javascript">
// <![CDATA[
function closeAndRefresh()
{
    var suppressRefresh = !document.getElementById('<%= ForumControlUtility.Instance().FindControl(this, "RefreshPage").ClientID %>').checked;
    window.parent.Telligent_Modal.Close(suppressRefresh);
}
// ]]>
</script>

<div class="CommonContentArea">
	<div class="CommonContent">
		<CSForum:CreateEditForumPostForm runat="server"
            ID="PostForm"
            PostBodyEditorId="PostBody" 
            PostSubjectTextBoxId="PostSubject" 
            SubmitButtonId="PostButton" 
            ValidationGroup="PostFormValidation"
            >
            <ModeratedSuccessActions>
                <CSControl:ExecuteScriptAction runat="server" Script="closeAndRefresh();" />
            </ModeratedSuccessActions>
            <UnmoderatedSuccessActions>
                <CSControl:ExecuteScriptAction runat="server" Script="closeAndRefresh();" />
            </UnmoderatedSuccessActions>
            <FormTemplate>
	            <div class="CommonFormArea">
		            <div class="CommonFormFieldName" style="display: none;">
			            <CSControl:FormLabel LabelForId="PostSubject" runat="server" ResourceName="CreateEditPost_Inline7" /> <asp:requiredfieldvalidator id="postSubjectValidator" runat="server" CssClass="validationWarning" ControlToValidate="PostSubject" ErrorMessage="*" ValidationGroup="PostFormValidation" />
		            </div>
		            <div class="CommonFormField" style="display: none;">
			            <asp:textbox autocomplete="off" id="PostSubject" runat="server" style="width:80%;" />	
		            </div>
		            <div class="CommonFormFieldName">
			            <CSControl:FormLabel LabelForId="PostBody" runat="server" ResourceName="CreateEditPost_Body" />
			            <asp:requiredfieldvalidator id="postBodyValidator" runat="server" CssClass="validationWarning" ControlToValidate="PostBody" EnableClientScript="False" ValidationGroup="PostFormValidation">*</asp:requiredfieldvalidator>
			            <CSControl:QuoteValidator id="postBodyQuoteValidator" runat="server" CssClass="validationWarning" ControlToValidate="PostBody" EnableClientScript="false" ValidationGroup="PostFormValidation">Non matching quote blocks in post</CSControl:QuoteValidator>
		            </div>
		            <div class="CommonFormField">
			            <CSControl:Editor Width="100%" runat="Server" Height="200px" id="PostBody" />
		            </div>
	            
		            <div id="Buttons" class="CommonFormField">
			            <CSControl:ResourceButton ResourceName="CreateEditPost_PostButton" id="PostButton" runat="server" ValidationGroup="PostFormValidation" />
			            <asp:CheckBox Runat="server" ID="RefreshPage" Text="Refresh Page" Checked="True" />
		            </div>
	            </div>
            </FormTemplate>
        </CSForum:CreateEditForumPostForm>
    </div>
</div>
</asp:Content>