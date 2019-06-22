<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'in.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jquery-1.8.2.js"></script>
  </head>
  
  <body>
    
	<script>
$(function(){
	$(function(){
		var url = "${pageContext.request.contextPath}/book/getAllBook.action";
		var method = "POST";
		$.ajax({
			url : url,
			type : method,
			dataType : 'json',
			success : function(response) {
				debugger;
				//$("#admName").text(response.adm.m_name);
				for(var i=0;i<response.length;i++){
					b_id=response.b_id[i];
				}
			}
		});
		
		
		
	});
});
</script>
  </body>
</html>
