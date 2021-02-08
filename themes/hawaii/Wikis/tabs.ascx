<%@ Control Language="C#" AutoEventWireup="true" %>

<script runat="server" language="C#">

    public WikiTabs SelectedTab
    {
        get { return (WikiTabs) (ViewState["SelectedTab"] ?? WikiTabs.Article); }
        set { ViewState["SelectedTab"] = value; }
    }

    public enum WikiTabs
    {
        Article,
        Edit,
        Comments,
        History
    }

</script>

<div class="CommonPaneTabSet">
    <div style="overflow: hidden;">
        <table border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSWiki:PagePropertyValueComparison runat="server" ComparisonProperty="ID" Operator="IsSetOrTrue" /></ContentConditions>
                    <TrueContentTemplate>
                        <td>
                            <CSControl:ConditionalContent runat="server">
                                <ContentConditions><CSControl:CustomCondition runat="server" CustomResult='<%# SelectedTab == WikiTabs.Article %>' /></ContentConditions>
                                <TrueContentTemplate><div class="CommonPaneTabSelected"></TrueContentTemplate>
                                <FalseContentTemplate><div class="CommonPaneTab"></FalseContentTemplate>
                            </CSControl:ConditionalContent>
                                <CSWiki:PageData LinkTo="Page" runat="server">
                                    <ContentTemplate>
                                        <CSControl:ThemeImage align="absmiddle" border="0" runat="server" ImageUrl="~/images/wiki/wiki-icon-article-tab.png" />
                                        <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_Article" />    
                                    </ContentTemplate>
                                </CSWiki:PageData>
                            </div>    
                        </td>
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        <td>
                            <div class="CommonPaneTabSelected">
                                <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_Create">
                                    <LeaderTemplate><CSControl:ThemeImage align="absmiddle" border="0" runat="server" ImageUrl="~/images/wiki/wiki-icon-edit-tab.png" /> </LeaderTemplate>
                                </CSControl:ResourceControl>
                            </div>    
                        </td>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>
                
                <CSControl:ConditionalContent runat="server">
                    <DisplayConditions><CSWiki:PagePropertyValueComparison runat="server" ComparisonProperty="ID" Operator="IsSetOrTrue" /></DisplayConditions>
                    <ContentConditions><CSWiki:PagePropertyValueComparison runat="server" ComparisonProperty="IsLocked" ComparisonValue="True" Operator="EqualTo" /></ContentConditions>
                    <TrueContentTemplate>
                        <CSWiki:PageData runat="server" LinkTo="EditPage" ResourceName="Wikis_Page_Edit">
                            <DisplayConditions><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsWikiAdministrator" ComparisonValue="True" Operator="EqualTo" UseAccessingUser="true" /></DisplayConditions>
                            <LeaderTemplate>
                                <td>
                                    <CSControl:ConditionalContent runat="server">
                                        <ContentConditions><CSControl:CustomCondition runat="server" CustomResult='<%# SelectedTab == WikiTabs.Edit %>' /></ContentConditions>
                                        <TrueContentTemplate><div class="CommonPaneTabSelected"></TrueContentTemplate>
                                        <FalseContentTemplate><div class="CommonPaneTab"></FalseContentTemplate>
                                    </CSControl:ConditionalContent>
                                    <CSWiki:PageData runat="server" LinkTo="EditPage" ResourceName="Wikis_Page_Edit"><ContentTemplate><CSControl:ThemeImage align="absmiddle" border="0" runat="server" ImageUrl="~/images/wiki/wiki-icon-edit-tab.png" /></ContentTemplate></CSWiki:PageData>
                            </LeaderTemplate>
                            <TrailerTemplate>
                                    <CSControl:ThemeImage align="absmiddle" border="0" runat="server" ImageUrl="~/images/common/locked_small.gif" AlternateTextResourceName="Wikis_Page_Is_Locked" />
                                    </div>
                                </td>
                            </TrailerTemplate>
                        </CSWiki:PageData>
                    </TrueContentTemplate>                                    
                    <FalseContentTemplate>
                        <CSWiki:PageData runat="server" LinkTo="EditPage" ResourceName="Wikis_Page_Edit">
                            <LeaderTemplate>
                                <td>
                                    <CSControl:ConditionalContent runat="server">
                                        <ContentConditions><CSControl:CustomCondition runat="server" CustomResult='<%# SelectedTab == WikiTabs.Edit %>' /></ContentConditions>
                                        <TrueContentTemplate><div class="CommonPaneTabSelected"></TrueContentTemplate>
                                        <FalseContentTemplate><div class="CommonPaneTab"></FalseContentTemplate>
                                    </CSControl:ConditionalContent>
                                    <CSWiki:PageData runat="server" LinkTo="EditPage" ResourceName="Wikis_Page_Edit"><ContentTemplate><CSControl:ThemeImage align="absmiddle" border="0" runat="server" ImageUrl="~/images/wiki/wiki-icon-edit-tab.png" /></ContentTemplate></CSWiki:PageData>
                            </LeaderTemplate>
                            <TrailerTemplate>
                                    </div>
                                </td>
                            </TrailerTemplate>
                        </CSWiki:PageData>
                    </FalseContentTemplate>
                </CSControl:ConditionalContent>                                
                
                <CSWiki:PageData runat="server" LinkTo="Comments">
                    <LeaderTemplate>
                        <td>
                            <CSControl:ConditionalContent runat="server">
                                <ContentConditions><CSControl:CustomCondition runat="server" CustomResult='<%# SelectedTab == WikiTabs.Comments %>' /></ContentConditions>
                                <TrueContentTemplate><div class="CommonPaneTabSelected"></TrueContentTemplate>
                                <FalseContentTemplate><div class="CommonPaneTab"></FalseContentTemplate>
                            </CSControl:ConditionalContent>        
                    </LeaderTemplate>
                    <ContentTemplate>
                        <CSControl:ThemeImage align="absmiddle" border="0" runat="server" ImageUrl="~/images/wiki/wiki-icon-comment-tab.png" />
                        <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_Comments" />
                        (<CSWiki:PageData runat="server" Property="CommentCount" />)
                    </ContentTemplate>
                    <TrailerTemplate>
                            </div>
                        </td>    
                    </TrailerTemplate>
                </CSWiki:PageData>
                        
                <CSWiki:PageData runat="server" LinkTo="History">
                    <LeaderTemplate>
                        <td>
                            <CSControl:ConditionalContent runat="server">
                                <ContentConditions><CSControl:CustomCondition runat="server" CustomResult='<%# SelectedTab == WikiTabs.History %>' /></ContentConditions>
                                <TrueContentTemplate><div class="CommonPaneTabSelected"></TrueContentTemplate>
                                <FalseContentTemplate><div class="CommonPaneTab"></FalseContentTemplate>
                            </CSControl:ConditionalContent>                        
                    </LeaderTemplate>
                    <ContentTemplate>
                        <CSControl:ThemeImage align="absmiddle" border="0" runat="server" ImageUrl="~/images/wiki/wiki-icon-history-tab.png" />
                        <CSControl:ResourceControl runat="server" ResourceName="Wikis_Page_History" />
                        (<CSWiki:PageData runat="server" Property="RevisionCount" />)
                    </ContentTemplate>
                    <TrailerTemplate>
                            </div>
                        </td>
                    </TrailerTemplate>
                </CSWiki:PageData>
                        
            </tr>
        </tbody>
        </table>
    </div>
</div>