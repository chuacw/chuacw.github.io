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

#header
{
    background-image: <%= UrlOrNone(themeData.GetUrlValue("siteTitleBackgroundImage", null))%>;
    border-bottom-color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("siteTitleBackgroundBorderColor", Color.Empty)) %>;;
}

#header h2
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("siteTitleColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("siteTitleFont", "")%>;
    font-size: <%= themeData.GetStringValue("siteTitleFontSize", "")%>;
}

#header h2 a 
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("siteTitleColor", Color.Empty))%>;
}

.entryviewheading, .contentsubheading
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("titleColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("titleFont", "")%>;
    font-size: <%= themeData.GetStringValue("titleFontSize", "")%>;
}

.entrylistheader
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("subTitleColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("subTitleFont", "")%>;
    font-size: <%= themeData.GetStringValue("subTitleFontSize", "")%>;
}

.entrylistheader a:link, .entrylistheader a:visited, .entrylistheader a:active, .entrylistheader a:hover
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("subTitleColor", Color.Empty))%>;
}

.sideheader
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarHeaderTextColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("sidebarHeaderFont", "")%>;
    font-size: <%= themeData.GetStringValue("sidebarHeaderFontSize", "")%>;
}

#subcontent-a
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarTextColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("sidebarFont", "")%>;
}

ul.sidelist li
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarTextColor", Color.Empty))%>;
    font-family: <%= themeData.GetStringValue("sidebarFont", "")%>;
    font-size: <%= themeData.GetStringValue("sidebarFontSize", "")%>;
}

#subcontent-a a:link
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarLinkColor", Color.Empty))%>;
}

#subcontent-a a:visited
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarVisitedLinkColor", Color.Empty))%>;
}

#subcontent-a a:active, #subcontent-a a:hover
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("sidebarActiveLinkColor", Color.Empty))%>;
}

.tag1 a:link, .tag1 a:visited, .tag1 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -85))%>;
}

.tag2 a:link, .tag2 a:visited, .tag2 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -68))%>;
}

.tag3 a:link, .tag3 a:visited, .tag3 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -51))%>;
}

.tag4 a:link, .tag4 a:visited, .tag4 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -34))%>;
}

.tag5 a:link, .tag5 a:visited, .tag5 a:active
{
    color: <%= ColorTranslator.ToHtml(AdjustIntensity(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")), -17))%>;
}

.tag6 a:link, .tag6 a:visited, .tag6 a:active
{
    color: <%= ColorTranslator.ToHtml(themeData.GetColorValue("linkColor", ColorTranslator.FromHtml("#00F")))%>;
}

#header
{
    height: <%= themeData.GetUnitValue("siteTitleHeight", Unit.Empty) %>;
}

<%= themeData.GetStringValue("cssOverrides", string.Empty)%>