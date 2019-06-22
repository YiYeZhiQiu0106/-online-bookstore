<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    
  </head>
  
  <body >
   <center>
		<h1 style="color: orange">${adm.a_name},欢迎您使用雅居乐平台后台管理</h1>
		
	</center>
	<div  ><img style="height: 525px;width: 1300px" src="${pageContext.request.contextPath}/jsp/js1/2.jpg" ></div>
  </body>
</html>
