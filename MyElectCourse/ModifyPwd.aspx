<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModifyPwd.aspx.cs" Inherits="ModifyPwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ModifyPwd</title>
</head>
<body leftmargin="0">
    <form id="form1" runat="server">
    <div>
    <table style="FONT-SIZE: 12px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; height: 138px;" 
            borderColor="#2c6ed5" width=300 border=1 align=center cellpadding=0 
            cellspacing=0>
            <tr>
                <td style="width: 76px"  align=right>
                    旧密码：</td>
                <td >
                    <asp:TextBox ID="txtOldPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPwd"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>                            
            </tr>
            
            <tr>
                <td style="width: 76px"  align=right>
                    新密码：</td>
                <td style="width: 6px">
                    <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPwd"
                        ErrorMessage="新密码不能为空" Width="178px"></asp:RequiredFieldValidator></td>                            
            </tr>
             <tr>
                <td  nowrap style="width: 76px; height: 41px;" align=right>
                    确认新密码：</td>
                <td style="height: 41px" >
                    <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtConfirmPwd"
                        ControlToValidate="txtNewPwd" ErrorMessage="必须输入确认密码"></asp:CompareValidator></td>                            
            </tr>
             <tr>
                <td colspan="2" align=center style="height: 25px">
                    <asp:ImageButton ID="imgBtnConfirm" runat="server" ImageUrl="~/Images/CONFIRM.GIF" OnClick="imgBtnConfirm_Click" />
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="imgBtnReset" runat="server" ImageUrl="~/Images/RESET.GIF" OnClick="imgBtnReset_Click" />&nbsp;
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
