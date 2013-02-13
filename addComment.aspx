<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addComment.aspx.cs" 
    Inherits="GuestBook.addComment" Theme="Style" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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

        <asp:Panel ID="commentPanel" Visible="true" runat="server"> 
        <p />
        <span class="text" style="padding-left:40px;">
            <b>Please Note:</b> Your email address will not be shared with anyone.
        </span>
        <p />
        <table class="form" align="center" width="405" cellpadding="0" cellspacing="0">
        <tr>
            <th class="formHeader" colspan="2" align="center">
                <b>Sign Guest Book</b>
            </th>
        </tr>
        <tr><td>&#160;</td><td>&#160;</td></tr>
        <tr>
            <td colspan="2" style="padding-left:20px;">
            <asp:ValidationSummary DisplayMode="BulletList" CssClass="validationSummary" ShowSummary="true" 
                    HeaderText="Please review the following errors:" ID="inputValSummary" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="formField">
                Name *
            </td>
            <td  class="formField">
                <asp:TextBox ID="nameTxtBox" Width="220" runat="server"></asp:TextBox>   
                <asp:RequiredFieldValidator ID="reqTxtBoxVal" ErrorMessage="Name" Display="Static" 
                    ControlToValidate="nameTxtBox" runat="server">*</asp:RequiredFieldValidator >
            </td>
        </tr>
        <tr>
            <td class="formField">
                Email Address *
            </td>
            <td  class="formField">
                <asp:TextBox ID="emailTxtBox" Width="220" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="emailReqVal" ErrorMessage="Email" Display="Static" 
                    ControlToValidate="emailTxtBox" runat="server">*</asp:RequiredFieldValidator> 
                <asp:RegularExpressionValidator ID="emailRegVal" ControlToValidate="emailTxtBox"
                    ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" 
                        ErrorMessage="Email" runat="server">*</asp:RegularExpressionValidator>   
            </td>
        </tr>
        <tr>
            <td class="formField">
                Website URL
            </td>
            <td  class="formField">
                <asp:TextBox ID="urlTxtBox" Width="220" runat="server"></asp:TextBox>   
            </td>
        </tr>
        <tr>
            <td class="formField">
                Location (*)
            </td>
            <td  class="formField">
                <asp:TextBox ID="locationTxtBox" Width="220" runat="server"></asp:TextBox>   
                <asp:RequiredFieldValidator ID="reqLocationTxtBox" ErrorMessage="Location" Display="Static"
                    ControlToValidate="locationTxtBox" runat="server">*</asp:RequiredFieldValidator >
            </td>
        </tr>
        <tr>
            <td class="formField">
                Comment *
            </td>
            <td class="formField">
                (600 characters maximum)
            </td>
        </tr>
        <tr>
            <td align="left" class="formField" colspan="2" valign="top">
                <asp:textbox ID="commentTxtBox" 
                    Width="342" MaxLength="600" TextMode="MultiLine" Rows="7" runat="server"></asp:textbox>
                <asp:RequiredFieldValidator ID="commentReqVal" ErrorMessage="Comment" Display="Static"
                    ControlToValidate="commentTxtBox" runat="server">*</asp:RequiredFieldValidator >
            </td>
        </tr>
       
        <tr>
            <td class="formField" colspan="2">(*) Indicates required value</td>
        </tr>
        <tr>
	        <td class="mainFormFooter" colspan="3">
                <asp:button OnClick="SubmitBtn_Clicked" id="submitBtn" 
                    Text="Submit" runat="server" width="88" />&nbsp;
                <asp:button OnClick="ResetBtn_Clicked" id="resetBtn" CausesValidation="false" 
                    Text="Reset" runat="server" width="84" />&nbsp;
                <asp:button OnClick="CancelBtn_Clicked" id="cancelBtn" CausesValidation="false" 
                    Text="Cancel" runat="server" width="84" />
	        </td>
	    </tr>
        </table>
        <span style="padding-left:40px;">
            <asp:HyperLink ID="returnLink" CssClass="text" 
                NavigateUrl="~/GuestBook.aspx" runat="server">View Guest Book</asp:HyperLink>
        </span>
        <br /><br />
        </asp:Panel>
        
        <asp:Panel ID="successPanel" Visible="false" runat="server">
        <br /><br />
        <table class="form" align="center" width="400" cellpadding="0" cellspacing="0">
        <tr>
            <th class="formHeader" align="center">
                <b>Comment Received</b>
            </th>
        </tr>
        <tr>
            <td class="messageText">
                <p />
                Thank you for your feedback. Your opinion is valuable to us and we appreciate your 
                taking the time to sign our guest book. We hope you liked the website!
                <p />
                Your comment is being moderated and will appear here soon.
            </td>
        </tr>
        </table>
        <span style="padding-left:40px;">
            <asp:HyperLink ID="HyperLink1" CssClass="text" 
                NavigateUrl="~/Guestbook.aspx" runat="server">View Guest Book</asp:HyperLink>
        </span>
        <br /><br />
        </asp:Panel>

        <asp:Panel ID="errorPanel" Visible="false" runat="server">  
        <br /><br />
        <table class="form" align="center" width="400" cellpadding="0" cellspacing="0">
        <tr>
            <th class="formHeader" align="center">
                <b>Problem...</b>
            </th>
        </tr>
        <tr>
            <td class="messageText">
                <p />
                We seem to be experiencing some problems at the moment. 
                We apologize for this inconvenience and suggest that you try again later.
            </td>
        </tr>
        </table>
        </asp:Panel>
        </div>
    </div>
    </form>
</body>
</html>
