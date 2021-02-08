<%@ Control Language="C#" AutoEventWireup="true" %>

<CSControl:Title runat="server" IncludeSiteName="true">
    <ContentTemplate><CSForum:ThreadData runat="server" Property="Subject" /></ContentTemplate>
</CSControl:Title>

<script type="text/javascript">
// <![CDATA[
function resizeTreeViewPane(newPaneHeight, newPaneWidth)
{
    var listing = document.getElementById('PostTree');
    var header = document.getElementById('PostTreeHeading');
    if (listing && header)
    {
        try
        {
	        listing.style.height = (newPaneHeight - parseInt(header.offsetHeight)) + 'px';
	        <%=ThreadTree.ClientID%>.Resize(newPaneWidth - 4, newPaneHeight - parseInt(header.offsetHeight) - 2);
        }
        catch (err)
        {
        }
    }
}

var displayPaneWidth, displayPaneHeight;
function resizePostDisplayPane(newPaneHeight, newPaneWidth)
{
    displayPaneWidth = newPaneWidth;
    displayPaneHeight = newPaneHeight;

    var iframe = document.getElementById('<%=PostContainer.ClientID%>');
    if (iframe && iframe.contentWindow && iframe.contentWindow.resizePostDisplay)
        iframe.contentWindow.resizePostDisplay(newPaneWidth, newPaneHeight);
		
}

function getPostDisplayWidthHeight()
{
    return new Array(displayPaneWidth, displayPaneHeight);
}

function updateLinkTargets(doc)
{
    try
    {
        if (doc && doc.getElementsByTagName)
        {
	        var re = new RegExp('^javascript', 'i');
	        var elements = doc.getElementsByTagName('A');
	        for(var i = 0; i < elements.length; i++)
	        {
		        if (!elements[i].target && !re.test(elements[i].href))
			        elements[i].target = "_top";				
	        }
        }
    }
    catch (err)
    {
    }
}
// ]]>
</script>

<style type="text/css">

/* override to ensure panels can be resized to window appropriately */
#CommonBodyTable
{
    table-layout: fixed;
}

</style>

<table cellpadding="0" cellspacing="0" border="0" width="100%" style="table-layout: fixed;">
    <tr valign="top">
        <td id="PostTreeArea" class="ForumTreeArea" width="250">
	        <div style="width: 250px;">
	        <div id="PostTreeHeading">
		        <CSControl:CSLabel runat="server" id="TooManyPostsMessage" CssClass="ForumDisplayMessage" />
		        <CSControl:ResourceControl runat="server" ResourceName="PostThreadedView_PostTreeHeading" Tag="Div" CssClass="ForumPostTreeHeading" />
	        </div>
	        <div id="PostTree" style="overflow: hidden; width: 100%; height: 100%;">
	            <TWC:Tree runat="server" ID="ThreadTree" Width="100%" Height="100%" />

                <TWC:PopupMenu runat="server" ID="PostContextMenu" MenuGroupCssClass="CommonContextMenuGroup" MenuItemCssClass="CommonContextMenuItem" MenuItemSelectedCssClass="CommonContextMenuItemHover" />
	        </div>
	        </div>
        </td>
        <td width="100%" id="PostContainerArea" class="ForumThreadedPostArea">
	        <iframe runat="server" id="PostContainer" style="width: 100%; height: 100%;" border="0" frameborder="0"></iframe>
        </td>
    </tr>
</table>

<script type="text/javascript">
// <![CDATA[

try
{
    var iframe = document.getElementById('<%=PostContainer.ClientID%>');
    if (iframe && iframe.contentWindow && iframe.contentWindow.location != iframe.src)
        iframe.contentWindow.location = iframe.src;
}
catch (err)
{
}

setTimeout(detectInvalidIframeContent, 999);
function detectInvalidIframeContent()
{
    try
    {
        var iframe = document.getElementById('<%=PostContainer.ClientID%>');
        if (iframe && iframe.contentWindow)
        {
	        var url = iframe.contentWindow.location.href;
	        if (url.toLowerCase().indexOf('http://') > -1 || url.toLowerCase().indexOf('https://') > -1)
	        {
		        var re = new RegExp('<%=ForumPostTreeForm.ValidPostWindowUrlPattern%>', 'i');
		        if (!re.test(url))
		        {
			        window.top.location = url;
			        return;
		        }
	        }
        }
    }
    catch(err)
    {
    }
	
    setTimeout(detectInvalidIframeContent, 249);
}

setTimeout(detectWindowSize, 999);
var lastHeight = -1;
var lastWidth = -1;
function detectWindowSize()
{
    if (typeof(window.innerWidth) == 'number') 
    {
        width = window.innerWidth;
        height = window.innerHeight;
    } 
    else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) 
    {
        width = document.documentElement.clientWidth;
        height = document.documentElement.clientHeight;
    } 
    else if (document.body && (document.body.clientWidth || document.body.clientHeight)) 
    {
        width = document.body.clientWidth;
        height = document.body.clientHeight;
    }
		
   	height -= 290;
    if (height < 250)
        height = 250;
		
    if (lastHeight != height || lastWidth != width)
    {
        lastHeight = height;
        lastWidth = width;
		
        var postContainer = document.getElementById('<%=PostContainer.ClientID %>');
        postContainer.style.height = height + 'px';
        resizePostDisplayPane(height, document.getElementById('PostContainerArea').offsetWidth);
        resizeTreeViewPane(height, document.getElementById('PostTreeArea').offsetWidth);
    }

    setTimeout(detectWindowSize, 999);
}
// ]]>
</script>

<CSForum:ForumPostTreeForm runat="server" 
    NotAllPostsDisplayedControlId="TooManyPostsMessage" 
    PostTreePopupMenuId="PostContextMenu" 
    PostTreeId="ThreadTree" 
    ViewPostIframeId="PostContainer" />