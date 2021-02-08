<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<div style="width: 50%; margin: 100px auto;">
    <div class="CommonContentBox">
        <CSControl:ConditionalContent runat="server">
            <ContentConditions>
                <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="MessageID" Operator="EqualTo" ComparisonValue="24" />
            </ContentConditions>
            <TrueContentTemplate>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr valign="top">
                        <td style="width: 100px;">
                            <CSControl:UserAvatar runat="server" UseAccessingUser="true" Height="80" Width="80" />
                            <br />
                            <CSControl:UserData runat="server" LinkTo="ChangeAvatar" ResourceName="EditProfile_ChangeAvatar" UseAccessingUser="true" />
                        </td>
                        <td>
                            <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H2" CssClass="CommonContentBoxHeader">
                                <ContentTemplate><CSControl:MessageData runat="server" Property="Title" /></ContentTemplate>
                            </CSControl:Title>
	                        <div class="CommonContentBoxContent">
	                            <CSControl:ResourceControl runat="server" ResourceName="CreateNewAccount_NewUserMessage">
	                                <Parameter1Template><CSControl:MessageData Property="Body" runat="server" /></Parameter1Template>
	                                <Parameter2Template><CSControl:UserData runat="server" LinkTo="EditProfile" ResourceName="CreateNewAccount_EditProfileLink" UseAccessingUser="true" /></Parameter2Template>
	                                <Parameter3Template><CSControl:SiteUrl runat="server" UrlName="Home" ResourceName="CreateNewAccount_NewUserMessage_Home" /></Parameter3Template>
	                            </CSControl:ResourceControl>
                            </div>
                        </td>
                    </tr>
                </table>
            </TrueContentTemplate>
            <FalseContentTemplate>
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions>
                        <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="MessageID" Operator="EqualTo" ComparisonValue="14" />
                    </ContentConditions>
                    <TrueContentTemplate>
                        <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H2" CssClass="CommonContentBoxHeader">
                            <ContentTemplate><CSControl:MessageData runat="server" Property="Title" /></ContentTemplate>
                        </CSControl:Title>
	                    <div class="CommonContentBoxContent">
                            <CSControl:ResourceControl runat="server" ResourceName="UserNotFound_Message">
                                <Parameter1Template><CSControl:MessageData Property="Body" runat="server" /></Parameter1Template>
                                <Parameter2Template><CSControl:SiteUrl runat="server" UrlName="search_ForUser" ResourceName="UserNotFound_Message_Here" /></Parameter2Template>
                            </CSControl:ResourceControl>
                        </div>
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H2" CssClass="CommonContentBoxHeader">
                            <ContentTemplate><CSControl:MessageData runat="server" Property="Title" /></ContentTemplate>
                        </CSControl:Title>
	                    <div class="CommonContentBoxContent">
                            <CSControl:MessageData Property="Body" runat="server" />
                        </div>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
            </FalseContentTemplate>
        </CSControl:ConditionalContent>
    </div>
</div>

</asp:Content>