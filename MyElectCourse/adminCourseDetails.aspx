<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminCourseDetails.aspx.cs" Inherits="adminCourseDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body topmargin=0 leftmargin=0 rightmargin=0>
    <form id="form1" runat="server">
    <div>
        <table id="table1" align="center" border="0" cellpadding="2" cellspacing="0" style="font-size: 12px;
            font-family: Tahoma; border-collapse: collapse" width="360">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" Width=100%
                        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="courceID,teaID"
                         GridLines="Vertical" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <Columns>
                            <asp:TemplateField HeaderText="课程号" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server"><%# Eval("courceID") %></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="教师编号" Visible=False>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server"><%# Eval("teaID") %></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="课程名称">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("courceName") %>' Width="50"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server"><%# Eval("courceName") %></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="教师姓名">
                                <EditItemTemplate>
                                <asp:HiddenField ID="hdfTeacher" runat="server" Value='<%# Eval("teaName") %>' />
                                <asp:DropDownList ID="ddlTeacher" runat="server" Width="70px" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("teaName") %></asp:Label>
                            </ItemTemplate>
                                <ItemStyle Wrap="False" />
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="上课时间">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTime" runat="server" Text='<%# Eval("courceTime") %>' Width="50"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server"><%# Eval("courceTime") %></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="上课地点">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("courceAddress") %>' Width="50"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server"><%# Eval("courceAddress") %></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:HyperLinkField DataNavigateUrlFields="courceID,teaID" DataNavigateUrlFormatString="adminCourse.aspx?courceID={0}&teaID={1}" HeaderText="详细..." Text="详细..." />
                            <asp:CommandField HeaderText="编辑" ShowEditButton="True" >
                                <ItemStyle Wrap="False" />
                                <HeaderStyle Wrap="False" />
                            </asp:CommandField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" EditText="删除" >
                                <ItemStyle Wrap="False" />
                                <HeaderStyle Wrap="False" />
                            </asp:CommandField>
                        </Columns>
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" Wrap="False" />
                        <AlternatingRowStyle BackColor="Gainsboro" />
                    </asp:GridView>                   
                </td>
            </tr>
            <tr>
                <td>
                    <table id=table2 style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse" borderColor="#2c6ed5"
								cellSpacing="0" cellPadding="2" width="100%" align="center" border="1">
						<tr>
                            <td align=right nowrap>
                                课程编号:</td>
                             <td><asp:TextBox ID="txtCourceID" runat="server" Width="100px" 
                                     ontextchanged="txtCourceID_TextChanged"></asp:TextBox></td>                   
                             <td align=right>
                                授课教师:</td>
                             <td><asp:DropDownList ID="ddlTeacherName" runat="server" DataSourceID="SqlDataSource1"
                                    DataTextField="teaName" DataValueField="teaID" Width="86px">
                                </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT [teaID], [teaName] FROM [Teacher]"></asp:SqlDataSource>
                            </td>
                            
                                
                        </tr>
                        <tr>
                            <td align=right>
                                课程名称:</td>
                             <td colspan=3><asp:TextBox ID="txtCourceName" runat="server" Width="230px"></asp:TextBox></td>                    
                        </tr>
                        <tr>
                            <td align=right>
                                上课时间:</td>
                             <td ><asp:TextBox ID="txtTime" runat="server" Width="100px"></asp:TextBox></td>          
                            <td align=right nowrap>
                                上课地点:</td>
                             <td><asp:TextBox ID="txtAddress" runat="server" Width="100px"></asp:TextBox></td>
                                
                        </tr>
                        <tr>
                            <td align=right style="height: 83px">
                                课程简介:</td>
                             <td colspan=3><asp:TextBox ID="txtCourceInformation" runat="server" TextMode="MultiLine" Height="118px" Width="303px"></asp:TextBox></td>
                                
                        </tr>
                        <tr>
                            <td colspan=4 align=center style="height: 44px">
                                <asp:ImageButton ID="imgBtnAdd" runat="server" ImageUrl="~/Images/ADD.GIF" OnClick="imgBtnAdd_Click" />
                                &nbsp; &nbsp;
                                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                <asp:ImageButton ID="imgBtnReset" runat="server" ImageUrl="~/Images/RESET.GIF" OnClick="imgBtnReset_Click" />
                                <br />
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label></td>
                                
                        </tr>
					</table>
                </td>
            </tr>
            
        </table>
    
    </div>
    </form>
</body>
</html>
