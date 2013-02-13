<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="commentDetails.aspx.cs" 
    Inherits="GuestBook.Admin.commentDetails" Theme="Style" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Edit Comments</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <div id="content">
        <asp:Panel ID="commentPanel" Visible="true" runat="server"> 
        
            <p />
            <span style="padding-left:38px; font-family:Arial; font-size:small;">
                <asp:LoginStatus ID="LoginStatus1" LogoutPageUrl="../Guestbook.aspx" runat="server" /> 
            </span>
                   
            <table class="form" align="center" width="405" cellpadding="0" cellspacing="0">
            <tr>
                <th class="formHeader" colspan="2" align="center">
                    <asp:Label ID="headerLabel" runat="server" />
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
                    Name (*)
                </td>
                <td  class="formField">
                    <asp:TextBox ID="nameTxtBox" Width="195" runat="server"></asp:TextBox>   
                    <asp:RequiredFieldValidator ID="reqTxtBoxVal" ErrorMessage="Name" Display="Dynamic" 
                        ControlToValidate="nameTxtBox" runat="server">*</asp:RequiredFieldValidator >
                </td>
            </tr>
            <tr>
                <td class="formField">
                    Email Address *
                </td>
                <td  class="formField">
                    <asp:TextBox ID="emailTxtBox" Width="195" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="emailReqVal" ErrorMessage="Email" Display="Dynamic" 
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
                    <asp:TextBox ID="urlTxtBox" Width="195" runat="server"></asp:TextBox>   
                </td>
            </tr>
            <tr>
                <td class="formField">
                    Location (*)
                </td>
                <td  class="formField">
                    <asp:TextBox ID="locationTxtBox" Width="195" runat="server"></asp:TextBox>   
                    <asp:RequiredFieldValidator ID="reqLocationTxtBox" ErrorMessage="Location" Display="Dynamic" 
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
                    <asp:textbox ID="commentTxtBox" ToolTip="Include extra date and time details in your description as appropriate" 
                        Width="342" MaxLength="600" TextMode="MultiLine" Rows="7" runat="server"></asp:textbox>
                    <asp:RequiredFieldValidator ID="commentReqVal" ErrorMessage="Comment" Display="Dynamic" 
                        ControlToValidate="commentTxtBox" runat="server">*</asp:RequiredFieldValidator >
                </td>
            </tr>
            <tr>
                <td class="formField">
                    <span style="color:Red;"><b>Publish Comment</b></span>
                </td>
                <td  class="formField">
                    <asp:CheckBox ID="liveChkBox" runat="server" />   
                </td>
            </tr>
            <tr>
                <td colspan="2" class="formField">
                    (*) Indicates required value
                </td>
            </tr>
            <tr><td colspan="2">&#160;</td></tr>
            <tr>
	            <td class="mainFormFooter" colspan="3">
                    <asp:button OnClick="SubmitBtn_Clicked" id="submitBtn" Text="Submit" runat="server" width="88" />&nbsp;
                    <asp:button OnClick="DeleteBtn_Clicked" id="deleteBtn" CausesValidation="false" Text="Delete" runat="server" width="84" />&nbsp;
                    <asp:button OnClick="CancelBtn_Clicked" id="cancelBtn" CausesValidation="false" Text="Cancel" runat="server" width="84" />
	            </td>
	        </tr>
            </table>
            <span style="padding-left:40px;">
                <asp:HyperLink ID="returnLink" CssClass="text" NavigateUrl="~/GuestBook.aspx" runat="server">View Guest Book</asp:HyperLink>
            </span>
            
        </asp:Panel>

        <asp:Panel ID="successPanel" Visible="false" runat="server">
            <p />
            <table cellpadding="0" class="form" align="center" cellspacing="0" width="320">
            <tr>
                <th class="formHeader" colspan="2" align="center">
                    <b>Comment Updated</b>
                </th>
            </tr>
            <tr>
                <td class="messageText">
                    The comment has been successfully updated. If you would like to edit
                    another comment, just go back to the <a href="guestbookAdmin.aspx">Guestbook Admin</a> page.
                    <p />
                    If you experience any problems, please contact the 
                    <a href="mailto:anthony.grace@gmail.com">Webmaster</a>.
                    <br />
                </td>
            </tr>

            </table>
            <span style="padding-left:80px;">
                <asp:HyperLink ID="HyperLink1" CssClass="text" 
                    NavigateUrl="~/Guestbook.aspx" runat="server">View Guest Book</asp:HyperLink>
            </span>
            
        </asp:Panel>
        </div>
    </div>
    </form>
</body>
</html>
