<%@ Control Language="C#" AutoEventWireup="true" %>

<CSControl:ConditionalContent runat="server">
    <ContentConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostStatus" ComparisonValue="IsAnswer" Operator="Contains"  /></ContentConditions>
    <TrueContentTemplate><div class="CommonCommentArea Verified"></TrueContentTemplate>
    <FalseContentTemplate>
        <CSControl:ConditionalContent runat="server">
            <ContentConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostStatus" ComparisonValue="IsSuggestedAnswer" Operator="Contains"  /></ContentConditions>
            <TrueContentTemplate><div class="CommonCommentArea Suggested"></TrueContentTemplate>    
            <FalseContentTemplate><div class="CommonCommentArea Normal"></FalseContentTemplate>
        </CSControl:ConditionalContent>
    </FalseContentTemplate>
</CSControl:ConditionalContent>
    <div class="CommonCommentUser" style="text-align: center;">
        <CSControl:UserData runat="server" LinkTo="Profile" Tag="Div" CssClass="ForumPostUserAvatar">
            <ContentTemplate>
                <CSControl:UserAvatar runat="server" BorderWidth="0" />
            </ContentTemplate>
        </CSControl:UserData>
        <CSControl:UserPostIcons runat="server" Tag="Div" />
        <CSControl:UserPostGenderIcon runat="server" Tag="Div" />
        <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="TotalPosts">
            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="PostCount" Operator="EqualTo" /></DisplayConditions>
            <LeaderTemplate><CSControl:ResourceControl ResourceName="PostFlatView_Posts" runat="server" /></LeaderTemplate>
        </CSControl:UserData>
        <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="UserRank" Tag="Div">
            <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="UserRank" Operator="EqualTo" /></DisplayConditions>
        </CSControl:UserData>
        <CSControl:UserData runat="server" Property="Points" Tag="Div"><LeaderTemplate><CSControl:ResourceControl ID="ResourceControl5" runat="server" ResourceName="PostFlatView_UserPoints" /></LeaderTemplate></CSControl:UserData>
        <CSControl:PlaceHolder runat="server" Tag="Div">
            <DisplayConditions><CSControl:UserPropertyValueComparison ComparisonProperty="IsOnline" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
            <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/user_IsOnline.gif" runat="server" /></ContentTemplate>
        </CSControl:PlaceHolder>
        <CSControl:PlaceHolder runat="server" Tag="Div">
            <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison ComparisonProperty="IsOnline" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
            <ContentTemplate><CSControl:ThemeImage ImageUrl="~/images/user_IsOffline.gif" runat="server" /></ContentTemplate>
        </CSControl:PlaceHolder>
        <CSControl:UserRoleIcons runat="server" LinkTo="Role" Tag="Div" CssClass="ForumPostRoleIcons">
            <SeparatorTemplate><br /></SeparatorTemplate>
        </CSControl:UserRoleIcons>
    </div>    	                                    
    <div class="CommonCommentArrow"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div><div class="r5"></div><div class="r6"></div><div class="r7"></div><div class="r8"></div><div class="r9"></div><div class="r10"></div></div>
    <div class="CommonCommentBubble">
        <div class="CommonCommentBubbleRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
        <div class="CommonCommentContent"><div style="width: 100%; overflow: hidden;">                                 
            <div class="ForumPostTitle">						                
                <CSForum:ForumPostData runat="server" LinkTo="PermaLink"><ContentTemplate><CSControl:ThemeImage runat="server" BorderWidth="0" ImageUrl="~/images/icon_post_show.gif" style="float: left; margin-right: 10px;" /></ContentTemplate></CSForum:ForumPostData>
                <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" Tag="Strong"  />
                <CSForum:ForumPostEmoticon runat="server" />
                <CSControl:PlaceHolder runat="server" Tag="Span" CssClass="ForumPostTitleDate">
                    <ContentTemplate>
                        <CSForum:ForumPostData runat="server" Id="ReplyToLabel" ResourceName="PostView_ReplyToLabel" LinkTo="ParentPost" />
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions>
                                <CSControl:ControlVisibilityCondition runat="server" ControlId="ReplyToLabel" ControlVisiblilityEquals="true" />
                            </ContentConditions>
                            <TrueContentTemplate>
                                <CSForum:ForumPostData runat="server" Property="PostDate" IncludeTimeInDate="true" />                              
                            </TrueContentTemplate>
                            <FalseContentTemplate>
                                <CSForum:ForumPostData runat="server" Property="PostDate" ResourceName="Forum_Posted" IncludeTimeInDate="true" />
                            </FalseContentTemplate>
                        </CSControl:ConditionalContent>     
                        <CSForum:ForumPostData runat="server" Property="UserHostAddress" ResourceName="PostFlatView_IPAddress" Tag="Span">
                            <LeaderTemplate> | </LeaderTemplate>
                        </CSForum:ForumPostData>                       
                        <CSControl:ResourceControl runat="server" ResourceName="Button_Locked">
                            <DisplayConditions><CSForum:ForumPostPropertyValueComparison ComparisonProperty="IsLocked" Operator="IsSetOrTrue" runat="server" /></DisplayConditions>
                            <LeaderTemplate> | <span class="CommonImageTextButton CommonLockedButton"></LeaderTemplate>
                            <TrailerTemplate></span></TrailerTemplate>
                        </CSControl:ResourceControl>
                    </ContentTemplate>
                </CSControl:PlaceHolder>
                <CSForum:ForumPostRating runat="server" ID="PostRating" RatingCssClass="ForumThreadRateControl" RatingReadOnlyCssClass="ForumThreadRateControlReadOnly" RatingActiveCssClass="ForumThreadRateControlActive" ImagesBaseUrl="~/Themes/hawaii/images/common/" EnableDetails="true" Tag="Div" />
                <CSControl:PlaceHolder runat="server" Tag="Div">
                    <DisplayConditions>
                        <CSControl:Conditions runat="server" Operator="Not">
                            <CSControl:ControlVisibilityCondition runat="server" ControlId="PostRating" /> 
                            <CSForum:ForumPostData runat="server" Property="TotalRatings" ResourceName="Forums_RatingsSummary" />
                        </CSControl:Conditions>
                    </DisplayConditions>
                    <ContentTemplate>
                        <CSControl:UserData LinkTo="Login" runat="server">
                            <ContentTemplate>
                                <CSControl:ThemeImage align="absmiddle" border="0" runat="server" ImageUrl="~/images/common/5star-rating.png" /> 
                                <CSForum:ForumPostData runat="server" Property="TotalRatings" ResourceName="Forums_RatingsSummary" />
                            </ContentTemplate>
                        </CSControl:UserData>
                    </ContentTemplate>
                </CSControl:PlaceHolder>  
                <CSForum:PostAttachmentData runat="server" Property="FileName" LinkTo="Attachment" Tag="Div" CssClass="ForumPostAttachment" />
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostStatus" ComparisonValue="IsAnswer" Operator="Contains"  /></ContentConditions>
                    <TrueContentTemplate>
                        <CSForum:ForumPostAnswerVerifiedByUserList runat="server">
                            <QueryOverrides QueryType="AnswerVerifiedBy" />
                            <HeaderTemplate><div class="ForumPostVerifiedBySection">Verified by </HeaderTemplate>
                            <ItemTemplate>
                                <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" />
                            </ItemTemplate>
                            <TrailerTemplate></div></TrailerTemplate>
                        </CSForum:ForumPostAnswerVerifiedByUserList>               
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions><CSForum:ForumPostPropertyValueComparison runat="server" ComparisonProperty="PostStatus" ComparisonValue="IsSuggestedAnswer" Operator="Contains"  /></ContentConditions>
                            <TrueContentTemplate>
                                <CSForum:ForumPostAnswerVerifiedByUserList runat="server">
                                    <QueryOverrides QueryType="AnswerSuggestedBy" />
                                    <HeaderTemplate><div class="ForumPostSuggestedBySection">Suggested by </HeaderTemplate>
                                    <ItemTemplate>
                                        <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" />
                                    </ItemTemplate>
                                    <TrailerTemplate></div></TrailerTemplate>
                                </CSForum:ForumPostAnswerVerifiedByUserList> 
                            </TrueContentTemplate>    
                            <FalseContentTemplate></FalseContentTemplate>
                        </CSControl:ConditionalContent>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
            </div>       							
            <CSForum:ForumPostData Property="FormattedBody" runat="server" IncrementViewCount="true" />       
            <CSControl:UserProfileData Property="SignatureFormatted" runat="server" Tag="Div" CssClass="ForumPostSignature" />
            <div class="ForumPostFooter">                            
                <ul class="ForumPostStatistics CommonPrintHidden">
                    <CSForum:ForumPostData runat="server" Property="Points" ResourceName="PostFlatView_PostPoints" Tag="Li" />
                </ul>     
            </div>  
        </div></div>
        <div class="CommonCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
    </div>
    <div style="clear: both;"></div>
</div>
