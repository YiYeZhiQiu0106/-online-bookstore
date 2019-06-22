<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
  	<meta charset="utf-8">
    <title>网格数据</title>
    <script type="text/javascript" src="js/jquery-1.7.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/themes/icon.css">
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/extend.js"></script>
<script type="text/javascript">
	//通过js操作
	$(function(){
		//页面加载数据
		$("#dg").datagrid({
			//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
		url:"${pageContext.request.contextPath}/b_eva/getEvaluates.action?sta=2",
		async:false,
		idField:'e_id',//标识字段
		columns:[[ //列  field 自动解析后台传输来的列名
		           //title 标题  sortable 是否支持排序
	            {field:'e_id',title:'编号',width:30,align:'center',sortable:true}, 
	            {field:'b_id',title:'图书id',width:40,align:'center',sortable:true},
	            {field:'u_id',title:'用户id',width:40,align:'center',sortable:true},	                  
	            {field:'name',title:'用户名',width:50,align:'center',sortable:true},
		        {field:'evaluate',title:'评论',width:300,align:'center',sortable:true},
		        {field:'e_time',title:'评论时间',width:70,align:'center',sortable:true},
		        {field:'statis',title:'状态',width:90,align:'center',sortable:true,
		        	formatter:function(value,row,index){	                		  
	                	if(value==1){	                			  
	                		return '<span style="color:orange"><b>审核中</b></span>'; 	                			 
	                	}else if(value==2){
	                		 return '<span style="color:green"><b>审核通过</b></span>';
	                	 }else {
	                		 return '<span style="color:red"><b>审核未通过</b></span>';
						}
	                 }	 
		        
		        },  	                 		              
             ]],
             toolbar: [
                        {
                          text: "不通过审核", iconCls: "icon-remove",  handler: function () {
                          	changeSta1();
                        }}, '-',
            ],
            pagination:true,//分页
            fitColumns:true,//列自适应宽度
            rownumbers:true,//显示行号
            striped:true,//斑马线
            singleSelect:true,//是否单选
		});
	});
			
	//根据id通过审核评论
	function changeSta(){
		//获取选中的行
		debugger;
		var row = $("#dg").datagrid("getSelected");
		var e_id = row.e_id;
		if(row){
			//提示
			$.messager.confirm("Confirm","确定通过审核吗?",function(result){
				if(result){//删除
					//根据t_id删除
					//jquery ajax
					$.post("${pageContext.request.contextPath}/b_eva/upEvaSta.action",{e_id:e_id,sta:1},
						function(result){
						// {success:true/false}
							if(result.eva=="操作成功"){
					 			$.messager.show({'title':'error','msg':"审核成功"});
								//刷新表格   重新请求后台
								$("#dg").datagrid('reload');
							}else{
								$.messager.show({'title':'error','msg':"审核失败，稍后再试"});
							}
					},"json"); 
				}
			});

		}else{
			$.messager.show({'title':'error','msg':"请选择一行数据"});
		}
	}
	
	//根据id通过审核评论
	function changeSta1(){
		//获取选中的行
		debugger;
		var row = $("#dg").datagrid("getSelected");
		var e_id = row.e_id;
		if(row){
			//提示
			$.messager.confirm("Confirm","确定通过审核吗?",function(result){
				if(result){//删除
					//根据t_id删除
					//jquery ajax
					$.post("${pageContext.request.contextPath}/b_eva/upEvaSta.action",{e_id:e_id,sta:3},
						function(result){
						// {success:true/false}
							if(result.eva=="操作成功"){
					 			$.messager.show({'title':'error','msg':"审核不通过成功"});
								//刷新表格   重新请求后台
								$("#dg").datagrid('reload');
							}else{
								$.messager.show({'title':'error','msg':"审核失败，稍后再试"});
							}
					},"json"); 
				}
			});

		}else{
			$.messager.show({'title':'error','msg':"请选择一行数据"});
		}
	}
		
		function searchFunc(){
			//根据输入的值进行搜索
			var u_id = $("#u_id").val();
			$("#dg").datagrid({
				//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
			url:"${pageContext.request.contextPath}/b_eva/getUserEva.action?u_id="+u_id,
			async:false,
			idField:'e_id',//标识字段
			columns:[[ //列  field 自动解析后台传输来的列名
			           //title 标题  sortable 是否支持排序
		            {field:'e_id',title:'编号',width:30,align:'center',sortable:true}, 
		            {field:'b_id',title:'图书id',width:40,align:'center',sortable:true},
		            {field:'u_id',title:'用户id',width:40,align:'center',sortable:true},	                  
		            {field:'name',title:'用户名',width:50,align:'center',sortable:true},
			        {field:'evaluate',title:'评论',width:300,align:'center',sortable:true},
			        {field:'e_time',title:'评论时间',width:70,align:'center',sortable:true},
			        {field:'statis',title:'状态',width:90,align:'center',sortable:true,
			        	formatter:function(value,row,index){	                		  
		                	if(value==1){	                			  
		                		return '<span style="color:orange"><b>审核中</b></span>'; 	                			 
		                	}else if(value==2){
		                		 return '<span style="color:green"><b>审核通过</b></span>';
		                	 }else {
		                		 return '<span style="color:red"><b>审核未通过</b></span>';
							}
		                 }	 
			        
			        },  	                 		              
	             ]],
	             toolbar: [
	                        {
	                          text: "通过审核", iconCls: "icon-remove",  handler: function () {
	                          	changeSta();
	                        }}, '-',
	                        {
	                            text: "不通过审核", iconCls: "icon-remove",  handler: function () {
	                            	changeSta1();
	                          }}, '-',
	            ],
	            pagination:true,//分页
	            fitColumns:true,//列自适应宽度
	            rownumbers:true,//显示行号
	            striped:true,//斑马线
	            singleSelect:true,//是否单选
			});
		}
		
		function clearSearch(){
			//清空表单的input 的name 的值
			$("#dg").datagrid({
				//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
			url:"${pageContext.request.contextPath}/b_eva/getEvaluates.action?sta=2",
			async:false,
			idField:'e_id',//标识字段
			columns:[[ //列  field 自动解析后台传输来的列名
			           //title 标题  sortable 是否支持排序
		            {field:'e_id',title:'编号',width:30,align:'center',sortable:true}, 
		            {field:'b_id',title:'图书id',width:40,align:'center',sortable:true},
		            {field:'u_id',title:'用户id',width:40,align:'center',sortable:true},	                  
		            {field:'name',title:'用户名',width:50,align:'center',sortable:true},
			        {field:'evaluate',title:'评论',width:300,align:'center',sortable:true},
			        {field:'e_time',title:'评论时间',width:70,align:'center',sortable:true},
			        {field:'statis',title:'状态',width:90,align:'center',sortable:true,
			        	formatter:function(value,row,index){	                		  
		                	if(value==1){	                			  
		                		return '<span style="color:orange"><b>审核中</b></span>'; 	                			 
		                	}else if(value==2){
		                		 return '<span style="color:green"><b>审核通过</b></span>';
		                	 }else {
		                		 return '<span style="color:red"><b>审核未通过</b></span>';
							}
		                 }	 
			        
			        },  	                 		              
	             ]],
	             toolbar: [
	                        {
	                          text: "通过审核", iconCls: "icon-remove",  handler: function () {
	                          	changeSta();
	                        }}, '-',
	                        {
	                            text: "不通过审核", iconCls: "icon-remove",  handler: function () {
	                            	changeSta1();
	                          }}, '-',
	            ],
	            pagination:true,//分页
	            fitColumns:true,//列自适应宽度
	            rownumbers:true,//显示行号
	            striped:true,//斑马线
	            singleSelect:true,//是否单选
			});
		}
	</script>
  </head>
  
  <body>
  	<div data-options="region:'north',title:'高级查询'" style="height: 100px; background: #F4F4F4;">
          <form id="searchForm">
              <table>
                  <tr>
                      <td>查找用户评论：</td>
                      <td><input name="u_id" id="u_id" placeholder="请输入用户id"/></td>
                      
                  </tr>
                  <tr>
                      <td></td>
                      <td>
                      <a class="easyui-linkbutton" href="javascript:void(0);" onclick="searchFunc();">查找</a>
                      <a class="easyui-linkbutton" href="javascript:void(0);" onclick="clearSearch();">清空</a>
                      </td>
                  </tr>
              </table>
          </form>
	</div>
  	
    <div data-options="region:'center',split:false">
        <table id="dg">
        </table>
	</div>
	
	

			
  </body>
</html>
