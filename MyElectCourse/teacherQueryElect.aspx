<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacherQueryElect.aspx.cs" Inherits="teacherQueryElect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>QueryElect</title>
    <style type="text/css">
        #table1
        {
            width: 282px;
        }
    </style>
</head>
<body topmargin=2>
    <form id="form1" runat="server">
    <div>
    <table id=table1 border=0 align=center>
        <tr>
            <td align=center height=40>
                <asp:label id="lblmessage" Font-Size="10pt" Runat="server">课程名称：</asp:label>
			    <asp:dropdownlist id="ddlCource" runat="server" Font-Size="10pt"  Width="85px" AutoPostBack="True"></asp:dropdownlist>
            </td>
        </tr>
        <tr>
            <td align=center>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1"
                    Font-Size="10pt" GridLines="Vertical" Width=260>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="stuID" HeaderText="学号" SortExpression="stuID" />
                        <asp:BoundField DataField="stuName" HeaderText="姓名" SortExpression="stuName" />
                        <asp:BoundField DataField="stuGrade" HeaderText="年级" SortExpression="stuGrade" />
                        <asp:BoundField DataField="stuClass" HeaderText="班级" SortExpression="stuClass" />
                        <asp:BoundField DataField="Score" HeaderText="成绩" SortExpression="Score" />
                    </Columns>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT Elect.stuID, Student.stuName, Student.stuGrade, Student.stuClass, Elect.Score FROM Elect INNER JOIN Student ON Elect.stuID = Student.stuID WHERE (Elect.courceID = @courceID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCource" Name="courceID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>            
            </td>
        </tr>
        <tr>
            <td align=center>
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="10pt" NavigateUrl="~/teacherSubmitScore.aspx">提交成绩</asp:HyperLink>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="10pt" NavigateUrl="~/ModifyPwd.aspx">修改密码</asp:HyperLink></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
