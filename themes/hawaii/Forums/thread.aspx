<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Discussions.Controls.CSForumThemePage" MasterPageFile="forums.Master" %>
<%@ Register TagPrefix="CSUserControls" TagName="QuestionAnswerView" Src="thread-questionanswerview.ascx" %>
<%@ Register TagPrefix="CSUserControls" TagName="FlatView" Src="thread-flatview.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <CSForum:BreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSForum:BreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSForum:ThreadData ID="ThreadData1" runat="server" Property="Subject" /></ContentTemplate>
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

<asp:Content ContentPlaceHolderID="rcr" runat="server" />