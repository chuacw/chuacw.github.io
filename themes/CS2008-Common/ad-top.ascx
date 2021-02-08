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
<div align="center" style="padding-top:5px;padding-bottom:5px;">
    <iframe width="486" height="60" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" src="http://www.communityserver.org/Banner.aspx?z=1"></iframe>
</div>