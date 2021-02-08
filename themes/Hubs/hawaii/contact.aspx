<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSHub:HubData LinkTo="contact" runat="server" ResourceName="Contact" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" Text="Contact" IncludeSectionOrHubName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle" /> 
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <CSControl:PlaceHolder runat="server">
                <DisplayConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="contactsent" Operator="IsSetOrTrue" /></DisplayConditions>
                <ContentTemplate>
                    <a name="message"></a>
                    <div class="CommonMessageSuccess"><CSControl:ResourceControl runat="server" ResourceName="Hubs_MessageSent" /></div>
                </ContentTemplate>
            </CSControl:PlaceHolder>

            <CSHub:ContactForm runat="server" 
                EmailTextBoxId="Email" 
                MessageTextBoxId="Message" 
                NameTextBoxId="Name" 
                SubjectTextBoxId="Subject" 
                SubmitButtonId="Submit">
                <SuccessActions>
                    <CSControl:GoToModifiedUrlAction QueryStringModification="contactsent=true" TargetLocationModification="message" runat="server" />
                </SuccessActions>
                <FormTemplate>
                    <div class="CommonFormArea">
                        
                        <CSControl:FormLabel ResourceName="Subject" LabelForId="Subject" runat="server" CssClass="CommonFormFieldName" />
                        <CSControl:ResourceControl runat="server" ResourceName="Hubs_Contact_Subject_Desc" CssClass="CommonFormFieldDescription" />
                        <div class="CommonFormField"><asp:TextBox runat="server" ID="Subject" Columns="40" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Subject" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                    
                        <CSControl:FormLabel ResourceName="Name" LabelForId="Name" runat="server" CssClass="CommonFormFieldName" />
                        <CSControl:ResourceControl runat="server" ResourceName="Hubs_Contact_Name_Desc" CssClass="CommonFormFieldDescription" />
                        <div class="CommonFormField"><asp:TextBox runat="server" ID="Name" Columns="40" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                    
                        <CSControl:FormLabel ResourceName="Hubs_EmailAddress" LabelForId="Email" runat="server" CssClass="CommonFormFieldName" />
                        <CSControl:ResourceControl runat="server" ResourceName="Hubs_Contact_Email_Desc" CssClass="CommonFormFieldDescription" />
                        <div class="CommonFormField"><asp:TextBox runat="server" ID="Email" Columns="40" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" Cssclass="validationWarning">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator runat="server" ControlToValidate="Email" Display="Dynamic" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">*</asp:RegularExpressionValidator></div>
                    
                        <div class="CommonFormFieldName"><CSControl:FormLabel ResourceName="CreateEditPost_Body" LabelForId="Message" runat="server" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Message" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                        <CSControl:ResourceControl runat="server" ResourceName="Hubs_Contact_Message_Desc" CssClass="CommonFormFieldDescription" />
                        <div class="CommonFormField"><asp:TextBox TextMode="MultiLine" runat="server" ID="Message" Rows="10" style="width: 80%;" /></div>
                    
                        <div class="CommonFormFieldName">
                            <asp:Button runat="server" ID="Submit" Text="Send" />   
                        </div>
                        
                    </div>
                </FormTemplate>
            </CSHub:ContactForm>

        </div>
    </div>

</asp:Content>