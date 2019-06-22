<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>销量统计表</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	 <script src="${pageContext.request.contextPath}/jsp/javascript/jquery.min.js"></script>
     <script src="${pageContext.request.contextPath}/jsp/javascript/highcharts.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/extend.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js1/echarts.min.js"></script>
  </head>
 
<body>


<div data-options="region:'center',split:false">
        <table id="dg">
        </table>
	</div>
	 <div id="main" style="width: 600px;height:400px;"></div>
	
 <script type="text/javascript">
    var names;
    var nums;
  
	//通过js操作
	$(function(){
		//页面加载数据
		$("#dg").datagrid({
			//响应数据 格式 是json  {total:14,rows:[{EMP},{EMP}]}
		url:"${pageContext.request.contextPath}/sta/getAllStatistics.action",
		async:false,
		idField:'st_id',//标识字段
		columns:[[ //列  field 自动解析后台传输来的列名
		           //title 标题  sortable 是否支持排序
	            {field:'st_id',title:'编号',width:30,align:'center',sortable:true}, 
	            {field:'b_id',title:'图书id',width:100,align:'center',sortable:true},
	            {field:'b_name',title:'图书名',width:70,align:'center',sortable:true},	                    	                  
	            {field:'b_type',title:'类型',width:70,align:'center',sortable:true},
	            {field:'eva_num',title:'评论数',width:50,align:'center',sortable:true},	                  
	            {field:'coll_num',title:'收藏数',width:70,align:'center',sortable:true},
		        {field:'order_num',title:'销量',width:70,align:'center',sortable:true},
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
		
		$.ajax({
			url:"${pageContext.request.contextPath}/sta/getAllStatistics1.action",
			type:"post",
			dataType:'json',
			success:function(t){
				
				console.log(t.data);
				names = t.data
				console.log(names);
				//names = Array.from(t);
				//console.log(typeof(names));
				//console.log(names);
			}
		})
		$.ajax({
			url:"${pageContext.request.contextPath}/sta/getAllStatistics2.action",
			type:"post",
			dataType:'json',
			success:function(t){
				
				console.log(t);
				nums = t;
				console.log(nums);
				//names = Array.from(t);
				//console.log(typeof(names));
				//console.log(names);
			}
		})
		
		
		
	});
	//var b_names = names;
	num  = [5, 20, 36, 10, 10, 20, 5, 20, 36, 10, 10, 20];
	console.log(num);
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));

// 指定图表的配置项和数据
var option = {
    title: {
        text: 'ECharts 入门示例'
    },
    tooltip: {},
    legend: {
        data:['销量']
    },
    xAxis: {
        data: names
    },
    yAxis: {},
    series: [{
        name: '销量',
        type: 'bar',
        data: num
    }]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);

	</script>
</body>
</html>
