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
    
    <CSControl:PlaceHolder runat="server">
        <DisplayConditions>
            <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="ConversationID" Operator="IsSetOrTrue" />
        </DisplayConditions>
        <ContentTemplate>
            <div class="CommonBreadCrumbArea">
            <div class="Common">
                <CSControl:SiteUrl UrlName="home" ResourceName="Home" runat="server" />
                 &raquo; 
                <CSControl:UserData runat="server" LinkTo="UserConversations" ResourceName="ViewUserProfile_AllConversations" UseAccessingUser="true" />
                 &raquo; 
                <CSMessage:ConversationMessageList runat="server">
                    <QueryOverrides runat="server" PageSize="1" SortOrder="descending" />
                    <ItemTemplate>
                        <CSMessage:ConversationData runat="server" LinkTo="view">
                            <ContentTemplate>
                                <CSMessage:ConversationMessageData runat="server" Property="Subject" />
                            </ContentTemplate>
                        </CSMessage:ConversationData>
                    </ItemTemplate>
                </CSMessage:ConversationMessageList>
            </div>
            </div>
        </ContentTemplate>
    </CSControl:PlaceHolder>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" Tag="H1" CssClass="CommonTitle" EnableRendering="true">
        <ContentTemplate>
            <CSMessage:ConversationMessageList runat="server">
                <QueryOverrides runat="server" PageSize="1" SortOrder="descending" />
                <ItemTemplate>
                    <CSMessage:ConversationData runat="server">
                        <ContentTemplate><CSMessage:ConversationMessageData runat="server" Property="Subject" /></ContentTemplate>
                    </CSMessage:ConversationData>
                </ItemTemplate>
            </CSMessage:ConversationMessageList>
        </ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

	<div class="CommonContentBox">
        <div class="CommonContentBoxContent">
        
            <CSMessage:ConversationMessageList runat="server" UpdateReadStatus="true">
                <QueryOverrides runat="server" PageSize="999999" PageIndex="0" SortOrder="Ascending"  />
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
                            <div style="display: inline-table; width: 99%;">
                            <div class="CommonCommentBubbleRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                            <div class="CommonCommentContent">
                                <div class="CommonMessageHeader">
                                    <CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" Tag="Strong" /> 
                                    wrote
                                </div>
                                <CSMessage:ConversationParticipantUserList runat="server" ShowHeaderFooterOnNone="false" Tag="Div" CssClass="CommonMessageRecipients">
                                    <HeaderTemplate>to </HeaderTemplate>
                                    <ItemTemplate><CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" /></ItemTemplate>
                                    <SeparatorTemplate>, </SeparatorTemplate>
                                </CSMessage:ConversationParticipantUserList>
                                <div class="CommonMessageDate">
                                    on <CSMessage:ConversationMessageData runat="server" Property="DateCreated" IncludeTimeInDate="true" />
                                </div>
                                
                                <CSMessage:ConversationMessageData runat="server" Property="Body" Tag="Div" />
                            </div>
                            <div class="CommonCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                    </div>     
	          </ItemTemplate>
            </CSMessage:ConversationMessageList>
        
            
            <CSMessage:CreateEditConversationForm runat="server"
                 MessageBodyEditorId="Message"
                 SubmitButtonId="SaveButton"
                 Tag="Div"
                 style="padding-left: 70px;"
            >
                <SuccessActions>
                    <CSControl:GoToModifiedUrlAction runat="server" />
                </SuccessActions>
                <FormTemplate>
                    <h2 class="CommonFormTitle">Reply to this Conversation</h2>
                    <div class="CommonFormArea">
                        <div class="CommonFormField">
                            <CSControl:Editor runat="Server" id="Message" Width="500" Height="180" EnableHtmlModeEditing="false" />
                        </div>
                        <div class="CommonFormFieldName">
                            <CSControl:ResourceButton id="SaveButton" Runat="server" ResourceName="ReplyMessage_Button" />
                        </div>
                    </div>
                </FormTemplate>
            </CSMessage:CreateEditConversationForm>
  
	    </div>
    </div>
	
</asp:Content>

<asp:Content ContentPlaceHolderID="rcr" runat="server"></asp:Content>