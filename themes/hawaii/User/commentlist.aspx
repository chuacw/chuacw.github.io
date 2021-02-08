<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="UserBadgeArea" Src="UserBadgeArea.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea">
        <div class="Common">
            <CSControl:UserData runat="server" LinkTo="profile" Property="DisplayName" />
             &raquo;
            <CSControl:UserData runat="server" LinkTo="comments" ResourceName="ViewUserProfile_Tab_Comments" />
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" Tag="H1" CssClass="CommonTitle" EnableRendering="true" IncludeSiteName="true">
        <ContentTemplate><CSControl:UserData Property="DisplayName" runat="server" />'s Comments</ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="lcr" runat="server">

    <div class="CommonSidebar">
        <CSUserControl:UserBadgeArea runat="server" />
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

	<div class="CommonContentBox">
        <div class="CommonContentBoxContent">
            <script type="text/javascript">
                function confirmCommentDelete() { return window.confirm('<CSControl:ResourceControl runat="server" ResourceName="ViewUserProfile_DeleteMessageConfirmation" Encoding="JavaScript" />'); }
            </script>
            <CSMessage:ProfileMessageList runat="server" ShowHeaderFooterOnNone="false">
                <QueryOverrides runat="server" QueryType="CommentsForCurrentUser" PageSize="20" PagerID="CommentsPager" />
                <ItemTemplate>
                    <div class="CommonCommentArea">
                        <div class="CommonCommentUser">
                            <CSControl:UserData runat="server" LinkTo="Profile">
                                <ContentTemplate>
                                    <CSControl:UserAvatar runat="server" BorderWidth="0" Width="60" Height="60" />
                                </ContentTemplate>
                            </CSControl:UserData>
                        </div>
                        <div class="CommonCommentArrow"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div><div class="r5"></div><div class="r6"></div><div class="r7"></div><div class="r8"></div><div class="r9"></div><div class="r10"></div></div>
                        <div class="CommonCommentBubble">
                            <div class="CommonCommentBubbleRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                            <div class="CommonCommentContent">
                                <CSMessage:DeleteProfileMessageForm runat="server" DeleteButtonId="DeleteComment" Tag="Div" CssClass="CommonMessageActions">
                                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                    <FormTemplate><CSControl:ResourceLinkButton runat="server" id="DeleteComment" ResourceName="ViewUserProfile_DeleteComment" OnClientClick="return confirmCommentDelete();" /></FormTemplate>
                                </CSMessage:DeleteProfileMessageForm>
                                <div class="CommonMessageHeader">
                                    <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" Tag="Strong" /> 
                                    wrote
                                    <CSMessage:ProfileMessageData runat="server" Property="Subject" Tag="Strong" />
                                </div>
                                <div class="CommonMessageDate">
                                    on <CSMessage:ProfileMessageData runat="server" Property="DateCreated" IncludeTimeInDate="true" />
                                </div>
                                
                                <CSMessage:ProfileMessageData runat="server" Property="Body" Tag="Div" />
                            </div>
                            <div class="CommonCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                        </div>
                        <div style="clear: both;"></div>
                    </div>     
                </ItemTemplate>
                <NoneTemplate>
	                <CSControl:UserData Property="DisplayName" runat="server" /> does not have any comments.
	            </NoneTemplate>
            </CSMessage:ProfileMessageList>
        </div>
        <div class="CommonContentBoxFooter">
            <CSControl:Pager runat="server" ID="CommentsPager">
                <TrailerTemplate> | </TrailerTemplate>
             </CSControl:Pager>
             <CSControl:UserData LinkTo="CommentsRss" Text="RSS" runat="server" />
        </div>
    </div>
	
	

    

	
	
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server"></asp:Content>