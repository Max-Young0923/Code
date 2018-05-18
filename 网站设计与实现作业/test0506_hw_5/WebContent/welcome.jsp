<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" import="java.sql.*" errorPage=""%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<jsp:useBean id="userTable" class="test0506_hw_5.userTable" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<title>welcome</title>
</head>
  <body>

    <h1>Welcome</h1>
    欢 迎 你：
    <font color="red">
        <jsp:getProperty property="username" name="userTable"/>
    </font>
    <br/>
    访问密码：
    <font color="green">
        <jsp:getProperty property="password" name="userTable"/>
    </font>

  </body>
</html>