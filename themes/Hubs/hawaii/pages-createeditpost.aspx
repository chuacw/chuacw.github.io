<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSHub:HubData runat="server" LinkTo="PageList" ResourceName="Pages" />
        &raquo;
        <CSControl:ConditionalContent runat="server">
            <ContentConditions><CSHub:HubPagePropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></ContentConditions>
            <TrueContentTemplate><CSHub:HubPageData LinkTo="EditPage" runat="server" Text="Edit Page" /></TrueContentTemplate>
            <FalseContentTemplate><CSHub:HubData LinkTo="CreatePage" runat="server" Text="Create Page" /></FalseContentTemplate>
        </CSControl:ConditionalContent>
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions><CSHub:HubPagePropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate>Editing <CSHub:HubPageData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions Operator="Not"><CSHub:HubPagePropertyValueComparison runat="server" ComparisonProperty="PostID" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate>Create New Page</ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <CSHub:CreateEditHubPageForm runat="server" ID="HubPageForm" PreviewHubPageListId="PreviewList" 
                BodyEditorId="Editor" 
                NameTextBoxId="Name" 
                SubmitButtonId="Submit">
                <SuccessActions>
                    <CSControl:GoToCurrentViewableContentAction runat="server" />
                </SuccessActions>
                <FormTemplate>
                    <TWC:TabbedPanes id="EditorTabs" runat="server"
	                    PanesCssClass="CommonPane"
	                    TabSetCssClass="CommonPaneTabSet"
	                    TabCssClasses="CommonPaneTab"
	                    TabSelectedCssClasses="CommonPaneTabSelected"
	                    TabHoverCssClasses="CommonPaneTabHover"
	                    >
	                    <TWC:TabbedPane runat="server" ID="ComposePane">
		                    <Tab>Compose</Tab>
		                    <Content>
                                <CSControl:FormLabel runat="server" ResourceName="Name" LabelForId="Name" CssClass="CommonFormFieldName" />
                                <div class="CommonFormField"><asp:TextBox runat="server" ID="Name" Columns="40" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                                
                                <div class="CommonFormFieldName"><CSControl:FormLabel runat="server" ResourceName="Weblog_CreateEditBlogPost_Body" LabelForId="Editor" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Editor" Cssclass="validationWarning">*</asp:RequiredFieldValidator></div>
                                <div class="CommonFormField"><CSControl:Editor runat="server" ID="Editor" /></div>
                            </Content>
                         </TWC:TabbedPane>
                         <TWC:TabbedPane runat="server" ID="PreviewPane">
                            <Tab OnClickClientFunction="Preview"><CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Tab_Preview" /></Tab>
                            <Content>
                                <script type="text/javascript">
		                        // <![CDATA[
		                            function Preview()
		                            {
		                                document.getElementById('previewloading').style.display = 'block';
		                                <%# ((CreateEditHubPageForm) HubControlUtility.Instance().FindControl(this, "HubPageForm")).GetPreviewScript("PreviewCallback();") %>
		                            }
        		                    
		                            function PreviewCallback()
		                            {
		                                document.getElementById('previewloading').style.display = 'none';
		                            }
		                        // ]]>
		                        </script>
                            
                                <div id="previewloading" style="display:none"><CSControl:ResourceControl runat="server" ResourceName="Hub_Loading" /> <CSControl:Image runat="server" ImageUrl="~/utility/spinner.gif" /></div>
                                <CSHub:HubPageList runat="server" ID="PreviewList">
                                    <ItemTemplate>
                                        <CSHub:HubPageData Property="Subject" Tag="H2" CssClass="CommonSubTitle" runat="server" />
                                        <CSHub:HubPageData Property="FormattedBody" runat="server" IncrementViewCount="true" />
                                    </ItemTemplate>
                                </CSHub:HubPageList>
                            </Content>
                         </TWC:TabbedPane>
                    </TWC:TabbedPanes>
                    
                    <div class="CommonFormFieldName"><asp:Button runat="server" ID="Submit" Text="Save" /></div>
                </FormTemplate>
            </CSHub:CreateEditHubPageForm>
        </div>
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server" />