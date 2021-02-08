<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="CommunityServer.Components" %>
<%@ Import Namespace="System.Drawing" %>

<script language="C#" runat="server">

    protected ThemeConfigurationData ThemeData = CSContext.Current.ThemePreviewCookie.IsPreviewing() ? ThemeConfigurationDatas.GetThemeConfigurationData("hawaii", CSContext.Current.ThemePreviewCookie.PreviewID, true) : ThemeConfigurationDatas.GetThemeConfigurationData("hawaii", true);

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Page.Response.ContentType = "text/css";
   
        Page.Response.Expires = 30;
    }

    protected string UrlOrNone(Uri url)
    {
        if (url == null)
            return "none";
        else
            return "url(" + ResolveUrl(url.ToString()) + ")";
    }

    protected Color AdjustColor(Color color, int rAmount, int gAmount, int bAmount)
    {
        int r = color.R;
        if (r + rAmount > 255)
            r = 255;
        else if (r + rAmount < 0)
            r = 0;
        else
            r += rAmount;

        int g = color.G;
        if (g + gAmount > 255)
            g = 255;
        else if (g + gAmount < 0)
            g = 0;
        else
            g += gAmount;

        int b = color.B;
        if (b + bAmount > 255)
            b = 255;
        else if (b + bAmount < 0)
            b = 0;
        else
            b += bAmount;

        return Color.FromArgb((byte)r, (byte)g, (byte)b);
    }

</script>

/* General Styles */

body, html
{
    font-family: <%= ThemeData.GetStringValue("textFont", "Arial, Helvetica") %>;
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("textColor", ColorTranslator.FromHtml("#666"))) %>;
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("siteBackgroundColor", ColorTranslator.FromHtml("#f0f0f0")))%>;
    background-image: <%= UrlOrNone(ThemeData.GetUrlValue("siteBackgroundImage", null))%>;
}

form
{
    min-width: <%= ThemeData.GetUnitValue("width", Unit.Parse("960px")) %>;
}

A:LINK
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#36c")))%>;
}

A:ACTIVE
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("activeLinkColor", ColorTranslator.FromHtml("#36c")))%>;
}

A:VISITED
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("visitedLinkColor", ColorTranslator.FromHtml("#039")))%>;
}

SELECT, TEXTAREA, INPUT, BUTTON
{
    font-family: <%= ThemeData.GetStringValue("textFont", "Arial, Helvetica") %>;
}

.Common
{
    width: <%= ThemeData.GetUnitValue("width", Unit.Parse("960px")) %>;
}

A.NewPageLink
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("newPageLinkColor", ColorTranslator.FromHtml("#FA5454")))%>;
}

/* Header Styles */

#CommonHeader
{
    background-image: <%= UrlOrNone(ThemeData.GetUrlValue("siteTitleBackgroundImage", null))%>;
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("siteTitleBackgroundColor", ColorTranslator.FromHtml("#ffffff")))%>;
    height: <%= ThemeData.GetUnitValue("siteTitleHeight", Unit.Parse("113px"))%>;
}

.CommonHeaderTitle
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("siteTitleColor", ColorTranslator.FromHtml("#000")))%>;
    font-family: <%= ThemeData.GetStringValue("siteTitleFont", "Arial, Helvetica") %>;
    font-size: <%= ThemeData.GetStringValue("siteTitleFontSize", "325%")%>;
}

#CommonHeaderUserRoundBottom .r1, #CommonHeaderUserRoundBottom .r2, #CommonHeaderUserRoundBottom .r3, #CommonHeaderUserRoundBottom .r4,
#CommonHeaderUserContent
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("siteTitleTopBorderColor", ColorTranslator.FromHtml("#95B6C3")))%>;
}

#CommonHeaderUserContent
{
    color: <%= ColorTranslator.ToHtml(AdjustColor(ThemeData.GetColorValue("siteTitleTopBorderColor", ColorTranslator.FromHtml("#95B6C3")), 7, 17, 21))%>;
}

/* Navigation Styles */

#CommonNavigation
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("navigationTabBackgroundColor", ColorTranslator.FromHtml("#95B6C3")))%>;
}

#CommonNavigation .Common .Inner, #CommonNavigation ul li
{
    border-color: <%= ColorTranslator.ToHtml(AdjustColor(ThemeData.GetColorValue("navigationTabBackgroundColor", ColorTranslator.FromHtml("#95B6C3")), 64, 43, 36))%>;
}

#CommonNavigation .Common, #CommonNavigation a:link, #CommonNavigation a:active, #CommonNavigation a:visited, #CommonNavigation a:link, #CommonNavigation a:active, #CommonNavigation a:hover
{
    border-color: <%= ColorTranslator.ToHtml(AdjustColor(ThemeData.GetColorValue("navigationTabBackgroundColor", ColorTranslator.FromHtml("#95B6C3")), -64, -43, -36))%>;
}

#CommonNavigation a:link, #CommonNavigation a:active, #CommonNavigation a:visited
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("navigationTabTextColor", ColorTranslator.FromHtml("#191919")))%>;
}

#CommonNavigation a:hover
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("navigationTabHoverTextColor", ColorTranslator.FromHtml("#fff")))%>;
}

#CommonNavigation a.Selected:link, #CommonNavigation a.Selected:active, #CommonNavigation a.Selected:visited
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("navigationTabSelectedTextColor", ColorTranslator.FromHtml("#191919")))%>;
    background-color: <%= ColorTranslator.ToHtml(AdjustColor(ThemeData.GetColorValue("navigationTabBackgroundColor", ColorTranslator.FromHtml("#95B6C3")), 65, 42, 36)) %>;
}

#CommonNavigation2
{
    background-color: <%= ColorTranslator.ToHtml(AdjustColor(ThemeData.GetColorValue("navigationTabBackgroundColor", ColorTranslator.FromHtml("#95B6C3")), 65, 42, 36)) %>;
}

#CommonNavigation2 a:link, #CommonNavigation2 a:active, #CommonNavigation2 a:visited
{
    color: <%= ColorTranslator.ToHtml(AdjustColor(ThemeData.GetColorValue("navigationTabBackgroundColor", ColorTranslator.FromHtml("#95B6C3")), -64, -64, -64))%>;
}

.CommonBreadCrumbArea
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("breadcrumbBackgroundColor", ColorTranslator.FromHtml("#f7f7f7")))%>;
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("breadcrumbTextColor", ColorTranslator.FromHtml("#000")))%>;
}

/* Body Styles */

.CommonTitle
{
    font-family: <%= ThemeData.GetStringValue("titleFont", "Arial, Helvetica") %>;
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("titleColor", ColorTranslator.FromHtml("#333"))) %>;
    font-size: <%= ThemeData.GetStringValue("titleFontSize", "200%")%>;
}

#CommonHeaderTitle
{
    font-size: <%= ThemeData.GetStringValue("siteTitleFontSize", "140%")%>;
}

#CommonHeaderTitle h1, #CommonHeaderTitle h1 A:LINK, #CommonHeaderTitle h1 A:VISITED, #CommonHeaderTitle h1 A:ACTIVE
{
    font-family: <%= ThemeData.GetStringValue("siteTitleFont", "Arial, Helvetica") %>;
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("siteTitleColor", ColorTranslator.FromHtml("#A0AE5A"))) %>;
}

.ForumPostHeader
{
    font-size: <%= ThemeData.GetStringValue("forumPostHeaderFontSize", "90%")%>;
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("forumPostHeaderTextColor", ColorTranslator.FromHtml("#000")))%>;
    font-family: <%= ThemeData.GetStringValue("forumPostHeaderFont", "Arial, Helvetica")%>;
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("forumPostHeaderBackgroundColor", ColorTranslator.FromHtml("#ccc")))%>;
}

.ForumPostHeader, .ForumPostTitleArea, .ForumPostContentArea, .ForumPostUserArea, .ForumPostFooterArea
{
    border-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("forumPostBorderColor", ColorTranslator.FromHtml("#E1E1E1")))%>;
}

.ForumPostTitleArea
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("forumPostManagementAreaBackgroundColor", ColorTranslator.FromHtml("#f4f4f4")))%>;
}

.ForumPostUserArea
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("forumPostUserAreaBackgroundColor", ColorTranslator.FromHtml("#f4f4f4")))%>;
}

.ForumPostContentArea
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("forumPostContentColor", ColorTranslator.FromHtml("#000")))%>;
}

A.ForumGroupNameRead, .ForumGroupNameRead:LINK, .ForumGroupNameRead:VISITED, A.ForumNameRead, .ForumNameRead:LINK, .ForumNameRead:VISITED
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("visitedLinkColor", ColorTranslator.FromHtml("#888")))%>;
}

A.ForumGroupNameUnRead, .ForumGroupNameUnRead:LINK, .ForumGroupNameUnRead:VISITED, A.ForumNameUnRead, .ForumNameUnRead:LINK, .ForumNameUnRead:VISITED
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#36c")))%>;
}

/* Content Box */

.CommonContentBox
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("contentBoxBackgroundColor", ColorTranslator.FromHtml("#fff")))%>;
    border-top-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("contentBoxBorderColor", ColorTranslator.FromHtml("#ccc")))%>;
}

.CommonContentBox .CommonContentBoxHeader
{
    border-bottom-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("contentBoxBorderColor", ColorTranslator.FromHtml("#ccc")))%>;
    font-family: <%= ThemeData.GetStringValue("contentBoxHeaderFont", "Arial, Helvetica")%>;
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("contentBoxHeaderTextColor", ColorTranslator.FromHtml("#333")))%>;
}

.CommonSearchRoundTop .r1, .CommonSearchRoundTop .r2, .CommonSearchRoundTop .r3, .CommonSearchRoundTop .r4,
.CommonSearchRoundBottom .r1, .CommonSearchRoundBottom .r2, .CommonSearchRoundBottom .r3, .CommonSearchRoundBottom .r4,
.CommonSearchContent
{
	background-color: <%= ColorTranslator.ToHtml(AdjustColor(ThemeData.GetColorValue("contentBoxBackgroundColor", ColorTranslator.FromHtml("#fff")), -8, -8, -8))%>;
	border-color: <%= ColorTranslator.ToHtml(AdjustColor(ThemeData.GetColorValue("contentBoxBorderColor", ColorTranslator.FromHtml("#ccc")), -24, -24, -24))%>;
}

.CommonSearchContent input
{
    background-color: <%= ColorTranslator.ToHtml(AdjustColor(ThemeData.GetColorValue("contentBoxBackgroundColor", ColorTranslator.FromHtml("#fff")), -8, -8, -8))%>;
}

/* Announcement Content Box */

.CommonContentBox.Highlighted
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("announcementContentBoxBackgroundColor", ColorTranslator.FromHtml("#ff9")))%>;
    border-top-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("announcementContentBoxBorderColor", ColorTranslator.FromHtml("#f93")))%>;
}

.CommonContentBox.Highlighted .CommonContentBoxHeader
{
    border-bottom-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("announcementContentBoxBorderColor", ColorTranslator.FromHtml("#f93")))%>;
    font-family: <%= ThemeData.GetStringValue("announcementContentBoxHeaderFont", "Arial, Helvetica")%>;
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("announcementContentBoxHeaderTextColor", ColorTranslator.FromHtml("#333")))%>;
}

/* Activity Content Box */

.CommonContentBox.TitleHighlighted
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("activityContentBoxBackgroundColor", ColorTranslator.FromHtml("#fff")))%>;
    border-top-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("activityContentBoxBorderColor", ColorTranslator.FromHtml("#f00")))%>;
}

.CommonContentBox.TitleHighlighted .CommonContentBoxHeader
{
    border-bottom-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("activityContentBoxBorderColor", ColorTranslator.FromHtml("#f00")))%>;
    font-family: <%= ThemeData.GetStringValue("activityContentBoxHeaderFont", "Arial, Helvetica")%>;
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("activityContentBoxHeaderTextColor", ColorTranslator.FromHtml("#333")))%>;
}

/* Highlighted Content Box */

.CommonContentBox.Highlighted2
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("highlightedContentBoxBackgroundColor", ColorTranslator.FromHtml("#EBFFFF")))%>;
    border-top-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("highlightedContentBoxBorderColor", ColorTranslator.FromHtml("#95B6C3")))%>;
}

.CommonContentBox.Highlighted2 .CommonContentBoxHeader
{
    border-bottom-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("highlightedContentBoxBorderColor", ColorTranslator.FromHtml("#95B6C3")))%>;
    font-family: <%= ThemeData.GetStringValue("highlightedContentBoxHeaderFont", "Arial, Helvetica") %>;
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("highlightedContentBoxHeaderTextColor", ColorTranslator.FromHtml("#333")))%>;
}

/* Message Box */

.CommonCommentBubbleRoundTop .r1, .CommonCommentBubbleRoundTop .r2, .CommonCommentBubbleRoundTop .r3, .CommonCommentBubbleRoundTop .r4,
.CommonCommentBubbleRoundBottom .r1, .CommonCommentBubbleRoundBottom .r2, .CommonCommentBubbleRoundBottom .r3, .CommonCommentBubbleRoundBottom .r4,
.CommonCommentArrow .r1, .CommonCommentArrow .r2, .CommonCommentArrow .r3, .CommonCommentArrow .r4,
.CommonCommentArrow .r5, .CommonCommentArrow .r6, .CommonCommentArrow .r7, .CommonCommentArrow .r8, 
.CommonCommentArrow .r9, .CommonCommentArrow .r10,
.CommonCommentContent
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("messageBoxBackgroundColor", ColorTranslator.FromHtml("#CEDEFD")))%>;
}

.Owner .CommonCommentBubbleRoundTop .r1, .Owner .CommonCommentBubbleRoundTop .r2, .Owner .CommonCommentBubbleRoundTop .r3, .Owner .CommonCommentBubbleRoundTop .r4,
.Owner .CommonCommentBubbleRoundBottom .r1, .Owner .CommonCommentBubbleRoundBottom .r2, .Owner .CommonCommentBubbleRoundBottom .r3, .Owner .CommonCommentBubbleRoundBottom .r4,
.Owner .CommonCommentArrow .r1, .Owner .CommonCommentArrow .r2, .Owner .CommonCommentArrow .r3, .Owner .CommonCommentArrow .r4,
.Owner .CommonCommentArrow .r5, .Owner .CommonCommentArrow .r6, .Owner .CommonCommentArrow .r7, .Owner .CommonCommentArrow .r8, 
.Owner .CommonCommentArrow .r9, .Owner .CommonCommentArrow .r10,
.Owner .CommonCommentContent
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("messageBoxAuthorBackgroundColor", ColorTranslator.FromHtml("#DFFFED")))%>;

}

/* File Box */

.CommonFileRoundTop .r1, .CommonFileRoundTop .r2, .CommonFileRoundTop .r3, .CommonFileRoundTop .r4,
.CommonFileRoundBottom .r1, .CommonFileRoundBottom .r2, .CommonFileRoundBottom .r3, .CommonFileRoundBottom .r4,
.CommonFileContent
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("fileBoxBackgroundColor", ColorTranslator.FromHtml("#ececec")))%>;
}

.CommonFile
{
    border-color: <%= ColorTranslator.ToHtml(AdjustColor(ThemeData.GetColorValue("fileBoxBackgroundColor", ColorTranslator.FromHtml("#ececec")), -32, -32, -32))%>;
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("contentBoxBackgroundColor", ColorTranslator.FromHtml("#fff")))%>;
}

/* List Styles */

.CommonListTitle
{
    font-family: <%= ThemeData.GetStringValue("listTitleFont", "Arial, Helvetica") %>;
    font-size: <%= ThemeData.GetStringValue("listTitleFontSize", "100%")%>;
}

.CommonListTitle, .CommonListTitle a:link, .CommonListTitle a:visited, .CommonListTitle a:active
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("listTitleTextColor", ColorTranslator.FromHtml("#000")))%>;
}

.CommonListHeader
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("listHeaderBackgroundColor", ColorTranslator.FromHtml("#999")))%>;
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("listHeaderTextColor", ColorTranslator.FromHtml("#fff")))%>;
}

.CommonListRow, .CommonAvatarListItemArea
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("listAlternateRowColor", ColorTranslator.FromHtml("#eee")))%>;
}

.CommonListRowAlt td, .CommonAvatarListItemArea.Alt
{
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("contentBoxBackgroundColor", ColorTranslator.FromHtml("#fff")))%>;;
}

/* Footer Styles */

#CommonFooter
{
    background-image: <%= UrlOrNone(ThemeData.GetUrlValue("siteFooterBackgroundImage", null))%>;
    background-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("siteFooterBackgroundColor", ColorTranslator.FromHtml("#f7f7f7")))%>;
}

/* Sidebar Styles */

#CommonSidebarLeft .CommonSidebar, #CommonSidebarRight .CommonSidebar
{
    width: <%= ThemeData.GetUnitValue("sidebarWidth", Unit.Parse("240px")) %>;
}

/* Modal Styles */

.CommonModal, .CommonModalTitle
{
    border-color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("modalBorderColor", ColorTranslator.FromHtml("#333")))%>;
}

.CommonModalTitle
{
    color: <%= ColorTranslator.ToHtml(ThemeData.GetColorValue("modalTitleTextColor", ColorTranslator.FromHtml("#333")))%>;
    font-family: <%= ThemeData.GetStringValue("modalTitleFont", "Arial, Helvetica") %>;
}

<%= ThemeData.DecodeStringValue(ThemeData.GetCustomValue("cssOverrides", string.Empty)) %>
