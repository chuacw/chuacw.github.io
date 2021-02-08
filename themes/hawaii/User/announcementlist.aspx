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
            <CSControl:UserData runat="server" LinkTo="announcements" ResourceName="ViewUserProfile_Announcements" />
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" Tag="H1" CssClass="CommonTitle" EnableRendering="true" IncludeSiteName="true">
        <ContentTemplate><CSControl:UserData Property="DisplayName" runat="server" />'s Announcements</ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">

    <div class="CommonSidebar">
        <CSUserControl:UserBadgeArea runat="server" />
    </div>	    

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox Highlighted">
        <div class="CommonContentBoxContent">
            <CSMessage:ProfileMessageList runat="server" ShowHeaderFooterOnNone="true">
                <QueryOverrides runat="server" QueryType="AnnouncementsForCurrentUser" PagerID="AnnouncementsPager" PageSize="15" />
                <HeaderTemplate><ul class="CommonContentBoxList"></HeaderTemplate>
                <ItemTemplate>
                    <CSMessage:ProfileMessageData runat="server" Property="DateCreated" Tag="Li" CssClass="Header">
                        <DisplayConditions><CSControl:CustomCondition CustomResult='<%# ShowDateHeader("Announcements", Eval("DateCreated")) %>' runat="server" /></DisplayConditions>
                    </CSMessage:ProfileMessageData>
                    <li>
                        <div class="CommonMessageActions">
                            <CSMessage:ProfileMessageData runat="server" ResourceName="Edit" LinkTo="Edit">
                                <TrailerTemplate> | </TrailerTemplate>
                            </CSMessage:ProfileMessageData>
                            <CSMessage:DeleteProfileMessageForm runat="server" DeleteButtonId="DeleteAnnouncement" ConfirmationResourceName="ViewUserProfile_DeleteAnnouncementConfirmation">
                                <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                <FormTemplate><asp:LinkButton runat="server" id="DeleteAnnouncement" Text="Delete" /></FormTemplate>
                            </CSMessage:DeleteProfileMessageForm>
                        </div>                
                        <div class="CommonMessageHeader">
                            <CSMessage:ProfileMessageData runat="server" Property="Subject" Tag="Strong" />
                        </div>
                        <CSMessage:ProfileMessageData runat="server" Property="Body" Tag="Div" />
                    </li>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
                <NoneTemplate>
                    <CSControl:UserData runat="server" Property="DisplayName" ResourceName="ViewUserProfile_NoAnnouncements" />
                </NoneTemplate>
	        </CSMessage:ProfileMessageList>
	    </div>
	    <div class="CommonContentBoxFooter">
	        <CSControl:Pager runat="server" ID="AnnouncementsPager" >
                <TrailerTemplate> | </TrailerTemplate>
             </CSControl:Pager>
             <CSControl:UserData LinkTo="AnnouncementsRss" Text="RSS" runat="server" />
	    </div>
    </div>
	
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server"></asp:Content>