<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSControl:ConditionalAction runat="server">
        <Actions>
            <CSControl:GoToMessageAction runat="server" />
        </Actions>
        <Conditions Operator="not">
            <CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="EnableConversations" Operator="issetortrue" />
        </Conditions>
    </CSControl:ConditionalAction>
    
    <div class="CommonBreadCrumbArea">
        <div class="Common">
            <CSControl:SiteUrl UrlName="home" ResourceName="Home" runat="server" />
            &raquo;
            <CSControl:UserData runat="server" LinkTo="UserConversations" ResourceName="ViewUserProfile_AllConversations" UseAccessingUser="true" />
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" Tag="H1" CssClass="CommonTitle" EnableRendering="true" ResourceName="Home_YourConversations" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:UserPropertyValueComparison UseAccessingUser="true" runat="server" ComparisonProperty="IsAnonymous" Operator="issetortrue" /></Conditions>
        <Actions>
            <CSControl:GoToSiteUrlAction runat="server" UrlName="login">
                    <Parameter1Template><CSControl:ModifiedUrl runat="server" RenderRawUrl="true" Encoding="URL" /></Parameter1Template>
            </CSControl:GoToSiteUrlAction>
        </Actions>
    </CSControl:ConditionalAction>

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

            <CSMessage:ConversationList runat="server" ShowHeaderFooterOnNone="false" ControlIdsToHideWhenNotVisible="ViewAllConversations">
                <QueryOverrides runat="server" PageSize="15" PagerID="ConversationPager" />
	            <HeaderTemplate>
		            <div class="CommonListArea">
	                <script type="text/javascript">
                        function confirmConversationDelete()
                        {
                            return window.confirm('Are you sure you want to delete this conversation?');
                        }
                    </script>
		            <table width="100%" cellpadding="0" cellspacing="0" border="0">
			            <thead>
				            <tr>
					            <th class="CommonListHeader" colspan="2">Conversation</th>
					            <th class="CommonListHeader">With</th>
					            <th class="CommonListHeader">&nbsp;</th>
				            </tr>
			            </thead>
			            <tbody>
	            </HeaderTemplate>
	            <ItemTemplate>
	                <CSMessage:ConversationMessageList runat="server">
                        <QueryOverrides runat="server" PageSize="1" PageIndex="0" SortOrder="Descending" />
                        <ItemTemplate>
			                <tr class="CommonListRow">
			                    <td class="CommonListCell">
			                        <CSControl:UserData LinkTo="Profile" runat="server">
			                            <ContentTemplate><CSControl:UserAvatar runat="server" Width="32" Height="32" BorderWidth="0" /></ContentTemplate>
			                        </CSControl:UserData>
			                    </td>
				                <td class="CommonListCell" style="width: 50%;">
                                    <CSControl:ConditionalContent runat="server">
			                            <ContentConditions>
			                                <CSMessage:ConversationPropertyValueComparison runat="server" ComparisonProperty="HasRead" Operator="isSetOrTrue" />
			                            </ContentConditions>
			                            <TrueContentTemplate>
			                                <CSMessage:ConversationData runat="server" LinkTo="View">
                                                <ContentTemplate><CSMessage:ConversationMessageData runat="server" Property="Subject" /></ContentTemplate>
                                            </CSMessage:ConversationData>
			                            </TrueContentTemplate>
			                            <FalseContentTemplate>
			                                <CSMessage:ConversationData runat="server" LinkTo="View" Tag="strong">
                                                <ContentTemplate><CSMessage:ConversationMessageData runat="server" Property="Subject" /></ContentTemplate>
                                            </CSMessage:ConversationData>
			                            </FalseContentTemplate>
			                        </CSControl:ConditionalContent>
                                    <div>
				                        Last message by 
				                        <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" />
				                        on
				                        <CSMessage:ConversationMessageData runat="server" Property="DateCreated" IncludeTimeInDate="true" />
					                </div>
				                </td>
				                <td class="CommonListCell" style="width: 40%;">
				                    <CSMessage:ConversationParticipantUserList runat="server" ShowHeaderFooterOnNone="false">
                                        <ItemTemplate><CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" /></ItemTemplate>
                                        <SeparatorTemplate>, </SeparatorTemplate>
                                    </CSMessage:ConversationParticipantUserList>
				                </td>
				                <td class="CommonListCell" style="width: 10%;">
                                    <CSMessage:DeleteConversationForm runat="server" DeleteButtonId="DeleteConversation">
                                        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                        <FormTemplate><CSControl:ResourceButton runat="server" ID="DeleteConversation" ResourceName="ViewUserProfile_DeleteConversation" OnClientClick="return confirmConversationDelete();" /></FormTemplate>
                                    </CSMessage:DeleteConversationForm>
				                </td>
			                </tr>				
                        </ItemTemplate>
                    </CSMessage:ConversationMessageList>
	            </ItemTemplate>
	            <AlternatingItemTemplate>
	                <CSMessage:ConversationMessageList runat="server">
                        <QueryOverrides runat="server" PageSize="1" PageIndex="0" SortOrder="Descending" />
                        <ItemTemplate>
			                <tr class="CommonListRowAlt">
			                    <td class="CommonListCell">
			                        <CSControl:UserData LinkTo="Profile" runat="server">
			                            <ContentTemplate><CSControl:UserAvatar runat="server" Width="32" Height="32" BorderWidth="0" /></ContentTemplate>
			                        </CSControl:UserData>
			                    </td>
				                <td class="CommonListCell" style="width: 50%;">
                                    <CSControl:ConditionalContent runat="server">
			                            <ContentConditions>
			                                <CSMessage:ConversationPropertyValueComparison runat="server" ComparisonProperty="HasRead" Operator="isSetOrTrue" />
			                            </ContentConditions>
			                            <TrueContentTemplate>
			                                <CSMessage:ConversationData runat="server" LinkTo="View">
                                                <ContentTemplate><CSMessage:ConversationMessageData runat="server" Property="Subject" /></ContentTemplate>
                                            </CSMessage:ConversationData>
			                            </TrueContentTemplate>
			                            <FalseContentTemplate>
			                                <CSMessage:ConversationData runat="server" LinkTo="View" Tag="strong">
                                                <ContentTemplate><CSMessage:ConversationMessageData runat="server" Property="Subject" /></ContentTemplate>
                                            </CSMessage:ConversationData>
			                            </FalseContentTemplate>
			                        </CSControl:ConditionalContent>
                                    <div>
				                        Last message by 
				                        <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" />
				                        on
				                        <CSMessage:ConversationMessageData runat="server" Property="DateCreated" IncludeTimeInDate="true" />
					                </div>
				                </td>
				                <td class="CommonListCell" style="width: 40%;">
				                    <CSMessage:ConversationParticipantUserList runat="server" ShowHeaderFooterOnNone="false">
                                        <ItemTemplate><CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" /></ItemTemplate>
                                        <SeparatorTemplate>, </SeparatorTemplate>
                                    </CSMessage:ConversationParticipantUserList>
				                </td>
				                <td class="CommonListCell" style="width: 10%;">
                                    <CSMessage:DeleteConversationForm runat="server" DeleteButtonId="DeleteConversation">
                                        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                        <FormTemplate><CSControl:ResourceButton runat="server" ID="DeleteConversation" ResourceName="ViewUserProfile_DeleteConversation" OnClientClick="return confirmConversationDelete();" /></FormTemplate>
                                    </CSMessage:DeleteConversationForm>
				                </td>
			                </tr>				
                        </ItemTemplate>
                    </CSMessage:ConversationMessageList>
	            </AlternatingItemTemplate>
	            <FooterTemplate>
		            </tbody>
		            </table>
		            </div>
	            </FooterTemplate>
	             <NoneTemplate>
	                <CSControl:ResourceControl runat="server" ResourceName="ViewConversations_NoTopics" />
	            </NoneTemplate>
            </CSMessage:ConversationList>

        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:Pager runat="server" ID="ConversationPager" ShowTotalSummary="true" />
        </div>
    </div>
	
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server"></asp:Content>