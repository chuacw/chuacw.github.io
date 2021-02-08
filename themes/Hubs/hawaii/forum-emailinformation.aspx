<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="theme.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSForum:ForumData LinkTo="HomePage" Text="Discussions" runat="server" />
        &raquo;
        Email Information
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSectionOrHubName="true" IncludeSiteName="true" ResourceName="Groups_EmailInformation_Title" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:ConditionalAction runat="server">
        <Conditions Operator="Or">
            <CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" UseAccessingUser="true" Operator="IsSetOrTrue" />
            <CSControl:Conditions runat="server" Operator="Not">
                <CSControl:Conditions runat="server" Operator="And">
                    <CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="EnableMailGateway" Operator="IsSetOrTrue" />    
                    <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsActive" Operator="IsSetOrTrue" />
                    <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsMailingList" Operator="IsSetOrTrue" />
                </CSControl:Conditions>
            </CSControl:Conditions>
        </Conditions>
        <Actions><CSControl:GoToMessageAction runat="server" MessageType="AccessDenied" /></Actions>
    </CSControl:ConditionalAction>

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <CSControl:ResourceControl runat="server" ResourceName="Groups_EmailInformation_Description" />
    		
		    <p />
    		
		    <table cellpadding="0" cellspacing="0" border="0">
		        <tr>
		            <td class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="Groups_EmailInformation_Subscribed" /></td>
		            <td class="CommonFormField" style="padding-top: 8px"><CSForum:ForumSubscriptionToggleButton runat="server" ToggleSubscriptionType="Thread" ButtonCssClass="CommonTextButton" /></td>
		        </tr>
		    </table>
    		
		    <p />
    		
		    <CSControl:ResourceControl runat="server" ResourceName="Groups_EmailInformation_ForumEmailAddress">
		        <Parameter1Template><CSMail:MailingListData runat="server" Property="EmailAddress" /></Parameter1Template>
		    </CSControl:ResourceControl>
    		
		    <p />
    				
		    <CSControl:ResourceControl runat="server" ResourceName="Groups_EmailInformation_CurrentEmailAddress">
		        <Parameter1Template><CSControl:UserData runat="server" UseAccessingUser="true" Property="Email" /></Parameter1Template>
		        <Parameter2Template><CSControl:SiteUrl runat="server" UrlName="user_EditProfile_Clean" RenderRawUrl="true" /></Parameter2Template>
		    </CSControl:ResourceControl>
		
		</div>
	</div>
		
</asp:Content>