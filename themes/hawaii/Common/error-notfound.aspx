<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="master.Master" %>

<script language="C#" runat="server">

    void Page_Load()
    {
        Page.Response.StatusCode = 404;
    }

</script>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<div style="width: 50%; margin: 100px auto;">
    <div class="CommonContentBox">
        <h2 class="CommonContentBoxHeader"><CSControl:Title runat="server" IncludeSiteName="true" ResourceName="Error_NotFound_Title" EnableRendering="true" /></h4>
	    <div class="CommonContentBoxContent">
				
			<CSControl:ResourceControl ResourceName="Error_NotFound_Description" runat="server" Tag="Div" CssClass="CommonDescription" />
			<p />
			<CSControl:SearchForm runat="server" 
                QueryTextBoxId="TitleBarSearchText" 
                SubmitButtonId="TitleBarSearchButton"
                DefaultSearchText="Search this site"
                >
                <FormTemplate>
                    <div class="CommonFormArea">
                        <div class="CommonFormFieldName">
                            <CSControl:DefaultButtonTextBox id="TitleBarSearchText" runat="server" columns="45" maxlength="128" ButtonId="TitleBarSearchButton" onkeyup="if (this.value == '') this.className = 'CommonSearchInputEmpty'; else this.className = 'CommonSearchInputNormal';" class="CommonSearchInputEmpty" />
                            <CSControl:ResourceButton id="TitleBarSearchButton" runat="server" ResourceName="Search" />
                        </div>
                    </div>
                </FormTemplate>
            </CSControl:SearchForm>
	
		</div>
	</div>
</div>

</asp:Content>