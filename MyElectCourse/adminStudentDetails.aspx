<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminStudentDetails.aspx.cs" Inherits="adminStudentDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body leftmargin=0 rightmargin=0>
    <form id="form1" runat="server">
    <div>
    <table id=table1 style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse" 
								cellSpacing="0" cellPadding="2" align="center" border="0">
	    <tr>
	        <td >
                学号：<asp:TextBox ID="txtstuID" 
                    runat="server" ontextchanged="txtstuID_TextChanged"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="imgBtnQuery" runat="server" ImageUrl="~/Images/QUERY.GIF" OnClick="imgBtnQuery_Click" /></td>
	    </tr>
	    <tr>
	        <td>
	            
	        </td>
	    </tr>
	    <tr>
	        <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                    OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" 
                    OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                    DataKeyNames="stuID" BackColor="White" BorderColor="#999999" BorderStyle="None" 
                    BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="学号">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%# Eval("stuID") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" Width=35 runat="server" Text='<%# Eval("stuName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("stuName") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="系院">
                            <EditItemTemplate>
                                <asp:HiddenField ID="hdfDepart" runat="server" Value='<%# Eval("departName") %>' />
                                <asp:DropDownList ID="ddlDepart" runat="server" Width="70px" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("departName") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="年级">
                             <EditItemTemplate>
                                <asp:TextBox ID="txtGrade"  Width=30 runat="server" Text='<%# Eval("stuGrade") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("stuGrade") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="班级">
                             <EditItemTemplate>
                                <asp:TextBox ID="txtClass" Width=20 runat="server" Text='<%# Eval("stuClass") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server"><%# Eval("stuClass") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                        <asp:CommandField ShowEditButton="True" HeaderText="编辑" />
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:GridView>
	        </td>
	    </tr>
	</table>
    </div>
    </form>
</body>
</html>
