<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminStudentScore.aspx.cs" Inherits="adminStudentScore" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="table1" align="center" border="0"  
            style="font-size:12px; height: 299px; width: 403px;">
            <tr>
                <td align="center">
                    课程名称：<asp:DropDownList ID="ddlCource" runat="server" AutoPostBack="True"
                        DataTextField="courceName" DataValueField="courceID" Font-Size="10pt" Width="85px" OnSelectedIndexChanged="ddlCource_SelectedIndexChanged">
                    </asp:DropDownList>
                    教师姓名：<asp:DropDownList ID="ddlTeacher" runat="server" AutoPostBack="True"
                        DataTextField="teaName" DataValueField="teaID" Font-Size="10pt" Width="70px" OnSelectedIndexChanged="ddlTeacher_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="stuID" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                        <Columns>
                            <asp:BoundField DataField="stuID" HeaderText="学号" ReadOnly="True" />
                            <asp:BoundField DataField="stuName" HeaderText="姓名" ReadOnly="True" />
                            <asp:BoundField DataField="stuGrade" HeaderText="年级" ReadOnly="True" />
                            <asp:BoundField DataField="stuClass" HeaderText="班级" ReadOnly="True" />
                            <asp:TemplateField HeaderText="成绩">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtScore" Width=35 runat="server" Text='<%# Eval("Score") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("Score") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                            <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                    </asp:GridView>
                    &nbsp; &nbsp;
                </td>
            </tr>
            
        </table>
    
    </div>
    </form>
</body>
</html>
