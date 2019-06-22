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
		url:"${pageContext.request.contextPath}/b_orders/getAllOrders1.action",
		idField:'o_id',//标识字段
		columns:[[ //列  field 自动解析后台传输来的列名
		           //title 标题  sortable 是否支持排序
	            {field:'o_id',title:'订单号',width:30,align:'center',sortable:true}, 
	            {field:'o_state',title:'发货状态',width:50,align:'center',sortable:true,
	            	formatter:function(value,row,index){	                		  
	                	if(value){	                			  
	                		return '<span style="color:red"><b>已发货</b></span>'; 	                			 
	                	}else{
	                		 return '未发货';
	                	 }
	                 }	  
	            },
	            {field:'o_time',title:'创建订单时间',width:70,align:'center',sortable:true},	                    	                  
	            {field:'num',title:'购买数量',width:30,align:'center',sortable:true,
	            	formatter:function(value,row,index){	                		  
	                	return '<span style="color:red"><b>'+value+'</b></span>'
	                 }	 
	            	},
	            {field:'u_id',title:'用户id',width:40,align:'center',sortable:true},	                  
	            {field:'u_name',title:'用户名',width:50,align:'center',sortable:true},
		        {field:'address',title:'收货地址',width:70,align:'center',sortable:true},
		        {field:'phone',title:'联系方式',width:50,align:'center',sortable:true},
		        {field:'b_id',title:'图书编号',width:40,align:'center',sortable:true},  	                 		              
	            {field:'b_name',title:'图书名',width:70,align:'center',sortable:true},
	            {field:'price',title:'价格',width:50,align:'center',sortable:true},  	                 		              
	            {field:'money',title:'订单总金额',width:70,align:'center',sortable:true,
	            	formatter:function(value,row,index){	                		  
	                	return '<span style="color:red"><b>'+value+'</b></span>'
	                 }
	            },
             ]],
             toolbar: [
                   {//在dategrid表单的头部添加按钮
                        text: "添加",iconCls: "icon-add", handler: function () {
                      	  addBook();
                        }}, '-', 
                        {
                          text: "取消订单", iconCls: "icon-remove",  handler: function () {
                          	deleteBook();
                        }}, '-',
                        {text: "修改",iconCls: "icon-edit", handler: function () {
                           updateBook();
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
		function updateBook(){
			//获取选中的行		
			var row = $("#dg").datagrid("getSelected");
			$("#fm1").form('clear');
			
			if(row){//有或者没有数据				
				//数据自动填充到表单中
				$("#dlg1").dialog('open').dialog('setTitle','修改订单信息');
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
				url:"${pageContext.request.contextPath}/b_orders/updateOrders.action",
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
		
		function searchFunc(){
			//根据输入的值进行搜索
			var o_id = $("#o_id").val();
			var url = "${pageContext.request.contextPath}/b_orders/dimO_id.action?o_id="+o_id+"&sta=1";
				$("#dg").datagrid({
					//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
					url:url,
					idField:'o_id',//标识字段
					columns:[[ //列  field 自动解析后台传输来的列名
					           //title 标题  sortable 是否支持排序
				            {field:'o_id',title:'订单号',width:30,align:'center',sortable:true}, 
				            {field:'o_state',title:'发货状态',width:50,align:'center',sortable:true,
				            	formatter:function(value,row,index){	                		  
				                	if(value){	                			  
				                		return '<span style="color:red"><b>已发货</b></span>'; 	                			 
				                	}else{
				                		 return '未发货';
				                	 }
				                 }	  
				            },
				            {field:'o_time',title:'创建订单时间',width:70,align:'center',sortable:true},	                    	                  
				            {field:'num',title:'购买数量',width:30,align:'center',sortable:true,
				            	formatter:function(value,row,index){	                		  
				                	return '<span style="color:red"><b>'+value+'</b></span>'
				                 }	 
				            	},
				            {field:'u_id',title:'用户id',width:40,align:'center',sortable:true},	                  
				            {field:'u_name',title:'用户名',width:50,align:'center',sortable:true},
					        {field:'address',title:'收货地址',width:70,align:'center',sortable:true},
					        {field:'phone',title:'联系方式',width:50,align:'center',sortable:true},
					        {field:'b_id',title:'图书编号',width:40,align:'center',sortable:true},  	                 		              
				            {field:'b_name',title:'图书名',width:70,align:'center',sortable:true},
				            {field:'price',title:'价格',width:50,align:'center',sortable:true},  	                 		              
				            {field:'money',title:'订单总金额',width:70,align:'center',sortable:true,
				            	formatter:function(value,row,index){	                		  
				                	return '<span style="color:red"><b>'+value+'</b></span>'
				                 }
				            },
			             ]],
			             toolbar: [
			                   {//在dategrid表单的头部添加按钮
			                        text: "添加",iconCls: "icon-add", handler: function () {
			                      	  addBook();
			                        }}, '-', 
			                        {
			                          text: "取消订单", iconCls: "icon-remove",  handler: function () {
			                          	deleteBook();
			                        }}, '-',
			                        {text: "修改",iconCls: "icon-edit", handler: function () {
			                           updateBook();
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
			$("#dg").datagrid({
				//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
			url:"${pageContext.request.contextPath}/b_orders/getAllOrders1.action",
			idField:'o_id',//标识字段
			columns:[[ //列  field 自动解析后台传输来的列名
			           //title 标题  sortable 是否支持排序
		            {field:'o_id',title:'订单号',width:30,align:'center',sortable:true}, 
		            {field:'o_state',title:'发货状态',width:50,align:'center',sortable:true,
		            	formatter:function(value,row,index){	                		  
		                	if(value){	                			  
		                		return '<span style="color:red"><b>已发货</b></span>'; 	                			 
		                	}else{
		                		 return '未发货';
		                	 }
		                 }	  
		            },
		            {field:'o_time',title:'创建订单时间',width:70,align:'center',sortable:true},	                    	                  
		            {field:'num',title:'购买数量',width:30,align:'center',sortable:true,
		            	formatter:function(value,row,index){	                		  
		                	return '<span style="color:red"><b>'+value+'</b></span>'
		                 }	 
		            	},
		            {field:'u_id',title:'用户id',width:40,align:'center',sortable:true},	                  
		            {field:'u_name',title:'用户名',width:50,align:'center',sortable:true},
			        {field:'address',title:'收货地址',width:70,align:'center',sortable:true},
			        {field:'phone',title:'联系方式',width:50,align:'center',sortable:true},
			        {field:'b_id',title:'图书编号',width:40,align:'center',sortable:true},  	                 		              
		            {field:'b_name',title:'图书名',width:70,align:'center',sortable:true},
		            {field:'price',title:'价格',width:50,align:'center',sortable:true},  	                 		              
		            {field:'money',title:'订单总金额',width:70,align:'center',sortable:true,
		            	formatter:function(value,row,index){	                		  
		                	return '<span style="color:red"><b>'+value+'</b></span>'
		                 }
		            },
	             ]],
	             toolbar: [
	                   {//在dategrid表单的头部添加按钮
	                        text: "添加",iconCls: "icon-add", handler: function () {
	                      	  addBook();
	                        }}, '-', 
	                        {
	                          text: "取消订单", iconCls: "icon-remove",  handler: function () {
	                          	deleteBook();
	                        }}, '-',
	                        {text: "修改",iconCls: "icon-edit", handler: function () {
	                           updateBook();
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
                      <td>查找订单：</td>
                      <td><input name="o_id" id="o_id" placeholder="请输入订单编号"/></td>
                      
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
	
	
<div id="dlg" class="easyui-dialog" style="width:400px;height:500px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
		<!--regions v_id t_type t_area t_face t_floor t_fitup t_price t_details -->
			<form id="fm" method="post" >
		   <div class="fitem">
			   <table>
				<tr>
					<td style="width:80px"><label>书名:&nbsp;&nbsp;</label></td>
					<td><input name="b_name"  class="easyui-validatebox" required="true"></td>
				</tr>
			   </table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>作者:&nbsp;&nbsp;</label></td>
					<td><input name="author"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>价格:&nbsp;&nbsp;</label></td>
					<td><input name="price"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>出版社:&nbsp;&nbsp;</label></td>
					<td><input name="press"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>出版时间:&nbsp;&nbsp;</label></td>
					<td><input name="pre_time"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>类型:&nbsp;</label></td>
					<td><select id="mySelect" name="b_type" class="easyui-validatebox" required="true">
						<option select="selected">请选择</option>
						<option >教材</option>
						<option >考试</option>
						<option >外语</option>
						<option >历史</option>
						<option >古籍</option>
						<option >文化</option>
						<option >政治</option>
					    <option >哲学</option>
					    <option >工具书</option>
					    <option >中小学教辅</option>
				</select></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>封面:&nbsp;&nbsp;</label></td>
					<td><input name="img"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>包装:&nbsp;&nbsp;</label></td>
					<td><select id="mySelect" name="packing" class="easyui-validatebox" required="true">
					  <option select="selected">请选择</option>
					  <option >精装</option>
					  <option >平装</option>
					  <option >线装</option>
					  <option >钉装</option>
					</select></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>开本:&nbsp;&nbsp;</label></td>				
					<td><select id="mySelect" name="openbook" class="easyui-validatebox" required="true">
					  <option select="selected">请选择</option>
					  <option >12开</option>
					  <option >16开</option>
					  <option >40开</option>
					  <option >44开</option>
					  <option >46开</option>
					</select></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>标准书号:&nbsp;&nbsp;</label></td>
					<td><input  name="isbn" class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>纸张:&nbsp;&nbsp;</label></td>				
					<td><select id="mySelect" name="paper" class="easyui-validatebox" required="true">
					  <option select="selected">请选择</option>
					  <option >胶质纸</option>
					  <option >胶质纸</option>
					  <option >胶质纸</option>
					</select></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>是否套装:&nbsp;&nbsp;</label></td>				
					<td><select id="mySelect" name="suit" class="easyui-validatebox" required="true">
					  <option select="selected">请选择</option>
					  <option >是</option>
					  <option >否</option>
					</select></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>库存:&nbsp;&nbsp;</label></td>
					<td><input type="stock" min="0" name="stock" class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>简介:</label></td>
					<td><input name="synopsis" class="easyui-validatebox" required="true"></td>
					</tr>
					</table>
				</div>
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveBook();saved();">保存</a>
			<!--  dialog('open/close') 打开或者关闭对话框 -->
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>

				
	
	
	
		 <!-- 修改操作的表单 -->
		<div id="dlg1" class="easyui-dialog" style="width:400px;height:520px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
			<form id="fm1" method="post">
				<div class="fitem"  >
			   <table>
				<tr>
					<td style="width:80px"><label>编号:&nbsp;&nbsp;</label></td>
					<td><input name="o_id" class="easyui-validatebox" required="true" readonly="readonly"></td>
				</tr>
			   </table>
			</div>
		   <div class="fitem">
			   <table>
				<tr>
					<td style="width:80px"><label>发货状态:&nbsp;&nbsp;</label></td>
					<td><input name="o_state"  class="easyui-validatebox" required="true"></td>
				</tr>
			   </table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>创建订单时间:&nbsp;&nbsp;</label></td>
					<td><input name="o_time"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>购买数量:&nbsp;&nbsp;</label></td>
					<td><input name="num"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>用户编号:&nbsp;&nbsp;</label></td>
					<td><input name="u_id"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>用户名:&nbsp;&nbsp;</label></td>
					<td><input name="u_name"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>地址:&nbsp;</label></td>
					<td><input name="address"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>手机号:&nbsp;&nbsp;</label></td>
					<td><input name="phone"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px"><label>图书id:&nbsp;&nbsp;</label></td>
					<td><input name="b_id"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>图书名:&nbsp;&nbsp;</label></td>				
					<td><input name="b_name"  class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>价格:&nbsp;&nbsp;</label></td>
					<td><input  name="price" class="easyui-validatebox" required="true"></td>
				</tr>
				</table>
			</div>
			<div class="fitem">
				<table>
				<tr>
					<td style="width:80px">
					<label>订单总金额:&nbsp;&nbsp;</label></td>				
					<td><input name="money"  class="easyui-validatebox" required="true"></td>
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
