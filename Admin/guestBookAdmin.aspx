<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="guestBookAdmin.aspx.cs" 
    Inherits="GuestBook.Admin.guestBookAdmin" Theme="Style" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Guest Book Admin</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <div id="content">
     
            <asp:ObjectDataSource ID="commentsObjectDataSource" runat="server" 
                TypeName="GuestBook.Layers.Business.BizClass" SelectMethod="GetCommentsSummary">
            </asp:ObjectDataSource>
            
            <p />
            <div style="padding-left:5px;">
            <span style="font-family:Arial; font-size:small;">
                <asp:LoginStatus ID="LoginStatus2" LogoutPageUrl="../Login.aspx" runat="server" /> 
            </span>
            
            <asp:GridView ID="commentsGrid" 
                DataSourceID="commentsObjectDataSource" 
                DataKeyNames="CommentID" 
                runat="server" 
                Width="465"
                EmptyDataText="There are no comments listed currently listed" 
                EmptyDataRowStyle-CssClass="formtext" 
                ToolTip="Sort columns by clicking the header. Click the 'Select' link to edit an record." 
                EmptyDataRowStyle-HorizontalAlign="Center" 
                EmptyDataRowStyle-Height="60" 
                EmptyDataRowStyle-Font-Bold="true"   
                BackColor="#FBFBDB" 
                BorderColor="Tan" 
                BorderWidth="1px" 
                PagerSettings-Mode="NumericFirstLast" 
                RowStyle-Height="25"
                ForeColor="Black" 
                GridLines="Horizontal" 
                AutoGenerateColumns="False" 
                AllowPaging="True" 
                AllowSorting="true" 
                PageSize="20">
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" CssClass="formtext" ForeColor="DarkSlateBlue" />
                <HeaderStyle BackColor="#C0D9BB" CssClass="formtext" Font-Size="Small" 
                    Font-Underline="true" ForeColor="#617F8A" Height="28px" Font-Bold="True" />
                <AlternatingRowStyle BackColor="#F4F0C4" BorderColor="Tan" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="CommentID" ControlStyle-CssClass="gridSelectText" 
                        DataNavigateUrlFormatString="commentDetails.aspx?CommentID={0}" ControlStyle-Width="70"  
                            Text="Select" />
                    <asp:TemplateField HeaderText="ID" SortExpression="CommentID">
                        <ItemStyle Width="50" />
                        <ItemTemplate>
                            <span class="formtext">
                                <asp:Label ID="idLabel" Text='<%# Eval("CommentID") %>' 
                                    runat="server"></asp:Label>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <ItemStyle Width="235" />
                        <ItemTemplate>
                            <span class="formtext">
                                <asp:Label ID="idTitle" Text='<%# GetShortTitle(Eval("Name"), 32) %>' 
                                    runat="server"></asp:Label>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Posted" SortExpression="PostDate">
                        <ItemStyle Width="80" />
                        <ItemTemplate>
                            <span class="formtext">
                                <asp:Label ID="postedLabel" Text='<%# Eval("PostDate", "{0:d}") %>' 
                                    runat="server"></asp:Label>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>        
                    <asp:CheckBoxField HeaderText="Live" ControlStyle-Width="30" 
                        DataField="Live"></asp:CheckBoxField>
                </Columns>
               <PagerSettings Mode="NextPreviousFirstLast" NextPageText="Next" 
                    PreviousPageText="Previous" FirstPageText="First" LastPageText="Last" />
                <EmptyDataRowStyle CssClass="formtext" Font-Bold="True" 
                    Height="60px" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:HyperLink ID="returnLink" CssClass="text" NavigateUrl="../GuestBook.aspx" 
                runat="server">Guest Book</asp:HyperLink>
                
            </div>
        </div>
    </div>
    </form>
</body>
</html>
