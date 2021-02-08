<%@ Page EnableViewState="true" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="theme.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="Tabs" Src="~/themes/hawaii/wikis/tabs.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSWiki:WikiData runat="server" LinkTo="HomePage" ResourceName="Button_Wiki" />
        &raquo;
        <CSControl:ConditionalContent runat="server">
            <ContentConditions><CSWiki:PagePropertyValueComparison runat="server" ComparisonProperty="ID" Operator="IsSetOrTrue" /></ContentConditions>
            <TrueContentTemplate><CSWiki:PageData runat="server" LinkTo="EditPage"><ContentTemplate>Editing <CSWiki:PageData runat="server" Property="Title" /></ContentTemplate></CSWiki:PageData></TrueContentTemplate>
            <FalseContentTemplate><CSWiki:WikiData runat="server" LinkTo="CreatePage" Text="Create Page" /></FalseContentTemplate>
        </CSControl:ConditionalContent>
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate>
            <CSControl:ConditionalContent runat="server">
                <ContentConditions><CSWiki:PagePropertyValueComparison runat="server" ComparisonProperty="ID" Operator="IsSetOrTrue" /></ContentConditions>
                <TrueContentTemplate>
                    <CSWiki:PageData runat="server" Property="Title"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_Editing" /></LeaderTemplate></CSWiki:PageData>
                </TrueContentTemplate>
                <FalseContentTemplate><CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_Adding" /></FalseContentTemplate>
            </CSControl:ConditionalContent>
        </ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
<CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="false">
    <ContentTemplate><CSWiki:PageData runat="server" Property="Title" /></ContentTemplate>
</CSControl:Title>

<div class="CommonContentBox">
    <div class="CommonContentBoxContent">
        <div style="float: right">
            <CSWiki:WikiData LinkTo="CreatePage" runat="server" LinkCssClass="WikiAddButton">
                <DisplayConditions>
                    <CSWiki:PagePropertyValueComparison runat="server" ComparisonProperty="ID" Operator="IsSetOrTrue" />            
                </DisplayConditions>
                <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Wikis_AddPage" /></span></ContentTemplate>
           </CSWiki:WikiData>
        </div>

        <CSUserControl:Tabs runat="server" SelectedTab="Edit" />

        <div class="CommonPane" >
            <div class="CommonGroupedContentArea">

                <CSWiki:CreateEditPageForm runat="server" ID="WikiPageForm"  
                PageTitleTextBoxId="Title" 
                PageBodyEditorId="Body" 
                SubmitButtonId="Submit"
                SubscribeToPageCheckBoxId="SubscribeToPage"
                SubFormIds="TagsSubForm"
                CustomValidatorId="PageValidator"
                ParentPageDropDownListId="ParentPageList">
                <SuccessActions>
                    <CSWiki:GoToCurrentPageAction runat="server" />
                </SuccessActions>
                <FormTemplate>
                    <asp:CustomValidator runat="server" id="PageValidator" />
                    
                    <div class="CommonFormField">
                        <CSControl:FormLabel runat="server" Text="Title" LabelForId="Title" CssClass="CommonFormFieldName" />
                        <asp:TextBox runat="server" ID="Title" Columns="40" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Title" Cssclass="validationWarning">* Required</asp:RequiredFieldValidator>
                    </div>

                    <div class="CommonFormField">
                        <CSWiki:PageTagsSubForm runat="server" ID="TagsSubForm" SelectTagsModalButtonId="SelectTags" TagsTextBoxId="Tags">
                        <FormTemplate>
                            <div class="CommonFormFieldName">
                                <CSControl:FormLabel LabelForId="Tags" runat="server" ResourceName="CreateEditPost_Tags" />
                            </div>
                            <div class="CommonFormField">
                                <asp:TextBox runat="server" ID="Tags" Columns="70" /> <CSControl:Modal ModalType="Button" Width="400" Height="350" ID="SelectTags" ResourceName="TagEditor_SelectTags" runat="server" />
                            </div>
                        </FormTemplate>
                        </CSWiki:PageTagsSubForm>
                    </div>

                    <CSControl:PlaceHolder runat="server">
                        <DisplayConditions><CSControl:ControlVisibilityCondition runat="server" ControlId="ParentPageList" ControlVisiblilityEquals="true" /></DisplayConditions>
                        <ContentTemplate>
                            <div class="CommonFormField">
                                <CSControl:FormLabel runat="server" ResourceName="Wikis_ParentPage" LabelForId="ParentPageList" CssClass="CommonFormFieldName" />
                                <asp:DropDownList runat="server" ID="ParentPageList" />
                            </div>
                        </ContentTemplate>
                    </CSControl:PlaceHolder>
                    
                    <div class="CommonFormField">
                        <br />
                        <CSControl:Editor runat="server" ID="Body" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Body" Cssclass="validationWarning">* Please enter some content</asp:RequiredFieldValidator>
                     </div>

	                <CSControl:PlaceHolder ID="PlaceHolder1" Tag="div" CssClass="CommonFormField" runat="server">
	                    <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="SubscribeToPage" ControlVisiblilityEquals="true" runat="server" /></DisplayConditions>
	                    <ContentTemplate>
		                    <asp:checkbox id="SubscribeToPage" Checked="true" runat="server"/>
		                    <CSControl:FormLabel runat="server" LabelForId="SubscribeToPage" ResourceName="Wikis_Page_Subscribe" />
	                    </ContentTemplate>
	                </CSControl:PlaceHolder>

                    <div class="CommonFormFieldName">
                        <asp:Button runat="server" ID="Submit" Text="Save" />
                    </div>

                    <CSControl:PageNavigationConfirmation runat="server" UnconfirmedControlIds="Submit"  />
                
                </FormTemplate>
            </CSWiki:CreateEditPageForm>    
                
                
            </div>
        
        </div>
    </div>
</div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcrc" runat="server">
    
    <CSWiki:DeletePageForm runat="server" DeleteSinglePageButtonId="DeletePageLink">
        <SuccessActions>
            <CSControl:GoToSiteUrlAction runat="server" UrlName="hub_wiki">
                <Parameter1Template><CSHub:HubData runat="server" Property="ApplicationKey" /></Parameter1Template>
            </CSControl:GoToSiteUrlAction>
        </SuccessActions>
        <LeaderTemplate>
            <script type="text/javascript">
                function confirmPageDelete()
                {
                    return window.confirm('Are you sure you want to delete this page?');
                }
            </script>
            <ul class="CommonContentBoxList Seperator"><li>
        </LeaderTemplate>
        <FormTemplate>
            <CSControl:ResourceLinkButton runat="server" OnClientClick="return confirmPageDelete();" ID="DeletePageLink" Text="Delete Page" />
        </FormTemplate>
        <TrailerTemplate></li></ul></TrailerTemplate>
    </CSWiki:DeletePageForm>
    
    <CSWiki:LockPageForm runat="server" LockButtonId="LockPageButton" UnlockButtonId="UnlockPageButton">
        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
        <LeaderTemplate><ul class="CommonContentBoxList Seperator"><li></LeaderTemplate>
        <FormTemplate>
            <CSControl:ResourceLinkButton runat="server" ID="LockPageButton" Text="Lock Page" />
            <CSControl:ResourceLinkButton runat="server" ID="UnlockPageButton" Text="Unlock Page" />
        </FormTemplate>
        <TrailerTemplate></li></ul></TrailerTemplate>
    </CSWiki:LockPageForm>
    
</asp:Content>