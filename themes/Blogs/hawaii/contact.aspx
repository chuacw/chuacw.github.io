<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" MasterPageFile="theme.Master" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSBlog:WeblogData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSBlog:WeblogData LinkTo="contactform" runat="server" ResourceName="MyWeblogs_ContactMe" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" ResourceName="MyWeblogs_ContactMe" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="Server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <CSControl:ResourceControl runat="Server" id="Msg" ResourceName="Weblog_ContactForm_Sent" Visible="false" Tag="Div" CssClass="CommonMessageSuccess" />

            <CSBlog:ContactForm runat="server" ID="ContactForm"
                SubjectTextBoxId="tbSubject" 
                NameTextBoxId="tbName" 
                EmailTextBoxId="tbEmail" 
                MessageTextBoxId="tbBody" 
                SubmitButtonId="btnSubmit" 
                ControlIdsToHideFromRegisteredUsers="NameTitle,NameDesc"
            >
                <SuccessActions>
                    <CSControl:SetVisibilityAction runat="server" ControlIdsToShow="Msg" ControlIdsToHide="ContactForm" />
                </SuccessActions>
                <FormTemplate>
                    <div id="CommonFormArea">
                        <div class="CommonFormFieldName" id="NameTitle" runat="server"><CSControl:FormLabel LabelForId="tbName" runat="server" ResourceName="Weblog_ContactForm_Name" /><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbName" /></div>
                        <div class="CommonFormField" id="NameDesc" runat="server"><asp:TextBox id="tbName" runat="server" Columns="50" /></div>
                        
                        <div class="CommonFormFieldName"><CSControl:FormLabel LabelForId="tbEmail" runat="server" ResourceName="Weblog_ContactForm_Email" /><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbEmail" ID="Requiredfieldvalidator2"/><asp:RegularExpressionValidator runat="server" ErrorMessage="Invalid email address format" ControlToValidate="tbEmail" Display="Dynamic" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">*</asp:RegularExpressionValidator></div>
                        <div class="CommonFormField"><asp:TextBox id="tbEmail" runat="server" Columns="50" /></div>
                        
                        <div class="CommonFormFieldName"><CSControl:FormLabel LabelForId="tbSubject" runat="server" ResourceName="Weblog_ContactForm_Subject" /><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbSubject" /></div>
                        <div class="CommonFormField"><asp:TextBox id="tbSubject" runat="server" Columns="50" /></div>        
                        
                        <div class="CommonFormFieldName"><CSControl:FormLabel LabelForId="tbBody" runat="server" ResourceName="Weblog_ContactForm_Body" /><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="tbBody" /></div>
                        <div class="CommonFormField"><asp:TextBox id="tbBody" runat="server" TextMode="MultiLine" Columns="50" Rows="10" /></div>

                        <div class="CommonFormFieldName"><asp:Button id="btnSubmit" runat="server" Text="Send" /></div>
                    </div>
                </FormTemplate>
            </CSBlog:ContactForm>

        </div>
    </div>
    
</asp:Content>
