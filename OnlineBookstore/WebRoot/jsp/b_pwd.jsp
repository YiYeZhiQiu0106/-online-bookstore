<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
<html>
  <head>
    <meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/layui/css/layui.css">
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/jquery-1.8.2.js"></script>
  	<script type="text/javascript">
  	
  	var yes = "${yes1}";
    if(yes!=null && yes!=""){
    	alert(yes);
    }
    
    function qingk(){
    	
    	$.ajax({
    		url:"${pageContext.request.contextPath}/b_adm/qingk.action",
    		dataType:"json",
    		success : function(response) {
			}
    	})
    }
    
  	</script>
  </head>
  <body>
  <%
	if ((String)request.getAttribute("str") == "true") {
	%>
	<script>
	alert("操作成功！");
	</script>
	<%
	}
	%>
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>系统设置 - 修改密码</legend>
            <div class="layui-field-box">
                <div class="layui-btn-group">

                    <button class="layui-btn layui-btn-xs dw-refresh">
                        <i class="layui-icon">&#x1002;</i>刷新
                    </button>
                </div>
                <hr>
                <form class="layui-form" action="${pageContext.request.contextPath}/b_adm/updateAdm.action">
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-inline">
                        <input type="text" id="name" name="a_name" required lay-verify="required" value="${adm.a_name} " autocomplete="off" class="layui-input">
                        </div>
                    </div>
                     <div class="layui-form-item">
                        <label class="layui-form-label">身份证号</label>
                        <div class="layui-input-inline">
                        <input type="text" id="name" name="a_idNumber" required lay-verify="required" value="${adm.a_idNumber} " autocomplete="off" class="layui-input" readonly="readonly">
                        </div>
                    </div>
                     <div class="layui-form-item">
                        <label class="layui-form-label">手机号</label>
                        <div class="layui-input-inline">
                        <input type="text" id="name" name="a_tel" required lay-verify="required" value="${adm.a_tel} " autocomplete="off" class="layui-input" readonly="readonly">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-inline">
                        <input type="password" id="pwd" name="a_pwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                        
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                       	<input type="submit" class="layui-btn" value="确定修改"/>
                        <button type="reset" class="layui-btn layui-btn-primary" onclick="qingk()" >重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
    </div>
  </div>
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/javascript/sys_config.js"></script>
  </body>
</html>
