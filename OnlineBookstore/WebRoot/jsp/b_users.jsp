<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		//debugger;
		$("#dg").datagrid({
			//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
		url:"${pageContext.request.contextPath}/b_users/getAllUsers.action",
		idField:'id',//标识字段
		columns:[[ //列  field 自动解析后台传输来的列名
		           //title 标题  sortable 是否支持排序
	            {field:'id',title:'编号',width:30,align:'center',sortable:true}, 
	            {field:'name',title:'用户名',width:80,align:'center',sortable:true},
	            {field:'phone',title:'手机号',width:90,align:'center',sortable:true},
	            {field:'address',title:'收货地址',width:150,align:'center',sortable:true},
	            {field:'time',title:'注册时间',width:100,align:'center',sortable:true},
	            {field:'balance',title:'已消费',width:50,align:'center',sortable:true}, 
             ]],
             toolbar: [//在dategrid表单的头部添加按钮
                        {
                          text: "删除用户", iconCls: "icon-remove",  handler: function () {
                          	deleteUser();
                        }}, '-',
                        {text: "修改",iconCls: "icon-edit", handler: function () {
                           updateUser();
                        }
                        }, '-'
            ],
            pagination:true,//分页
            fitColumns:true,//列自适应宽度
            rownumbers:true,//显示行号
            striped:true,//斑马线
            singleSelect:true,//是否单选
		});
	});
		/**
		*转换函数 date long 日期类型
		*/
		function formate(date){
			var now = new Date(date);
			// yyyy-MM-dd
			var year=now.getFullYear();
			var month=now.getMonth()+1;//0开始
			var day=now.getDate();//date 月中日期  
			//获取时分秒
			//var hh =now.getHours();
			return year+'-'+month+'-'+day;
		}
		
		
		

		
		//打开修改的对话框
		function updateUser(){
			//获取选中的行		
			var row = $("#dg").datagrid("getSelected");
			$("#fm1").form('clear');
			
			if(row){//有或者没有数据				
				//数据自动填充到表单中
				$("#dlg1").dialog('open').dialog('setTitle','修改用户信息');
			    var now = row.t_time;
			    if(now){
			    	var time = formate(now);
			    	row.t_time = time;
			    }
			    $("#fm1").form('load',row);//往表单中填充数据 [一行]	
			    $("#village").empty();
			 	
			}else{
				//easyui的错误提示
				$.messager.show({'title':'error','msg':"请选择需要修改的数据"});
			}			
		}
		
		//修改表单数据提交 
		function saveUpdate(){
			//提交fm的表单
			$("#fm1").form("submit",{//提交表单
				url:"${pageContext.request.contextPath}/b_users/updateUser.action",
				onSubmit:function(){
					//提交时候的事件
					return $(this).form("validate");//验证					
				},
				success:function(response){
					//提交成功   "{success:true}"
					debugger;
					var result = eval( "("+response+")" );
					//dg表格要刷新并且关闭对话框
					if(result[0].end=="成功"){
						$.messager.show({'title':'error','msg':"操作成功"});
						$("#dlg1").dialog('close');//关闭
						//dg刷新
						$("#dg").datagrid('reload');
					}else{
						$.messager.show({'title':'error','msg':"操作失败"});
					}
				}
			});
		}	
		
		
		//根据id删除一行数据
		function deleteUser(){
			//获取选中的行
			debugger;
			var row = $("#dg").datagrid("getSelected");
			if(row){
				//提示
				$.messager.confirm("Confirm","确认删除吗?",function(result){
					if(result){//删除
						//根据t_id删除
						//jquery ajax
						$.post("${pageContext.request.contextPath}/b_users/delUser.action?",{id:row.id},
							function(result){
							// {success:true/false}
								if(result[0].end=="成功"){
						            $.messager.show({'title':'error','msg':"删除成功"});
									//刷新表格   重新请求后台
									$("#dg").datagrid('reload');
								}else{
									$.messager.show({'title':'error','msg':"删除失败，稍后再试"});
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
			var i1 = $("#name1").val();
			var url = "${pageContext.request.contextPath}/b_users/dimName.action?name="+i1;
			$("#dg").datagrid({
				//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
			url:url,
			idField:'id',//标识字段
			columns:[[ //列  field 自动解析后台传输来的列名
			           //title 标题  sortable 是否支持排序
		            {field:'id',title:'编号',width:30,align:'center',sortable:true}, 
		            {field:'name',title:'用户名',width:80,align:'center',sortable:true},
		            {field:'sex',title:'性别',width:50,align:'center',sortable:true},
		            {field:'age',title:'年龄',width:50,align:'center',sortable:true},
		            {field:'phone',title:'手机号',width:90,align:'center',sortable:true},
		            {field:'address',title:'收货地址',width:150,align:'center',sortable:true},
		            {field:'time',title:'注册时间',width:100,align:'center',sortable:true},
		            {field:'balance',title:'账户余额',width:50,align:'center',sortable:true}, 
	             ]],
	             toolbar: [//在dategrid表单的头部添加按钮
	                        {
	                          text: "删除用户", iconCls: "icon-remove",  handler: function () {
	                          	deleteUser();
	                        }}, '-',
	                        {text: "修改",iconCls: "icon-edit", handler: function () {
	                           updateUser();
	                        }
	                        }, '-'
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
			$("#searchForm input[name]").val("");
			$("#dg").datagrid({
				//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
			url:"${pageContext.request.contextPath}/b_users/getAllUsers.action",
			idField:'id',//标识字段
			columns:[[ //列  field 自动解析后台传输来的列名
			           //title 标题  sortable 是否支持排序
		            {field:'id',title:'编号',width:30,align:'center',sortable:true}, 
		            {field:'name',title:'用户名',width:80,align:'center',sortable:true},
		            {field:'sex',title:'性别',width:50,align:'center',sortable:true},
		            {field:'age',title:'年龄',width:50,align:'center',sortable:true},
		            {field:'phone',title:'手机号',width:90,align:'center',sortable:true},
		            {field:'address',title:'收货地址',width:150,align:'center',sortable:true},
		            {field:'time',title:'注册时间',width:100,align:'center',sortable:true},
		            {field:'balance',title:'账户余额',width:50,align:'center',sortable:true}, 
	             ]],
	             toolbar: [//在dategrid表单的头部添加按钮
	                        {
	                          text: "删除用户", iconCls: "icon-remove",  handler: function () {
	                          	deleteUser();
	                        }}, '-',
	                        {text: "修改",iconCls: "icon-edit", handler: function () {
	                           updateUser();
	                        }
	                        }, '-'
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
                     
                       <td>查找用户：</td>
                      <td><input name="name" id="name1" placeholder="输入用户名查询"/></td>
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
	
	

		

		 <!-- 修改操作的表单 -->
		<div id="dlg1" class="easyui-dialog" style="width:400px;height:350px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
			<form id="fm1" method="post">
				<div class="fitem"  >
			   <table>
				<tr>
					<td style="width:80px"><label>编号:&nbsp;&nbsp;</label></td>
					<td><input name="id" class="easyui-validatebox" required="true" readonly="readonly"></td>
				</tr>
			   </table>
			</div>
		   <div class="fitem">
			   <table>
				<tr>
					<td style="width:80px"><label>用户名:&nbsp;&nbsp;</label></td>
					<td><input name="name"  class="easyui-validatebox" required="true"></td>
				</tr>
			   </table>
			</div>
			
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>收货地址:&nbsp;&nbsp;</label></td>
					<td><input name="address"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>电话号码:&nbsp;&nbsp;</label></td>
					<td><input name="phone"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>		
			
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>注册时间:&nbsp;&nbsp;</label></td>
					<td><input name="time"  class="easyui-validatebox" required="true" readonly="readonly"></td>
				</tr>
				</table>
			</div>	
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>账户余额:&nbsp;&nbsp;</label></td>
					<td><input name="balance"  class="easyui-validatebox" required="true" readonly="readonly"></td>
				</tr>
				</table>
			</div>				
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUpdate()">确定</a>
			<!--  dialog('open/close') 打开或者关闭对话框 -->
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg1').dialog('close')">取消</a>
		</div>
			
  </body>
</html>
