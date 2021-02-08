<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSHub:HubData LinkTo="EditTheme" runat="server" ResourceName="Hubs_EditTheme" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" IncludeSectionOrHubName="true" Text="Theme Configuration" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">

        <CSHub:HubThemeConfigurationForm runat="server" 
            EndPreviewButtonId="EndPreview" 
            ExportButtonId="Export" 
            ImportModalButtonId="Import" 
            RestoreDefaultsButtonId="RestoreDefaults" 
            SaveButtonId="Save" 
            ThemeConfigurationFormId="ConfigurationForm" 
            ThemeDescriptionTextId="ThemePreviewText" 
            ThemeDropDownListId="Themes" 
            ThemeNameTextId="ThemeName" 
            ThemePreviewImageId="ThemePreviewImage" 
            UpdatePreviewButtonId="UpdatePreview"
            StartPreviewButtonId="StartPreview"
            >
            <SaveSuccessfulActions>
                <CSControl:GoToModifiedUrlAction runat="server" />
            </SaveSuccessfulActions>
            <PreviewUpdatedActions>
            
            </PreviewUpdatedActions>
            <PreviewEndedActions>
            
            </PreviewEndedActions>
            <DefaultsRestoredActions>
            
            </DefaultsRestoredActions>
            <FormTemplate>
                <CSControl:PlaceHolder runat="server" CssClass="CommonContentBoxHeaderForm">
                    <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="Themes" ControlVisiblilityEquals="true" /></DisplayConditions>
                    <ContentTemplate>
                        <div class="CommonFormArea">
                            <div class="CommonFormFieldName">
                                <CSControl:ResourceControl runat="server" ResourceName="EditProfile_Theme"/>: <TWC:DropDownList runat="server" ID="Themes" ShowHtmlWhenSelected="false" SelectListWidth="440" SelectListHeight="375" />
                            </div>
                        </div>
                    </ContentTemplate>
                </CSControl:PlaceHolder>

                <div class="CommonContentBoxContent">
                    <CSControl:PlaceHolder runat="server">
                        <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ConfigurationForm" ControlVisiblilityEquals="true" /></DisplayConditions>
                        <ContentTemplate>
                            <h2>
                                <asp:Image runat="server" id="ThemePreviewImage" Width="60" Height="40" BorderWidth="1" ImageAlign="AbsMiddle" />
	                            <asp:Literal runat="server" id="ThemeName" />
	                        </h2>
	                        <p>
	                            <asp:Literal runat="server" id="ThemePreviewText" />
	                        </p>
	                    </ContentTemplate>
	                </CSControl:PlaceHolder>
        	    
	                <CSDynConfig:ConfigurationForm runat="server" id="ConfigurationForm"
	                    RenderGroupsInTabs="true" 
	                    PanesCssClass="CommonPane"
		                TabSetCssClass="CommonPaneTabSet"
		                TabCssClasses="CommonPaneTab"
		                TabSelectedCssClasses="CommonPaneTabSelected"
		                TabHoverCssClasses="CommonPaneTabHover"
		                >
		                <PropertyFormGroupHeaderTemplate>
		                    <div class="CommonFormDescription">
		                        <CSDynConfig:PropertyGroupData Property="Description" runat="server" />
		                    </div>
		                </PropertyFormGroupHeaderTemplate>
		                <PropertyFormSubGroupHeaderTemplate>
                            <div class="CommonFormSubTitle"><CSDynConfig:PropertySubGroupData Property="Name" runat="server" /></div>
		                </PropertyFormSubGroupHeaderTemplate>
		                <PropertyFormPropertyTemplate>
	                        <div class="CommonFormFieldName"><strong><CSDynConfig:PropertyData Property="Name" runat="server" /></strong></div>
	                        <div class="CommonFormFieldDescription"><CSDynConfig:PropertyData Property="Description" runat="server" /></div>
	                        <div class="CommonFormField"><CSDynConfig:PropertyControl runat="server" /></div>
		                </PropertyFormPropertyTemplate>
		                <PropertyFormSubGroupFooterTemplate>
		                    <div style="height: .5em;"></div>
		                </PropertyFormSubGroupFooterTemplate>
		                <AppendedTabbedPanes>
		                    <TWC:TabbedPane runat="server" ID="PreviewPane">
		                        <Tab><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Tab_Preview" /></Tab>
		                        <Content>
		                            <div class="CommonFormFieldDescription">
		                                <p>
		                                    Ready to see what your new theme looks like? 
		                                </p>
		                                <p>
                                            Just click 'Enter Preview Mode' you can then browse and preview the changes that you've made -- your changes won't become live until you click 'Save' (so don't forget to save!) 
                                        </p>
		                            </div>
        		                    
		                            <asp:Button ID="StartPreview" runat="server" Text="Enter Preview Mode" />
		                            <asp:Button ID="UpdatePreview" runat="server" Text="Update Preview" />
		                            <asp:Button ID="EndPreview" runat="server" Text="Exit Preview Mode" />
		                        </Content>
		                    </TWC:TabbedPane>
		                </AppendedTabbedPanes>
	                </CSDynConfig:ConfigurationForm>
        	
	                <p>
	                    <asp:Button ID="Save" runat="server" Text="Save" />
	                    &nbsp;&nbsp;&nbsp;&nbsp;
	                    <CSControl:Modal ModalType="Button" ID="Import" runat="server" ResourceName="Hubs_Import" Width="500" Height="300" />
	                    <asp:Button ID="Export" runat="server" Text="Export" />
	                    &nbsp;&nbsp;&nbsp;&nbsp;
	                    <asp:Button ID="RestoreDefaults" runat="server" Text="Restore Defaults" />
                    </p>
                </div>
            </FormTemplate>
        </CSHub:HubThemeConfigurationForm>
    </div>
</asp:Content>

