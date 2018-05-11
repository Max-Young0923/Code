<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminTeacherAdd.aspx.cs" Inherits="adminTeacherAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table id=table1 style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse" borderColor="#2c6ed5"
								cellSpacing="0" cellPadding="2" width="260" align="center" border="1">
        
        <tr>
            <td colspan=2 align=center>
                <font size=6 face="隶书">添加教师</font><br />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
             </td>            
        </tr>
        <tr>
            <td>
                编号:</td>
            <td>
                <asp:TextBox ID="txtID" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                姓名:</td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                系院:</td>
            <td>
                <asp:DropDownList ID="ddlDepart" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="departName" DataValueField="departID" Width="152px">
                </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Depart]"></asp:SqlDataSource>
            </td>
        </tr>
        
        <tr>
            <td colspan=2 align=center>
                <asp:ImageButton ID="imgBtnAdd" runat="server" ImageUrl="~/Images/ADD.GIF" OnClick="imgBtnAdd_Click" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:ImageButton
                    ID="imgBtnReset" runat="server" ImageUrl="~/Images/RESET.GIF" OnClick="imgBtnReset_Click" />
                </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
