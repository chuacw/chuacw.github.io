<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="hubs.Master" %>
<%@ Import Namespace="CommunityServer.Components"%>

<asp:Content ContentPlaceHolderID="tr" runat="server">
	<CSControl:ResourceControl runat="server" ResourceName="Hubs_AccessDenied_Title" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
		<div class="CommonContentBoxContent">
			<CSControl:ConditionalContent runat="server">
				<ContentConditions><CSHub:SectionMembershipPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="MembershipType" Operator="EqualTo" ComparisonValue="PendingMember" /></ContentConditions>
				<TrueContentTemplate>
					<CSControl:ResourceControl runat="server" ResourceName="Hubs_AccessDenied_BodyPending" Tag="P" />
				</TrueContentTemplate>
				<FalseContentTemplate>
					<CSControl:ResourceControl runat="server" ResourceName="Hubs_AccessDenied_Body" Tag="P" />

					<CSHub:RequestMembershipForm runat="server" SubmitButtonId="RequestClosedMembershipButton" Tag="P">
						<RequestAcceptedActions><CSControl:GoToModifiedUrlAction runat="server" /></RequestAcceptedActions>
						<RequestSentActions><CSControl:GoToModifiedUrlAction runat="server" /></RequestSentActions>
						<FormTemplate><CSControl:ResourceLinkButton runat="server" ID="RequestClosedMembershipButton" ResourceName="Hubs_ApplyToJoin" /></FormTemplate>
					</CSHub:RequestMembershipForm>
				</FalseContentTemplate>
			</CSControl:ConditionalContent>
		</div>
	</div>

</asp:Content>