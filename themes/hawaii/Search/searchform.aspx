<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="sr" runat="server" />

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="SearchAdvanced_Title" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<script type="text/javascript">
// <![CDATA[
var prevDateComparerIndex = 0;

function DateComparerChange() 
{
	var dateComparerIndex = document.getElementById('<%=CSControlUtility.Instance().FindControl(this, "DateComparer").ClientID%>').selectedIndex;

	if (dateComparerIndex == 0 || prevDateComparerIndex == -1)
		document.getElementById('StartDateContainer').style.display = 'none';
	else if (prevDateComparerIndex == 0)
		document.getElementById('StartDateContainer').style.display = 'inline';
	
	if (prevDateComparerIndex == 2 || prevDateComparerIndex == -1)
		document.getElementById('EndDateContainer').style.display = 'none';
	else if (dateComparerIndex == 2)
		document.getElementById('EndDateContainer').style.display = 'inline';

	prevDateComparerIndex = dateComparerIndex;
}

// ]]>
</script>

<div class="CommonContentBox">
	<div class="CommonContentBoxContent">

    	<div class="CommonDescription"><CSControl:ResourceControl ResourceName="SearchAdvanced_Description" runat="server" /></div>
		
		<CSControl:SearchForm runat="server" 
		    CustomValidatorId="Validator" 
		    DateComparerDropDownListId="DateComparer" 
		    EndDateTimeSelectorId="EndDate" 
		    QueryTextBoxId="Keywords" 
		    SectionTreeViewId="" 
		    SortByDropDownListId="SortBy" 
		    StartDateTimeSelectorId="StartDate" 
		    SubmitButtonId="SearchButton" 
		    TagsTextBoxId="Tags" 
		    UsersTextBoxId="Users"
		    FriendsOnlyCheckboxId="ynFriendsOnlyCheckBox">
            <FormTemplate>
		
		        <asp:CustomValidator Runat="server" id="Validator" Display="Dynamic" />

		        <div class="CommonFormArea">
		            <div class="CommonFormFieldName">
				        <CSControl:ResourceControl runat="server" ResourceName="SearchAdvanced_Keywords" />
			        </div>
			        <div class="CommonFormField">
				        <asp:textbox id="Keywords" runat="server" columns="60" />
			        </div>
		        
			        <div class="CommonFormFieldName">
				        <CSControl:ResourceControl runat="server" ResourceName="SearchAdvanced_Tags" />
			        </div>
			        <div class="CommonFormFieldDescription">
			            <CSControl:ResourceControl runat="server" ResourceName="SearchAdvanced_Tags_Info" />
			        </div>
			        <div class="CommonFormField">
				        <asp:TextBox Runat="server" ID="Tags" Columns="60" />
			        </div>

			        <div class="CommonFormFieldName">
				        <CSControl:ResourceControl runat="server" ResourceName="SearchAdvanced_Users" />
			        </div>
			        <div class="CommonFormFieldDescription">
			            <CSControl:ResourceControl runat="server" ResourceName="SearchAdvanced_Users_Info" />
			        </div>
			        <div class="CommonFormField">
				        <asp:textbox id="Users" runat="server" columns="60" />
			        </div>
        		
			        <div class="CommonFormFieldName">
				        <CSControl:ResourceControl runat="server" ResourceName="SearchAdvanced_Date" />
			        </div>
			        <div class="CommonFormField">
				        <asp:dropdownlist id="DateComparer" runat="server" />
				        <span id="StartDateContainer" style="display: none;">
    				        <TWC:DateTimeSelector runat="server" ID="StartDate" DateTimeFormat="MMMM d yyyy" ShowCalendarPopup="true" />
				        </span>

				        <span id="EndDateContainer" style="display: none;">
				            <CSControl:ResourceControl ResourceName="SearchAdvanced_Date_Range_And" runat="server" />
				            <TWC:DateTimeSelector runat="server" ID="EndDate" DateTimeFormat="MMMM d yyyy" ShowCalendarPopup="true" />
				        </span>
			        </div>
        		
			        <div class="CommonFormFieldName">
				        <CSControl:ResourceControl runat="server" ResourceName="SearchAdvanced_Sort" />
			        </div>
			        <div class="CommonFormField">
				        <asp:DropDownList ID="SortBy" Runat="server" />
			        </div>
        		
        		    <CSControl:PlaceHolder runat="server">
        		        <DisplayConditions>
        		            <CSControl:UserInRoleCondition runat="server" UseAccessingUser="true" Role="Registered Users" />
        		        </DisplayConditions>
        		        <ContentTemplate>
        		            <div class="CommonFormFieldName">
			                    <CSControl:ResourceControl runat="server" ResourceName="SearchAdvanced_FriendsOnly" />
			                </div>
			                <div class="CommonFormField">
				                <CSControl:YesNoCheckBox runat="server" ID="ynFriendsOnlyCheckBox" />
			                </div>
        		        </ContentTemplate>
        		    </CSControl:PlaceHolder>
        		
		        <div class="CommonFormFieldName">
				    <CSControl:ResourceButton ResourceName="Search" id="SearchButton" runat="server" />
                </div>
	        </div>
            </FormTemplate>
        </CSControl:SearchForm>
    </div>
</div>

<script type="text/javascript">
// <![CDATA[
document.getElementById('<%=CSControlUtility.Instance().FindControl(this, "DateComparer").ClientID%>').onchange = DateComparerChange;
DateComparerChange();
// ]]>
</script>

</asp:Content>
