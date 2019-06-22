<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>书香后台管理系统</title>
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/layui/css/layui.css">
  	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp//layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp//javascript/index.js"></script>
  </head>
  
  <body >
    
 <div class="layui-footer">
    <!-- 底部固定区域 -->
  	<div align="center">
      <spen>本产品所有权归左洪林所有</spen>     
        邮箱：<a href="mailto:service@58ganji.com" target="_blank" rel="nofollow">975723892@qq.com</a>   
        Copyright&nbsp;©&nbsp;2007-2018 www.anjuke.com All Rights Reserved   <a href="http://www.miibeian.gov.cn/" rel="nofollow">ICP号：湘 B2-20090008</a>
    </div>
    <div align="center">
        <a target="_blank" rel="nofollow" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31011502002124">
            <img src="https://pages.anjukestatic.com/usersite/site/img/icon/beianbgs.png" width="20" height="20">
            湘公网安备 31011502002124号
        </a>
    </div>
  </div>

  </body>
</html>
