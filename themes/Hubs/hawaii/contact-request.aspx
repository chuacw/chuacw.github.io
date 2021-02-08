<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/Themes/hawaii/Common/modal.Master" Inherits="CommunityServer.Hubs.Controls.CSHubThemePage" %>


<asp:Content ContentPlaceHolderID="bcr" runat="server">
        
        <CSControl:Title runat="server" IncludeSiteName="false" EnableRendering="false">
            <ContentTemplate><CSHub:HubContactRequestData runat="server" Property="Subject" /></ContentTemplate>
        </CSControl:Title>
        
        <script type="text/javascript">
            function confirmRequestDelete()
            {
                return window.confirm('Are you sure you want to delete this contact request?');
            }
        </script>
            
        <div class="CommonContentBoxContent">

            <div class="CustomAvatarListItemCustomAvatar">
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions>
                        <CSHub:HubContactRequestPropertyValueComparison runat="server" ComparisonProperty="IsModerated" Operator="IsSetOrTrue" />
                    </ContentConditions>
                    <TrueContentTemplate>
                        <CSControl:ThemeImage runat="server" ImageUrl="~/images/Common/spam.png" ToolTip="Possible Spam: Not Emailed" />
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <CSControl:ThemeImage runat="server" ImageUrl="~/images/Common/published.png" ToolTip="Message Emailed" />
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
            </div>
            <CSHub:HubContactRequestData runat="server" style="float:left;" Property="Subject" Tag="H4" CssClass="CommonAvatarListItemName" />
            <div style="float:right;width:100px;margin-top:0px;">
                <CSHub:ApproveDeleteHubContactRequestForm runat="server" 
                    ApproveButtonId="ApproveRequest"
                    DeleteButtonId="DeleteRequest"
                >
                    <SuccessActions>
                        <CSControl:RefreshPageAction runat="server" WindowNameScript="window.parent" />
                    </SuccessActions>
                    <FormTemplate>
                        <CSControl:ResourceLinkButton runat="server" ID="DeleteRequest" OnClientClick="return confirmRequestDelete();" ResourceName="Delete" />
                        <CSControl:PlaceHolder runat="server">
                            <DisplayConditions>
                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ApproveRequest" ControlVisiblilityEquals="true" />
                            </DisplayConditions>
                            <ContentTemplate> | </ContentTemplate>
                        </CSControl:PlaceHolder>
                        <CSControl:ResourceLinkButton runat="server" ID="ApproveRequest" ResourceName="Approve" />
                    </FormTemplate>    
                </CSHub:ApproveDeleteHubContactRequestForm>
            </div>
            <div style="margin-top:35px; padding-left: 70px;">
                <CSHub:HubContactRequestData runat="server" Property="Body" CssClass="CommonAvatarListItem" />
                <div class="CommonAvatarListItemDetails">
                    <CSHub:HubContactRequestData runat="server" Property="CreationDate" FormatString="ddd, MMM MM yyyy h:mm tt" />
                    <CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_By" />
                    <CSHub:HubContactRequestData runat="server" Property="Name" LinkTo="MailTo" />
                </div>
            </div>

        </div>

</asp:Content>