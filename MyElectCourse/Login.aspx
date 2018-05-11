<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Login</title>
</head>
<body onload=document.all.txtUserName.focus() leftmargin="0" rightmargin="0">
    <form id="form1" runat="server">
    <div>
    <table align="center" 
            style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; height: 304px; width: 475px;" 
            background="Images/FangKuai.gif" border="0" cellpadding="3" cellspacing="0">
                   <tr>
                   <td colspan=2 style="text-align: center">
                       <span style="font-size: 24pt; font-family: 隶书">网络选课系统</span></td>
                   </tr>
                    <tr>
                        <td>
                            <div align="right">
                                <img height="16" src="Images/name.gif" width="11" />
                                <span style="font-family: 宋体">用户名</span>：</div>
                        </td>
                        <td style="width: 242px">
                            <asp:TextBox ID="txtUserName" runat="server" Width="150px" 
                                ontextchanged="txtUserName_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                                ErrorMessage="不能为空！"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="height: 32px">
                            <div align="right">
                                <img height="12" src="Images/mm.gif" width="11" />
                                密&nbsp;&nbsp;&nbsp;码：
                            </div>
                        </td>
                        <td style="height: 32px; width: 242px;">
                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                                ErrorMessage="不能为空！"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td colspan=2 align=center style="height: 46px">                           
                            <asp:RadioButtonList ID="rblClass" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">教师</asp:ListItem>
                                <asp:ListItem Selected="True" Value="1">学生</asp:ListItem>
                                <asp:ListItem Value="2">管理员</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align=center colspan=2>
                            <asp:ImageButton ID="imgbtnLogin" runat="server" ImageUrl="~/Images/Login.GIF" OnClick="imgbtnLogin_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="imgbtnClose" runat="server" ImageUrl="~/Images/Close.GIF" 
                                OnClientClick="javascript:window.close();" onclick="imgbtnClose_Click" /></td>
                    </tr>
                </table>  
    </div>
    </form>
</body>
</html>
