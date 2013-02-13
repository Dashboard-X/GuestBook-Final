<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" 
    Inherits="GuestBook.Login" Theme="Style" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Guest Book Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <div id="content">
            <div style="padding-left:38px;">
            <br />
            <asp:Login ID="adminLogin" DestinationPageUrl="~/Login.aspx" runat="server">
                <LayoutTemplate>       
                    <table border="0" width="340" cellpadding="0" class="form" cellspacing="0">
                    <tr>
                        <td align="center" colspan="2" class="formHeader">
                            <b>Log In</b></td>
                    </tr>
                    <tr><td>&#160;</td></tr>
                    <tr>
                        <td align="right" class="formField">
                           <span style="font-family:Arial; font-size:small; text-decoration:none;">
                                 <asp:LoginView ID="LoginView3" runat="server">
                                    <LoggedInTemplate>
                                         &#160;
                                    </LoggedInTemplate>
                                </asp:LoginView>
                            </span>
                        </td>
                        <td class="formField">
                        &#160;
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formField">
                            <asp:Label ID="UserNameLabel" runat="server" 
                                AssociatedControlID="UserName">Name:</asp:Label></td>
                        <td  class="formField">
                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                    ToolTip="User Name is required." 
                                    ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formField">
                            <asp:Label ID="PasswordLabel" runat="server" 
                                AssociatedControlID="Password">Password:</asp:Label></td>
                        <td class="formField">
                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                ErrorMessage="Password is required." ToolTip="Password is required." 
                                    ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="formField"><span style="padding-left:95px;">
                            &#160;&#160;&#160;<asp:CheckBox ID="RememberMe" runat="server" 
                                Text=" Remember me next time." /></span>
                        </td>
                    </tr>
                    <tr>
                    <td colspan="2" class="formField">
                        <span style="padding-right:14px;">
                            <asp:Button ID="Button1" Width="80" runat="server" 
                                CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                        </span>
                        <span style="font-family:Arial; font-size:small; text-decoration:none;">
                             <asp:LoginView ID="LoginView1" runat="server">
                                <LoggedInTemplate>
                                    <asp:LoginStatus ID="LoginStatus1" LogoutPageUrl="Login.aspx" runat="server" />
                                </LoggedInTemplate>
                                <AnonymousTemplate>&#160;</AnonymousTemplate>
                            </asp:LoginView>
                        </span>
                    </td>
                    </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
            
            <asp:LoginView ID="LoginView2" runat="server">
                <LoggedInTemplate>
                    <asp:HyperLink ID="adminLink" CssClass="text" 
                        NavigateUrl="Admin/guestBookAdmin.aspx" runat="server">Administators</asp:HyperLink>
                </LoggedInTemplate>
                <AnonymousTemplate>
                    <asp:HyperLink ID="returnLink" CssClass="text" 
                        NavigateUrl="Default.aspx" runat="server">Home</asp:HyperLink>
                </AnonymousTemplate>
            </asp:LoginView>
            <br />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
