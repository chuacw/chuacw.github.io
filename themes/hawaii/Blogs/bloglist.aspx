<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Blogs.Controls.CSBlogThemePage" MasterPageFile="blogs.Master" %>
<%@ Register TagPrefix="CSUserControl" TagName="AdTop" Src="/Themes/CS2008-Common/Ad-Top.ascx" %>
<%@ Register TagPrefix="CSUserControl" TagName="AdBottom" Src="/Themes/CS2008-Common/Ad-Bottom.ascx" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">

    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="weblogs" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions Operator="Not"><CSBlog:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
    </CSControl:Title>

    <CSControl:Title runat="server" IncludeSiteName="true" EnableRendering="true" Tag="H1" CssClass="CommonTitle">
        <DisplayConditions><CSBlog:GroupPropertyValueComparison runat="server" ComparisonProperty="GroupID" Operator="IsSetOrTrue" /></DisplayConditions>
        <ContentTemplate><CSBlog:GroupData runat="server" Property="Name" /></ContentTemplate>
    </CSControl:Title>

</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

    <div class="CommonContentBox">
        <div class="CommonContentBoxContent">

		    <CSBlog:GroupList runat="server">
			    <ItemTemplate>
				    <div class="CommonListArea">
				        <CSBlog:GroupData Property="Name" Tag="H4" CssClass="CommonListTitle" runat="server" />
    				
					    <CSBlog:WeblogList runat="server">
					        <QueryOverrides PagerID="Pager" PageSize="10" />
						    <HeaderTemplate>
							    <table width="100%" cellpadding="0" cellspacing="0">
								    <thead>
									    <tr>
										    <th class="CommonListHeader"><CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_Blog" /></th>
										    <th class="CommonListHeader"><CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_Author" /></th>
										    <th class="CommonListHeader" nowrap="nowrap"><CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_LastPost" /></th>    
										    <th class="CommonListHeader" align="center" nowrap="nowrap"><CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_Posts" /></th>                                    
										    <th class="CommonListHeader" align="center" nowrap="nowrap"><CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_Articles" /></th>
										    <th class="CommonListHeader" align="center" nowrap="nowrap"><CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_Comments" /></th>				
										    <th class="CommonListHeader" align="center" nowrap="nowrap"><CSControl:ResourceControl runat="server" ResourceName="Weblog_Aggregate_Trackbacks" /></th>
									    </tr>
								    </thead>
								    <tbody>
						    </HeaderTemplate>
						    <ItemTemplate>
    							    <tr class="CommonListRow">
									    <td class="CommonListCell BlogBlogNameColumn">
									        <CSBlog:WeblogData Property="Name" Tag="B" LinkTo="HomePage" runat="server" /><br />
									    </td>
									    <td class="CommonListCell BlogAuthorColumn">
									        <CSBlog:SectionMembershipList runat="server">
									            <QueryOverrides MembershipType="Owner" />
                                                <ItemTemplate><CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" /></ItemTemplate>
                                                <SeparatorTemplate>, </SeparatorTemplate>
									        </CSBlog:SectionMembershipList>
									        &nbsp;
									    </td>
									    <td class="CommonListCell">
									        <CSBlog:WeblogData Property="MostRecentPostSubject" LinkTo="MostRecentPost" runat="server" />&nbsp;
									    </td>
									    <td class="CommonListCell BlogPostsColumn">
									        <CSBlog:WeblogData Property="PostCount" runat="server" />&nbsp;
									    </td>                   						
									    <td class="CommonListCell BlogArticlesColumn">
									        <CSBlog:WeblogData Property="ArticleCount" runat="server" />&nbsp;
									    </td>
									    <td class="CommonListCell BlogCommentsColumn">
									        <CSBlog:WeblogData Property="CommentCount" runat="server" />&nbsp;
									    </td>
									    <td class="CommonListCell BlogTrackbacksColumn">
									        <CSBlog:WeblogData Property="TrackbackCount" runat="server" />&nbsp;
									    </td>														
								    </tr>
							        <tr class="CommonListRow">
							                <CSBlog:WeblogData ID="WeblogData1" Property="Description" Tag="Td" runat="server" colspan="7" CssClass="CommonListCell BlogBlogNameColumn">
							                </CSBlog:WeblogData>
							        </tr>

						    </ItemTemplate>
						    <AlternatingItemTemplate>
    							    <tr class="CommonListRowAlt">
									    <td class="CommonListCell BlogBlogNameColumn">
									        <CSBlog:WeblogData Property="Name" Tag="B" LinkTo="HomePage" runat="server" /><br />
									    </td>
									    <td class="CommonListCell BlogAuthorColumn">
									        <CSBlog:SectionMembershipList runat="server">
									            <QueryOverrides MembershipType="Owner" />
                                                <ItemTemplate><CSControl:UserData Property="DisplayName" LinkTo="Profile" runat="server" /></ItemTemplate>
                                                <SeparatorTemplate>, </SeparatorTemplate>
									        </CSBlog:SectionMembershipList>
									        &nbsp;
									    </td>
									    <td class="CommonListCell">
									        <CSBlog:WeblogData Property="MostRecentPostSubject" LinkTo="MostRecentPost" runat="server" />&nbsp;
									    </td>
									    <td class="CommonListCell BlogPostsColumn">
									        <CSBlog:WeblogData Property="PostCount" runat="server" />&nbsp;
									    </td>                   						
									    <td class="CommonListCell BlogArticlesColumn">
									        <CSBlog:WeblogData Property="ArticleCount" runat="server" />&nbsp;
									    </td>
									    <td class="CommonListCell BlogCommentsColumn">
									        <CSBlog:WeblogData Property="CommentCount" runat="server" />&nbsp;
									    </td>
									    <td class="CommonListCell BlogTrackbacksColumn">
									        <CSBlog:WeblogData Property="TrackbackCount" runat="server" />&nbsp;
									    </td>														
								    </tr>
							        <tr class="CommonListRowAlt">
							            <CSBlog:WeblogData ID="WeblogData1" Property="Description" Tag="Td" runat="server" colspan="7" CssClass="CommonListCell BlogBlogNameColumn">
						                </CSBlog:WeblogData>
							        </tr>
						    </AlternatingItemTemplate>
						    <FooterTemplate>
								    </tbody>
							    </table>        
						    </FooterTemplate>
					    </CSBlog:WeblogList>

					    <CSControl:PostbackPager runat="server" id="Pager" />
				    </div>
			    </ItemTemplate>
		    </CSBlog:GroupList>
	
        </div>
    </div>

</asp:Content>