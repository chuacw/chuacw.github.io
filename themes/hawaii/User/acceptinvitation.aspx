<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<div style="width: 50%; margin: 100px auto;">
    <div class="CommonContentBox">
        <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="AcceptInvitation_Title" EnableRendering="true" Tag="H2" CssClass="CommonContentBoxHeader" />  
        <div class="CommonContentBoxContent">

		    <CSControl:ConditionalContent runat="server">
		        <ContentConditions><CSHub:HubPropertyValueComparison runat="server" ComparisonProperty="SectionID" Operator="IsSetOrTrue" /></ContentConditions>
		        <TrueContentTemplate>
		            <CSControl:ResourceControl runat="server" ResourceName="AcceptInvitation_Hub_AnnonymousUser">
		                <Parameter1Template><CSControl:UserData Property="Username" runat="server" /></Parameter1Template>
		                <Parameter2Template><CSControl:UserInvitationData runat="server" Property="Message" Encoding="HTML" /></Parameter2Template>
		                <Parameter3Template>
		                    <CSControl:SiteUrl UrlName="user_Register_WithInvitation" runat="server" RenderRawUrl="true">
		                        <Parameter1Template><CSControl:UserInvitationData runat="server" Property="InvitationKey" /></Parameter1Template>
		                    </CSControl:SiteUrl>
		                </Parameter3Template>
		                <Parameter4Template>
		                    <CSControl:SiteUrl UrlName="login_WithInvitation" runat="server" RenderRawUrl="true">
		                        <Parameter1Template><CSControl:UserInvitationData runat="server" Property="InvitationKey" /></Parameter1Template>
		                    </CSControl:SiteUrl>
		                </Parameter4Template>
		                <Parameter5Template><CSHub:HubData Property="Name" runat="server" /></Parameter5Template>
		            </CSControl:ResourceControl>
		        </TrueContentTemplate>
		        <FalseContentTemplate>
		            <CSControl:ResourceControl runat="server" ResourceName="AcceptInvitation_AnonymousUser">
		                 <Parameter1Template><CSControl:UserData Property="Username" runat="server" /></Parameter1Template>
		                <Parameter2Template><CSControl:UserInvitationData runat="server" Property="Message" Encoding="HTML" /></Parameter2Template>
		                <Parameter3Template>
		                    <CSControl:SiteUrl UrlName="user_Register_WithInvitation" runat="server" RenderRawUrl="true">
		                        <Parameter1Template><CSControl:UserInvitationData runat="server" Property="InvitationKey" /></Parameter1Template>
		                    </CSControl:SiteUrl>
		                </Parameter3Template>
		                <Parameter4Template>
		                    <CSControl:SiteUrl UrlName="login_WithInvitation" runat="server" RenderRawUrl="true">
		                        <Parameter1Template><CSControl:UserInvitationData runat="server" Property="InvitationKey" /></Parameter1Template>
		                    </CSControl:SiteUrl>
		                </Parameter4Template>
		            </CSControl:ResourceControl>
		        </FalseContentTemplate>
		    </CSControl:ConditionalContent>
	
	    </div>
    </div>
</div>
    
    <CSControl:AcceptInvitationForm runat="server">
        <SuccessActions>
            <CSControl:GoToCurrentContentContainerAction runat="server" />
            <CSControl:GoToMessageAction runat="server" MessageType="UserInvitationAccepted" />
        </SuccessActions>
    </CSControl:AcceptInvitationForm>

</asp:Content>

