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

#top
{
    background-color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("siteTitleBackgroundColor", Color.Empty))%>;
}

h1.headermaintitle
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("siteTitleColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("siteTitleFont", "")%>;
    font-size: <%= themeData.GetStringValue("siteTitleFontSize", "")%>;
}

h1.headermaintitle a:link, h1.headermaintitle a:visited, h1.headermaintitle a:active
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("siteTitleColor", Color.Empty))%>;
}

h2.pageTitle
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("titleColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("titleFont", "")%>;
    font-size: <%= themeData.GetStringValue("titleFontSize", "")%>;
}

.post h5
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("subTitleColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("subTitleFont", "")%>;
    font-size: <%= themeData.GetStringValue("subTitleFontSize", "")%>;
}

.post h5 a:link, .post h5 a:visited, .post h5 a:active, .post h5 a:hover
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("subTitleColor", Color.Empty))%>;
}

#leftmenu h3
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarHeaderTextColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("sidebarHeaderFont", "")%>;
    font-size: <%= themeData.GetStringValue("sidebarHeaderFontSize", "")%>;
}

#leftmenu
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarTextColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("sidebarFont", "")%>;
}

#leftmenu ul, #leftmenu p
{
    font-size: <%= themeData.GetStringValue("sidebarFontSize", "")%>;
}

#leftmenu a:link
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarLinkColor", Color.Empty))%>;
}

#leftmenu a:visited
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarVisitedLinkColor", Color.Empty))%>;
}

#leftmenu a:active, #leftmenu a:hover
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarActiveLinkColor", Color.Empty))%>;
}

.Tag1 a:link, .Tag1 a:visited, .Tag1 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -85))%>;
}

.Tag2 a:link, .Tag2 a:visited, .Tag2 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -68))%>;
}

.Tag3 a:link, .Tag3 a:visited, .Tag3 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -51))%>;
}

.Tag4 a:link, .Tag4 a:visited, .Tag4 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -34))%>;
}

.Tag5 a:link, .Tag5 a:visited, .Tag5 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -17))%>;
}

.Tag6 a:link, .Tag6 a:visited, .Tag6 a:active
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")))%>;
}

<%= themeData.GetStringValue("cssOverrides", string.Empty)%>