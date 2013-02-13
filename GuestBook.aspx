<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestBook.aspx.cs" 
    Inherits="GuestBook.GuestBook" Theme="Style" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Guest Book</title>
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
            <p />
        <asp:ObjectDataSource ID="sourceEvents" runat="server"  
            TypeName="GuestBook.Layers.Business.BizClass" SelectMethod="GetComments">
        </asp:ObjectDataSource>

        <div style="padding-left:38px;">
            <asp:GridView ID="guestbookGrid" runat="server" 
                DataSourceID="sourceEvents" 
                Width="405px" 
                EmptyDataText="There are no comments currently listed" 
                EmptyDataRowStyle-CssClass="formtext" 
                EmptyDataRowStyle-HorizontalAlign="Center" 
                EmptyDataRowStyle-Height="60" 
                EmptyDataRowStyle-Font-Bold="true"   
                BackColor="#FBFBDB" 
                BorderColor="Tan" 
                BorderWidth="1px" 
                PagerSettings-Mode="NumericFirstLast"
                ForeColor="Black" 
                GridLines="Horizontal" 
                AutoGenerateColumns="False" 
                AllowPaging="True" 
                PageSize="4">
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" CssClass="formtext" ForeColor="DarkSlateBlue" />
                <HeaderStyle BackColor="#C0D9BB" CssClass="formHeader" Height="28px" Font-Bold="True" />
                <AlternatingRowStyle BackColor="#F4F0C4" BorderColor="Tan" />
                <Columns>
                <asp:TemplateField HeaderText="Guest Book">
                    <ItemTemplate>
                    <table style="padding-left:10px;" cellpadding="5" cellspacing="3">
                    <tr>
                        <td>
                         <span class="formtext"><b>Name:</b> <%# Eval("Name") %></span><br />
                         <span class="formtext"><b>Date Posted:</b> <%# Eval("PostDate") %></span><br />
                         <span class="formtext"><b>Website:</b> <a href='<%# Eval("Website") %>' 
                            target="_blank"> <%# Eval("Website")%></a></span><br />
                         <span class="formtext"><b>Location:</b></span>  
                         <span class="formtext"><%# Eval("Location") %></span><br />
                         <span class="formtext"><b>Comment:</b></span><br />
                         <span class="formtext"><%# Eval("Comment") %></span><br />
                        </td>
                     </tr>
                     </table>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NextPreviousFirstLast" 
                    NextPageText="Next" PreviousPageText="Previous" FirstPageText="First" LastPageText="Last" />
            </asp:GridView>
            <asp:HyperLink ID="returnLink" CssClass="text" 
                NavigateUrl="~/addComment.aspx" runat="server">Sign Guest Book</asp:HyperLink>
        </div>
        </div>
    </div>
    </form>
</body>
</html>
