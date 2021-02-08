<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="theme.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="Tabs" Src="~/themes/hawaii/wikis/tabs.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSWiki:WikiData LinkTo="HomePage" runat="server" ResourceName="Hubs_Wiki" />
        &raquo;
        <CSWiki:PageData Property="Title" LinkTo="Page" runat="server" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSWiki:PageData runat="server" Property="Title" /></ContentTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
<CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="false">
    <ContentTemplate><CSWiki:PageData runat="server" Property="Title" /></ContentTemplate>
</CSControl:Title>

<div class="CommonContentBox">
    <div class="CommonContentBoxContent">
        <div style="float: right" class="NoPrint">
            <CSWiki:WikiData LinkTo="CreatePage" runat="server" LinkCssClass="WikiAddButton">
                <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Wikis_AddPage" /></span></ContentTemplate>
           </CSWiki:WikiData>
        </div>
        
        <CSUserControl:Tabs runat="server" SelectedTab="Article" />

        <div class="CommonPane">
            <div class="CommonGroupedContentArea">                

                <CSControl:PlaceHolder ID="PlaceHolder1" runat="server" CssClass="CommonContentBoxHeaderSmall NoPrint" Tag="H2">
                    <ContentTemplate>
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions runat="server">
                                <CSWiki:PagePropertyValueComparison runat="server" ComparisonProperty="RatingCount" Operator="GreaterThan" ComparisonValue="0" />
                            </ContentConditions>
                            <TrueContentTemplate>
                                <CSWiki:PageRating runat="server"
                                    RatingGoodImageUrl="~/utility/images/thumbsup.png"
                                    RatingBadImageUrl="~/utility/images/thumbsdown.png"
                                    RatingContainerCssClass="WikiCurrentRating NoPrint"
                                    RatingGoodCssClass="WikiRatingGood"
                                    RatingBadCssClass="WikiRatingBad"
                                    Show="CurrentRating"
                                    ThankYouMessage="" 
                                />
                            </TrueContentTemplate>
                            <FalseContentTemplate>
                                <CSWiki:PageRating runat="server"
                                    RatingGoodImageUrl="~/utility/images/norating.png"
                                    RatingBadImageUrl="~/utility/images/thumbsdown.png"
                                    RatingContainerCssClass="WikiCurrentRating NoPrint"
                                    RatingGoodCssClass=""
                                    RatingBadCssClass="WikiRatingBad"
                                    Show="CurrentRating"
                                    ThankYouMessage="" 
                                />
                            </FalseContentTemplate>
                        </CSControl:ConditionalContent>
                    
                        <CSWiki:PageData ID="PageData5" runat="server" Property="Title" Tag="Span" LinkTo="Page" />
                        <CSControl:ConditionalContent ID="ConditionalContent1" runat="server">
                            <ContentConditions><CSWiki:PagePropertyValueComparison ID="PagePropertyValueComparison1" runat="server" ComparisonProperty="IsLocked" ComparisonValue="True" Operator="EqualTo" /></ContentConditions>
                            <TrueContentTemplate><CSControl:ThemeImage ID="ThemeImage1" align="absmiddle" border="0" runat="server" ImageUrl="~/images/common/locked.gif" AlternateTextResourceName="Wikis_Page_Is_Locked" /></TrueContentTemplate>
                            <FalseContentTemplate></FalseContentTemplate>
                        </CSControl:ConditionalContent>
                        
                        <div style="clear: both;"></div>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
                                
                <div class="CommonDescription NoPrint" style="font-size: 90%;">
                    <CSWiki:PageTagEditableList EditorCssClass="CommonInlineTagEditor" runat="server" />
                </div>
                <CSWiki:PageData runat="server" Property="Body" Tag="Div" />
                
                <CSWiki:PageRating runat="server" 
                    RatingContainerCssClass="WikiRatingForm NoPrint" 
                    RatingContainerActiveCssClass="WikiRatingFormActive"
                    YesButtonCssClass="WikiRatingYes"
                    NoButtonCssClass="WikiRatingNo"
                    RatingButtonsContainerCssClass="WikiRatingButtons"
                    RatingButtonsDescriptionCssClass="WikiRatingButtonsDescription"
                    IsReadOnly="false"
                    Show="RatingForm"
                    ThankYouMessage=""  />
            </div>
        
        </div>
    </div>
</div>


<div class="CommonContentBox">
    <div style="float: right;" class="NoPrint">
        <CSControl:ConditionalContent runat="server">
            <ContentConditions runat="server">
                <CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" UseAccessingUser="true" />
            </ContentConditions>
            <TrueContentTemplate>
                <CSControl:UserData LinkTo="Login" runat="server" UseAccessingUser="true" LinkCssClass="WikiAddButton">
                    <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Wikis_AddComment" /></span></ContentTemplate>
                </CSControl:UserData>
            </TrueContentTemplate>
            <FalseContentTemplate>
                <CSWiki:PageData LinkTo="Comments" runat="server" LinkTargetLocationModification="addcomment" LinkCssClass="WikiAddButton">
                    <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Wikis_AddComment" /></span></ContentTemplate>
               </CSWiki:PageData>
            </FalseContentTemplate>
        </CSControl:ConditionalContent>
    </div>
    <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_RecentComments" Tag="H3" CssClass="CommonContentBoxHeader" />
    <div class="CommonContentBoxContent">
        <CSWiki:PageCommentList runat="server">
            <QueryOverrides PageSize="5" SortBy="MostRecent"  />
            <ItemTemplate>
                <div class="WikiCommentArea">
                    <div class="WikiCommentBubble">
                        <div class="WikiCommentBubbleRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                        <div class="WikiCommentContent">
                            <CSControl:UserData runat="server" LinkTo="Profile" CssClass="WikiCommentHeaderIcon">
                                <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
                                <ContentTemplate>
                                    <CSControl:UserAvatar runat="server" BorderWidth="0" Width="32" Height="32" />
                                </ContentTemplate>
                            </CSControl:UserData>
                            <CSControl:UserAvatar runat="server" BorderWidth="0" Width="32" Height="32" CssClass="WikiCommentHeaderIcon">                                
                                    <DisplayConditions><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
                                </CSControl:UserAvatar>
                            <div class="WikiCommentHeader">
                                By: 
                                <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile"  />
                                Posted on 
                                <CSWiki:PageCommentData runat="server" Property="PublishedDate" IncludeTimeInDate="true" />
                                <CSWiki:PageCommentRating ID="WikiPageCommentRating" runat="server"
                                    RatingContainerCssClass="WikiRatingSmall" 
                                    RatingGoodCssClass="WikiRatingGoodSmall" 
                                    RatingBadCssClass="WikiRatingBadSmall" 
                                    RatingContainerActiveCssClass="WikiRatingActiveSmall" 
                                    RatingButtonsDescriptionCssClass="WikiRatingButtonsDescription"
                                    RatingButtonsContainerCssClass="WikiRatingButtons"
                                    YesButtonCssClass="WikiRatingYesSmall"
                                    NoButtonCssClass="WikiRatingNoSmall"
                                    IsReadOnly="true" />
                            </div>
                            <div style="clear: both;"></div>
                            
                            <CSWiki:PageCommentData runat="server" Property="FormattedBody" Tag="Div" />

                            <div style="float: right; font-size: 80%;" class="NoPrint">
                                <CSWiki:DeletePageCommentForm DeleteButtonId="DeleteComment" ConfirmationResourceName="Wikis_PageComment_DeleteVerify" runat="server">
                                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
                                    <FormTemplate><asp:LinkButton runat="server" Text="Delete" ID="DeleteComment" /></FormTemplate>
                                </CSWiki:DeletePageCommentForm>
                                <CSWiki:PageCommentData LinkTo="Edit" Text="Edit" runat="server"><LeaderTemplate> | </LeaderTemplate></CSWiki:PageCommentData>
                            </div><div style="clear: both;"></div>
                        </div>
                        <div class="WikiCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                    </div>
                    <div class="WikiCommentArrow"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div><div class="r5"></div><div class="r6"></div><div class="r7"></div><div class="r8"></div><div class="r9"></div><div class="r10"></div></div>
                </div>     
            </ItemTemplate>
            <NoneTemplate>
                <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_NoComments" Tag="Div" CssClass="CommonMessageWarning" />
            </NoneTemplate>
            <FooterTemplate>
                </div>
                <div class="CommonContentBoxFooter">
                    <CSWiki:PageData ResourceName="Wikis_Page_ViewAllComments" LinkTo="Comments" runat="server">
                    <DisplayConditions><CSWiki:PagePropertyValueComparison ComparisonProperty="CommentCount" ComparisonValue="0" Operator="GreaterThan" runat="server" /></DisplayConditions>
                    </CSWiki:PageData>
            </FooterTemplate>
        </CSWiki:PageCommentList>
    </div>
</div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcrc" runat="server">
    
    <CSWiki:DeletePageForm runat="server" DeleteSinglePageButtonId="DeletePageLink">
        <SuccessActions>
            <CSControl:GoToSiteUrlAction runat="server" UrlName="hub_wiki">
                <Parameter1Template><CSHub:HubData runat="server" Property="ApplicationKey" /></Parameter1Template>
            </CSControl:GoToSiteUrlAction>
        </SuccessActions>
        <LeaderTemplate>
            <script type="text/javascript">
                function confirmPageDelete()
                {
                    return window.confirm('Are you sure you want to delete this page?');
                }
            </script>
            <ul class="CommonContentBoxList Seperator"><li>
        </LeaderTemplate>
        <FormTemplate>
            <CSControl:ResourceLinkButton runat="server" OnClientClick="return confirmPageDelete();" ID="DeletePageLink" Text="Delete Page" />
        </FormTemplate>
        <TrailerTemplate></li></ul></TrailerTemplate>
    </CSWiki:DeletePageForm>
    
    <CSWiki:LockPageForm runat="server" LockButtonId="LockPageButton" UnlockButtonId="UnlockPageButton">
        <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
        <LeaderTemplate><ul class="CommonContentBoxList Seperator"><li></LeaderTemplate>
        <FormTemplate>
            <CSControl:ResourceLinkButton runat="server" ID="LockPageButton" Text="Lock Page" />
            <CSControl:ResourceLinkButton runat="server" ID="UnlockPageButton" Text="Unlock Page" />
        </FormTemplate>
        <TrailerTemplate></li></ul></TrailerTemplate>
    </CSWiki:LockPageForm>
    
</asp:Content>