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
		$("#dg").datagrid({
			//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
		url:"${pageContext.request.contextPath}/b_type/getAlltype.action",
		idField:'bt_id',//标识字段
		columns:[[ //列  field 自动解析后台传输来的列名
		           //title 标题  sortable 是否支持排序
	            {field:'bt_id',title:'编号',width:30,align:'center',sortable:true}, 
	            {field:'bt_name',title:'类型名',width:100,align:'center',sortable:true},
	            {field:'bt_synopsis',title:'简介',width:100,align:'center',sortable:true},	                    	                  
             ]],
             toolbar: [
                   {//在dategrid表单的头部添加按钮
                        text: "添加",iconCls: "icon-add", handler: function () {
                      	  addType();
                        }}, '-', 
                        {
                          text: "删除", iconCls: "icon-remove",  handler: function () {
                          	deleteType();
                        }}, '-',
                        {text: "修改",iconCls: "icon-edit", handler: function () {
                           updateType();
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
		
		function addType(){
			//打开新增对话框
			$("#dlg").dialog('open').dialog('setTitle','新增类型');
			//清空表单			
			$("#fm input[name]").val("");
			 $("#myvillage").empty();
			 var opt  = $("#fm select>option[select='selected']");
				opt.each(function(){
					$(this).attr("selected","selected");
				});
			  
		}
		function saveType(){
			debugger;
			//提交fm的表单
			$("#fm").form("submit",{//提交表单
				url:"${pageContext.request.contextPath}/b_type/addType.action",
				onSubmit:function(){
					//提交时候的事件
					return $(this).form("validate");//验证
				},
				success:function(response){
					
					//提交成功   "{success:true}"
					var result = eval( "("+response+")" );
					//dg表格要刷新并且关闭对话框
					if(result[0].end=="添加成功"){
						$.messager.show({'title':'error','msg':"操作成功"});
						$("#dlg").dialog('close');//关闭
						//dg刷新
						$("#dg").datagrid('reload');
					}else if(result[0].end=="失败"){
						$.messager.show({'title':'error','msg':"类型名已存在,添加失败"});
					}
				}
			});
		}

		
		//打开修改的对话框
		function updateType(){
			//获取选中的行		
			var row = $("#dg").datagrid("getSelected");
			$("#fm1").form('clear');
			
			if(row){//有或者没有数据				
				//数据自动填充到表单中
				$("#dlg1").dialog('open').dialog('setTitle','修改类型信息');
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
				url:"${pageContext.request.contextPath}/b_type/updateType.action",
				onSubmit:function(){
					//提交时候的事件
					return $(this).form("validate");//验证					
				},
				success:function(response){
					//提交成功   "{success:true}"
					debugger;
					var result = eval( "("+response+")" );
					//dg表格要刷新并且关闭对话框
					if(result[0].end=="添加成功"){
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
		function deleteType(){
			//获取选中的行
			debugger;
			var row = $("#dg").datagrid("getSelected");
			if(row){
				//提示
				$.messager.confirm("Confirm","确认删除吗?",function(result){
					if(result){//删除
						//根据t_id删除
						//jquery ajax
						$.post("${pageContext.request.contextPath}/b_type/deleteType.action?",{bt_id:row.bt_id},
							function(result){
							// {success:true/false}
								if(result[0].end=="添加成功"){
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
			var name = $("#btname").val();
			var url = "${pageContext.request.contextPath}/b_type/dimName.action?name="+name;
			$("#dg").datagrid({
				//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
			url:url,
			idField:'bt_id',//标识字段
			columns:[[ //列  field 自动解析后台传输来的列名
			           //title 标题  sortable 是否支持排序
		            {field:'bt_id',title:'编号',width:30,align:'center',sortable:true}, 
		            {field:'bt_name',title:'类型名',width:100,align:'center',sortable:true},
		            {field:'bt_synopsis',title:'简介',width:100,align:'center',sortable:true},	                    	                  
	             ]],
	             toolbar: [
	                   {//在dategrid表单的头部添加按钮
	                        text: "添加",iconCls: "icon-add", handler: function () {
	                      	  addType();
	                        }}, '-', 
	                        {
	                          text: "删除", iconCls: "icon-remove",  handler: function () {
	                          	deleteType();
	                        }}, '-',
	                        {text: "修改",iconCls: "icon-edit", handler: function () {
	                           updateType();
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
			url:"${pageContext.request.contextPath}/b_type/getAlltype.action",
			idField:'bt_id',//标识字段
			columns:[[ //列  field 自动解析后台传输来的列名
			           //title 标题  sortable 是否支持排序
		            {field:'bt_id',title:'编号',width:30,align:'center',sortable:true}, 
		            {field:'bt_name',title:'类型名',width:100,align:'center',sortable:true},
		            {field:'bt_synopsis',title:'简介',width:100,align:'center',sortable:true},	                    	                  
	             ]],
	             toolbar: [
	                   {//在dategrid表单的头部添加按钮
	                        text: "添加",iconCls: "icon-add", handler: function () {
	                      	  addType();
	                        }}, '-', 
	                        {
	                          text: "删除", iconCls: "icon-remove",  handler: function () {
	                          	deleteType();
	                        }}, '-',
	                        {text: "修改",iconCls: "icon-edit", handler: function () {
	                           updateType();
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
                      <td>查找类型：</td>
                      <td><input name="bt_name" id="btname" placeholder="请输入类型名"/></td>
                       
                  </tr>
                  <tr>
                      <td></td>
                      <td><a class="easyui-linkbutton" href="javascript:void(0);" onclick="searchFunc();">查找</a>
                      <a class="easyui-linkbutton" href="javascript:void(0);" onclick="clearSearch();">清空</a></td>
                  </tr>
              </table>
          </form>
	</div>
  	
    <div data-options="region:'center',split:false">
        <table id="dg">
        </table>
	</div>
	
	
<div id="dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
		<!--regions v_id t_type t_area t_face t_floor t_fitup t_price t_details -->
			<form id="fm" method="post" >
		   <div class="fitem">
			   <table>
				<tr>
					<td style="width:80px"><label>类型名:&nbsp;&nbsp;</label></td>
					<td><input name="bt_name"  class="easyui-validatebox" required="true"></td>
				</tr>
			   </table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>简介:&nbsp;&nbsp;</label></td>
					<td><input name="bt_synopsis"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveType()">保存</a>
			<!--  dialog('open/close') 打开或者关闭对话框 -->
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		

		 <!-- 修改操作的表单 -->
		<div id="dlg1" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
			<form id="fm1" method="post">
				<div class="fitem"  >
			   <table>
				<tr>
					<td style="width:80px"><label>编号:&nbsp;&nbsp;</label></td>
					<td><input name="bt_id" class="easyui-validatebox" required="true" readonly="readonly"></td>
				</tr>
			   </table>
			</div>
		   <div class="fitem">
			   <table>
				<tr>
					<td style="width:80px"><label>类型名:&nbsp;&nbsp;</label></td>
					<td><input name="bt_name"  class="easyui-validatebox" required="true"></td>
				</tr>
			   </table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>简介:&nbsp;&nbsp;</label></td>
					<td><input name="bt_synopsis"  class="easyui-validatebox" required="true"></td>
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
