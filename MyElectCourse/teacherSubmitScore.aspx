<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacherSubmitScore.aspx.cs" Inherits="teacherSubmitScore" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SubmitScore</title>
</head>
<body topmargin=0>
    <form id="form1" runat="server">
    <div>
    <table id="table1" width=350  border="0" runat="server" >
				<tr valign="top">
					<td  align="center">						
						<asp:label id="lblmessage" Font-Size="10pt" Runat="server">课程名称：</asp:label>
						<asp:dropdownlist id="ddlCource" runat="server" Font-Size="10pt"  Width="85px" AutoPostBack="True" onselectedindexchanged="kcddl_SelectedIndexChanged"></asp:dropdownlist><br>
					</td>
				</tr>
				<tr>
					<td align="center">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Size="10pt"
                            GridLines="Vertical" Width=100%>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <Columns>
                                <asp:BoundField DataField="stuID" HeaderText="学号" />
                                <asp:BoundField DataField="stuName" HeaderText="姓名" />
                                <asp:BoundField DataField="stuGrade" HeaderText="年级" />
                                <asp:BoundField DataField="stuClass" HeaderText="班级" />
                                <asp:TemplateField HeaderText="成绩">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtScore" Width=30 runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="#EEEEEE" Font-Size="10pt" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="Gainsboro" />
                        </asp:GridView>
                    </td>
				</tr>
				<tr>
					<td align="center">
                        <asp:ImageButton ID="imgBtnSubmitScore" runat="server" ImageUrl="~/Images/SubmitScore.GIF" OnClick="imgBtnSubmitScore_Click" />
                    </td>
				</tr>
				<tr>
				    <td align=center >
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="10pt" NavigateUrl="~/teacherQueryElect.aspx">查看选课</asp:HyperLink>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="10pt" NavigateUrl="~/Login.aspx">退出系统</asp:HyperLink></td>
				</tr>
			</table>
    </div>
        <br />
    </form>
</body>
</html>
