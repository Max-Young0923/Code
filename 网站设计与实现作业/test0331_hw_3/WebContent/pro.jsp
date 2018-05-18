<%@ page language="java"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*" %>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/javascript; charset=utf-8">
<title>服务器端界面</title>
</head>
<body>

<%
String name = new String((request.getParameter("myname")).getBytes("ISO-8859-1"),"UTF-8");
String password = new String((request.getParameter("pass")).getBytes("ISO-8859-1"),"UTF-8"); 


if(name == null || password ==null )
{
	out.println("请输入用户名和密码！");
	response.sendRedirect("input.jsp");
}
else if(name.equals(password))
{
	out.println("登录成功！");
	response.sendRedirect("welcome.jsp");
}
else {
	out.println("登录失败！");
	response.sendRedirect("input.jsp");

}

%>
</body>
</html>


