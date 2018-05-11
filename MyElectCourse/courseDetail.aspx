<%@ Page Language="C#" AutoEventWireup="true" CodeFile="courseDetail.aspx.cs" Inherits="courseDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>CourceDetail</title>
</head>
<body topmargin=0>
    <form id="form1" runat="server">
    <div>    
        <table style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse" align=center id="table" width="420" border="0" runat="server">
			
			<tr>
			<td align=center><asp:label id="courceNameF" Runat="server" Font-Names=隶书 Font-Size=20 ForeColor=red></asp:label><font face=隶书 size=5>的详细信息</font></td>
			</tr>
			<tr height="25">
				<td style="height: 25px"><br>					
						<b>课程名称：</b><asp:label id="courceName"  Font-Size="9pt" Runat="server"></asp:label></td>
			</tr>
			<tr height="25">
				<td>
						<b>教师姓名：</b><asp:label id="teaName"  Font-Size="9pt" Runat="server"></asp:label></td>
			</tr>
			<tr height="25">
				<td style="height: 25px">
						<b>上课时间：</b><asp:label id="courceTime" Font-Size="9pt" Runat="server"></asp:label></td>
			</tr>
			<tr height="25">
				<td>
						<b>上课地点：</b><asp:label id="courceAddress"  Font-Size="9pt" Runat="server"></asp:label></td>
			</tr>
			<tr height="10">
				<td>
					<hr SIZE="1">
				</td>
			</tr>
			<tr>
				<td><b>课程简介：</b><br /><asp:textbox id="courceDetails" runat="server" Height="150px" 
                        Width="100%" TextMode="MultiLine"
						BorderColor="Transparent" BorderStyle="Groove" ReadOnly="True" BorderWidth="1px" 
                        Font-Size="9pt" ontextchanged="courceDetails_TextChanged"></asp:textbox></td>
			</tr>
			<tr height="30">
				<td align="center">
					<asp:imagebutton id="imgBtnReturn" runat="server" ImageUrl="~/Images/RETURN.GIF"></asp:imagebutton></td>
			</tr>
		</table>
    </div>
    </form>
</body>
</html>
