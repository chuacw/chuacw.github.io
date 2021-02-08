<%@ Page EnableViewState="false" EnableSessionState="true" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="master.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bcr" runat="server">


    <CSControl:Title runat="server">
        <ContentTemplate><CSControl:SiteSettingsData runat="server" Property="SiteName" /></ContentTemplate>
    </CSControl:Title>

    <div style="width: 50%; margin: 100px auto;">
        <div class="CommonContentBox">
            <h2 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Login_Title" /></h2>
            
            <CSControl:PlaceHolder runat="server" Tag="Div" CssClass="CommonContentBoxHeaderForm">
                <DisplayConditions><CSControl:CustomCondition runat="server" CustomResult='<%# (new CommunityServer.Components.OpenIdHelper()).IsEnabled() %>' /></DisplayConditions>
                <ContentTemplate>
                    Use: 
                    
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions Operator="Or">
                            <CSControl:QueryStringPropertyValueComparison QueryStringProperty="Type" Operator="EqualTo" ComparisonValue="Password" runat="server" />
                            <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Type" Operator="IsSetOrTrue" runat="server" /></CSControl:Conditions>
                        </ContentConditions>
                        <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Login_NamePassword" QueryStringModification="Type=Password" runat="server" /></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Login_NamePassword" QueryStringModification="Type=Password" runat="server" /></FalseContentTemplate>
                    </CSControl:ConditionalContent> |
                    
                    <CSControl:ConditionalContent runat="server">
                        <ContentConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Type" Operator="EqualTo" ComparisonValue="OpenID" runat="server" /></ContentConditions>
                        <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="OpenID" QueryStringModification="Type=OpenID" runat="server" /></TrueContentTemplate>
                        <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="OpenID" QueryStringModification="Type=OpenID" runat="server" /></FalseContentTemplate>
                    </CSControl:ConditionalContent>
                    
                </ContentTemplate>
            </CSControl:PlaceHolder>

            <CSControl:LoginForm runat="server" 
                    AutoLoginCheckBoxId="autoLogin" UserNameTextBoxId="username" 
                    PasswordTextBoxId="password" LoginButtonId="loginButton">
                <SuccessActions>
                    <CSControl:GoToReferralUrlAction runat="server" />
                    <CSControl:GoToSiteUrlAction UrlName="home" runat="server" />
                </SuccessActions>
                <DisplayConditions Operator="Or">
                    <CSControl:QueryStringPropertyValueComparison QueryStringProperty="Type" Operator="EqualTo" ComparisonValue="Password" runat="server" />
                    <CSControl:Conditions runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison QueryStringProperty="Type" Operator="IsSetOrTrue" runat="server" /></CSControl:Conditions>
                </DisplayConditions>
                <FormTemplate>
 	                <div class="CommonContentBoxContent">
	                    <asp:Panel runat="server" DefaultButton="loginButton">
	                        <div class="CommonFormArea">
		                        <div class="CommonFormFieldName">
					                <CSControl:FormLabel LabelForId="username" runat="server" ResourceName="Login_UserName" />
				                </div>
				                <div class="CommonFormField">
					                <CSControl:DefaultButtonTextBox ButtonId="loginButton" id="username" runat="server" Columns="30" maxlength="64" />
                                </div>
                                
                                <div class="CommonFormFieldName">
					                <CSControl:FormLabel LabelForId="password" runat="server" ResourceName="Login_Password" />
				                </div>
				                <div class="CommonFormField">
			                        <CSControl:DefaultButtonTextBox ButtonId="loginButton" TextMode="Password" id="password" runat="server" Columns="30" maxlength="64" />
				                </div>
			                    <div class="CommonFormFieldName">
					                <asp:CheckBox type="checkbox" Checked="true" runat="server" id="autoLogin" /> <CSControl:FormLabel LabelForId="autologin" runat="server" ResourceName="LoginSmall_AutoLogin" />
				                </div>
			                    <div class="CommonFormFieldName">
					                <CSControl:ResourceButton id="loginButton" runat="server" ResourceName="LoginSmall_Button" />
				                </div>
                            </div>
		                </asp:Panel>
                    </div>
                    <div class="CommonContentBoxFooter">
                        <CSControl:SiteUrl UrlName="user_ForgotPassword" ResourceName="Utility_ForumAnchorType_UserForgotPassword" runat="server" /> |
                        <CSControl:PlaceHolder runat="server">
	                        <DisplayConditions Operator="not">
	                            <CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="AccountActivation" Operator="equalTo" ComparisonValue="InvitationOnly" runat="server" />
	                        </DisplayConditions>
	                        <ContentTemplate>
                                <CSControl:ResourceControl runat="server" ResourceName="Login_NotMemberYet" />
	                            <CSControl:SiteUrl runat="server" UrlName="user_Register" ResourceName="Login_JoinLink">
                                    <UrlQueryStringModificationTemplate>
                                      ReturnUrl=<CSControl:QueryStringData Property="ReturnUrl" Encoding="URL" runat="server" />
                                    </UrlQueryStringModificationTemplate>
                                </CSControl:SiteUrl>
		                    </ContentTemplate>
		                </CSControl:PlaceHolder>
                    </div>
                </FormTemplate>
            </CSControl:LoginForm>
    
            <CSControl:OpenIdLoginForm runat="server"
                LoginButtonId="loginOpenIdButton" 
                OpenIdTextBoxId="openId" 
                StatusTextId="statusText">
                <SuccessActions runat="server">
                    <CSControl:GoToReferralUrlAction runat="server" />
                    <CSControl:GoToSiteUrlAction UrlName="home" runat="server" />
                </SuccessActions>
                <DisplayConditions>
                    <CSControl:QueryStringPropertyValueComparison QueryStringProperty="Type" Operator="EqualTo" ComparisonValue="OpenID" runat="server" />
                </DisplayConditions>
                <FormTemplate>
                    <div class="CommonContentBoxContent">
                        <asp:Panel runat="server" DefaultButton="loginOpenIdButton">
                            <div class="CommonFormArea">
                                <CSControl:WrappedLiteral runat="server" ID="statusText" CssClass="CommonValidationWarning" Tag="Div" />
	                            
                                <div class="CommonFormFieldName">
	                                <CSControl:FormLabel LabelForId="openId" runat="server" ResourceName="Login_OpenId" />
                                </div>
                                <div class="CommonFormField">
                                    <asp:TextBox CssClass="CommonOpenIdBox" id="openId" runat="server" Columns="30" ToolTip="Example: http://yourname.myopenid.com" ValidationGroup="OpenIdGroup" />
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="openId" 
                                     ValidationExpression="(?:http://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*))*)(?:\?(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*))?)?)|(?:ftp://(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*)(?::(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*))?@)?(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))(?:/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*))*)(?:;type=[AIDaid])?)?)|(?:news:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;/?:&=])+@(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3})))|(?:[a-zA-Z](?:[a-zA-Z\d]|[_.+-])*)|\*))|(?:nntp://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)/(?:[a-zA-Z](?:[a-zA-Z\d]|[_.+-])*)(?:/(?:\d+))?)|(?:telnet://(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*)(?::(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?&=])*))?@)?(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))/?)|(?:gopher://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))*)(?:%09(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*)(?:%09(?:(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))*))?)?)?)?)|(?:wais://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)/(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)(?:(?:/(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)/(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*))|\?(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;:@&=])*))?)|(?:mailto:(?:(?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))+))|(?:file://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))|localhost)?/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*))*))|(?:prospero://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)/(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&=])*))*)(?:(?:;(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&])*)=(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[?:@&])*)))*)|(?:ldap://(?:(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))?/(?:(?:(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*))(?:(?:(?:%0[Aa])?(?:%20)*)\+(?:(?:%0[Aa])?(?:%20)*)(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)))*)(?:(?:(?:(?:%0[Aa])?(?:%20)*)(?:[;,])(?:(?:%0[Aa])?(?:%20)*))(?:(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*))(?:(?:(?:%0[Aa])?(?:%20)*)\+(?:(?:%0[Aa])?(?:%20)*)(?:(?:(?:(?:(?:[a-zA-Z\d]|%(?:3\d|[46][a-fA-F\d]|[57][Aa\d]))|(?:%20))+|(?:OID|oid)\.(?:(?:\d+)(?:\.(?:\d+))*))(?:(?:%0[Aa])?(?:%20)*)=(?:(?:%0[Aa])?(?:%20)*))?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))*)))*))*(?:(?:(?:%0[Aa])?(?:%20)*)(?:[;,])(?:(?:%0[Aa])?(?:%20)*))?)(?:\?(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+)(?:,(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))*)?)(?:\?(?:base|one|sub)(?:\?(?:((?:[a-zA-Z\d$\-_.+!*'(),;/?:@&=]|(?:%[a-fA-F\d]{2}))+)))?)?)?)|(?:(?:z39\.50[rs])://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+)(?:\+(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))*(?:\?(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))?)?(?:;esn=(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))?(?:;rs=(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+)(?:\+(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))+))*)?))|(?:cid:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?:@&=])*))|(?:mid:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?:@&=])*)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[;?:@&=])*))?)|(?:vemmi://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:/(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[/?:@&=])*)(?:(?:;(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[/?:@&])*)=(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[/?:@&])*))*))?)|(?:imap://(?:(?:(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+)(?:(?:;[Aa][Uu][Tt][Hh]=(?:\*|(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+))))?)|(?:(?:;[Aa][Uu][Tt][Hh]=(?:\*|(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+)))(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~])+))?))@)?(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?))/(?:(?:(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)?;[Tt][Yy][Pp][Ee]=(?:[Ll](?:[Ii][Ss][Tt]|[Ss][Uu][Bb])))|(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)(?:\?(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+))?(?:(?:;[Uu][Ii][Dd][Vv][Aa][Ll][Ii][Dd][Ii][Tt][Yy]=(?:[1-9]\d*)))?)|(?:(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)(?:(?:;[Uu][Ii][Dd][Vv][Aa][Ll][Ii][Dd][Ii][Tt][Yy]=(?:[1-9]\d*)))?(?:/;[Uu][Ii][Dd]=(?:[1-9]\d*))(?:(?:/;[Ss][Ee][Cc][Tt][Ii][Oo][Nn]=(?:(?:(?:[a-zA-Z\d$\-_.+!*'(),]|(?:%[a-fA-F\d]{2}))|[&=~:@/])+)))?)))?)|(?:nfs:(?:(?://(?:(?:(?:(?:(?:[a-zA-Z\d](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?)\.)*(?:[a-zA-Z](?:(?:[a-zA-Z\d]|-)*[a-zA-Z\d])?))|(?:(?:\d+)(?:\.(?:\d+)){3}))(?::(?:\d+))?)(?:(?:/(?:(?:(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*)(?:/(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*))*)?)))?)|(?:/(?:(?:(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*)(?:/(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*))*)?))|(?:(?:(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*)(?:/(?:(?:(?:[a-zA-Z\d\$\-_.!~*'(),])|(?:%[a-fA-F\d]{2})|[:@&=+])*))*)?)))"
                                     ErrorMessage="<br/>URL not in correct format" Text="*" ValidationGroup="OpenIdGroup"  />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="openId" ValidationGroup="OpenIdGroup" Text="*" />
                                 </div>
		                         
                                 <div class="CommonFormFieldName">
		                            <CSControl:ResourceButton id="loginOpenIdButton" runat="server" ResourceName="Login_OpenId_Button" ValidationGroup="OpenIdGroup" />
	                             </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div class="CommonContentBoxFooter">
                        <CSControl:PlaceHolder runat="server">
	                        <DisplayConditions Operator="not">
	                            <CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="AccountActivation" Operator="equalTo" ComparisonValue="InvitationOnly" runat="server" />
	                        </DisplayConditions>
	                        <ContentTemplate>
                                <CSControl:ResourceControl runat="server" ResourceName="Login_NotMemberYet" />
	                            <CSControl:SiteUrl runat="server" UrlName="user_Register" ResourceName="Login_JoinLink" />
		                    </ContentTemplate>
		                </CSControl:PlaceHolder>
                    </div>
                </FormTemplate>
            </CSControl:OpenIdLoginForm>
    
        </div>
    </div>
    
</asp:Content>
