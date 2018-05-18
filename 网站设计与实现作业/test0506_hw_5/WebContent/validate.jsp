<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<jsp:useBean id="userTable" class="test0506_hw_5.userTable" scope="session"></jsp:useBean>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>validate</title>
</head>
  <body>
  <%
    request.setCharacterEncoding("utf-8");
    String username=request.getParameter("username");
    String password=request.getParameter("password");

    if(username != "" && password != "" && username.equals(password)){
    %>
  <jsp:setProperty property="username" name="userTable"></jsp:setProperty>
  <jsp:setProperty property="password" name="userTable"></jsp:setProperty>
    <%
        out.print(userTable.getUsername());
        response.sendRedirect("welcome.jsp");
    }
    else{ 
        response.sendRedirect("default.jsp");
    }
   %>   
  </body>
</html>