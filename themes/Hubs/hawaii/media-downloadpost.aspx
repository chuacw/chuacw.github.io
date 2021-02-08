<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSMedia:MediaGalleryData runat="server" ResourceName="Hubs_Files" LinkTo="MediaGalleryHome" />
        &raquo;
        <CSMedia:MediaGalleryPostData Property="Subject" Text="Download {0}" runat="server" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSMedia:MediaGalleryPostData runat="server" Property="Subject" /></ContentTemplate>
        <TrailerTemplate> <CSControl:ResourceControl runat="server" ResourceName="MediaGalleries_Disclaimer_Title" ResourceFile="MediaGallery.xml" /></TrailerTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">
            <CSControl:ResourceControl runat="server" ResourceName="MediaGalleries_Disclaimer_Detail" ResourceFile="MediaGallery.xml" />
            <CSMedia:DownloadMediaGalleryPostForm runat="server" AcceptButtonId="MediaGalleryPostAccept" DeclineButtonId="MediaGalleryPostDecline">
                <DeclinedActions>
                    <CSControl:GoToCurrentViewableContentAction runat="server" />
                </DeclinedActions>
                <FormTemplate>
                    <div class="CommonFormArea">
	                    <table cellspacing="0" cellpadding="0" border="0">
		                    <tr>
			                    <td class="CommonFormField">
				                    <CSControl:ResourceButton id="MediaGalleryPostAccept" ResourceName="Accept" ResourceFile="MediaGallery.xml" runat="server" />
				                    <CSControl:ResourceButton id="MediaGalleryPostDecline" ResourceName="Decline" ResourceFile="MediaGallery.xml" runat="server" />
			                    </td>
		                    </tr>
	                    </table>
	                </div>
	            </FormTemplate>
	        </CSMedia:DownloadMediaGalleryPostForm>
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server" />