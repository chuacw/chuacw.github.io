<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>
<%@ Register TagPrefix="th" Namespace="TimothyHumphrey.CommunityServer.WebControls" Assembly="TimothyHumphrey.CommunityServer" %>
<%@ Register TagPrefix="th" Namespace="TimothyHumphrey.WebControls" Assembly="TimothyHumphrey.CommunityServer" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="CreateNewAccount_Title" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />  
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
            <CSControl:ResourceControl runat="server" ResourceName="CreateNewAccount_Instructions" Tag="Div" CssClass="CommonDescription" />
        
            <div class="CommonFormArea" >

                <CSControl:CreateUserForm runat="server" 
                    AcceptAgreementCheckBoxId="AcceptAgreement" 
                    AcceptAgreementHyperLinkId="AcceptAgreementLink" 
                    AllowSitePartnersToContactCheckBoxId="AllowSitePartnersToContact" 
                    AllowSiteToContactCheckBoxId="AllowSiteToContact" 
                    CreateButtonId="CreateAccount" 
                    CreateUserCustomValidatorId="CreateUserCustomValidator" 
                    EmailAddressTextBoxId="Email" 
                    PasswordTextBoxId="Password" 
                    SubFormIds="OpenIdSubForm" 
                    TimeZoneDropDownListId="Timezone" 
                    UserNameTextBoxId="Username"
                    PasswordPlaceholderId="PasswordPlaceholder"
                    SecondPasswordTextBoxId="Password2"
                    SecondEmailAddressTextBoxId="Email2">
                    <FormTemplate>
                   
                        <div class="CommonMessageWarning">
                            <CSControl:ResourceControl runat="server" ResourceName="CreateNewAccount_Required">
                                <DisplayConditions>
                                    <CSControl:Conditions Operator="not" runat="server">
                                        <CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="AccountActivation" Operator="EqualTo" ComparisonValue="Email" runat="server" />
                                    </CSControl:Conditions>
                                </DisplayConditions>
                            </CSControl:ResourceControl>
                            <CSControl:ResourceControl runat="server" ResourceName="CreateNewAccount_Required_ForEmailActivation">
                                <DisplayConditions>
                                    <CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="AccountActivation" Operator="EqualTo" ComparisonValue="Email" runat="server" />
                                </DisplayConditions>
                            </CSControl:ResourceControl>
                        </div>
                            
                       <asp:CustomValidator runat="server" ID="CreateUserCustomValidator" CssClass="CommonValidationWarning" style="display: block;" />
                           
                       <div class="CommonFormFieldName">
                            <CSControl:ResourceControl runat="server" ResourceName="CreateNewAccount_UserName" />
                       </div>
                       <div class="CommonFormField">
                            <asp:TextBox id="Username" MaxLength="64" runat="server" columns="40" />
                            <asp:RequiredFieldValidator EnableClientScript="false" id="usernameValidator" runat="server" ControlToValidate="Username" Cssclass="validationWarning">*</asp:RequiredFieldValidator>
                        </div>
                        
                        <CSControl:PlaceHolder runat="server" ID="PasswordPlaceholder">
                            <DisplayConditions Operator="Or">
                                <CSControl:Conditions runat="server" Operator="Not">
                                    <CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="AccountActivation" ComparisonValue="Email" runat="server" Operator="EqualTo" />
                                </CSControl:Conditions>	                    
                                <CSControl:UserInRoleCondition runat="server" UseAccessingUser="true" Role="SystemAdministrator" />
                                <CSControl:UserInRoleCondition runat="server" UseAccessingUser="true" Role="MembershipAdministrator" />
                            </DisplayConditions>
                            <ContentTemplate>
                                <div class="CommonFormFieldName">
                                    <CSControl:ResourceControl runat="server" ResourceName="CreateNewAccount_PasswordDescription" />
                                </div>
                                <div class="CommonFormField">
                                    <asp:TextBox id="Password" MaxLength="64" TextMode="Password" runat="server" columns="40" />
                                    <asp:RequiredFieldValidator id="passwordValidator" runat="server" ControlToValidate="Password" Cssclass="validationWarning">*</asp:RequiredFieldValidator>
                                </div>
                                
                                <div class="CommonFormFieldName">
                                    <CSControl:ResourceControl runat="server" ResourceName="CreateNewAccount_ReEnterPassword" />
                                </div>
                                <div class="CommonFormField">
                                    <asp:TextBox id="Password2" MaxLength="64" TextMode="Password" runat="server" columns="40" />
                                    <asp:RequiredFieldValidator id="password2Validator" runat="server" ControlToValidate="Password2" Cssclass="validationWarning">*</asp:RequiredFieldValidator>
                                    <asp:comparevalidator id="ComparePassword" runat="server" ControlToValidate="Password2" ControlToCompare="Password" Cssclass="validationWarning">*</asp:comparevalidator>
                                </div>
                            </ContentTemplate>
                        </CSControl:PlaceHolder>
                            
                        <div class="CommonFormFieldName">
                            <CSControl:ResourceControl runat="server" ResourceName="CreateNewAccount_Email" />
                        </div>
                        <div class="CommonFormField">
                            <asp:TextBox id="Email" runat="server" MaxLength="128" columns="40" />
                            <CSControl:ResourceControl runat="server" ResourceName="CreateNewAccount_EmailDescription" ID="Resourcecontrol6"/>
                            <asp:RequiredFieldValidator id="emailValidator" runat="server" ControlToValidate="Email" Cssclass="validationWarning">*</asp:RequiredFieldValidator>
                        </div>
                        
                        <div class="CommonFormFieldName">
                            <CSControl:ResourceControl runat="server" ResourceName="CreateNewAccount_ReEnterEmail" />
                        </div>
                        <div class="CommonFormField">
                            <asp:TextBox id="Email2" runat="server" MaxLength="128" columns="40" />
                            <asp:RequiredFieldValidator id="email2Validator" runat="server" ControlToValidate="Email2" Cssclass="validationWarning">*</asp:RequiredFieldValidator>
                            <asp:comparevalidator id="CompareEmail" runat="server" ControlToValidate="Email2" ControlToCompare="Email" Cssclass="validationWarning">*</asp:comparevalidator>
                        </div>

                        <div class="CommonFormFieldName">
                            <CSControl:ResourceControl runat="server" resourcename="CreateNewAccount_Timezone" />
                        </div>
                        <div class="CommonFormField">
                            <asp:DropDownList id="Timezone" runat="server" />
                        </div>
                	        
                        <CSControl:PlaceHolder runat="server">
                            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="ShowContactCheckboxes" Operator="IsSetOrTrue" /></DisplayConditions>
                            <ContentTemplate>
                                <div class="CommonFormFieldName">
                                    <CSControl:ResourceControl runat="server" resourcename="CreateNewAccount_AllowSiteToContact" />
                                </div>
                                <div class="CommonFormField">
                                    <asp:CheckBox id="AllowSiteToContact" runat="server" />
                                </div>
                                
                                <div class="CommonFormFieldName">
                                    <CSControl:ResourceControl runat="server" resourcename="CreateNewAccount_AllowSitePartnersToContact" />
                                </div>
                                <div class="CommonFormField">
                                    <asp:CheckBox id="AllowSitePartnersToContact" runat="server" />
                                </div>
                            </ContentTemplate>
                        </CSControl:PlaceHolder>
                	        
                        <CSControl:PlaceHolder runat="server">
                            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="TermsOfServiceUrl" Operator="IsSetOrTrue" /></DisplayConditions>
                            <ContentTemplate>
                                <div class="CommonFormFieldName">
                                    <CSControl:ResourceControl runat="server" resourcename="CreateNewAccount_ForumRules" />
                                </div>
                                <div class="CommonFormField">
                                    <asp:CheckBox id="AcceptAgreement" Runat="server" onclick="validateForm(this);" /><asp:HyperLink runat="server" id="AcceptAgreementLink"  />
		                            <CSControl:SiteSettingsData LinkTo="TermsOfService" LinkTarget="_blank" ResourceName="CreateNewAccount_ForumRulesDesc" runat="server" />
                                    <CSControl:RequiredCheckBoxValidator EnableClientScript="false" id="RequiredAcceptAgreement" runat="server" ControlToValidate="AcceptAgreement" Cssclass="validationWarning">*</CSControl:RequiredCheckBoxValidator>
                                </div>
                            </ContentTemplate>
                        </CSControl:PlaceHolder>
                        
<CSControl:ConditionalContent runat="server">
    <ContentConditions><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></ContentConditions>
    <TrueContentTemplate>
                    <dt>Enter the following code to ensure that your request is approved:</dt>
                    <dd><th:Captcha runat="server" id="captcha1" ValidationGroup="CreateCommentForm" /></dd>
    </TrueContentTemplate>
    <FalseContentTemplate>
    <!-- the above code from CSControl:ConditionalContent to the below ending tag is added by chuacw 23 Apr 2012-->
    </FalseContentTemplate>
</CSControl:ConditionalContent>

                        <div class="CommonFormFieldName">
                            <CSControl:ResourceButton ResourceName="CreateNewAccount_CreateAccount" id="CreateAccount" Runat="server" />
                        </div>
                        
                        <CSControl:OpenIdCreateUserSubForm runat="server" ID="OpenIdSubForm" 
                            OpenIdTextBoxId="OpenId" 
                            CreateOpenIdUserButtonId="verifyOpenId" 
                            StatusTextId="statusText"
                            RequestEmail="Request"
                            RequestNickname="Request"
                            RequestTimeZone="Request"
                            VisibleAfterOpenIdVerified="false"
                        >
                            <FormTemplate>
                                <div class="CommonMessageWarning"><CSControl:ResourceControl runat="server" ResourceName="OpenId_Signup" /></div>

                               <asp:Panel runat="server" DefaultButton="verifyOpenId">
                                   <CSControl:ResourceControl runat="server" ResourceName="OpenId_Signup_Instructions" Tag="Div" CssClass="CommonDescription" />
                                   
                                   <CSControl:WrappedLiteral runat="server" ID="statusText" Tag="Div" CssClass="CommonValidationWarning" />
                                    
                                    <div class="CommonFormFieldName">
                                        <CSControl:FormLabel LabelForId="openId" runat="server" ResourceName="Login_OpenId" />
                                    </div>
                                    <div class="CommonFormField">
                                        <asp:TextBox id="OpenId" runat="server" CssClass="CommonOpenIdBox" Columns="40" ToolTip="Example: http://your.name.myopenid.com" ValidationGroup="OpenIdGroup" />
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="OpenId" 
                                         ValidationExpression="(?:http://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*))*)(?:\?(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*))?)?)|(?:ftp://(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*)(?::(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*))?@)?(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))(?:/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*))*)(?:;type=[AIDaid])?)?)|(?:news:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;/?:&=])+@(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3})))|(?:[a-zA-Z](?:[a-zA-Z\d]|[_.+-])*)|\*))|(?:nntp://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)/(?:[a-zA-Z](?:[a-zA-Z\d]|[_.+-])*)(?:/(?:\d+))?)|(?:telnet://(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*)(?::(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*))?@)?(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))/?)|(?:gopher://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))*)(?:%09(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*)(?:%09(?:(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))*))?)?)?)?)|(?:wais://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)/(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)(?:(?:/(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)/(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*))|\?(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*))?)|(?:mailto:(?:(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))+))|(?:file://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))|localhost)?/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*))*))|(?:prospero://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*))*)(?:(?:;(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&])*)=(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&])*)))*)|(?:ldap://(?:(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))?/(?:(?:(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*))(?:(?:(?:%0[Aa])?(?:%20)*)\+(?:(?:%0[Aa])?(?:%20)*)(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)))*)(?:(?:(?:(?:%0[Aa])?(?:%20)*)(?:[;,])(?:(?:%0[Aa])?(?:%20)*))(?:(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*))(?:(?:(?:%0[Aa])?(?:%20)*)\+(?:(?:%0[Aa])?(?:%20)*)(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)))*))*(?:(?:(?:%0[Aa])?(?:%20)*)(?:[;,])(?:(?:%0[Aa])?(?:%20)*))?)(?:\?(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+)(?:,(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))*)?)(?:\?(?:base|one|sub)(?:\?(?:((?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))+)))?)?)?)|(?:(?:z39\.50[rs])://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+)(?:\+(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))*(?:\?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))?)?(?:;esn=(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))?(?:;rs=(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+)(?:\+(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))*)?))|(?:cid:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?:@&=])*))|(?:mid:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?:@&=])*))?)|(?:vemmi://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[/?:@&=])*)(?:(?:;(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[/?:@&])*)=(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[/?:@&])*))*))?)|(?:imap://(?:(?:(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+)(?:(?:;[Aa][Uu][Tt][Hh]=(?:\*|(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+))))?)|(?:(?:;[Aa][Uu][Tt][Hh]=(?:\*|(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+)))(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+))?))@)?(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))/(?:(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)?;[Tt][Yy][Pp][Ee]=(?:[Ll](?:[Ii][Ss][Tt]|[Ss][Uu][Bb])))|(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)(?:\?(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+))?(?:(?:;[Uu][Ii][Dd][Vv][Aa][Ll][Ii][Dd][Ii][Tt][Yy]=(?:[1-9]\d*)))?)|(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)(?:(?:;[Uu][Ii][Dd][Vv][Aa][Ll][Ii][Dd][Ii][Tt][Yy]=(?:[1-9]\d*)))?(?:/;[Uu][Ii][Dd]=(?:[1-9]\d*))(?:(?:/;[Ss][Ee][Cc][Tt][Ii][Oo][Nn]=(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)))?)))?)|(?:nfs:(?:(?://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:(?:/(?:(?:(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*)(?:/(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*))*)?)))?)|(?:/(?:(?:(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*)(?:/(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*))*)?))|(?:(?:(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*)(?:/(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*))*)?)))"
                                         ErrorMessage="<br/>URL not in correct format" Text="*" ValidationGroup="OpenIdGroup" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="openId" ValidationGroup="OpenIdGroup" Text="*" />
                                    </div>
                                    
                                    <div class="CommonFormFieldName">
                                        <CSControl:ResourceButton id="verifyOpenId" runat="server" ResourceName="Verify_OpenId" ValidationGroup="OpenIdGroup" />
                                    </div>
                                </asp:Panel>
                            </FormTemplate>
                        </CSControl:OpenIdCreateUserSubForm>

                    </FormTemplate>
                </CSControl:CreateUserForm>

            </div>
        </div>
    </div>

</asp:Content>
