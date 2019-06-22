<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>书香后台管理系统-登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/layui/css/layui.css" media="all" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/login.css" />
    <script type="text/javascript">
		var message = "${message}";
	    if(message!=null && message!=""){
	    	alert(message);
	    }
	    
    </script>
  </head>
  
  <body class="beg-login-bg">
    <div class="beg-login-box">
        <header>
            <h1>书香后台管理系统</h1>
        </header>
        <div class="beg-login-main">
            <form action="${pageContext.request.contextPath}/b_adm/login.action" class="layui-form" method="post">
                <div class="layui-form-item">
                    <label class="beg-login-icon">
                        <i class="layui-icon">&#xe612;</i>
                    </label>
                    <input type="text" id="idnumber" lay-verify="required" name="a_idNumber" autocomplete="off" placeholder="请输入管理员账号" class="layui-input" lay-verType="tips">
                </div>
                <div class="layui-form-item">
                    <label class="beg-login-icon">
                        <i class="layui-icon">&#xe642;</i>
                    </label>
                    <input type="password" lay-verify="required" name="a_pwd" autocomplete="off" placeholder="请输入密码" class="layui-input" lay-verType="tips">
                </div>
                
                <div class="layui-form-item">
                    <div class="beg-pull">
                        <button  type="sumbit" class="layui-btn layui-btn-normal" style="width:100%;" lay-submit lay-filter="formDemo">
                       		     登　　录
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <footer>
            <p>power by dw © </p>
        </footer>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/jquery.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/layui/layui.js" > </script>
<%--     <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/login.js" > </script>
 --%></body>
</html>
