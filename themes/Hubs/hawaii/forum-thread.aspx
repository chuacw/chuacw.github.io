<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" %>
<%@ Register TagPrefix="CSUserControls" TagName="QuestionAnswerView" Src="forum-thread-questionanswerview.ascx" %>
<%@ Register TagPrefix="CSUserControls" TagName="FlatView" Src="forum-thread-flatview.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSForum:ForumData LinkTo="HomePage" Text="Discussions" runat="server" />
        &raquo;
        <CSForum:ThreadData LinkTo="thread" Property="Subject" runat="server" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSForum:ThreadData runat="server" Property="Subject" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <CSControl:ConditionalAction runat="server">
        <Conditions Operator="Not"><CSForum:ForumPermissionCondition runat="server" Permission="Read" /></Conditions>
        <Actions><CSControl:GoToMessageAction runat="server" MessageType="AccessDenied" /></Actions>
    </CSControl:ConditionalAction>
    
    <CSControl:ConditionalContent runat="server">
        <ContentConditions Operator="And">
            <CSForum:ForumConfigurationPropertyValueComparison ID="ForumConfigurationPropertyComparison2" ComparisonProperty="EnableThreadStatus" Operator="IsSetOrTrue" runat="server" />
            <CSForum:ThreadPropertyValueComparison runat="server" ComparisonProperty="ThreadType" ComparisonValue="QuestionAndAnswer" Operator="EqualTo" />
        </ContentConditions>
        <TrueContentTemplate><CSUserControls:QuestionAnswerView runat="server" /></TrueContentTemplate>
        <FalseContentTemplate><CSUserControls:FlatView runat="server" /></FalseContentTemplate>
    </CSControl:ConditionalContent>
    
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="rcr" />