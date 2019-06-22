<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>书香后台管理平台</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/layui/css/layui.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/index.js"></script>
  </head>
  
  
<frameset rows="60px,*" framespacing="0" border="0" frameborder="0">
		<frame src="${pageContext.request.contextPath}/jsp/b_top.jsp" scrolling="no" noresize /> 
		<frameset cols="200px,*">
			<frame noresize src="${pageContext.request.contextPath}/jsp/b_left.jsp" scrolling="yes" /> 
			<frameset rows="*,40px" framespacing="1" border="1" frameborder="1">
			<frame noresize name="right" src="${pageContext.request.contextPath}/jsp/b_right.jsp" scrolling="yes" />
			<frame noresize name="status_bar" scrolling="no" src="${pageContext.request.contextPath}/jsp/b_bottom.jsp" />
			</frameset>
		</frameset>
		
	</frameset>
	<noframes>
		<body>
			你的浏览器不支持框架布局，推荐你使用<a href="http://www.firefox.com.cn/download/" style="text-decoration: none;">火狐浏览器</a>,
			<a href="http://www.google.cn/intl/zh-CN/chrome/" style="text-decoration: none;">谷歌浏览器</a>
		</body>
	</noframes>
</html>
