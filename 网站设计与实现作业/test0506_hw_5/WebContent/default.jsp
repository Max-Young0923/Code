<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>default</title>
</head>
  <body>
    <h1>登录失败</h1>
    <br/>
    <a href="vali.jsp">返回</a>
  </body>
</html>