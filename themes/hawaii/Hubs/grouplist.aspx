<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true"  MasterPageFile="hubs.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>

<asp:Content runat="server" ContentPlaceHolderID="bbcr">
    <CSHub:GroupBreadCrumb runat="server" Tag="Div" CssClass="CommonBreadCrumbArea">
        <DisplayConditions><CSControl:QueryStringPropertyValueComparison QueryStringProperty="GroupID" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
        <LeaderTemplate><div class="Common"></LeaderTemplate>
        <TrailerTemplate></div></TrailerTemplate>
    </CSHub:GroupBreadCrumb>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">

    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate>
            <CSControl:WrappedLiteral runat="server" Text="Groups">
                <DisplayConditions Operator="Not"><CSHub:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
            </CSControl:WrappedLiteral>
            <CSHub:GroupData Property="Name" runat="server" />
        </ContentTemplate>
    </CSControl:Title>

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    <script type="text/javascript">
        function confirmCancelMembership()
        {
            return window.confirm('Are you sure you want to leave this group?');
        }
    </script>
    
    <div class="CommonContentBox">
    <CSHub:SectionMembershipList runat="server" ShowHeaderFooterOnNone="false">
        <DisplayConditions Operator="Not"><CSHub:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
        <QueryOverrides SortBy="SectionName" SortOrder="Ascending" QueryType="AccessingUserMembership" PageSize="20" PagerID="SectionMembershipPager" MembershipType="Owner,Manager,Member" />
        <HeaderTemplate>
            
                <h2 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_Yours" /></h2>
                <div class="CommonContentBoxContent">
        </HeaderTemplate>
        <ItemTemplate>
            <CSHub:HubData runat="server" CssClass="CommonSideListArea" Tag="Div">
                <ContentTemplate>
                    <CSHub:HubData runat="server" LinkTo="HomePage" Tag="Div" CssClass="CommonSideListImage">
                        <ContentTemplate><CSHub:HubAvatar runat="server" BorderWidth="0" Width="60" Height="60" /></ContentTemplate>
                    </CSHub:HubData>
                    <div class="CommonSideListContent">
                        <CSHub:HubData runat="server" Property="Name" TruncateAt="25" LinkTo="HomePage" Tag="Strong" style="font-size: 110%;" />
                        <CSHub:HubData runat="server" Property="Description" TruncateAt="50" Tag="Div" style="font-size: 90%;" />
                    </div>
                    <div style="clear: both;"></div>
                </ContentTemplate>
            </CSHub:HubData>
        </ItemTemplate>
        <FooterTemplate>
                    <div style="clear: both;"></div>
                </div>
            
        </FooterTemplate>
    </CSHub:SectionMembershipList>
    <CSControl:Pager runat="server" ID="SectionMembershipPager" QueryStringProperty="SectionMembershipPageIndex">
    </CSControl:Pager>
    </div>
    
    
        
    <div class="CommonContentBox">
    
        <%-- Sub-categories for the main group page --%>        
        <CSHub:GroupList runat="server" ShowHeaderFooterOnNone="false" ItemsPerRow="2">
            <DisplayConditions Operator="Not"><CSHub:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
            <QueryOverrides SortBy="Name" SortOrder="Ascending" PageSize="999999" IncludeOnlyTopLevelGroups="true" />
            <HeaderTemplate>
                <h2 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_BrowseByCategory" /></h2>
                <div class="CommonContentBoxContent">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="CommonHierarchalList">
                    <h3 class="CommonHeader">
                        <CSHub:GroupData LinkTo="GroupHome" Property="Name" runat="server" />
                    </h3>
                    <CSHub:GroupData Property="Description" Tag="Div" runat="server" TruncateAt="100" />
                    <CSHub:GroupList runat="server" ShowHeaderFooterOnNone="false">
                        <QueryOverrides SortBy="Name" SortOrder="Ascending" PageSize="4" PagerID="SubGroupPager" />
                        <ItemTemplate><CSHub:GroupData LinkTo="GroupHome" Property="Name" runat="server" /></ItemTemplate>
                        <SeparatorTemplate>, </SeparatorTemplate>
                    </CSHub:GroupList><CSControl:Pager runat="server" ID="SubGroupPager" ShowNext="true" ShowLast="false" ShowFirst="false" ShowPrevious="false" ShowIndividualPages="false">
                        <NextLinkTemplate>, <CSHub:GroupData LinkTo="GroupHome" runat="server" ResourceName="More" /></NextLinkTemplate>
                    </CSControl:Pager>
                </div>
            </ItemTemplate>
            <NoneTemplate>
                <CSControl:ResourceControl runat="server" ResourceName="Hubs_NoGroupCategories" />
            </NoneTemplate>
            <RowSeparatorTemplate><div style="clear: both;"></div></RowSeparatorTemplate>
            <FooterTemplate><div style="clear: both;"></div></div></FooterTemplate>
        </CSHub:GroupList>
        
        <%-- Sub-categories when a category is already selected --%>
        <CSHub:GroupList runat="server" ShowHeaderFooterOnNone="false" ItemsPerRow="2">
            <DisplayConditions><CSHub:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
            <QueryOverrides SortBy="Name" SortOrder="Ascending" PageSize="999999" />
            <HeaderTemplate>
                <h2 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_BrowseByCategory" /></h2>
                <div class="CommonContentBoxContent">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="CommonHierarchalList">
                    <h3 class="CommonHeader"><CSHub:GroupData LinkTo="GroupHome" Property="Name" runat="server" /></h3>
                    <CSHub:GroupData Property="Description" Tag="Div" runat="server" TruncateAt="100" />
                </div>
            </ItemTemplate>
            <RowSeparatorTemplate><div style="clear: both;"></div></RowSeparatorTemplate>
            <FooterTemplate><div style="clear: both;"></div></div></FooterTemplate>
        </CSHub:GroupList>        

        <CSHub:HubList runat="server" ShowHeaderFooterOnNone="false">
            <DisplayConditions><CSHub:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
            <QueryOverrides PageSize="20" SortBy="name" PagerID="GroupListPager" SortOrder="Ascending" IncludeSubGroupSections="true" />
            <LeaderTemplate>
                 <h2 class="CommonContentBoxHeader"><CSControl:ResourceControl runat="server" ResourceName="Hubs_GroupsInCategory" /></h2>
                 <div class="CommonContentBoxContent">
            </LeaderTemplate>
            <ItemTemplate>
                <CSHub:HubData runat="server" CssClass="CommonSideListArea" Tag="Div">
                    <ContentTemplate>
                        <CSHub:HubData runat="server" LinkTo="HomePage" Tag="Div" CssClass="CommonSideListImage">
                            <ContentTemplate><CSHub:HubAvatar runat="server" BorderWidth="0" Width="60" Height="60" /></ContentTemplate>
                        </CSHub:HubData>
                        <div class="CommonSideListContent">
                            <CSHub:HubData runat="server" Property="Name" TruncateAt="25" LinkTo="HomePage" Tag="Strong" style="font-size: 110%;" />
                            <CSHub:HubData runat="server" Property="Description" TruncateAt="50" Tag="Div" style="font-size: 90%;" />
                            <div style="font-size: 90%; color: #000;">
                                <CSControl:ConditionalContent runat="server">
                                    <ContentConditions Operator="Or">
                                        <CSHub:SectionMembershipPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="MembershipType" Operator="EqualTo" ComparisonValue="Owner" />
                                        <CSHub:SectionMembershipPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="MembershipType" Operator="EqualTo" ComparisonValue="Manager" />
                                        <CSHub:SectionMembershipPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="MembershipType" Operator="EqualTo" ComparisonValue="Member" />
                                        <CSHub:SectionMembershipPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="MembershipType" Operator="EqualTo" ComparisonValue="PendingMember" />
                                    </ContentConditions>
                                    <TrueContentTemplate>
                                        <CSControl:ConditionalContent runat="server">
                                            <ContentConditions><CSHub:SectionMembershipPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="MembershipType" Operator="EqualTo" ComparisonValue="PendingMember" /></ContentConditions>
                                            <TrueContentTemplate>
                                                <CSControl:ResourceControl runat="server" ResourceName="Hubs_MembershipPending" />
                                            </TrueContentTemplate>
                                            <FalseContentTemplate>
                                                <CSHub:CancelMembershipForm runat="server" DeleteButtonId="CancelMembership">
	                                                <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
	                                                <FormTemplate>
	                                                    <asp:LinkButton ID="CancelMembership" OnClientClick="return confirmCancelMembership();" CausesValidation="false" Text="Leave Group" runat="server" />
	                                                </FormTemplate>
	                                            </CSHub:CancelMembershipForm> 
                                            </FalseContentTemplate>
                                        </CSControl:ConditionalContent>
                                    </TrueContentTemplate>
                                    <FalseContentTemplate>
                                        <CSControl:ConditionalContent runat="server">
                                            <ContentConditions Operator="Not"><CSHub:HubPropertyValueComparison runat="server" ComparisonProperty="IsPublic" Operator="IsSetOrTrue" /></ContentConditions>
                                            <TrueContentTemplate>
                                                <CSHub:RequestMembershipForm runat="server" SubmitButtonId="RequestMembershipButton">
                                                    <RequestAcceptedActions>
                                                        <CSControl:GoToModifiedUrlAction runat="server" />
                                                    </RequestAcceptedActions>
                                                    <RequestSentActions>
                                                        <CSControl:GoToModifiedUrlAction runat="server" />
                                                    </RequestSentActions>
                                                    <FormTemplate>
                                                        <CSControl:ResourceLinkButton runat="server" ID="RequestMembershipButton" ResourceName="Hubs_ApplyToJoin" />
                                                    </FormTemplate>
                                                </CSHub:RequestMembershipForm>
                                            </TrueContentTemplate>
                                            <FalseContentTemplate>
                                                <CSControl:ConditionalContent runat="server">
                                                    <ContentConditions><CSHub:HubPropertyValueComparison runat="server" ComparisonProperty="MembershipIsOpen" Operator="IsSetOrTrue" /></ContentConditions>
                                                    <TrueContentTemplate>
                                                        <CSHub:RequestMembershipForm runat="server" SubmitButtonId="RequestOpenMembershipButton">
                                                            <RequestAcceptedActions>
                                                                <CSControl:GoToModifiedUrlAction runat="server" />
                                                            </RequestAcceptedActions>
                                                            <RequestSentActions>
                                                                <CSControl:GoToModifiedUrlAction runat="server" />
                                                            </RequestSentActions>
                                                            <FormTemplate>
                                                                <CSControl:ResourceLinkButton runat="server" ID="RequestOpenMembershipButton" ResourceName="Hubs_JoinGroup" />
                                                            </FormTemplate>
                                                        </CSHub:RequestMembershipForm>
                                                    </TrueContentTemplate>
                                                    <FalseContentTemplate>
                                                        <CSHub:RequestMembershipForm runat="server" SubmitButtonId="RequestClosedMembershipButton">
                                                            <RequestAcceptedActions>
                                                                <CSControl:GoToModifiedUrlAction runat="server" />
                                                            </RequestAcceptedActions>
                                                            <RequestSentActions>
                                                                <CSControl:GoToModifiedUrlAction runat="server" />
                                                            </RequestSentActions>
                                                            <FormTemplate>
                                                                <CSControl:ResourceLinkButton runat="server" ID="RequestClosedMembershipButton" ResourceName="Hubs_ApplyToJoin" />
                                                            </FormTemplate>
                                                        </CSHub:RequestMembershipForm>
                                                    </FalseContentTemplate>
                                                </CSControl:ConditionalContent>
                                            </FalseContentTemplate>
                                        </CSControl:ConditionalContent>
                                    </FalseContentTemplate>
                                </CSControl:ConditionalContent>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                    </ContentTemplate>
                </CSHub:HubData>
            </ItemTemplate>
            <NoneTemplate><CSControl:ResourceControl runat="server" ResourceName="Hubs_NoGroupsInCategory" /></NoneTemplate>
            <FooterTemplate><div style="clear: both;"></div></FooterTemplate>
            <TrailerTemplate></div></TrailerTemplate>
        </CSHub:HubList>
        <CSControl:Pager runat="server" ID="GroupListPager" QueryStringProperty="GroupPageIndex">
            <DisplayConditions>
                <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="GroupID" Operator="IsSetOrTrue" />
            </DisplayConditions>
        </CSControl:Pager>
    </div>
    
</asp:Content>