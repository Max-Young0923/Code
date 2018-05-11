<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminTeacherDetails.aspx.cs" Inherits="adminTeacherDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table id=table1  border=0>
        <tr>
            <td align=center>
    <asp:GridView id="GridView1" runat="server" OnRowUpdating="GridView1_RowUpdating" 
    OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" 
    OnRowDataBound="GridView1_RowDataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
    AutoGenerateColumns="False" DataKeyNames="teaID" BackColor="White" BorderColor="#999999" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="编号">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%# Eval("teaID") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" Width=35 runat="server" Text='<%# Eval("teaName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("teaName") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="系院">
                            <EditItemTemplate>
                                <asp:HiddenField ID="hdfDepart" runat="server" Value='<%# Eval("departName") %>'  />
                                <asp:DropDownList ID="ddlDepart" runat="server" Width="70px" ></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("departName") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                                              
                        <asp:CommandField ShowEditButton="True" HeaderText="编辑" ></asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" ></asp:CommandField>
                    </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <RowStyle BackColor="#EEEEEE" Font-Size="10pt" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" Font-Size="10pt" ForeColor="White" />
        <AlternatingRowStyle BackColor="Gainsboro" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
        <br />
    </form>
</body>
</html>
