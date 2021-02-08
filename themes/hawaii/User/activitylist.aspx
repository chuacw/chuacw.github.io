<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="UserBadgeArea" Src="UserBadgeArea.ascx" %>

<script runat="server" language="C#">

    DateTime lastDate = DateTime.MinValue;
    string lastDateKey = string.Empty;
    CommunityServer.Components.User user = CommunityServer.Components.CSContext.Current.User;

    public bool ShowDateHeader(string key, object date)
    {
        DateTime currDate = user.GetTimezone((DateTime)date).Date;
        if (currDate != lastDate || key != lastDateKey)
        {
            lastDateKey = key;
            lastDate = currDate;
            return true;
        }
        else
            return false;
    }

</script>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea">
        <div class="Common">
            <CSControl:UserData runat="server" LinkTo="profile" Property="DisplayName" />
             &raquo;
            <CSControl:UserData runat="server" LinkTo="activities" ResourceName="ViewUserProfile_RecentActivityTab" />
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" Tag="H1" CssClass="CommonTitle" EnableRendering="true" IncludeSiteName="true">
        <ContentTemplate><CSControl:UserData Property="DisplayName" runat="server" />'s Activity</ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">

    <div class="CommonSidebar">
        <CSUserControl:UserBadgeArea runat="server" />
    </div>	    

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
   <script type="text/javascript">
        function confirmActivityDelete()
        {
            return window.confirm('<%# CommunityServer.Components.ResourceManager.GetString("Activity_DeleteConfirmation") %>');
        }
    </script>
    <div class="CommonContentBox TitleHighlighted">
        <div class="CommonContentBoxContent">
            <CSMessage:ActivityMessageList runat="server" ShowHeaderFooterOnNone="false">
                <QueryOverrides QueryType="CurrentUserActivity" PageSize="20" PagerID="UserActivityPager" />
                <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
                <ItemTemplate>
                    <ItemTemplate>
                        <CSMessage:ActivityMessageData runat="server" Property="DateCreated" Tag="Li" CssClass="Header">
                            <DisplayConditions><CSControl:CustomCondition CustomResult='<%# ShowDateHeader("Activity", Eval("DateCreated")) %>' runat="server" /></DisplayConditions>
                        </CSMessage:ActivityMessageData>
                        <CSMessage:ActivityMessageData Property="Type" Text="&lt;li class=&quot;CommonActivity {0}&quot;&gt;" runat="server" />
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr valign="top">
                                    <td align="left" class="CommonActivityContent">
                                        <CSMessage:ActivityMessageData runat="server" Property="Body" />            
                                    </td>
                                    <td align="right">
                                        <CSMessage:DeleteActivityMessageForm runat="server" DeleteButtonId="DeleteActivity">
                                            <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                            <FormTemplate>
                                                    <CSControl:ResourceLinkButton runat="server" ID="DeleteActivity" ToolTip="Delete Activity Message" OnClientClick="return confirmActivityDelete();">
                                                        <CSControl:ThemeImage runat="server" ImageUrl="~/images/common/x-delete-icon.png" BorderWidth="0" />
                                                    </CSControl:ResourceLinkButton>
                                            </FormTemplate>
                                        </CSMessage:DeleteActivityMessageForm>
                                    </td>
                                </tr>
                            </table>
                        </li>
                    </ItemTemplate>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </CSMessage:ActivityMessageList>
        </div>
        <div class="CommonContentBoxFooter">
             <CSControl:Pager runat="server" ID="UserActivityPager">
                <TrailerTemplate> | </TrailerTemplate>
             </CSControl:Pager>
             <CSControl:UserData LinkTo="ActivitiesRss" Text="RSS" runat="server" />
        </div>
    </div>
	
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server"></asp:Content>