<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="Main" runat="Server">

    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="false" ResourceName="MyWeblogs_ContactMe" />

    <CSBlog:ContactForm runat="server"
        SubjectTextBoxId="tbSubject" 
        NameTextBoxId="tbName" 
        EmailTextBoxId="tbEmail" 
        MessageTextBoxId="tbBody" 
        SubmitButtonId="btnSubmit" 
        ControlIdsToHideFromRegisteredUsers="NameTitle,NameDesc"
        Tag="div"
        CssClass="entryview"
    >
        <SuccessActions>
            <CSControl:SetVisibilityAction runat="server" ControlIdsToShow="Msg" />
        </SuccessActions>
        <FormTemplate>
            <CSControl:ResourceControl Tag="h3" ResourceName="Weblog_ContactForm" CssClass="entryviewheading" runat="Server" />
            <dl class="commentform">
                <dt id="NameTitle" runat="server"><CSControl:FormLabel LabelForId="tbName" runat="server" ResourceName="Weblog_ContactForm_Name" /><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbName" ID="Requiredfieldvalidator1"/></dt>
                <dd id="NameDesc" runat="server"><asp:TextBox id="tbName" runat="server" CssClass="textline" /></dd>

                <dt><CSControl:FormLabel LabelForId="tbEmail" runat="server" ResourceName="Weblog_ContactForm_Email" /><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbEmail" ID="Requiredfieldvalidator2"/><asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email address format" ControlToValidate="tbEmail" Display="Dynamic" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">*</asp:RegularExpressionValidator></dt>
                <dd><asp:TextBox id="tbEmail" runat="server" CssClass="textline" /></dd>

                <dt><CSControl:FormLabel LabelForId="tbSubject" runat="server" ResourceName="Weblog_ContactForm_Subject" /><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbSubject" ID="Requiredfieldvalidator3"/></dt>
                <dd><asp:TextBox id="tbSubject" runat="server" CssClass="textline" /></dd>        

                <dt><CSControl:FormLabel LabelForId="tbBody" runat="server" ResourceName="Weblog_ContactForm_Body" /><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbBody" ID="Requiredfieldvalidator4"/></dt>
                <dd><asp:TextBox id="tbBody" runat="server" TextMode="MultiLine" CssClass="textmultiline" /></dd>

                <dt><asp:Button id="btnSubmit" runat="server" Text="Send" />  <CSControl:ResourceControl runat="Server" id="Msg" ResourceName="Weblog_ContactForm_Sent" Visible="false" /></dt>
            </dl>
        </FormTemplate>
    </CSBlog:ContactForm>
    
</asp:Content>
