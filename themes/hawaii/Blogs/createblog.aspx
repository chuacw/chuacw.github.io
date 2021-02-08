<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" MasterPageFile="blogs.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea">
        <div class="Common">
        <CSControl:SiteUrl UrlName="home" Text="Home" runat="server" />
        <CSControl:ResourceControl ResourceName="BreadCrumb_Seperator" runat="server" />
        <CSControl:SiteUrl UrlName="webloghome" Text="Blogs" runat="server" />
        <CSControl:ResourceControl ResourceName="BreadCrumb_Seperator" runat="server" />
        <CSControl:ResourceControl runat="server" ResourceName="Weblog_CreateNew" />
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSControl:ResourceControl runat="server" ResourceName="Weblog_CreateNew" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <CSBlog:CreateWeblogForm runat="server"
                ApplicationKeyTextBoxId="AppKeyTextBox"
                CreateButtonId="CreateBlogButton"
                CustomValidatorId="CustomValidator"
                GroupDropDownListId="GroupDropDown"
                NameTextBoxId="BlogNameTextBox">
                <FormTemplate>
                    <asp:CustomValidator runat="server" ID="CustomValidator" />
                    
                    <CSControl:FormLabel runat="server" LabelForId="BlogNameTextBox" ResourceName="Name" CssClass="CommonFormFieldName" />
                    <div class="CommonFormFieldDescription"><CSControl:ResourceControl runat="server" ResourceName="Weblog_Name_Desc" /></div>
                    <div class="CommonFormField"><asp:TextBox runat="server" ID="BlogNameTextBox" Columns="40" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="BlogNameTextBox" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                    
                    <CSControl:FormLabel runat="server" LabelForId="AppKeyTextBox" ResourceName="Weblog_ApplicationKey" CssClass="CommonFormFieldName" />
                    <div class="CommonFormFieldDescription"><CSControl:ResourceControl runat="server" ResourceName="Weblog_ApplicationKey_Desc" /></div>
                    <div class="CommonFormField"><asp:TextBox runat="server" ID="AppKeyTextBox" Columns="40" /></div>
                    
                    <CSControl:FormLabel runat="server" LabelForId="GroupDropDown" ResourceName="Weblog_Groups" CssClass="CommonFormFieldName" />            
                    <div class="CommonFormFieldDescription"><CSControl:ResourceControl runat="server" ResourceName="Weblog_Groups_Desc" /></div>
                    <div class="CommonFormField"><asp:DropDownList runat="Server" ID="GroupDropDown" /></div>

                    <div class="CommonFormFieldName">
                        <asp:Button ID="CreateBlogButton" runat="server" Text="Create" />     
                    </div>
                </FormTemplate>
            </CSBlog:CreateWeblogForm>
        </div>
    </div>
</asp:Content>