<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="CommunityServer.Components" %>
<%@ Import Namespace="System.Drawing" %>

<script language="C#" runat="server">

    protected ThemeConfigurationData themeData = CSContext.Current.GetCurrent<ThemeConfigurationData>(ApplicationType.Weblog);

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Page.Response.ContentType = "text/css";
   
        Page.Response.Expires = 30;
    }

    protected string UrlOrNone(Uri url)
    {
        if (url == null || string.IsNullOrEmpty(url.ToString()))
            return "none";
        else
            return "url(" + ResolveUrl(url.ToString()) + ")";
    }
    
    protected Color AdjustIntensity(Color color, int amount)
    {
        int r = color.R;
        if (r + amount > 255)
            r = 255;
        else if (r + amount < 0)
            r = 0;
        else
            r += amount;

        int g = color.G;
        if (g + amount > 255)
            g = 255;
        else if (g + amount < 0)
            g = 0;
        else
            g += amount;

        int b = color.B;
        if (b + amount > 255)
            b = 255;
        else if (b + amount < 0)
            b = 0;
        else
            b += amount;

        return Color.FromArgb((byte)r, (byte)g, (byte)b);
    }

</script>

body, html
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("textColor", Color.Empty)) %>;
    font-family: <%= themeData.GetStringValue("textFont", "") %>;
    background-color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("siteBackgroundColor", Color.Empty)) %>;
    background-image: <%= UrlOrNone(themeData.GetUrlValue("siteBackgroundImage", null))%>;
}

a:link
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("linkColor", Color.Empty)) %>;
}

a:hover, a:active
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("activeLinkColor", Color.Empty))%>;
}

a:visited
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("visitedLinkColor", Color.Empty))%>;
}

#header h2
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("siteTitleColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("siteTitleFont", "")%>;
    font-size: <%= themeData.GetStringValue("siteTitleFontSize", "")%>;
}

#header h2 a:link, #header h2 a:visited, #header h2 a:active, #header h2 a:hover
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("siteTitleColor", Color.Empty))%>;
}

#navbar li
{
    background-color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("navigationTabBackgroundColor", Color.Empty))%>;
}

#navbar li.navselected
{
    background-color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("navigationTabBackgroundColorHover", Color.Empty))%>;
}

#navbar a:link, #navbar a:active, #navbar a:visited
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("navigationTabTextColor", Color.Empty))%>;
}

#navbar a:hover
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("navigationTabTextColor", Color.Empty))%>;
    background-color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("navigationTabBackgroundColorHover", Color.Empty))%>;
}

.entryviewheading
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("titleColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("titleFont", "")%>;
    font-size: <%= themeData.GetStringValue("titleFontSize", "")%>;
}

.entryview
{
    background-image: <%= UrlOrNone(themeData.GetUrlValue("contentBackgroundImage", null))%>;
}

dl.entrylist dt
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("subTitleColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("subTitleFont", "")%>;
    font-size: <%= themeData.GetStringValue("subTitleFontSize", "")%>;
}

dl.entrylist dt a:link, dl.entrylist dt a:visited, dl.entrylist dt a:active, dl.entrylist dt a:hover
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("subTitleColor", Color.Empty))%>;
}

.sideboxes h4, .rightsideboxes h4
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarHeaderTextColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("sidebarHeaderFont", "")%>;
    font-size: <%= themeData.GetStringValue("sidebarHeaderFontSize", "")%>;
    background-image: <%= UrlOrNone(themeData.GetUrlValue("sidebarHeaderBackgroundImage", null))%>;
}

.sideboxes, .rightsideboxes
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarTextColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("sidebarFont", "")%>;
    font-size: <%= themeData.GetStringValue("sidebarFontSize", "")%>;
}

.sideboxes a:link, .rightsideboxes a:link
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarLinkColor", Color.Empty))%>;
}

.sideboxes a:visited, .rightsideboxes a:visited
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarVisitedLinkColor", Color.Empty))%>;
}

.sideboxes a:active, .sideboxes a:hover, .rightsideboxes a:active, .rightsideboxes a:hover
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarActiveLinkColor", Color.Empty))%>;
}

.recentposts a:link
{
	color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("subTitleColor", Color.Empty))%>;
}

.souptag1 a:link, .souptag1 a:visited, .souptag1 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -85))%>;
}

.souptag2 a:link, .souptag2 a:visited, .souptag2 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -68))%>;
}

.souptag3 a:link, .souptag3 a:visited, .souptag3 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -51))%>;
}

.souptag4 a:link, .souptag4 a:visited, .souptag4 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -34))%>;
}

.souptag5 a:link, .souptag5 a:visited, .souptag5 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -17))%>;
}

.souptag6 a:link, .souptag6 a:visited, .souptag6 a:active
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")))%>;
}

<%= themeData.GetStringValue("cssOverrides", string.Empty)%>