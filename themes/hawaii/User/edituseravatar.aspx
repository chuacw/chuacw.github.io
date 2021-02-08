<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/modal.Master" %>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
<CSControl:Title runat="server" ResourceName="EditProfile_ChangeAvatar" />
<script type="text/javascript" language="javascript">
    function CloseModal()
    {
        window.parent.location = window.parent.location;
        window.parent.Telligent_Modal.Close();
    }
</script>
     
<div>
    <CSControl:ConditionalAction runat="server">
        <Conditions Operator="Not">
            <CSControl:ControlVisibilityCondition runat="server" ControlId="SelectableAvatars" />
        </Conditions>
        <Actions>
            <CSControl:SetVisibilityAction runat="server" ControlIdsToHide="AvatarSelectionTab" />
        </Actions>
    </CSControl:ConditionalAction>
    
    <CSControl:ConditionalAction runat="server">
        <Conditions Operator="Not">
            <CSControl:ControlVisibilityCondition runat="server" ControlId="AvatarUpload" />
        </Conditions>
        <Actions>
            <CSControl:SetVisibilityAction runat="server" ControlIdsToHide="AvatarUploadTab" />
        </Actions>
    </CSControl:ConditionalAction>
    
    <CSControl:ConditionalAction runat="server">
        <Conditions Operator="Not">
            <CSControl:ControlVisibilityCondition runat="server" ControlId="AvatarUrl" />
        </Conditions>
        <Actions>
            <CSControl:SetVisibilityAction runat="server" ControlIdsToHide="AvatarLinkTab" />
        </Actions>
    </CSControl:ConditionalAction>
    
    <TWC:TabbedPanes id="ProfileTabs" runat="server"
        PanesCssClass="CommonPane"
        TabSetCssClass="CommonPaneTabSet"
        TabCssClasses="CommonPaneTab"
        TabSelectedCssClasses="CommonPaneTabSelected"
        TabHoverCssClasses="CommonPaneTabHover"
        >
            <TWC:TabbedPane runat="server" ID="AvatarUploadTab">
                <Tab><CSControl:ResourceControl runat="server" ResourceName="EditProfile_UploadAvatarTab" /></Tab>
                <Content>
                    <CSControl:EditUserAvatarForm runat="server"
                         UploadAvatarButtonId="SubmitAvatar"
                         UploadAvatarHtmlInputFileId="AvatarUpload"
                         EnableAvatarCheckBoxId="EnableSelectAvatarCheckbox"
                         RemoveAvatarButtonId="RemoveUploadAvatarButton"
                    >
                       <SuccessActions>
                            <CSControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
                        </SuccessActions>
                        <FormTemplate>
                            <asp:CheckBox runat="server" ID="EnableUploadAvatarCheckbox" Checked="true" Visible="false" />
                            <div class="CommonFormFieldName">
                                <CSControl:ResourceControl runat="server" ResourceName="EditProfile_UploadAvatar" />
                            </div>
                            <CSControl:ResourceControl runat="server" ResourceName="EditProfile_UploadAvatar_Desc" CssClass="CommonFormFieldDescription" />
                            <div class="CommonFormField">
                                <input type="file" runat="server" id="AvatarUpload" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="AvatarUpload" ErrorMessage="<br/>Click browse to select an image from your computer." ValidationGroup="UploadGroup" />
                            </div>
                            <div class="CommonFormFieldName">
                                <CSControl:ResourceButton id="SubmitAvatar" runat="server" ValidationGroup="UploadGroup" ResourceName="EditProfile_AvatarUploadButton" />
                                <CSControl:ResourceButton runat="server" ID="RemoveUploadAvatarButton" ResourceName="EditProfile_RemoveAvatar" />
                            </div>
                        </FormTemplate>
                    </CSControl:EditUserAvatarForm>
                </Content>
            </TWC:TabbedPane>
            
            <TWC:TabbedPane runat="server" ID="AvatarSelectionTab">
                <Tab><CSControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarSelect" /></Tab>
                <Content>
                    <CSControl:EditUserAvatarForm runat="server"
                        SelectableAvatarsRadioButtonListId="SelectableAvatars" 
                        SelectableAvatarHeight="60" 
                        SelectableAvatarWidth="60"
                        EnableAvatarCheckBoxId="EnableSelectAvatarCheckbox"
                        SubmitButtonId="UpdateSelectedAvatarButton"
                        RemoveAvatarButtonId="RemoveSelectAvatarButton"
                    >
                       <SuccessActions>
                            <CSControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
                        </SuccessActions>
                        <FormTemplate>
                            <asp:CheckBox runat="server" ID="EnableSelectAvatarCheckbox" Checked="true" Visible="false" />
                            <div class="CommonFormFieldName"><CSControl:ResourceControl ResourceName="EditProfile_AvatarSelect" runat="server" /></div>
                            <CSControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarSelect_Desc" CssClass="CommonFormFieldDescription" />
                            <div class="CommonFormField">
                                <asp:RadioButtonList RepeatLayout="Flow" runat="server" ID="SelectableAvatars" RepeatColumns="6" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="SelectableAvatars" ErrorMessage="<br/>Select the image you want to use." ValidationGroup="SelectGroup" />
                            </div>
                            <div class="CommonFormFieldName">		
                                <CSControl:ResourceButton runat="server" id="UpdateSelectedAvatarButton" ResourceName="EditProfile_UseSelectedAvatar" ValidationGroup="SelectGroup" />
                                <CSControl:ResourceButton runat="server" ID="RemoveSelectAvatarButton" ResourceName="EditProfile_RemoveAvatar" />
                            </div>
                        </FormTemplate>
                    </CSControl:EditUserAvatarForm>
                </Content>
            </TWC:TabbedPane>
            
            <TWC:TabbedPane runat="server" ID="AvatarLinkTab">
                <Tab><CSControl:ResourceControl runat="server" ResourceName="EditProfile_LinkToAvatarTab" /></Tab>
                <Content>
                    <CSControl:EditUserAvatarForm runat="server"
                        AvatarUrlTextBoxId="AvatarUrl"
                        SubmitButtonId="UpdateLinkedAvatarButton"
                        EnableAvatarCheckBoxId="EnableUploadAvatarCheckbox"
                        RemoveAvatarButtonId="RemoveLinkAvatarButton"
                    >
                       <SuccessActions>
                            <CSControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
                        </SuccessActions>
                        <FormTemplate>
                            <div class="CommonFormFieldName">
                                <CSControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarUrl" />
                            </div>
                            <CSControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarUrl_Desc" CssClass="CommonFormFieldDescription" />
                            <div class="CommonFormField">
                                <asp:TextBox id="AvatarUrl" runat="server" MaxLength="256" Columns="60" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="AvatarUrl" ErrorMessage="<br/>Type or paste in the URL to the image you want to use." ValidationGroup="LinkGroup" />
                            </div>
                            <div class="CommonFormFieldName">		
                                <CSControl:ResourceButton runat="server" id="UpdateLinkedAvatarButton" ValidationGroup="LinkGroup" ResourceName="EditProfile_UseLinkedAvatar" />
                                <CSControl:ResourceButton runat="server" ID="RemoveLinkAvatarButton" ResourceName="EditProfile_RemoveAvatar" />
                            </div>
                        </FormTemplate>
                    </CSControl:EditUserAvatarForm>
                </Content>
            </TWC:TabbedPane>
            
    </TWC:TabbedPanes>
    
</div>

</asp:Content>