<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSControl:SiteUrl UrlName="forumshome" ResourceName="forums" runat="server" />
        &raquo;
        Forum Subscriptions
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="ForumSubscriptionView_Title" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:ConditionalAction runat="server">
        <Conditions><CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></Conditions>
        <Actions><CSControl:GoToMessageAction runat="server" MessageType="AccessDenied" /></Actions>
    </CSControl:ConditionalAction>

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

	        <CSControl:ResourceControl runat="server" ResourceName="ForumSubscriptionView_Description" Tag="Div" CssClass="CommonDescription" />
            
            <CSForum:GroupList runat="server">
                <QueryOverrides PageSize="999999" />
	            <ItemTemplate>
		            <div class="CommonListArea">
		            <CSForum:GroupData runat="server" Property="Name" LinkTo="GroupHome" Tag="H2" CssClass="CommonListTitle" />
		            <CSForum:ForumList runat="server">
		                <QueryOverrides IncludeLinkForums="false" PageSize="999999" />
			            <HeaderTemplate>
				            <table cellpadding="0" cellspacing="0" border="0" width="100%">
				            <thead>
					            <tr>
						            <CSControl:ResourceControl runat="server" ResourceName="ForumSubscriptionView_List_Forum" Tag="Th" CssClass="CommonListHeader" />
						            <CSControl:ResourceControl runat="server" ResourceName="ForumSubscriptionView_List_BidirectionalAddress" Tag="Th" CssClass="CommonListHeader"><DisplayConditions><CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="EnableMailGateway" Operator="IsSetOrTrue" runat="server" /></DisplayConditions></CSControl:ResourceControl>
						            <CSControl:ResourceControl runat="server" ResourceName="ForumSubscriptionView_List_Subscribe" Tag="Th" CssClass="CommonListHeader" />
					            </tr>
				            </thead>
			            </HeaderTemplate>
			            <ItemTemplate>
				            <tr>
					            <td width="60%" class="CommonListCell">
                                    <CSForum:ForumData Property="Name" LinkTo="HomePage" runat="server" Tag="Strong" />
                                    <CSForum:ForumData Property="Description" runat="server" Tag="Div" />
					            </td>
                                <CSControl:PlaceHolder runat="server" Tag="Td" width="30%" CssClass="CommonListCell" style="text-align:center;">
                                    <DisplayConditions>
                                        <CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="EnableMailGateway" Operator="IsSetOrTrue" runat="server" />
                                    </DisplayConditions>    
                                    <ContentTemplate>
                                        <CSMail:MailingListData runat="server" LinkTo="MailingList" Property="EmailAddress" />
                                        <CSControl:ResourceControl runat="server" ResourceName="ForumSubscriptionView_NotificationsOnly">
                                            <DisplayConditions Operator="Not">
                                                <CSControl:Conditions runat="server" Operator="And">
                                                    <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsMailingList" Operator="IsSetOrTrue" />
                                                    <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsActive" Operator="IsSetOrTrue" />
                                                </CSControl:Conditions>
                                            </DisplayConditions>
                                        </CSControl:ResourceControl>
                                    </ContentTemplate>
                                </CSControl:PlaceHolder>
					            <td width="10%" class="CommonListCell" style="text-align: center;">
						            <CSForum:ForumSubscriptionToggleButton ToggleSubscriptionType="Post" runat="server" />
					            </td>
				            </tr>
				            <CSForum:ForumList runat="server">
				                <QueryOverrides IncludeLinkForums="false" PageSize="999999" />
				                <ItemTemplate>
				                    <tr>
					                    <td width="60%" class="CommonListCell"><div style="padding-left: 20px;">
                                            <CSForum:ForumData Property="Name" LinkTo="HomePage" runat="server" Tag="Strong" />
                                            <CSForum:ForumData Property="Description" runat="server" Tag="Div" />
					                    </div></td>
                                        <CSControl:PlaceHolder runat="server" Tag="Td" width="30%" CssClass="CommonListCell" style="text-align:center;">
                                            <DisplayConditions>
                                                <CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="EnableMailGateway" Operator="IsSetOrTrue" runat="server" />
                                            </DisplayConditions>    
                                            <ContentTemplate>
                                                <CSMail:MailingListData runat="server" LinkTo="MailingList" Property="EmailAddress" />
                                                <CSControl:ResourceControl runat="server" ResourceName="ForumSubscriptionView_NotificationsOnly">
                                                    <DisplayConditions Operator="Not">
                                                        <CSControl:Conditions runat="server" Operator="And">
                                                            <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsMailingList" Operator="IsSetOrTrue" />
                                                            <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsActive" Operator="IsSetOrTrue" />
                                                        </CSControl:Conditions>
                                                    </DisplayConditions>
                                                </CSControl:ResourceControl>                               
                                            </ContentTemplate>
                                        </CSControl:PlaceHolder>
					                    <td width="10%" class="CommonListCell" style="text-align: center;">
						                    <CSForum:ForumSubscriptionToggleButton ToggleSubscriptionType="Post" runat="server" />
					                    </td>
				                    </tr>
                                    <CSForum:ForumList runat="server">
                                        <QueryOverrides IncludeLinkForums="false" PageSize="999999" />
				                        <ItemTemplate>
				                            <tr>
					                            <td width="60%" class="CommonListCell"><div style="padding-left: 40px;">
                                                    <CSForum:ForumData Property="Name" LinkTo="HomePage" runat="server" Tag="Strong" />
                                                    <CSForum:ForumData Property="Description" runat="server" Tag="Div" />
					                            </div></td>
                                                <CSControl:PlaceHolder runat="server" Tag="Td" width="30%" CssClass="CommonListCell" style="text-align:center;">
                                                    <DisplayConditions>
                                                        <CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="EnableMailGateway" Operator="IsSetOrTrue" runat="server" />
                                                    </DisplayConditions>    
                                                    <ContentTemplate>
                                                        <CSMail:MailingListData runat="server" LinkTo="MailingList" Property="EmailAddress" />
                                                        <CSControl:ResourceControl runat="server" ResourceName="ForumSubscriptionView_NotificationsOnly">
                                                            <DisplayConditions Operator="Not">
                                                                <CSControl:Conditions runat="server" Operator="And">
                                                                    <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsMailingList" Operator="IsSetOrTrue" />
                                                                    <CSMail:MailingListPropertyValueComparison runat="server" ComparisonProperty="IsActive" Operator="IsSetOrTrue" />
                                                                </CSControl:Conditions>
                                                            </DisplayConditions>
                                                        </CSControl:ResourceControl>                               
                                                    </ContentTemplate>
                                                </CSControl:PlaceHolder>
					                            <td width="10%" class="CommonListCell" style="text-align: center;">
						                            <CSForum:ForumSubscriptionToggleButton ToggleSubscriptionType="Post" runat="server" />
					                            </td>
				                            </tr>
                                        </ItemTemplate>
				                    </CSForum:ForumList>
                                </ItemTemplate>
				            </CSForum:ForumList>
			            </ItemTemplate>
			            <FooterTemplate>
				            </table>
			            </FooterTemplate>
			            <NoneTemplate>
                            <CSControl:ResourceControl runat="server" ResourceName="ForumSubscriptionView_NoEmailListsAvailable">
                                <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="EnableMailGateway" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                                <LeaderTemplate><tr><td colspan="3" class="CommonListCell" style="text-align: center;"></LeaderTemplate>
                                <TrailerTemplate></td></tr></TrailerTemplate>
                            </CSControl:ResourceControl>
                            <CSControl:ResourceControl runat="server" ResourceName="ForumSubscriptionView_NoEmailListsAvailable">
                                <DisplayConditions Operator="Not"><CSControl:SiteSettingsPropertyValueComparison ComparisonProperty="EnableMailGateway" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                                <LeaderTemplate><tr><td colspan="2" class="CommonListCell" style="text-align: center;"></LeaderTemplate>
                                <TrailerTemplate></td></tr></TrailerTemplate>
                            </CSControl:ResourceControl>
			            </NoneTemplate>
		            </CSForum:ForumList>
	                </div>
	            </ItemTemplate>
            </CSForum:GroupList>
        </div>
	</div>
	
</asp:Content>