<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="~/Themes/hawaii/Common/modal.Master" %>

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
    
    <TWC:TabbedPanes runat="server"
        PanesCssClass="CommonPane"
        TabSetCssClass="CommonPaneTabSet"
        TabCssClasses="CommonPaneTab"
        TabSelectedCssClasses="CommonPaneTabSelected"
        TabHoverCssClasses="CommonPaneTabHover"
        >
            <TWC:TabbedPane runat="server" ID="AvatarUploadTab">
                <Tab><CSControl:ResourceControl runat="server" ResourceName="Hubs_Avatar_UploadAvatar" /></Tab>
                <Content>
                    <CSHub:EditHubAvatarForm runat="server"
                         UploadAvatarButtonId="UploadAvatarButton"
                         UploadAvatarHtmlInputFileId="AvatarUpload"
                         DeleteAvatarButtonId="RemoveUploadAvatarButton"
                    >
                        <SuccessActions>
                            <CSControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
                        </SuccessActions>
                        <FormTemplate>
                            <div class="CommonFormFieldName">
                                <CSControl:ResourceControl runat="server" ResourceName="Hubs_Avatar_UploadAvatar" />
                            </div>
                            <CSControl:ResourceControl runat="server" ResourceName="Hubs_Avatar_UploadAvatar_Desc" CssClass="CommonFormFieldDescription" />
                            <div class="CommonFormField">
                                <input type="file" runat="server" id="AvatarUpload" /> 
                            </div>
                            <div class="CommonFormFieldName">
                                <CSControl:ResourceButton id="UploadAvatarButton" runat="server" ResourceName="Hubs_Avatar_UploadButton" CausesValidation="false" />
                                <CSControl:ResourceButton runat="server" ID="RemoveUploadAvatarButton" ResourceName="Hubs_Avatar_RemoveAvatar" />
                            </div>
                        </FormTemplate> 
                    </CSHub:EditHubAvatarForm>
                </Content>
            </TWC:TabbedPane>
            
            <TWC:TabbedPane runat="server" ID="AvatarSelectionTab">
                <Tab><CSControl:ResourceControl runat="server" ResourceName="Hubs_Avatar_AvatarSelect" /></Tab>
                <Content>
                    <CSHub:EditHubAvatarForm runat="server"
                         SelectableAvatarsRadioButtonListId="SelectableAvatars" 
                         SelectableAvatarHeight="60" 
                         SelectableAvatarWidth="60"
                         SubmitButtonId="UpdateSelectedAvatarButton"
                         DeleteAvatarButtonId="RemoveSelectAvatarButton"
                    >
                        <SuccessActions>
                            <CSControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
                        </SuccessActions>
                        <FormTemplate>
                            <div class="CommonFormFieldName"><CSControl:ResourceControl ResourceName="Hubs_Avatar_AvatarSelect" runat="server" /></div>
                            <CSControl:ResourceControl runat="server" ResourceName="Hubs_Avatar_AvatarSelect_Desc" CssClass="CommonFormFieldDescription" />
                            <div class="CommonFormField">
                                <asp:RadioButtonList RepeatLayout="Flow" runat="server" ID="SelectableAvatars" RepeatColumns="6" />
                            </div>
                            <div class="CommonFormFieldName">		
                                <CSControl:ResourceButton runat="server" id="UpdateSelectedAvatarButton" ResourceName="Hubs_Avatar_UseSelectedAvatar" />
                                <CSControl:ResourceButton runat="server" ID="RemoveSelectAvatarButton" ResourceName="Hubs_Avatar_RemoveAvatar" />
                            </div>
                        </FormTemplate> 
                    </CSHub:EditHubAvatarForm>
                </Content>
            </TWC:TabbedPane>
    </TWC:TabbedPanes>
    
</div>

</asp:Content>