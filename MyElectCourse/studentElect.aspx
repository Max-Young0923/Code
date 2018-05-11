<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentElect.aspx.cs" Inherits="StudentElect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ElectCource</title>
</head>
<body leftmargin="0" rightmargin="0">
    <form id="form1" runat="server">
    <div>
    <table id=table1 width=400 border=0 align=center>
    <tr>
    <td align=center>
        <span style="font-size: 16pt; font-family: 隶书">
        可选修课程</span></td>
    </tr>
        <tr>
            <td>                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" Width=100%
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                    DataSourceID="SqlDataSource1" GridLines="Vertical" 
                    OnRowCommand="GridView1_RowCommand" Font-Size="10pt" 
                    DataKeyNames="courceID,teaID" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" >
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" Font-Size="10pt" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" Font-Size="10pt" />
                    <AlternatingRowStyle BackColor="Gainsboro" />
                    <Columns>
                        <asp:BoundField DataField="courceID" HeaderText="courceID" ReadOnly="True" Visible=False SortExpression="courceID" />
                        <asp:BoundField DataField="teaID" Visible=False HeaderText="teaID" ReadOnly="True" SortExpression="teaID" />
                        <asp:BoundField DataField="courceName" HeaderText="课程名称" SortExpression="courceName">
                            <ItemStyle Width="70px" Wrap="False" />
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="teaName" HeaderText="教师姓名" SortExpression="teaName">
                            <ItemStyle Width="70px" Wrap="False" />
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="courceTime" HeaderText="上课时间" SortExpression="courceTime">
                            <ItemStyle Width="70px" Wrap="False" />
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="courceAddress" HeaderText="上课地点" SortExpression="courceAddress">
                            <ItemStyle Width="70px" Wrap="False" />
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="courceID,teaID" DataNavigateUrlFormatString="courseDetail.aspx?courceID={0}&teaID={1}" HeaderText="详细..." Text="详细..." />
                        <asp:ButtonField HeaderText="选修"  CommandName="select" Text="选修">
                            <ItemStyle Width="30px" Wrap="False" />
                            <HeaderStyle Wrap="False" />
                        </asp:ButtonField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT Cource.courceID, Cource.teaID, Cource.courceName, Teacher.teaName, Cource.courceTime, Cource.courceAddress FROM Cource INNER JOIN Teacher ON Cource.teaID = Teacher.teaID WHERE (Cource.courceID NOT IN (SELECT courceID FROM Elect WHERE (stuID = @stuID)))">
                    <SelectParameters>
                        <asp:SessionParameter Name="stuID" SessionField="userName" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 24px; text-align: center">
                <span style="font-size: 16pt; font-family: 隶书">您已经选修的课程</span></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    BackColor="White"  Width=100%
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                    DataSourceID="SqlDataSource2" GridLines="Vertical" 
                    OnRowCommand="GridView2_RowCommand" DataKeyNames="stuID,courceID,teaID" 
                    onselectedindexchanged="GridView2_SelectedIndexChanged">
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" Font-Size="10pt" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" Font-Size="10pt" />
                    <AlternatingRowStyle BackColor="Gainsboro" />
                    <Columns>
                        <asp:BoundField DataField="stuID" HeaderText="stuID" ReadOnly="True" SortExpression="stuID" Visible=False />
                        <asp:BoundField DataField="courceID" HeaderText="courceID" ReadOnly="True" SortExpression="courceID" Visible=False />
                        <asp:BoundField DataField="teaID" HeaderText="teaID" ReadOnly="True" SortExpression="teaID" Visible=False />
                        <asp:BoundField DataField="courceName" HeaderText="课程名称" SortExpression="courceName">
                            <ItemStyle Width="70px" Wrap="False" />
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="teaName" HeaderText="教师姓名" SortExpression="teaName">
                            <ItemStyle Width="60px" Wrap="False" />
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="courceTime" HeaderText="上课时间" SortExpression="courceTime">
                            <ItemStyle Width="60px" Wrap="False" />
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="courceAddress" HeaderText="上课地点" SortExpression="courceAddress">
                            <ItemStyle Width="60px" Wrap="False" />
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:ButtonField HeaderText="退选"  CommandName="shanchu" Text="退选">
                            <ItemStyle Width="28px" Wrap="False" />
                            <HeaderStyle Wrap="False" />
                        </asp:ButtonField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT Elect.stuID, Elect.courceID, Elect.teaID, Cource.courceName, Teacher.teaName, Cource.courceTime, Cource.courceAddress, Cource.courceInfo FROM Elect INNER JOIN Cource ON Elect.courceID = Cource.courceID AND Elect.teaID = Cource.teaID INNER JOIN Teacher ON Elect.teaID = Teacher.teaID AND Cource.teaID = Teacher.teaID WHERE (Elect.stuID = @stuID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="stuID" SessionField="userName" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 21px" align="center">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ModifyPwd.aspx" Font-Size="10pt">修改密码</asp:HyperLink>
                &nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink2" runat="server"　 Font-Size="10pt" NavigateUrl="~/Login.aspx">退出系统</asp:HyperLink></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
