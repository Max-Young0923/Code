<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String[] a = new String[20] ;
a[0]="admin" ;
a[1]="2015210001" ;
a[2]="2015210002" ;
a[3]="2015210003" ;
a[4]="2015210004" ;

String q = request.getParameter("search") ;//获取get传递的参数值search，String类型
String hint1 = null ;

if (q.length()>0) {
	for (int i=0;i<a.length;i++) {
		if (!q.equals(a[i])) {
      hint1 = "该用户名不存在，请确认后再输入" ;
    	}
    else {
      hint1 = "该用户名存在，请继续输入密码" ;
    	break;
    	}
  	}
}
  out.println(hint1) ;//显示hint1
%>