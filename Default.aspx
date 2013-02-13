<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" 
    Inherits="GuestBook._Default" Theme="Style" Title="Guest Book Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">

</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <div id="content">
        <p />
        <asp:Panel ID="menuPanel" Visible="true" runat="server"> 
        
        <table class="form" align="center" width="405" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2" style="padding-left:20px;">
                <p />
                <span class="linktext">
                    Guest Book <a href="Default.aspx">home</a>
                </span>
                <p />
                <span class="linktext">
                    Sign the Guest Book <a href="addComment.aspx">here</a> and leave your comments
                </span>
                <p />
                <span class="linktext">
                    View the Guest Book <a href="GuestBook.aspx">here</a>
                </span> 
                <p />
                <span class="linktext">
                    <a href="Admin/guestBookAdmin.aspx">Administrators</a>
                </span>
            </td>
        </tr>
        </table>
        </asp:Panel>  
        </div>
    </div>
    </form>
</body>
</html>
