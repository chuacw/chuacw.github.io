<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<CSControl:Title runat="server" IncludeSiteName="true" ResourceName="InviteUser_Title" />   

<div style="width: 50%; margin: 100px auto;">
    <div class="CommonContentBox">
        <h2 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="InviteUser_Title" /></h2>
        <div class="CommonContentBoxContent">
            <CSControl:ResourceControl runat="server" CssClass="CommonMessageSuccess" Tag="div" ResourceName="InviteUser_SendSuccess" Visible="false" ID="StatusMessage" />

            <CSControl:InviteUserForm runat="server" EmailTextBoxId="Email" MessageTextBoxId="Message" SendButtonId="Send">
                <SuccessActions>
                    <CSControl:SetVisibilityAction runat="server" ControlIdsToShow="StatusMessage" />
                </SuccessActions>
                <FormTemplate>
                    <div class="CommonFormArea" >
                        <div class="CommonFormFieldDescription"><CSControl:ResourceControl runat="server" ResourceName="InviteUser_Instructions" /></div>
                        <div class="CommonFormArea">
                        
                            <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="InviteUser_Email" /></div>
                            <div class="CommonFormField">
                                <asp:TextBox id="Email" runat="server" MaxLength="5000" columns="60" />
                                <asp:RequiredFieldValidator id="emailValidator" runat="server" ControlToValidate="Email" Cssclass="validationWarning">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator id="emailRegExValidator" runat="server" ControlToValidate="Email" Cssclass="validationWarning" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*(\W*?\;\W*?\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)*">*</asp:RegularExpressionValidator>
                            </div>
                            
                            <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="InviteUser_Message" /></div>
                            <div class="CommonFormField">
		                        <asp:TextBox id="Message" runat="server" textmode="MultiLine" rows="5" columns="60" />
	                        </div>
                        
                            <div class="CommonFormFieldName">
                                <CSControl:ResourceButton runat="server" id="Send" ResourceName="Send" />
                            </div>
                        </div>
                    </div>
                </FormTemplate>
            </CSControl:InviteUserForm>
        </div>
    </div>
</div>

</asp:Content>

