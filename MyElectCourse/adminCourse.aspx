<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminCourse.aspx.cs" Inherits="adminCourse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body leftmargin=0 rightmargin=0>
    <form id="form1" runat="server">
    <div>
    <table style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse" id="table" width="300" border="0" runat="server">			
			<tr>
			<td align=center><asp:label id="courceName" Runat="server" Font-Names=隶书 Font-Size=20 ForeColor=red></asp:label><font face=隶书 size=5>的详细信息</font><br />
                <asp:Label ID="lblMessage" runat="server" ForeColor=Red></asp:Label></td>
			</tr>
			<tr height="25">
				<td style="height: 25px"><br>					
						<b>课程名称：<asp:TextBox ID="txtName" runat="server" 
                        ontextchanged="txtName_TextChanged"></asp:TextBox></b></td>
			</tr>
			<tr height="25">
				<td>
						<b>教师姓名：<asp:DropDownList ID="ddlTeacherName" runat="server"
                            DataTextField="teaName" DataValueField="teaID" Width="86px">
                        </asp:DropDownList>
                        </b></td>
			</tr>
			<tr height="25">
				<td style="height: 25px">
						<b>上课时间：<asp:TextBox ID="txtTime" runat="server"></asp:TextBox></b></td>
			</tr>
			<tr height="25">
				<td>
						<b>上课地点：<asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></b></td>
			</tr>
			<tr height="10">
				<td>
					<hr SIZE="1">
				</td>
			</tr>
			<tr>
				<td><b>课程简介：</b><br /><asp:textbox id="txtDetails" runat="server" Height="200px" Width="100%" TextMode="MultiLine"
						BorderColor="Transparent" BorderStyle="Groove" BorderWidth="1px" Font-Size="9pt"></asp:textbox></td>
			</tr>
			<tr height="30">
				<td align="center">
                    <asp:ImageButton ID="imgBtnConfirm" runat="server" ImageUrl="~/Images/CONFIRM.GIF" OnClick="imgBtnConfirm_Click" />
                    &nbsp; &nbsp;&nbsp;
                    <asp:ImageButton ID="imgBtnReturn" runat="server" ImageUrl="~/Images/RETURN.GIF" /></td>
			</tr>
		</table>
    </div>
        <br />
    </form>
</body>
</html>
