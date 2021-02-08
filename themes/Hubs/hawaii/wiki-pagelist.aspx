<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Wikis.Controls.CSWikiThemePage" MasterPageFile="theme.Master" %>

<script runat="server" type="text/C#">
    private CommunityServer.Wikis.Components.Page _page;
        
    public string SetPageValue(CommunityServer.Wikis.Components.Page page)
    {
        _page = page;
        return string.Empty;
    }
    
    public int GetYesRatingCount()
    {
        if (_page != null && _page.RatingCount > 0)
            return (int)(_page.RatingSum / 2 - _page.RatingCount);
        else
            return 0;
    }

    public int GetNoRatingCount()
    {
        if (_page != null && _page.RatingCount > 0)
            return (int)(_page.RatingCount - GetYesRatingCount());
        else
            return 0;
    }

    public double GetRatingAverage()
    {
        if (_page != null && _page.RatingCount > 0)
            return (((double)GetYesRatingCount()) / ((double)_page.RatingCount) * 100);
        else
            return 100.00;
    }

    public bool IsPositiveRating()
    {
        return GetRatingAverage() >= 50.00;
    }
</script>

<asp:Content ContentPlaceHolderID="bbcr" runat="server">
    <div class="CommonBreadCrumbArea"><div class="Common">
        <CSHub:HubData Property="Name" LinkTo="HomePage" runat="server" />
        &raquo;
        <CSWiki:WikiData LinkTo="HomePage" ResourceName="Button_Wiki" runat="server" />
    </div></div>
</asp:Content>

<asp:Content ContentPlaceHolderID="tr" runat="server">

    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <ContentTemplate>
            <CSWiki:WikiData runat="server" Property="Name" />
        </ContentTemplate>
    </CSControl:Title>
    <div class="CommonDescription">
        <CSWiki:WikiData runat="server" Property="Description" />
    </div>
    
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">
    
    <CSControl:ConditionalAction runat="server">
        <Conditions>
            <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="QueryType" Operator="EqualTo" ComparisonValue="All" />
        </Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="SortBy" QueryOverrideValue="LastModifiedDate" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="QueryType" QueryOverrideValue="All" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="WikiPages" />
        </Actions>
    </CSControl:ConditionalAction>
    
    <CSControl:ConditionalAction runat="server">
        <Conditions>
            <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="QueryType" Operator="EqualTo" ComparisonValue="New" />
        </Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="SortBy" QueryOverrideValue="LastModifiedDate" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="QueryType" QueryOverrideValue="New" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="WikiPages" />
        </Actions>
    </CSControl:ConditionalAction>
    
    <CSControl:ConditionalAction runat="server">
        <Conditions>
            <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="QueryType" Operator="EqualTo" ComparisonValue="Updated" />
        </Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="SortBy" QueryOverrideValue="LastModifiedDate" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="QueryType" QueryOverrideValue="Updated" />
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="WikiPages" />
        </Actions>
    </CSControl:ConditionalAction>
    
    <CSControl:ConditionalAction runat="server">
        <Conditions>
            <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="QueryType" Operator="EqualTo" ComparisonValue="UserAll" />
        </Conditions>
        <Actions>
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="SortBy" QueryOverrideValue="LastModifiedDate" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="SortOrder" QueryOverrideValue="Descending" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="QueryType" QueryOverrideValue="All" />
            <CSControl:SetQueryOverridePropertyAction runat="server" ListControlId="WikiPages" QueryOverrideProperty="AuthorUserID">
                <QueryOverrideValueTemplate runat="server">
                    <CSControl:UserData runat="server" Property="UserID" UseAccessingUser="true" FormatString="0" />
                </QueryOverrideValueTemplate>
            </CSControl:SetQueryOverridePropertyAction>
            <CSControl:ClearAndDataBindRepeaterAction runat="server" RepeaterId="WikiPages" />
        </Actions>
    </CSControl:ConditionalAction>
        
<div class="CommonContentBox">
    <div class="CommonContentBoxHeaderForm">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td align="left">
                    <div>
                        <CSControl:ResourceControl runat="server" ResourceName="Filter" />: 
                        
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions>
                                <CSControl:ControlPropertyValueComparison ComparisonControlId="WikiPagesQuery" ComparisonProperty="QueryType" Operator="EqualTo" ComparisonValue="All" runat="server" />
                                <CSControl:Conditions runat="server" Operator="Not">
                                    <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="QueryType" Operator="EqualTo" ComparisonValue="UserAll" />
                                </CSControl:Conditions>    
                            </ContentConditions>
                            <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Wikis_PageSort_All" QueryStringModification="QueryType=All" runat="server" /></TrueContentTemplate>
                            <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Wikis_PageSort_All" QueryStringModification="QueryType=All" runat="server" /></FalseContentTemplate>
                        </CSControl:ConditionalContent>
                        |
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="WikiPagesQuery" ComparisonProperty="QueryType" Operator="EqualTo" ComparisonValue="New" runat="server" /></ContentConditions>
                            <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Wikis_PageSort_New" QueryStringModification="QueryType=New" runat="server" /></TrueContentTemplate>
                            <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Wikis_PageSort_New" QueryStringModification="QueryType=New" runat="server" /></FalseContentTemplate>
                        </CSControl:ConditionalContent>
                        |
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions><CSControl:ControlPropertyValueComparison ComparisonControlId="WikiPagesQuery" ComparisonProperty="QueryType" Operator="EqualTo" ComparisonValue="Updated" runat="server" /></ContentConditions>
                            <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Wikis_PageSort_Updated" QueryStringModification="QueryType=Updated" runat="server" /></TrueContentTemplate>
                            <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Wikis_PageSort_Updated" QueryStringModification="QueryType=Updated" runat="server" /></FalseContentTemplate>
                        </CSControl:ConditionalContent>
                        |
                        <CSControl:ConditionalContent runat="server">
                            <ContentConditions><CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="QueryType" Operator="EqualTo" ComparisonValue="UserAll" /></ContentConditions>
                            <TrueContentTemplate><CSControl:ModifiedUrl Tag="B" ResourceName="Wikis_PageSort_YourPages" QueryStringModification="QueryType=UserAll" runat="server" /></TrueContentTemplate>
                            <FalseContentTemplate><CSControl:ModifiedUrl ResourceName="Wikis_PageSort_YourPages" QueryStringModification="QueryType=UserAll" runat="server" /></FalseContentTemplate>
                        </CSControl:ConditionalContent>
                        
                    </div>
                </td>
                <td align="right">
                    <CSWiki:WikiData LinkTo="CreatePage" runat="server" LinkCssClass="WikiAddButton">
                        <ContentTemplate><span><CSControl:ResourceControl runat="server" ResourceName="Wikis_AddPage" /></span></ContentTemplate>
                   </CSWiki:WikiData>
                </td>
            </tr>
        </table>
    </div>
    <div class="CommonContentBoxContent">
        
        <CSWiki:PageList runat="server" ID="WikiPages">
            <QueryOverrides runat="server" ID="WikiPagesQuery" PageSize="5" PagerID="WikiPagesPager" PublishedOnly="true" />
            <ItemTemplate>
                    <%# SetPageValue(DataBinder.GetDataItem(Container) as CommunityServer.Wikis.Components.Page) %>
                    <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSWiki:PagePropertyValueComparison runat="server" ComparisonProperty="RatingCount" Operator="GreaterThan" ComparisonValue="0" /></ContentConditions>
                    <TrueContentTemplate>
                        <div class="CommonWikiPageRatingArea">
                            <CSControl:ConditionalContent runat="server">
                                <ContentConditions>
                                    <CSControl:CustomCondition runat="server" CustomResult="<%# IsPositiveRating()%>" />
                                </ContentConditions>
                                <TrueContentTemplate>
                                    <CSControl:ThemeImage runat="server" ImageUrl="~/images/Wiki/thumbsup_large.png" />
                                    <%# (int)GetRatingAverage() %>%
                                </TrueContentTemplate>
                                <FalseContentTemplate>
                                    <CSControl:ThemeImage runat="server" ImageUrl="~/images/Wiki/thumbsdown_large.png" />
                                    <%# (int)GetRatingAverage()%>%
                                </FalseContentTemplate>
                            </CSControl:ConditionalContent>
                        </div>
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <div class="CommonWikiPageNoRatingArea">
                            <CSControl:ThemeImage runat="server" ImageUrl="~/images/Wiki/norating_large.png" />
                           <CSControl:ResourceControl runat="server" ResourceName="Wikis_NoRating" />
                        </div>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
                
                <div class="CommonWikiPageListArea">
                    <CSControl:PlaceHolder runat="server" CssClass="CommonHeader" Tag="H3">
                        <ContentTemplate>
                            <CSWiki:PageData runat="server" Property="Title" Tag="Span" LinkTo="Page" />
                            <CSControl:ConditionalContent ID="ConditionalContent1" runat="server">
                                <ContentConditions><CSWiki:PagePropertyValueComparison ID="PagePropertyValueComparison1" runat="server" ComparisonProperty="IsLocked" ComparisonValue="True" Operator="EqualTo" /></ContentConditions>
                                <TrueContentTemplate><CSControl:ThemeImage ID="ThemeImage1" align="absmiddle" border="0" runat="server" ImageUrl="~/images/common/locked.gif" AlternateTextResourceName="Wikis_Page_Is_Locked" /></TrueContentTemplate>
                                <FalseContentTemplate></FalseContentTemplate>
                            </CSControl:ConditionalContent>
                        </ContentTemplate>
                    </CSControl:PlaceHolder>
                    <CSWiki:PageData runat="server" Property="Body" TruncateAt="110" TruncationEllipsisText="..." Tag="Div" />
                    <CSControl:ResourceControl runat="server" CssClass="CommonWikiPageDescription" ResourceName="Wikis_Page_Summary">
                        <Parameter1Template>
                            <CSWiki:PageData runat="server" Property="RevisionCount" />
                        </Parameter1Template>
                        <Parameter2Template>
                            <CSWiki:WikiData runat="server" Property="Name" LinkTo="HomePage" />
                        </Parameter2Template>
                        <Parameter3Template>
                            <CSWiki:PageData runat="server" Property="User">
                                <ContentTemplate>
                                    <a href='<%# CommunityServer.Components.SiteUrls.Instance().UserProfile(Eval("User.Username").ToString()) %>'><%# Eval("User.DisplayName") %></a>
                                </ContentTemplate>
                            </CSWiki:PageData>
                        </Parameter3Template>
                        <Parameter4Template>
                            <CSWiki:PageData runat="server" Property="LastModifiedDate" />
                        </Parameter4Template>
                    </CSControl:ResourceControl>
                </div>
                
                <div style="clear: both;"></div>
            </ItemTemplate>
            <NoneTemplate>
                <CSControl:ResourceControl runat="server" ResourceName="Wikis_Pages_NoneExist">
                    <Parameter1Template>
                        <CSWiki:WikiData runat="server" LinkTo="CreatePage" ResourceName="Wikis_AddandEditPage" />
                    </Parameter1Template>
                </CSControl:ResourceControl>
            </NoneTemplate>
        </CSWiki:PageList>
        <CSControl:Pager runat="server" ID="WikiPagesPager" />
    </div>
</div>

</asp:Content>

<asp:Content ContentPlaceHolderID="rcrc" runat="server">
    
    <CSWiki:WikiData LinkTo="CreatePage" runat="server" ResourceName="Hubs_Wiki_CreatePage">
        <LeaderTemplate><ul class="CommonContentBoxList Seperator"><li></LeaderTemplate>
        <TrailerTemplate></li></ul></TrailerTemplate>
    </CSWiki:WikiData>
    
</asp:Content>