<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="test0415_hw_4.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/javascript; charset=utf-8">
<title>服务器端界面</title>
</head>
<body>
	<jsp:useBean id="user" class="test0415_hw_4.userTable" scope="session"></jsp:useBean>
	<jsp:useBean id="userService" class="test0415_hw_4.userService"
		scope="session"></jsp:useBean>
	<jsp:setProperty property="*" name="user" />


	<%
		if (userService.valiUser(user))
			response.sendRedirect("welcome.jsp");
		else
			response.sendRedirect("input.jsp");
	%>


</body>
</html>


