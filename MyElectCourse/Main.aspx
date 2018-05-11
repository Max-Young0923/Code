<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<%@ Register Src="Controls/left.ascx" TagName="left" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Main</title>
    <script language="javascript">
        var nShow = 1;
        function switchSysBar()
        {
            if (document.all("TDTree").style.display == "")
            {
                document.all("TDTree").style.display = "none"
            document.all.movetool.innerHTML = "<img src='Images/movetoolright1.gif' width='10' height='39' border='0'>";
            }
            else
            {
                document.all("TDTree").style.display = "";
            document.all.movetool.innerHTML = "<img src='Images/movetool1.gif' width='10' height='39' border='0'>";
            }
        }
	</script>
    <style type="text/css">
        #table1
        {
            height: 389px;
            width: 555px;
        }
    </style>
</head>
<body leftmargin=0 rightmargin=0>
    <form id="form1" runat="server">
    <div>
        <table align=center id=table1 cellpadding=0 cellspacing=0  border=0>
            <tr>
                <td valign=top align=center width=80 id="TDTree">
                    <uc1:left ID="Left1" runat="server" />
                </td>
                <td  width="10"><a style="CURSOR:hand" onClick="switchSysBar()" id="A1"><img src="Images/movetool1.gif" width="10" height="39" border="0"></a></td>
                <td vAlign="top"  align=left><iframe id=Main name=frameMain src=ModifyPwd.aspx height=300 width=320 frameborder=no  marginwidth=0 marginheight=0></iframe></td>
            </tr>
        </table>					
    </div>
    </form>
</body>
</html>
