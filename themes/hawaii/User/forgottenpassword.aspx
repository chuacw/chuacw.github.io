<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="ForgottenPassword_Title" />   

    <div style="width: 50%; margin: 100px auto;">
        <div class="CommonContentBox">
            <h2 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="ForgottenPassword_Title" /></h2>
            <div class="CommonContentBoxContent">
	            <CSControl:ForgottenPasswordForm runat="server" AnswerValidationGroup="AnswerGroup" EmailValidationGroup="EmailGroup"
	                AnswerTextBoxId="SAnswer" 
	                EmailAddressTextBoxId="EmailAddress" 
	                NextButtonId="Next" 
	                QuestionTextId="sQuestion" 
	                SendPasswordButtonId="SendPassword">
	                <SuccessActions>
	                    <CSControl:SetVisibilityAction runat="server" ControlIdsToShow="MessageArea" ControlIdsToHide="ButtonsArea,EmailArea,QuestionArea,DescriptionArea" />
	                </SuccessActions>
	                <FormTemplate>
	                    <div class="CommonDescription" runat="server" id="DescriptionArea">
			                <CSControl:ResourceControl runat="server" ResourceName="ForgottenPassword_Instructions" />
		                </div>
		                <div class="CommonFormArea">
		                
		                    <CSControl:PlaceHolder runat="server" ID="EmailArea">
		                        <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="EmailAddress" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
		                        <ContentTemplate>
                                    <div class="CommonFormFieldName" >
				                        <CSControl:ResourceControl runat="server" ResourceName="ForgottenPassword_EmailAddress" />
                                    </div>
                                    <div class="CommonFormField">
				                        <asp:TextBox id="EmailAddress" runat="server" Columns="30" MaxLength="128" ValidationGroup="EmailGroup" /> 
				                        <asp:RequiredFieldValidator ValidationGroup="EmailGroup" ControlToValidate="EmailAddress" id="EmailValidator" runat="server">*</asp:RequiredFieldValidator>
				                        <asp:RegularExpressionValidator ValidationGroup="EmailGroup" id="EmailRegexValidator" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="EmailAddress">*</asp:RegularExpressionValidator>
                                    </div>                 
                                </ContentTemplate>
                            </CSControl:PlaceHolder>
                            
                            <CSControl:PlaceHolder runat="server" ID="QuestionArea">
                                <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="SAnswer" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
                                <ContentTemplate>
                                    <div class="CommonFormFieldName" >
				                        <CSControl:ResourceControl runat="server" ResourceName="ForgottenPassword_SecretQuestion" />
                                    </div>
                                    <div class="CommonFormField">
			                            <asp:Literal runat="Server" id="sQuestion" />
                                    </div>
                                    
                                    <div class="CommonFormFieldName" >
					                    <CSControl:ResourceControl runat="server" ResourceName="ForgottenPassword_SecretAnswer" />
                                    </div>
                                    <div class="CommonFormField">
				                        <asp:TextBox id="SAnswer" runat="server" Columns="30" MaxLength="256" ValidationGroup="AnswerGroup" />             
				                        <asp:RequiredFieldValidator ValidationGroup="AnswerGroup" ControlToValidate="SAnswer" id="SAnswerValidator" runat="server">*</asp:RequiredFieldValidator>
				                        <asp:RegularExpressionValidator ValidationGroup="AnswerGroup" id="SAnswerRegexValidator" ControlToValidate="SAnswer" runat="server" ValidationExpression="[1-zA-Z0-1@.\s]{1,256}">*</asp:RegularExpressionValidator>
                                    </div>    
                                </ContentTemplate>
                            </CSControl:PlaceHolder> 
                              
			                <div class="CommonFormFieldName" id="ButtonsArea" runat="server">
				                <CSControl:ResourceButton id="SendPassword" runat="server" ResourceName="ForgottenPassword_SendButton" />
				                <CSControl:ResourceButton id="Next" runat="server" ResourceName="ForgottenPassword_NextButton" />
				            </div>
				                
                            <div id="MessageArea" class="CommonFormDescription" runat="server" visible="false">
                                <CSControl:ConditionalContent runat="server">
                                    <ContentConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PasswordRecovery" Operator="EqualTo" ComparisonValue="Reset" /></ContentConditions>
                                    <TrueContentTemplate>
                                        <CSControl:ResourceControl ResourceName="ForgottenPassword_PasswordResetTitle" runat="server" Tag="B" /><br />
                                        <CSControl:ResourceControl ResourceName="ForgottenPassword_PasswordResetMessage" runat="server">
                                            <Parameter1Template><CSControl:ControlData ControlId="EmailAddress" Property="Text" Encoding="HTML" runat="server" /></Parameter1Template>
                                        </CSControl:ResourceControl>
                                    </TrueContentTemplate>
                                    <FalseContentTemplate>
                                        <CSControl:ResourceControl ResourceName="ForgottenPassword_PasswordLinkSentTitle" runat="server" Tag="B" /><br />
                                        <CSControl:ResourceControl ResourceName="ForgottenPassword_PasswordLinkSentMessage" runat="server">
                                            <Parameter1Template><CSControl:ControlData ControlId="EmailAddress" Property="Text" Encoding="HTML" runat="server" /></Parameter1Template>
                                        </CSControl:ResourceControl>
                                    </FalseContentTemplate>
                                </CSControl:ConditionalContent>
                            </div>              
		                
		                </div>
                    </FormTemplate>
                </CSControl:ForgottenPasswordForm>
	        </div>
        </div>	
    </div>

</asp:Content>