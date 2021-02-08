<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="wikis.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="Tabs" Src="tabs.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSControl:SiteUrl UrlName="wikishome" runat="server" ResourceName="wikis"  />
        &raquo;
        <CSWiki:WikiData Property="Name" LinkTo="HomePage" runat="server" />
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

                <CSControl:PlaceHolder runat="server" CssClass="CommonContentBoxHeaderSmall NoPrint" Tag="H2">
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
                    
                    
                        <CSWiki:PageData runat="server" Property="Title" Tag="Span" LinkTo="Page" />
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
                <CSWiki:PageData runat="server" Property="Body" Tag="Div" IncrementViewCount="true" />
                
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
    <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_RecentComments" Tag="H3" CssClass="CommonContentBoxHeader" />
    <div class="CommonContentBoxContent">
        <CSWiki:PageCommentList runat="server">
            <QueryOverrides PageSize="5" SortBy="MostRecent" ReverseOrder="true" />
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
        <CSWiki:CreateEditPageCommentForm runat="server" ID="WikiPageCommentForm"  
            BodyTextBoxId="Body" 
            SubmitButtonId="Submit"
            SubFormIds="PostTags"
            CustomValidatorId="PageValidator"
            ValidationGroup="AddComment">
            <SuccessActions>
                <CSControl:GoToModifiedUrlAction ID="GoToModifiedUrlAction1" runat="server" />
            </SuccessActions>
            <FormTemplate>
                <div class="CommonFormArea" id="addcomment"> 
                    <div class="CommonFormFieldName"><CSControl:ResourceControl ID="ResourceControl1" runat="server" ResourceName="Wikis_Page_PostAComment" /></div>
                    <asp:CustomValidator runat="server" id="PageValidator" ValidationGroup="AddComment" />
                    <div class="CommonFormField">
                        <asp:TextBox runat="server" TextMode="MultiLine" Width="100%" Height="150px" ID="Body" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Body" Cssclass="validationWarning" ValidationGroup="AddComment">* <CSControl:ResourceControl ID="ResourceControl2" runat="server" ResourceName="Wikis_EnterCommentWarning" /></asp:RequiredFieldValidator>
                    </div>
                    <script type="text/javascript">
	                    // <![CDATA[
                        if (document.URL.indexOf('#addcomment') >= 0){
                            if (document.getElementById('<%#(WikiControlUtility.Instance().FindControl(this, "Body")).ClientID %>')){
                                document.getElementById('<%#(WikiControlUtility.Instance().FindControl(this, "Body")).ClientID %>').focus();
                            }
                        }
                        // ]]>
                    </script>                                    
                    <div class="CommonFormField">
                        <asp:LinkButton runat="server" ID="Submit" ValidationGroup="AddComment" CssClass="WikiAddButton"><span><CSControl:ResourceControl runat="server" ResourceName="Wikis_AddComment" /></span></asp:LinkButton>
                    </div>
                </div>
            </FormTemplate>
        </CSWiki:CreateEditPageCommentForm> 
    </div>
</div>

</asp:Content>