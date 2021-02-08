<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="CommunityServer.Components" %>

<script language="C#" runat="server">

    void Page_Load()
    {
        AdsConfiguration adsConfig = AdsConfiguration.Instance(true);
        this.Visible = adsConfig.Enabled && adsConfig.AllowInlineControl && AdsConfiguration.DisplayAd();
    }

</script>

<%-- Place ad mark-up here --%>