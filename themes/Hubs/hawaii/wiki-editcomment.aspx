<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="../../Hawaii/Common/modal.Master" %>

<asp:Content  ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title Text="Edit Comment" runat="server" IncludeSiteName="false" />

    <div class="CommonContentArea">
	<div class="CommonContent">
	    <CSWiki:CreateEditPageCommentForm runat="server"  
            BodyTextBoxId="Body" 
            SubmitButtonId="Submit"
            SubFormIds="PostTags"
            CustomValidatorId="PageValidator"
            ValidationGroup="AddComment">
            <SuccessActions>
                <CSControl:RefreshPageAction runat="server" WindowNameScript="window.parent" />
            </SuccessActions>
            <FormTemplate>
                <asp:CustomValidator runat="server" id="PageValidator" ValidationGroup="AddComment" />
                <div class="CommonFormField">
                    <asp:TextBox runat="server" TextMode="MultiLine" Width="90%" Height="250px" ID="Body" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Body" Cssclass="validationWarning" ValidationGroup="AddComment">* <CSControl:ResourceControl runat="server" ResourceName="Wikis_EnterCommentWarning" /></asp:RequiredFieldValidator>
                 </div>
                <div class="CommonFormFieldName">
                    <asp:Button runat="server" ID="Submit" Text="Publish Comment" ValidationGroup="AddComment" />
                </div>
            </FormTemplate>
        </CSWiki:CreateEditPageCommentForm> 	   
    </div>
</div>
</asp:Content>