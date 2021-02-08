<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="UserBadgeArea" Src="UserBadgeArea.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSControl:UserFileBreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <LeaderTemplate>
            <div class="Common">
                <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" />
                <CSControl:ResourceControl ResourceName="BreadCrumb_Seperator" runat="server" />
        </LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSControl:UserFileBreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSControl:UserFileData runat="server" Property="Name" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">

    <div class="CommonSidebar">
        <CSUserControl:UserBadgeArea runat="server" />
    </div> 

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <script type="text/javascript">
    // <!--

    function confirmFileDelete()
    {
        return window.confirm('<CSControl:ResourceControl ResourceName="UserFile_DeleteConfirmation" runat="server" />');
    }

    // -->
    </script>

    <div class="CommonContentBox">
        <div class="CommonContentBoxHeaderForm">
            <div style="float: right;">
                <CSControl:UserFileData runat="server" LinkTo="Download" ResourceName="Download" />
                <CSControl:DeleteUserFileForm SubmitButtonId="DeleteFile" runat="server">
                    <SuccessActions>
                        <CSControl:GoToCurrentUserFolderAction runat="server" />
                    </SuccessActions>
                    <FormTemplate>
                        | <CSControl:ResourceLinkButton ResourceName="Delete" OnClientClick="return confirmFileDelete();" id="DeleteFile" runat="server" />
                    </FormTemplate>
                </CSControl:DeleteUserFileForm>
            </div>
        
            <CSControl:UserFileData LinkTo="ViewPreviousFile" ResourceName="Button_PreviousTopic" runat="server" /> |
            <CSControl:UserFileData LinkTo="ViewNextFile" ResourceName="Button_NextTopic" runat="server" /> |
            <CSControl:UserFolderData runat="server" LinkTo="View" ResourceName="ViewUserProfile_ViewAllFiles" /> |
            <CSControl:UserFolderData runat="server" LinkTo="Slideshow" ResourceName="MediaGallery_ViewSlideshow" />
        </div>
        <div class="CommonContentBoxContent">
        	
            <CSControl:UserFileViewer ViewType="View" Width="600" Height="450" runat="server" Tag="Div" style="text-align: center;" ID="FileViewer" />
            <CSControl:PlaceHolder runat="server">
                <DisplayConditions><CSControl:ControlVisibilityCondition ControlId="FileViewer" ControlVisiblilityEquals="false" runat="server" /></DisplayConditions>
                <ContentTemplate>
                    <CSControl:ResourceControl runat="server" ResourceName="MediaGallery_FileNotViewable" /> <CSControl:UserFileData runat="server" LinkTo="Download" Text="download" />
                </ContentTemplate>
            </CSControl:PlaceHolder>
    
        </div>
    </div>

</asp:Content>

