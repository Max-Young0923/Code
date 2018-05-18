<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户界面</title>
</head>

<body>
<form name="form1" action="pro.jsp" method="post">
<table>
<tr>
<td>用户名:</td>
<td><input type="text" name="myname" value=""><td>
</tr>
<tr>
<td>密码:</td>
<td><input type="password" name="pass" value=""></td>
</tr>
<tr>
<td><input type="submit" value="提交"></td>
<td><input type="submit" value="取消" ></td>
</tr>
<% Cookie name = new Cookie("cookie1", request.getParameter("myname"));
Cookie password = new Cookie("cookie2", request.getParameter("pass"));
name.setMaxAge(60*60*24);
password.setMaxAge(60*60*24);
response.addCookie(name);
response.addCookie(password);
%>
</table>
</form>
</body>

</html>