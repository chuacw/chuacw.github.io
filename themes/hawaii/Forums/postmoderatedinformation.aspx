<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSForum:BreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSForum:BreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<div style="width: 50%; margin: 100px auto;">
    <div class="CommonContentBox">
        <CSControl:Title ResourceName="PostPendingModeration_Title" runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H2" CssClass="CommonContentBoxHeader" />
	    <div class="CommonContentBoxContent">
            <CSControl:ResourceControl runat="server" ResourceName="PostPendingModeration_Body">
                <Parameter1Template><CSForum:ForumData LinkTo="HomePage" Property="Name" runat="server" /></Parameter1Template>
            </CSControl:ResourceControl>
        </div>
    </div>
</div>
		                
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server" />