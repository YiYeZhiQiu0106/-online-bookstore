<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>书香后台管理系统</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/layui/css/layui.mobile.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/index.js"></script>
  </head>
  
  <body>
    <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item">
          <a class="" href="javascript:;">系统设置</a>
          <dl class="layui-nav-child">
            <dd><a target="right" href="${pageContext.request.contextPath}/jsp/b_pwd.jsp">修改密码</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a target="right" href="${pageContext.request.contextPath}/jsp/b_users.jsp">用户管理</a>
          
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">图书管理</a>
            <dl class="layui-nav-child">
                <dd><a target="right"  href="${pageContext.request.contextPath}/jsp/b_book.jsp">图书信息管理</a></dd>
                <dd><a target="right" href="${pageContext.request.contextPath}/jsp/b_img.jsp">图书图片管理</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
                <a href="javascript:;">订单管理</a>
                <dl class="layui-nav-child">
                     <dd><a target="right" href="${pageContext.request.contextPath}/jsp/b_orders1.jsp">已发货订单</a></dd>
                	 <dd><a target="right" href="${pageContext.request.contextPath}/jsp/b_orders.jsp">未发货订单</a></dd>
            	</dl>
            </li>
        <li class="layui-nav-item">
                <a target="right" href="${pageContext.request.contextPath}/jsp/b_type.jsp">图书类型管理</a>
            </li>
		<li class="layui-nav-item">
                <a target="right" href="${pageContext.request.contextPath}/jsp/b_salesTab.jsp">统计</a>
            </li>
        <li class="layui-nav-item">
            <a href="javascript:;">评论管理</a>
            <dl class="layui-nav-child">
                <dd><a target="right" href="${pageContext.request.contextPath}/jsp/b_eva1.jsp">审核评论</a></dd>
                <dd><a target="right" href="${pageContext.request.contextPath}/jsp/b_eva2.jsp">已通过审核</a></dd>
                <dd><a target="right" href="${pageContext.request.contextPath}/jsp/b_eva3.jsp">未通过审核</a></dd>
            </dl>
        </li>
      </ul>
    </div>
  </div>
  </body>
</html>
