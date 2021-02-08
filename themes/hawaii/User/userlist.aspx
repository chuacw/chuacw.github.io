<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" Inherits="CommunityServer.Controls.CSThemePage" MasterPageFile="../Common/master.Master" %>

<asp:Content ContentPlaceHolderID="tr" runat="server">
    <CSControl:Title runat="server" IncludeSiteName="true" ResourceName="CommunityServerMembers_Inline1" EnableRendering="true" Tag="H1" CssClass="CommonTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bcr" runat="server">

<script type="text/javascript">
// <![CDATA[
prevJoinedDateIndex = 0;
prevPostDateIndex = 0;

function LastPostDateComparerChange()
{
    var dateComparerIndex = document.getElementById('<%=CSControlUtility.Instance().FindControl(this, "lastPostDateComparer").ClientID%>').selectedIndex;
    if (dateComparerIndex == 0)
        document.getElementById('lastPostDateContainer').style.display = 'none';
    else
        document.getElementById('lastPostDateContainer').style.display = 'inline';
}

function JoinedDateComparerChange()
{
    var dateComparerIndex = document.getElementById('<%=CSControlUtility.Instance().FindControl(this, "joinedDateComparer").ClientID%>').selectedIndex;
    if (dateComparerIndex == 0)
        document.getElementById('joinedDateContainer').style.display = 'none';
    else
        document.getElementById('joinedDateContainer').style.display = 'inline';
}
// ]]>
</script>

<div class="CommonContentBox">
    <div class="CommonContentBoxHeaderForm">
	
	    <CSControl:UserSearchForm runat="server" 
	        CurrentAccountStatusDropDownListId="currentAccountStatus" 
	        JoinedDateTimeSelectorId="joinedDate" 
	        JoinedDateComparerDropDownListId="joinedDateComparer" 
	        LastPostDateTimeSelectorId="lastPostDate" 
	        LastPostDateComparerDropDownListId="lastPostDateComparer" 
	        MemberSortDropDownListId="memberSortDropDown" 
	        QueryTextBoxId="searchText" 
	        SearchRoleDropDownListId="searchRole" 
	        SearchTypeDropDownListId="searchType" 
	        SortOrderDropDownListId="sortOrderDropDown" 
	        SubmitButtonId="searchButton"
	        >
	        <FormTemplate>
	            <asp:Panel runat="server" DefaultButton="searchButton">
	            <div class="CommonFormArea">
                    <div class="CommonFormFieldName">Search</div>
                    <div class="CommonFormField">
                        <asp:textbox id="searchText" runat="server" Columns="50" maxlength="255" />
                        <CSControl:ResourceButton id="searchButton" runat="server" ResourceName="Search" />
                    </div>
                    
                    <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" resourcename="UserSearchControl_SortBy" /></div>
                    <div class="CommonFormField">
                        <asp:DropDownList id="memberSortDropDown" runat="server" />
                        <asp:DropDownList id="sortOrderDropDown" runat="server" />
                    </div>

                    <div class="CommonFormFieldName"><CSControl:ResourceControl  runat="server" resourcename="UserSearchControl_JoinedDate" /></div>
                    <div class="CommonFormField">
                        <asp:dropdownlist id="joinedDateComparer" runat="server" />
                        <span id="joinedDateContainer">
                            <TWC:DateTimeSelector runat="server" ID="joinedDate" DateTimeFormat="MMMM d yyyy" ShowCalendarPopup="true" />
                        </span>
                    </div>
	                
	                <div class="CommonFormFieldName"><CSControl:ResourceControl runat="server" resourcename="UserSearchControl_LastPostDate" /></div>
	                <div class="CommonFormField">
                        <asp:dropdownlist id="lastPostDateComparer" runat="server" />
                        <span id="lastPostDateContainer">
                            <TWC:DateTimeSelector runat="server" ID="lastPostDate" DateTimeFormat="MMMM d yyyy" ShowCalendarPopup="true" />
                        </span>
                    </div>	                    

                    <div class="CommonFormFieldName">
                        <CSControl:ResourceControl runat="server" resourcename="UserSearchControl_Role" />
                    </div>
                    <div class="CommonFormField">
	                    <asp:DropDownList id="searchRole" runat="server" />
                    </div>	                    
	                    
                    <CSControl:PlaceHolder runat="server">
                        <DisplayConditions>
                            <CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAdministrator" Operator="IsSetOrTrue" />
                            <CSControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsMembershipAdministrator" Operator="IsSetOrTrue" />
                        </DisplayConditions>
                        <ContentTemplate>
                            <div class="CommonFormFieldName">
                                <CSControl:ResourceControl runat="server" ResourceName="UserSearchControl_SearchFor" />
                            </div>
                            <div class="CommonFormField">
	                            <asp:DropDownList id="searchType" runat="server" align="absmiddle" />
                            </div>
                        </ContentTemplate>
                    </CSControl:PlaceHolder>
	                        
                    <div class="CommonFormFieldName">
                        <CSControl:ResourceControl runat="server" resourcename="UserSearchControl_Status" />
                    </div>
                    <div class="CommonFormField"><asp:DropDownList id="currentAccountStatus" runat="server" /></div>
	            </div>
	            </asp:Panel>
            </FormTemplate>
	    </CSControl:UserSearchForm>
	</div>
	<div class="CommonContentBoxContent">
    
	    <CSControl:UserList runat="server">
	        <QueryOverrides QueryType="Search" PagerID="Pager" PageSize="26" />
	        <DisplayConditions Operator="Or">
	            <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="search" Operator="EqualTo" ComparisonValue="1" runat="server" />
	        </DisplayConditions>
	        <ItemTemplate>
                <div class="CommonAvatarListArea">
                   <CSControl:UserData LinkTo="Profile" runat="server" Tag="Div" CssClass="CommonAvatarArea"><ContentTemplate><CSControl:UserAvatar runat="server" Width="60" Height="60" /></ContentTemplate></CSControl:UserData>
                   <CSControl:UserData runat="server" Property="DisplayName" LinkTo="Profile" TruncateAt="25" />
                </div>
	        </ItemTemplate>
	        <NoneTemplate>
                <CSControl:ResourceControl runat="server" ResourceName="ForumMembers_NoRecords" />
	        </NoneTemplate>
	        <FooterTemplate>
                <div style="clear:both;"></div>
	        </FooterTemplate>
	    </CSControl:UserList>
    </div>
    <CSControl:Pager runat="server" ID="Pager" CssClass="CommonContentBoxFooter" Tag="Div" ShowTotalSummary="true">
        <DisplayConditions>
            <CSControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="search" Operator="EqualTo" ComparisonValue="1" runat="server" />
        </DisplayConditions>
    </CSControl:Pager>
</div>

<script type="text/javascript">
// <![CDATA[
document.getElementById('<%=CSControlUtility.Instance().FindControl(this, "lastPostDateComparer").ClientID%>').onchange = LastPostDateComparerChange;
document.getElementById('<%=CSControlUtility.Instance().FindControl(this, "joinedDateComparer").ClientID%>').onchange = JoinedDateComparerChange;
LastPostDateComparerChange();
JoinedDateComparerChange();
// ]]>
</script>

</asp:Content>

