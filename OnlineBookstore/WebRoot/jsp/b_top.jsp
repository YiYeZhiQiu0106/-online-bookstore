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
  <title>雅居乐管理平台</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/layui/css/layui.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/index.js"></script>
 	
  </head>
  
  <body>
    <div class="layui-layout layui-layout-admin">
		<div class="layui-header">
	    <div class="layui-logo">书香后台</div>
	    <!-- 头部区域（可配合layui已有的水平导航） -->
	    <ul class="layui-nav layui-layout-left">
	      <li class="layui-nav-item"><a target="right" href="${pageContext.request.contextPath}/jsp/b_salesTab.jsp">统计</a></li>
	      <li class="layui-nav-item"><a target="right" href="${pageContext.request.contextPath}/jsp/b_eva1.jsp">审核评论</a></li>
	      <li class="layui-nav-item"><a href="javascript:;"></a></li>
	      <li class="layui-nav-item"><a href="javascript:;"></a></li>
	      <li class="layui-nav-item"><a href="javascript:;"></a></li>
	      <li class="layui-nav-item"><a href="javascript:;"></a></li>
	      <li class="layui-nav-item"><a href="javascript:;"></a></li>
	      <li class="layui-nav-item"><a href="javascript:;">本次访问时间:<%=session.getAttribute("newTime") %></a></li>
	      <li class="layui-nav-item"><a id="oldTimeId" href="javascript:;">上次访问时间:<%=session.getAttribute("oldTime") %></a></li>
	    </ul>
	    <ul class="layui-nav layui-layout-right">
	      <li class="layui-nav-item">
	        <a href="javascript:;">
	          <!-- <img src="http://t.cn/RCzsdCq" class="layui-nav-img"> -->
	          <img src="${pageContext.request.contextPath}/jsp/image/22a2e685c42c4066acca75d26f870fb4!400x400.jpeg" class="layui-nav-img">
	          ${adm.a_name }
	        </a>
	      </li>
	      <li class="layui-nav-item"><a target="parent" href="${pageContext.request.contextPath}/b_adm/exit.action" >退出</a></li>
	    </ul>
	  </div>
  </div>
  <script type="text/javascript">
 		//var message = "${newTime}";
 		var oldTime = "${oldTime}";
 		if(oldTime==null || oldTime==""){
 			document.getElementById("oldTimeId").innerText = "";
 		}
 		//alert(message);
 	</script>	
  </body>
</html>
