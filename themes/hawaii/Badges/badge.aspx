<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" %>
<%@ Import Namespace="CommunityServer.Blogs.Components" %>
<%@ Import Namespace="CommunityServer.Components" %>
<%@ Import Namespace="CommunityServer" %>

<script language="C#" runat="server">
	void Page_Load()
	{
		JavaScript.RenderAsJavaScript(this.Context);
	
		// acquire current context
        CSContext csContext = CurrentCSContext;
		
		// if settings don't allow anonymous viewing of profiles, don't show badge
		if ((csContext.User.IsAnonymous) && (csContext.SiteSettings.RequireAuthenticationForProfiles))
		{
			badge.Visible = false;
			Context.Response.End();
		}

		// don't show the anonymous user's badge
        if (CurrentUser.IsAnonymous)
		{
			badge.Visible = false;
			Context.Response.End();
		}

        Users.ValidateUserAccess(CurrentUser, csContext.User);

        HyperLink siteLink = CSControlUtility.Instance().FindControl(this, "SiteLink") as HyperLink;
        if (siteLink != null)
        {
            siteLink.Text = csContext.SiteSettings.SiteName;
            siteLink.NavigateUrl = csContext.SiteSettings.SiteUrl;
        }

		// Note: Disabling the "Powered By" text of the badge is a violation
		// of the Community Server Express Edition End User License Agreement
		//
		if (Telligent.Registration.Licensing.CommunityServer.DisplayBranding && !csContext.SiteSettings.EnableEula)
        {
            Control footer = CSControlUtility.Instance().FindControl(this, "Footer");
            if (footer != null)
                footer.Visible = false;
        }
	}
	
	
</script>

<asp:placeholder id="badge" runat="server">
	<style>
		#CommonBadge
		{
			margin: 0px;
			border: solid 1px <%= Request.QueryString["bordercolor"] == null ? "#e1e1e1" : Request.QueryString["bordercolor"] %>;	
			width: <%= Request.QueryString["width"] == null ? "180px" : Request.QueryString["width"] %>;
			overflow: hidden;
			font-family: Arial, Helvetica;
			font-size: <%= Request.QueryString["basefontsize"] == null ? "10pt" : Request.QueryString["basefontsize"] %>;
			color: <%= Request.QueryString["contentcolor"] == null ? "#333" : Request.QueryString["contentcolor"] %>;
		}
		
		#CommonBadge a:link, #CommonBadge a:visited, #CommonBadge a:hover, #CommonBadge a:active
		{
			color: <%= Request.QueryString["linkcolor"] == null ? "#000" : Request.QueryString["linkcolor"] %>;
		}

		.CommonBadgeHeader
		{
			padding: 6px;
			padding-left: 8px;
			border-bottom: solid 1px <%= Request.QueryString["bordercolor"] == null ? "#e1e1e1" : Request.QueryString["bordercolor"] %>;
			background-color: <%= Request.QueryString["headerbgcolor"] == null ? "#eee" : Request.QueryString["headerbgcolor"] %>;
			font-size: 90%;
			font-weight: bold;
			margin: 0px;
			text-align: center;
		}

		.CommonBadgeContent
		{
			background-color: <%=Request.QueryString["contentbgcolor"] == null ? "#f3f3f3" : Request.QueryString["contentbgcolor"] %>;
			padding: 8px;
		}

		UL.CommonBadgeContentList
		{
			margin: 0px;
			padding: 0px;
			list-style-type: none;	
			padding-left: 4px;
		}

		UL.CommonBadgeContentList LI
		{
			margin: 4px;
			margin-left: 2px;
			margin-right: 10px;
			font-size: 90%;
			text-align: center;
		}

		.CommonBadgeUserName
		{
			font-weight: bold;
		}

		.CommonBadgeAvatar
		{
		}

		.CommonBadgeFooter
		{
			font-size: 70%;
			text-align: center;
			padding: 8px;
			background-color: <%= Request.QueryString["headerbgcolor"] == null ? "#eee" : Request.QueryString["headerbgcolor"] %>;
			border-top: solid 1px <%= Request.QueryString["bordercolor"] == null ? "#e1e1e1" : Request.QueryString["bordercolor"] %>;
		}
	</style>

    <div id="CommonBadge">
        <h4 class="CommonBadgeHeader">
		    <asp:HyperLink runat="server" id="SiteLink" Target="_top" />
		</h4>
        <CSControl:UserData runat="server" ID="UserBadge">
	    <ContentTemplate>
		    <div class="CommonBadgeContent">
			    <ul class="CommonBadgeContentList">
				    <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" LinkTarget="_top" Tag="Li" CssClass="CommonBadgeUserName" />
			        <CSControl:UserAvatar runat="server" Tag="Li" CssClass="CommonBadgeAvatar" />
			        <CSControl:UserPostIcons runat="server" Tag="Li" />
			        <CSControl:UserPostGenderIcon runat="server" Tag="Li" />
			        <CSControl:UserData runat="server" Property="DateCreated" Tag="Li"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="PostFlatView_Joined" /></LeaderTemplate></CSControl:UserData>
			        <CSControl:UserProfileData runat="server" Property="Location" Tag="Li" />
			        <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="TotalPosts" Tag="Li">
                        <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="PostCount" Operator="EqualTo" /></DisplayConditions>
                        <LeaderTemplate><CSControl:ResourceControl ResourceName="PostFlatView_Posts" runat="server" /></LeaderTemplate>
                    </CSControl:UserData>
                    <CSControl:UserData runat="server" LinkTo="PostsSearch" Property="UserRank" Tag="Li">
                        <DisplayConditions><CSControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="PostingActivityDisplay" ComparisonValue="UserRank" Operator="EqualTo" /></DisplayConditions>
                    </CSControl:UserData>
                    <CSControl:UserData runat="server" Property="Points" Tag="Li"><LeaderTemplate><CSControl:ResourceControl runat="server" ResourceName="PostFlatView_UserPoints" /></LeaderTemplate></CSControl:UserData>
                    <CSControl:UserRoleIcons runat="server" LinkTo="Role" Tag="Li">
                        <SeparatorTemplate><br /></SeparatorTemplate>
                    </CSControl:UserRoleIcons>
			    </ul>						
		    </div>
	    </ContentTemplate>
	    </CSControl:UserData>
	    <div class="CommonBadgeFooter" id="Footer" runat="server">
			<CSControl:ResourceControl resourcename="Badge_PoweredBy" runat="server" />
			<a href="http://nohelp/r.ashx?B" target="_top">Community Server</a>
		</div>
	</div>
</asp:placeholder>




