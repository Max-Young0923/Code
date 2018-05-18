<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>ajax用户名验证</title>
<script language="javascript">

        var xmlHttp = null ;//声明一个名为xmlHttp的变量

        function showHint(str) {
          if (str.length==0) {//当输入内容为空的时候，不检测
            document.getElementById("txtHint").innerHTML="";//获取html文件内容，即表单内容
            return;
          }
          xmlHttp = GetXmlHttpObject();//调用GetXmlHttpObject()得到其返回值，一个ajax对象。
          if (xmlHttp==null) {
            alert ("您的浏览器不支持AJAX!");
            return;
          }
          xmlHttp.onreadystatechange = callback;//每次状态转换就会调用stateChanged函数
          xmlHttp.open("POST",'Ajax.jsp?search=' + str,true);//使用POST请求http，str发送至请gethint.jsp的search，true为异步模式
          xmlHttp.send(null);//发送请求
       }
  
        function callback() {//XMLHttpRequest对象的生命周期:创建、初始化请求、发送请求、接收数据、解析数据、完成
          /*
          0:确认XMLHttpRequest对象是否创建，为调用open()初始化作好准备。值为0表示对象已经存在，否则浏览器会报错－－对象不存在。
          1:对XMLHttpRequest对象初始化，即调用open()，参数(method,url,true)对象状态的设置。调用send()向服务端发送请求。值为1表示正在向服务端发送请求。
          2:接收服务器端的响应数据。获得服务端响应的原始数据，并不能直接使用。值为2表示已经接收完成。并为下一阶段对数据解析作好准备。
          3:解析接收到的服务器端响应数据。根据服务器端响应头部返回的MIME类型把数据转换成能通过responseBody、responseText或responseXML属性存取的格式。状态3表示正在解析数据。
          4:确认全部数据都已经解析为客户端可用的格式。值为4表示数据解析完毕，可以通过XMLHttpRequest对象的相应属性取得数据。
          */
          if (xmlHttp.readyState==4) {
            document.getElementById("txtHint").innerHTML = xmlHttp.responseText;
          }
        }

        function GetXmlHttpObject() {//XMLHttpRequest 是 AJAX 的基础
          try {
            xmlHttp = new XMLHttpRequest();//新版本的浏览器
          }
          catch (e) {//老版本的 Internet Explorer（IE5 和 IE6）使用 ActiveX 对象
            try {
              xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (e) {
              xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
          }
          return xmlHttp;
        }

      </script>
</head>
<body>
	<form action="validate.jsp" method="post">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input name="username" type="text" id="txt1"
					onkeyup="showHint(this.value)"> <span id="txtHint"></span>
				</td>

			</tr>
			<tr>
				<td>密&nbsp;&nbsp;&nbsp;码：</td>
				<td><input name="password" type="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="提交" /></td> 
				<td><input type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
	<%
    Cookie name = new Cookie("cookie1",request.getParameter("name"));
    Cookie password = new Cookie("cookie2",request.getParameter("password"));
    name.setMaxAge(60*60*24); 
    password.setMaxAge(60*60*24); 
    response.addCookie( name );
    response.addCookie( password );%>
</body>
</html>