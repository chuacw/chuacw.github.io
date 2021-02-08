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
        <ContentTemplate><CSControl:UserFolderData runat="server" Property="Name" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">

    <div class="CommonSidebar">
    
        <CSUserControl:UserBadgeArea runat="server" />
	    
	    <div class="CommonContentBox Highlighted2">
	        <h4 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="MediaGallery_BrowseFiles" /></h4>
	        <div class="CommonContentBoxContent">
	            <ul class="CommonContentBoxList">
	                <CSControl:UserFolderData LinkTo="ViewParent" ResourceName="MediaGallery_ParentFolder" Tag="LI" runat="server" />
	                <CSControl:UserFolderData LinkTo="View" Property="Name" TruncateAt="15" Tag="LI" CssClass="Selected" runat="server" />
	                <CSControl:UserFolderList runat="server" ShowHeaderFooterOnNone="false">
                        <QueryOverrides PageSize="9999" />
                        <ItemTemplate>
                            <li class="Child">
                                <CSControl:DeleteUserFolderForm SubmitButtonId="DeleteFolder" runat="server">
                                    <SuccessActions>
                                        <CSControl:GoToModifiedUrlAction runat="server" />
                                    </SuccessActions>
                                    <FormTemplate>
                                        <CSControl:ResourceLinkButton ResourceName="Delete" OnClientClick="return confirmFolderDelete();" id="DeleteFolder" runat="server" style="float: right; margin: 0 0 0 4px; font-size: 80%; font-weight: bold;" />
                                    </FormTemplate>
                                </CSControl:DeleteUserFolderForm>
                                <CSControl:UserFolderData runat="server" Property="Name" TruncateAt="15" LinkTo="View" />
                            </li>
                        </ItemTemplate>
                    </CSControl:UserFolderList>
	        </div>
	    </div>
	    
    </div>	    

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <script type="text/javascript">
    // <!--

    function confirmFileDelete()
    {
        return window.confirm('<CSControl:ResourceControl ResourceName="UserFile_DeleteConfirmation" runat="server" />');
    }

    function confirmFolderDelete()
    {
        return window.confirm('<CSControl:ResourceControl ResourceName="UserFolder_DeleteConfirmation" runat="server" />');
    }

    // -->
    </script>

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <CSControl:AddUserFileForm runat="server" FileHtmlInputFileId="File" SaveButtonId="SaveFile" MessageTextId="FileMessage">
                <SuccessActions>
                    <CSControl:GoToModifiedUrlAction runat="server" />
                </SuccessActions>
                <LeaderTemplate>
                    <div class="CommonContentBoxHeaderForm">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr><td align="left">
                </LeaderTemplate>
                <FormTemplate>
                    <CSControl:WrappedLiteral runat="server" ID="FileMessage" Tag="Div" CssClass="CommonMessageError" />
                    <input type="file" runat="server" id="File" />
                    <asp:Button runat="server" Text="Add File" ID="SaveFile" />
                </FormTemplate>
                <TrailerTemplate>
                    </td><td align="right">
                </TrailerTemplate>
            </CSControl:AddUserFileForm>
            <CSControl:AddUserFolderForm runat="server" NameTextBoxId="FolderName" SaveButtonId="SaveFolder">
                <SuccessActions>
                    <CSControl:GoToModifiedUrlAction runat="server" />
                </SuccessActions>
                <FormTemplate>
                    <asp:TextBox runat="server" ID="FolderName" />
                    <asp:Button runat="server" ID="SaveFolder" Text="Add Folder" />            
                </FormTemplate>
                <TrailerTemplate>
                            </td></tr>
                        </table>
                    </div>
                </TrailerTemplate>
            </CSControl:AddUserFolderForm>	
        
            <CSControl:UserFileList runat="server" ShowHeaderFooterOnNone="false">
                <QueryOverrides PageSize="20" PagerID="FilePager" />
                <ItemTemplate>
                    <div class="CommonFileArea">
                        <div class="CommonFileRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                        <div class="CommonFileContent">
                            <div class="CommonFile"><table cellpadding="0" cellspacing="0" border="0"><tr><td class="CommonFileInner">
                                <CSControl:UserFileData runat="server" LinkTo="View">
                                    <ContentTemplate>
                                        <CSControl:UserFileViewer runat="server" ViewType="Preview" Width="131" Height="94" />
                                    </ContentTemplate>
                                </CSControl:UserFileData>
                                <CSControl:UserFileData runat="server" LinkTo="View" Text="&amp;nbsp;" LinkCssClass="CommonFileLink" />
                            </td></tr></table></div>
                            <div class="CommonFileDetails">
                                <CSControl:UserFileData runat="server" Property="Name" LinkTo="View" Tag="Strong" TruncateAt="15" />
                                <CSControl:DeleteUserFileForm SubmitButtonId="DeleteFile" runat="server" Tag="Div" style="margin-top: 12px;">
                                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                    <FormTemplate>
                                        <CSControl:ResourceLinkButton ResourceName="Delete" OnClientClick="return confirmFileDelete();" id="DeleteFile" runat="server" />
                                    </FormTemplate>
                                </CSControl:DeleteUserFileForm>
                            </div>
                        </div>
                        <div class="CommonFileRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>                        
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <div style="clear:both;"></div>
                </FooterTemplate>
                <NoneTemplate>
                    <CSControl:ResourceControl ResourceName="UserFile_NoFiles" runat="server" />
                </NoneTemplate>
            </CSControl:UserFileList>
            
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:Pager runat="server" ID="FilePager" ShowTotalSummary="true">
                <TrailerTemplate> | <CSControl:UserFolderData LinkTo="Slideshow" ResourceName="MediaGallery_ViewSlideshow" runat="server" /></TrailerTemplate>
            </CSControl:Pager>
        </div>
    </div>

</asp:Content>

