<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.MediaGalleries.Controls.CSMediaGalleryThemePage" MasterPageFile="mediagalleries.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea">
        <div class="Common">
            <CSControl:SiteUrl UrlName="mediagallerieshome" ResourceName="media" runat="server" />
            &raquo;
            <CSMedia:GroupData LinkTo="GroupHome" Property="Name" runat="server" />
            &raquo;
            <CSMedia:MediaGalleryData LinkTo="MediaGalleryHome" Property="Name" runat="server" />        
            &raquo;
            <CSMedia:MediaGalleryPostData Property="Subject" LinkTo="View" runat="server" />
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" Tag="H1" CssClass="CommonTitle" EnableRendering="true">
        <ContentTemplate>
            <CSMedia:MediaGalleryPostData runat="server" Property="Subject" />
            <CSControl:ResourceControl runat="server" ResourceName="MediaGalleries_Disclaimer_Title" ResourceFile="MediaGallery.xml" />
        </ContentTemplate>
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
			            <div class="CommonFormField">
				            <CSControl:ResourceButton id="MediaGalleryPostAccept" ResourceName="Accept" ResourceFile="MediaGallery.xml" runat="server" />
				            <CSControl:ResourceButton id="MediaGalleryPostDecline" ResourceName="Decline" ResourceFile="MediaGallery.xml" runat="server" />
					    </div>
			        </div>
			    </FormTemplate>
			</CSMedia:DownloadMediaGalleryPostForm>

        </div>
    </div>

</asp:Content>
