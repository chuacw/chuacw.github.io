<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="wikis.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="Tabs" Src="tabs.ascx" %>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSControl:SiteUrl UrlName="wikishome" runat="server" ResourceName="wikis"  />
        &raquo;
        <CSWiki:WikiData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSWiki:PageData ID="PageData6" Property="Title" LinkTo="Page" runat="server" />
        &raquo;
        <CSWiki:PageData ID="PageData3" runat="server" LinkTo="Comments">
            <ContentTemplate>Comments</ContentTemplate>
        </CSWiki:PageData>
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate><CSWiki:PageData runat="server" Property="Title" /></ContentTemplate>
        <LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_Comments" />: </LeaderTemplate>
    </CSControl:Title>
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
<CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="false">
    <ContentTemplate>
        <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_Comments" />: 
        <CSWiki:PageData runat="server" Property="Title" />
    </ContentTemplate>
</CSControl:Title>

<CSControl:ConditionalAction ID="ConditionalAction1" runat="server">
    <Conditions runat="server" Operator="Or">
        <CSControl:QueryStringPropertyValueComparison ID="QueryStringPropertyValueComparison1" runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="PublishedDate" />
        <CSControl:Conditions ID="Conditions2" runat="server" Operator="Not"><CSControl:QueryStringPropertyValueComparison ID="QueryStringPropertyValueComparison6" runat="server" QueryStringProperty="Sort" Operator="IsSetOrTrue" /></CSControl:Conditions>
    </Conditions>
    <Actions runat="server">
        <CSControl:SetQueryOverridePropertyAction ID="SetQueryOverridePropertyAction1" runat="server" ListControlId="CommentList" QueryOverrideProperty="SortBy" QueryOverrideValue="PublishedDate" />
        <CSControl:SetQueryOverridePropertyAction ID="SetQueryOverridePropertyAction2" runat="server" ListControlId="CommentList" QueryOverrideProperty="SortOrder" QueryOverrideValue="Ascending" />
        <CSControl:ClearAndDataBindRepeaterAction ID="ClearAndDataBindRepeaterAction1" runat="server" RepeaterId="CommentList" />
    </Actions>
</CSControl:ConditionalAction>
   
<CSControl:ConditionalAction ID="ConditionalAction2" runat="server">
    <Conditions ID="Conditions1" runat="server">
        <CSControl:QueryStringPropertyValueComparison ID="QueryStringPropertyValueComparison2" runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="MostRecent" />
    </Conditions>
    <Actions ID="Actions1" runat="server">
        <CSControl:SetQueryOverridePropertyAction ID="SetQueryOverridePropertyAction3" runat="server" ListControlId="CommentList" QueryOverrideProperty="SortBy" QueryOverrideValue="MostRecent" />
        <CSControl:SetQueryOverridePropertyAction ID="SetQueryOverridePropertyAction5" runat="server" ListControlId="CommentList" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
        <CSControl:ClearAndDataBindRepeaterAction ID="ClearAndDataBindRepeaterAction2" runat="server" RepeaterId="CommentList" />
    </Actions>
</CSControl:ConditionalAction>   
   
<CSControl:ConditionalAction ID="ConditionalAction3" runat="server">
    <Conditions><CSControl:QueryStringPropertyValueComparison ID="QueryStringPropertyValueComparison4" runat="server" QueryStringProperty="Sort" Operator="EqualTo" ComparisonValue="MostUseful" /></Conditions>
    <Actions>
        <CSControl:SetQueryOverridePropertyAction ID="SetQueryOverridePropertyAction4" runat="server" ListControlId="CommentList" QueryOverrideProperty="SortBy" QueryOverrideValue="RatingAverage" />
        <CSControl:SetQueryOverridePropertyAction ID="SetQueryOverridePropertyAction6" runat="server" ListControlId="CommentList" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
        <CSControl:ClearAndDataBindRepeaterAction ID="ClearAndDataBindRepeaterAction3" runat="server" RepeaterId="CommentList" />
    </Actions>
</CSControl:ConditionalAction>

<div class="CommonContentBox">
    <div class="CommonContentBoxContent">
        <div style="float: right">
            <CSWiki:WikiData LinkTo="CreatePage" runat="server" LinkCssClass="WikiAddButton">
                <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Wikis_AddPage" /></span></ContentTemplate>
           </CSWiki:WikiData>
        </div>
        
        <CSUserControl:Tabs runat="server" SelectedTab="Comments" />

        <div class="CommonPane">
            <div class="CommonGroupedContentArea">

                <CSControl:PlaceHolder runat="server" CssClass="CommonContentBoxHeaderSmall" Tag="H2">
                    <ContentTemplate>
                        <CSWiki:PageData runat="server" Property="Title" Tag="Span" LinkTo="Page" />
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions><CSWiki:PagePropertyValueComparison runat="server" ComparisonProperty="IsLocked" ComparisonValue="True" Operator="EqualTo" /></ContentConditions>
                            <TrueContentTemplate><CSControl:ThemeImage align="absmiddle" border="0" runat="server" ImageUrl="~/images/common/locked.gif" AlternateTextResourceName="Wikis_Page_Is_Locked" /></TrueContentTemplate>
                            <FalseContentTemplate></FalseContentTemplate>
                        </CSControl:ConditionalContent>
                    </ContentTemplate>
                </CSControl:PlaceHolder>                            

                <CSControl:ConditionalContent runat="server">
                    <ContentConditions>
                        <CSControl:ControlPropertyValueComparison runat="server" ComparisonControlId="CommentListPager" ComparisonProperty="TotalRecords" Operator="GreaterThan" ComparisonValue="0" />
                    </ContentConditions>
                    <TrueContentTemplate>
                        <CSControl:ResourceControl runat="server" ResourceName="Sortby" />: 
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions Operator="And">
                                <CSControl:ControlPropertyValueComparison ComparisonControlId="CommentListQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="PublishedDate" runat="server" />
                                <CSControl:ControlPropertyValueComparison ComparisonControlId="CommentListQuery" ComparisonProperty="SortOrder" Operator="EqualTo" ComparisonValue="Ascending" runat="server" />
                            </ContentConditions>
                            <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" Text="Published Date" QueryStringModification="Sort=PublishedDate&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                            <FalseContentTemplate><CSControl:ModifiedUrl Text="Published Date" QueryStringModification="Sort=PublishedDate&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                        </CSControl:ConditionalContent> | 
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions>
                                <CSControl:ControlPropertyValueComparison ComparisonControlId="CommentListQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="MostRecent" runat="server" />                  
                            </ContentConditions>
                            <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Wikis_MostRecent" QueryStringModification="Sort=MostRecent&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                            <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Wikis_MostRecent" QueryStringModification="Sort=MostRecent&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                        </CSControl:ConditionalContent> | 
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="CommentListQuery" ComparisonProperty="SortBy" Operator="EqualTo" ComparisonValue="RatingAverage" runat="server" /></ContentConditions>
                            <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" Text="Most Useful" QueryStringModification="Sort=MostUseful&amp;PageIndex=1" runat="server" /></TrueContentTemplate>
                            <FalseContentTemplate><CSControl:ModifiedUrl Text="Most Useful" QueryStringModification="Sort=MostUseful&amp;PageIndex=1" runat="server" /></FalseContentTemplate>
                        </CSControl:ConditionalContent>
                    </TrueContentTemplate>
                    <FalseContentTemplate></FalseContentTemplate>
                </CSControl:ConditionalContent>


                <CSControl:UserData LinkTo="Login" runat="server" UseAccessingUser="true" LinkCssClass="WikiAddButton">
                    <DisplayConditions>
                    <CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" UseAccessingUser="true" />
                    </DisplayConditions>
                    <LeaderTemplate>
                        <div class="WikiCommentBubbleRoundTop" style="margin-top: 1em;"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                        <div class="WikiCommentContent" style="padding-top: 4px;">
                            <div>
                    </LeaderTemplate>
                    <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Wikis_AddComment" /></span></ContentTemplate>
                    <TrailerTemplate>
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                        <div class="WikiCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                    </TrailerTemplate>
                </CSControl:UserData>
                 
                <CSControl:Pager runat="server" ID="CommentListPager" />
                <CSWiki:PageCommentList id="CommentList" runat="server">
                    <QueryOverrides runat="server" ID="CommentListQuery" SortBy="PublishedDate" PageSize="5" PagerID="CommentListPager" />
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
                                        <CSWiki:PageCommentRating runat="server"
                                            RatingContainerCssClass="WikiCurrentRatingSmall" 
                                            RatingGoodCssClass="WikiRatingGoodSmall" 
                                            RatingBadCssClass="WikiRatingBadSmall" 
                                            RatingContainerActiveCssClass="WikiRatingActiveSmall" 
                                            RatingButtonsDescriptionCssClass="WikiRatingButtonsDescription"
                                            IsReadOnly="false"  
                                            Show="CurrentRating" />
                                    </div>
                                    <div style="clear: both;"></div>
                                    
                                    <CSWiki:PageCommentData runat="server" Property="FormattedBody" Tag="Div" />
                                    
                                    <CSWiki:PageCommentRating runat="server"
                                            RatingContainerCssClass="WikiRatingFormSmall" 
                                            RatingContainerActiveCssClass="WikiRatingFormActiveSmall" 
                                            RatingButtonsContainerCssClass="WikiRatingButtons"
                                            RatingButtonsDescriptionCssClass="WikiRatingButtonsDescription"
                                            YesButtonCssClass="WikiRatingYesSmall"
                                            NoButtonCssClass="WikiRatingNoSmall"
                                            IsReadOnly="false"  
                                            Show="RatingForm"
                                            ThankYouMessage="Thanks for Rating this Comment" />
                                            
                                    <div style="float: right; font-size: 80%;">
                                        <a href="#addcomment"><CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_ReplyComment" /></a>
                                        <CSWiki:DeletePageCommentForm DeleteButtonId="DeleteComment" ConfirmationResourceName="Wikis_PageComment_DeleteVerify" runat="server">
		                                    <SuccessActions><CSControl:GoToModifiedUrlAction runat="server" /></SuccessActions>
		                                    <FormTemplate> | <asp:LinkButton runat="server" Text="Delete" ID="DeleteComment" /></FormTemplate>
		                                </CSWiki:DeletePageCommentForm>
                                        <CSWiki:PageCommentData LinkTo="Edit" Text="Edit" runat="server"><LeaderTemplate> | </LeaderTemplate></CSWiki:PageCommentData>
                                    </div>
                                    
                                    <div style="clear: both;"></div>
                                </div>
                                <div class="WikiCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                            </div>
                            <div class="WikiCommentArrow"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div><div class="r5"></div><div class="r6"></div><div class="r7"></div><div class="r8"></div><div class="r9"></div><div class="r10"></div></div>
                        </div>     
                    </ItemTemplate>
                    <NoneTemplate>
                        <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_NoComments" Tag="Div" CssClass="CommonMessageWarning" />
                    </NoneTemplate>
                </CSWiki:PageCommentList>
                
                <CSWiki:CreateEditPageCommentForm runat="server" ID="WikiPageCommentForm"  
                    BodyTextBoxId="Body" 
                    SubmitButtonId="Submit"
                    SubFormIds="PostTags"
                    CustomValidatorId="PageValidator"
                    ValidationGroup="AddComment">
                    <SuccessActions>
                        <CSControl:GoToModifiedUrlAction runat="server" />
                    </SuccessActions>
                    <FormTemplate>
                        <div class="CommonFormArea" id="addcomment"> 
                            <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_PostAComment" /></div>
                            <asp:CustomValidator runat="server" id="PageValidator" ValidationGroup="AddComment" />
                            <div class="CommonFormField">
                                <asp:TextBox runat="server" TextMode="MultiLine" Width="100%" Height="150px" ID="Body" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Body" Cssclass="validationWarning" ValidationGroup="AddComment">* <CSControl:ResourceControl runat="server" ResourceName="Wikis_EnterCommentWarning" /></asp:RequiredFieldValidator>
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
    </div>
</div>

</asp:Content>