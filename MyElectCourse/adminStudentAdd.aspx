<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminStudentAdd.aspx.cs" Inherits="adminStudentAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table id=table1 style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse" borderColor="#2c6ed5"
								cellSpacing="0" cellPadding="2" width="280" align="center" border="1">
        
        <tr>
            <td colspan=2 align=center>
                <font size=6 face="隶书">添加学生</font><br />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
             </td>            
        </tr>
        <tr>
            <td>
                学号:</td>
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
            <td>
                年级:</td>
            <td>
                <asp:DropDownList ID="ddlGrade" runat="server" Width="60px">
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                班级:</td>
            <td>
                <asp:DropDownList ID="ddlClass" runat="server" Width="60px" 
                    onselectedindexchanged="ddlClass_SelectedIndexChanged">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td colspan=2 align=center>
                <asp:ImageButton ID="imgBtnAdd" runat="server" ImageUrl="~/Images/ADD.GIF" OnClick="imgBtnAdd_Click" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:ImageButton
                    ID="imgBtnReset" runat="server" ImageUrl="~/Images/RESET.GIF" OnClick="imgBtnReset_Click" />
                </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
