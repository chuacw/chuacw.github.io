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
            <CSControl:ResourceControl runat="server" ResourceName="Delete" ResourceFile="MediaGallery.xml" />
            <CSMedia:MediaGalleryPostData runat="server" Property="Subject" />
        </ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

	        <CSMedia:DeleteMediaGalleryPostForm runat="server" DeleteButtonId="MediaGalleryPostDelete">
	            <SuccessActions>
	                <CSControl:GoToSiteUrlAction UrlName="mediaGalleries_ViewMediaGallery" Parameter1='<%# CurrentSection.ApplicationKey %>' runat="server" />
	            </SuccessActions>
	            <FormTemplate>
	                <div class="CommonFormArea">
			           <div class="CommonFormFieldName">
				            <CSControl:ResourceControl runat="server" ResourceName="MediaGalleryPostAdmin_Name" ResourceFile="MediaGallery.xml" />
			            </div>
			            <div class="CommonFormField">
				            <CSMedia:MediaGalleryPostData runat="server" Property="Subject" />
			            </div>
			            
			            <div class="CommonFormFieldName">
                            <CSControl:ResourceControl runat="server" ResourceName="MediaGalleryPostAdmin_Desc" ResourceFile="MediaGallery.xml" />
                        </div>
				        <div  class="CommonFormField">
					        <CSMedia:MediaGalleryPostData runat="server" Property="FormattedBody" />
					    </div>
					        
                        <div class="CommonFormField" >
				            <CSControl:ResourceButton id="MediaGalleryPostDelete" runat="server" ResourceName="Delete" ResourceFile="MediaGallery.xml" />
				            <CSControl:ButtonActionForm ButtonId="MediaGalleryPostCancel" runat="server">
				                <Actions>
				                    <CSControl:GoToCurrentViewableContentAction runat="server" />
				                </Actions>
                                <FormTemplate>
                                    <CSControl:ResourceButton id="MediaGalleryPostCancel" runat="server" ResourceName="Cancel" ResourceFile="MediaGallery.xml" />    					                
				                </FormTemplate>
				            </CSControl:ButtonActionForm>
				        </div>
		            </div>
                </FormTemplate>
            </CSMedia:DeleteMediaGalleryPostForm>

        </div>
    </div>
    
</asp:Content>