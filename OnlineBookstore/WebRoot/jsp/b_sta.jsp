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
		url:"${pageContext.request.contextPath}/b_book/getAllBook.action",
		async:false,
		idField:'b_id',//标识字段
		columns:[[ //列  field 自动解析后台传输来的列名
		           //title 标题  sortable 是否支持排序
	            {field:'b_id',title:'编号',width:30,align:'center',sortable:true}, 
	            {field:'b_name',title:'书名',width:100,align:'center',sortable:true},
	            {field:'author',title:'作者',width:70,align:'center',sortable:true},	                    	                  
	            {field:'synopsis',title:'简介',width:70,align:'center',sortable:true},
	            {field:'price',title:'价格(元/本)',width:50,align:'center',sortable:true},	                  
	            {field:'press',title:'出版社',width:70,align:'center',sortable:true},
		        {field:'pre_time',title:'出版时间',width:70,align:'center',sortable:true},
		        {field:'b_type',title:'类型',width:50,align:'center',sortable:true},
		        {field:'img',title:'封面',width:90,align:'center',sortable:true},  	                 		              
	            {field:'packing',title:'包装',width:50,align:'center',sortable:true},
                {field:'openbook',title:'开本',width:50,align:'center',sortable:true},
                {field:'isbn',title:'国际标准书号',width:60,align:'center',sortable:true},
                {field:'paper',title:'纸张',width:50,align:'center',sortable:true},
                {field:'suit',title:'套装',width:50,align:'center',sortable:true},
                {field:'stock',title:'库存',width:70,align:'center',sortable:true},
             ]],
             toolbar: [
                   {//在dategrid表单的头部添加按钮
                        text: "添加",iconCls: "icon-add", handler: function () {
                      	  addBook();
                        }}, '-', 
                        {
                          text: "删除", iconCls: "icon-remove",  handler: function () {
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
		
		function addBook(){
			//打开新增对话框
			$("#dlg").dialog('open').dialog('setTitle','新增图书');
			//清空表单			
			$("#fm input[name]").val("");
			 $("#myvillage").empty();
			 var opt  = $("#fm select>option[select='selected']");
				opt.each(function(){
					$(this).attr("selected","selected");
				});
				$("#myvillage").append($("<option>请选择小区</opton>"));
			  //小区填充下拉框
			    var uri = "${pageContext.request.contextPath}/VillageServlet?method=AllVillage";
			    $.post(uri,null,function(response){
			    	//循环取Json数据  放入option中
			    	var citys=response;
			    	for(var i=0;i<citys.length;i++){
			    		var cityname = citys[i].v_name;
			    		var v_id = citys[i].v_id;
			    		var opt = document.createElement("option");
			    		opt.innerText = cityname;
			    		opt.value=v_id;
			    		$("#myvillage").append(opt);
			    	}			    	
			    },"json");
		}
		function saveBook(){
			debugger;
			//提交fm的表单
			
			$("#fm").form("submit",{//提交表单
				url:"${pageContext.request.contextPath}/b_book/addBook.action",
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
						console.log("helloworld");
						$("#dlg").dialog('close');//关闭
						//dg刷新
						$("#dg").datagrid('reload');
					}else{
						$.messager.show({'title':'error','msg':"操作失败"});
					}
				}
			});
		}

		
		
		
		//打开修改的对话框
		function updateBook(){
			//获取选中的行		
			var row = $("#dg").datagrid("getSelected");
			$("#fm1").form('clear');
			
			if(row){//有或者没有数据				
				//数据自动填充到表单中
				$("#dlg1").dialog('open').dialog('setTitle','修改图书信息');
			    var now = row.t_time;
			    if(now){
			    	var time = formate(now);
			    	row.t_time = time;
			    }
			    $("#fm1").form('load',row);//往表单中填充数据 [一行]	
			    $("#village").empty();
			  //小区填充下拉框
			    var uri = "${pageContext.request.contextPath}/VillageServlet?method=AllVillage";
			    $.post(uri,null,function(response){
			    	//循环取Json数据  放入option中
			    	debugger;
			    	var citys=response;
			    	for(var i=0;i<citys.length;i++){
			    		var cityname = citys[i].v_name;
			    		var v_id = citys[i].v_id;
			    		var opt = document.createElement("option");
			    		opt.innerText = cityname;
			    		opt.value=v_id;
			    		$("#village").append(opt);
			    	}			    	
			    },"json");			
			}else{
				//easyui的错误提示
				$.messager.show({'title':'error','msg':"请选择需要修改的数据"});
			}			
		}
		
		//修改表单数据提交 
		function saveUpdate(){
			//提交fm的表单
			$("#fm1").form("submit",{//提交表单
				url:"${pageContext.request.contextPath}/b_book/updateBook.action",
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
		function deleteBook(){
			//获取选中的行
			debugger;
			var row = $("#dg").datagrid("getSelected");
			if(row){
				//提示
				$.messager.confirm("Confirm","确认删除吗?",function(result){
					if(result){//删除
						//根据t_id删除
						//jquery ajax
						$.post("${pageContext.request.contextPath}/b_book/deleteBook.action?",{b_id:row.b_id},
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
			var name = $("#bname").val();
			var url = "${pageContext.request.contextPath}/b_book/dimName.action?name="+name;
				$("#dg").datagrid({
					//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
				url:url,
				idField:'b_id',//标识字段
				columns:[[ //列  field 自动解析后台传输来的列名
				           //title 标题  sortable 是否支持排序
			            {field:'b_id',title:'编号',width:30,align:'center',sortable:true}, 
			            {field:'b_name',title:'书名',width:100,align:'center',sortable:true},
			            {field:'author',title:'作者',width:70,align:'center',sortable:true},	                    	                  
			            {field:'synopsis',title:'简介',width:70,align:'center',sortable:true},
			            {field:'price',title:'价格(元/本)',width:50,align:'center',sortable:true},	                  
			            {field:'press',title:'出版社',width:70,align:'center',sortable:true},
				        {field:'pre_time',title:'出版时间',width:70,align:'center',sortable:true},
				        {field:'b_type',title:'类型',width:50,align:'center',sortable:true},
				        {field:'img',title:'封面',width:90,align:'center',sortable:true},  	                 		              
			            {field:'packing',title:'包装',width:50,align:'center',sortable:true},
		                {field:'openbook',title:'开本',width:50,align:'center',sortable:true},
		                {field:'isbn',title:'国际标准书号',width:60,align:'center',sortable:true},
		                {field:'paper',title:'纸张',width:50,align:'center',sortable:true},
		                {field:'suit',title:'套装',width:50,align:'center',sortable:true},
		                {field:'stock',title:'库存',width:70,align:'center',sortable:true},
		             ]],
		             toolbar: [
		                   {//在dategrid表单的头部添加按钮
		                        text: "添加",iconCls: "icon-add", handler: function () {
		                      	  addBook();
		                        }}, '-', 
		                        {
		                          text: "删除", iconCls: "icon-remove",  handler: function () {
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
			//清空表单的input 的name 的值
			$("#searchForm input[name]").val("");
			$("#dg").datagrid({
				//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
			url:"${pageContext.request.contextPath}/b_book/getAllBook.action",
			idField:'b_id',//标识字段
			columns:[[ //列  field 自动解析后台传输来的列名
			           //title 标题  sortable 是否支持排序
		            {field:'b_id',title:'编号',width:30,align:'center',sortable:true}, 
		            {field:'b_name',title:'书名',width:100,align:'center',sortable:true},
		            {field:'author',title:'作者',width:70,align:'center',sortable:true},	                    	                  
		            {field:'synopsis',title:'简介',width:70,align:'center',sortable:true},
		            {field:'price',title:'价格(元/本)',width:50,align:'center',sortable:true},	                  
		            {field:'press',title:'出版社',width:70,align:'center',sortable:true},
			        {field:'pre_time',title:'出版时间',width:70,align:'center',sortable:true},
			        {field:'b_type',title:'类型',width:50,align:'center',sortable:true},
			        {field:'img',title:'封面',width:90,align:'center',sortable:true},  	                 		              
		            {field:'packing',title:'包装',width:50,align:'center',sortable:true},
	                {field:'openbook',title:'开本',width:50,align:'center',sortable:true},
	                {field:'isbn',title:'国际标准书号',width:60,align:'center',sortable:true},
	                {field:'paper',title:'纸张',width:50,align:'center',sortable:true},
	                {field:'suit',title:'套装',width:50,align:'center',sortable:true},
	                {field:'stock',title:'库存',width:70,align:'center',sortable:true},
	             ]],
	             toolbar: [
	                   {//在dategrid表单的头部添加按钮
	                        text: "添加",iconCls: "icon-add", handler: function () {
	                      	  addBook();
	                        }}, '-', 
	                        {
	                          text: "删除", iconCls: "icon-remove",  handler: function () {
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
                      <td>查找图书：</td>
                      <td><input name="b_name" id="bname" placeholder="请输入图书名"/></td>
                      
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
					<td><input name="b_id" class="easyui-validatebox" required="true" readonly="readonly"></td>
				</tr>
			   </table>
			</div>
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
						<option ></option>
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
					<td><input  min="0" name="stock" class="easyui-validatebox" required="true"></td>
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
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUpdate()">确定</a>
			<!--  dialog('open/close') 打开或者关闭对话框 -->
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg1').dialog('close')">取消</a>
		</div>
			
  </body>
</html>
