<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="CommunityServer.Components" %>
<%@ Import Namespace="System.Drawing" %>

<script language="C#" runat="server">

    protected ThemeConfigurationData themeData = CSContext.Current.GetCurrent<ThemeConfigurationData>(ApplicationType.Hub);

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Page.Response.ContentType = "text/css";
   
        Page.Response.Expires = 30;
    }

</script>

<%= themeData.GetStringValue("cssOverrides", string.Empty)%>