<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Contact</title>
<meta charset="utf-8"/>
<link href="${pageContext.request.contextPath}/jsp/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/jsp/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href='https://fonts.googleapis.com/css?family=Oxygen:300,400,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/js/jquery.easydropdown.js"></script>
<script src="${pageContext.request.contextPath}/jsp/js/responsiveslides.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/js/easyResponsiveTabs.js"></script>

<script>
   function upUser(){
	   var ins01= tname();
		 var ins02= tpwd();
		 var ins03= taddress();
		 var result = ins01+ins02+ins03;
		 
		/* if($("#pwd").val() ==""){
			 $("#pwd_sp").text("");
			 $("#pwd_sp").css("color","red");
		 }*/
			if(result > 0){
				return false;
			}else{
	   
	   $.ajax({
		   url:"${pageContext.request.contextPath}/user/upUser.action",
		   dataType:"json",
		   type:"post",
		   data:$("#userfm").serialize(),
		   success:function(t){
			   alert(t.user);
			   if(t.user=="修改成功"){
				   window.location.href="${pageContext.request.contextPath}/jsp/userCenter.jsp";
			   }
		   }
	   })
	   
	   
   }
   }
   </script>
<script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
</script>	
</head>
<body>
<div class="header">
   <div class="header_top" style="height: 30px">
    <div class="container">
	  <div class="header_top_left" >
	  	<c:if test="${user==null}">
	  		<a style="color:#00FFFF" href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a><font color="#00FFFF">|</font><a style="color:#00FFFF" href="${pageContext.request.contextPath}/jsp/register.jsp">注册</a>
	  	</c:if>
	  	<c:if test="${user!=null}">
	  		<font color="#00FFFF">${user.name }</font>
	  	</c:if>
	  </div>
	  <div class="header_top_right">
	  	<div class="lang_list">
			
   		</div>
   		<ul class="header_user_info">
		  <a class="login" href="${pageContext.request.contextPath}/jsp/login.jsp">
			<i class="user"></i> 
			<li class="user_desc">
			<c:if test="${user==null}">
	  		<a  href="${pageContext.request.contextPath}/jsp/login.jsp">个人中心</a>
	  	</c:if>
	  	<c:if test="${user!=null}">
	  		<a href="${pageContext.request.contextPath}/jsp/userCenter.jsp">个人中心</a>
	  	</c:if>
			</li>
		  </a>
		  <div class="clearfix"> </div>
	    </ul>
	    <div class="main-search">
	        <form action="${pageContext.request.contextPath}/book/dimName.action">
	           <input type="text" value="Search"  class="text"  name="b_name"/>
	            <input type="submit" value=""/>
	        </form>
	        <div class="close"><img src="${pageContext.request.contextPath}/jsp/images/close.png" /></div>
	     </div>
	     <div class="srch"><button></button></div>
	    <div class="clearfix"> </div>
		<script type="text/javascript">
	         $('.main-search').hide();
	        $('button').click(function(){
	            $('.main-search').show();
	            $('.main-search text').focus();
	        }
	        );
	        $('.close').click(function(){
	            $('.main-search').hide();
	        });
	    </script>
        </div>
	  <div class="clearfix"> </div>
	</div>
  </div>
  <div class="header_bottom">
	<div class="container">	 			
		<div class="logo">
		  <a href="${pageContext.request.contextPath}/jsp/index.jsp"><img src="${pageContext.request.contextPath}/jsp/images/logo.png" alt=""/></a>
		</div>	
		<div class="header_bottom_right">			
	        <div class="h_menu4"><!-- start h_menu4 -->
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<li class="active"><a href="${pageContext.request.contextPath}/jsp/index.jsp">首页</a></li>
					<li><a href="${pageContext.request.contextPath}/book/findType.action?type=小说">小说</a></li>
					<li><a href="">教育</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/book/findType.action?type=教材">教材</a></li>
							<li><a href="${pageContext.request.contextPath}/book/findType.action?type=考试">考试</a></li>
							<li><a href="${pageContext.request.contextPath}/book/findType.action?type=工具书">工具书</a></li>
							<li><a href="${pageContext.request.contextPath}/book/findType.action?type=中小学教辅">中小学教辅</a></li>
						</ul>
					</li>
					<li><a href="">人文社科</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/book/findType.action?type=历史">历史</a></li>
							<li><a href="${pageContext.request.contextPath}/book/findType.action?type=文学">文学</a></li>
							<li><a href="${pageContext.request.contextPath}/book/findType.action?type=文化">文化</a></li>
							<li><a href="${pageContext.request.contextPath}/book/findType.action?type=哲学">哲学</a></li>
							<li><a href="${pageContext.request.contextPath}/book/findType.action?type=传记">传记</a></li>
						</ul>
					</li>
					<li><a href="#">我的书香</a>
						<ul>
						<c:if test="${user!=null }">
							<li><a href="${pageContext.request.contextPath}/shopCat/getOrders.action?u_id=${user.id}">我的订单</a></li>
							<li><a href="${pageContext.request.contextPath}/book/userCollection.action?u_id=${user.id}">我的收藏</a></li>
							<li><a href="${pageContext.request.contextPath}/book/getUserEva.action?u_id=${user.id}">我的评论</a></li>
						</c:if>
						<c:if test="${user==null }">
							<li><a href="${pageContext.request.contextPath}/jsp/login.jsp">我的订单</a></li>
							<li><a href="${pageContext.request.contextPath}/jsp/login.jsp">我的收藏</a></li>
							<li><a href="${pageContext.request.contextPath}/jsp/login.jsp">我的评论</a></li>
						
						</c:if>
						</ul>
					</li>
				</ul>
				<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/nav.js"></script>
	      </div><!-- end h_menu4 -->
		  <div class="shopping_cart">
		 	<ul class="shopping_cart_top">
			    <a href="#">
				   <li class="shop_left">
				   <c:if test="${user!=null}">
				   <a style="color:#999;" href="${pageContext.request.contextPath}/shopCat/getShopCat.action?u_id=${user.id}">购物车</a>
				   </c:if>
				   <c:if test="${user==null}">
				   <a style="color:#999;" href="${pageContext.request.contextPath}/jsp/login.jsp">购物车</a>
				   </c:if>
				   </li>
				   <li class="shop_right"><img src="${pageContext.request.contextPath}/jsp/images/arrow1.png" alt=""/></li>
				    <div class="clearfix"></div>	
				</a>
			</ul>
			<ul class="shopping_bag">
			    <a href="#">
				   <li class="bag_left"><img src="${pageContext.request.contextPath}/jsp/images/bag.png" alt=""/></li>
				   <li class="bag_right"><label style="color: red"> ${count}件</label>  |  <label style="color: red">$ ${sum }</label></li>
				    <div class="clearfix"></div>	
				</a>
			</ul>		
		  </div>
	      <div class="clearfix"></div>		   
      </div>
    </div>
  </div>
</div>
<ul class="breadcrumbs">
 <div class="container">
     <li class="home">
        <a href="index.jsp" title="Go to Home Page"><img src="images/home.png" alt=""/></a>&nbsp;&nbsp;
        <span>&gt;</span>&nbsp;
     </li>
     
     <li class="home">
         <span class="red"> &nbsp;个人中心&nbsp;</span>
     </li>
 </div>
</ul>
      <div class="contact">
      <form id="userfm">
      	<table align="center" >
      	<tr><td>编号：</td><td><input type="text" class="form-control"  value="${user.id}" readonly="readonly" name="id" id="id"></td><td width="200px"></td></tr>
      	<tr><td>姓名：</td><td><input type="text" class="form-control" placeholder="请输入姓名" value="${user.name}" name="name" onblur="tname()" id="name"></td><td><span id="p1"></span></td></tr>
      	<tr><td>手机号：</td><td><input type="text" class="form-control" placeholder="请输入手机号" readonly="readonly" value="${user.phone}" name="phone" id="phone"></td><td></td></tr>
      	<tr><td>收货地址：</td><td><input type="text" class="form-control" placeholder="请输入收货地址" value="${user.address}" name="address" onblur="taddress()" id="address"></td><td><span id="p2"></span></td></tr>
      	<tr><td>密码：</td><td><input type="password" class="form-control" placeholder="请输入密码"  name="pwd" onblur="tpwd()" id="pwd"></td><td><span id="p3"></span></td></tr>
      	<tr><td>注册时间：</td><td><input type="text" class="form-control" readonly="readonly" value="${user.time}" name="time" id="time"></td><td></td></tr>
      	<tr><td>已消费：</td><td><input type="text" class="form-control" readonly="readonly" value="${user.balance}" name="balance" id="balance"></td><td></td>
      	</tr>
      	</table>
      	</form>
      	<button class="btn btn-info btn-getcode"  style="margin-left: 615px;width: 164px" onclick="upUser()">修改个人资料</button>
      </div>
      
      
      <div class="grid-2">
       	<div class="container">
       		<p>We accept<img src="${pageContext.request.contextPath}/jsp/images/paypal.png" class="img-responsive" alt="" align="middle" /></p>
       	</div>
       </div>
       <div class="footer_top">
       	<div class="container">
       		<div class="col-sm-2 grid-3">
       			<h3>Customer Service</h3>
       			<ul class="footer_list">
       				<li><a href="contact.jsp">Contact</a></li>
       				<li><a href="#">FAQ</a></li>
       				<li><a href="#">Terms of payment</a></li>
       				<li><a href="#">Terms of sale</a></li>
       				<li><a href="#">Terms and conditions</a></li>
       				<li><a href="#">Returns and Refunds</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Information</h3>
       			<ul class="footer_list">
       				<li><a href="#">Affiliate</a></li>
       				<li><a href="#">Cookies</a></li>
       				<li><a href="#">How to Shop</a></li>
       				<li><a href="#">About Nelly</a></li>
       				<li><a href="#">Investor relations</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Campaigns</h3>
       			<ul class="footer_list">
       				<li><a href="#">Evening Dresses</a></li>
       				<li><a href="#">Makeup</a></li>
       				<li><a href="#">Fashion forward</a></li>
       				<li><a href="#">Training clothes</a></li>
       				<li><a href="#">Special Occasion Dresses</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Stores</h3>
       			<ul class="footer_list">
       				<li><a href="#">Paris</a></li>
       				<li><a href="#">New York</a></li>
       				<li><a href="#">London</a></li>
       				<li><a href="#">Madrid</a></li>
       				<li><a href="#">Tokio</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Social</h3>
       			<ul class="footer_social">
				  <li><a href="#"> <i class="tw1"> </i> </a></li>
				  <li><a href="#"> <i class="db1"> </i> </a></li>
				  <li><a href="#"> <i class="fb1"> </i></a></li>
				  <li><a href="#"> <i class="g1"> </i></a></li>
				  <li><a href="#"> <i class="thumb"> </i></a></li>
				  <li><a href="#"> <i class="vimeo"> </i></a></li>
				</ul>
       		</div>
       		<div class="col-sm-2">
       			<img src="images/secure.png" alt=""/>
       		</div>
       	</div>
       </div>
       <div class="footer_bottom">
       	<div class="container">
       		<div class="cssmenu">
				<ul>
					<li class="active"><a href="login.jsp">Privacy & Cookies</a></li> |
					<li><a href="checkout.jsp">Terms & Conditions</a></li> |
					<li><a href="checkout.jsp">Accessibility</a></li> |
					<li><a href="login.jsp">Store Directory</a></li> |
					<li><a href="register.jsp">About Us</a></li>
				</ul>
			</div>
			
		    <div class="clearfix"> </div>
       	</div>
       </div>
  <script type="text/javascript">
   function tname(){
	   debugger;
	   var name =$("input[name=name]").val();
	   var sp = $("#p1");
	   var role =   /^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,10}$/;//验证姓名正则 
	   if(name == "" || name==null){
			sp.html("<b>*姓名不能为空！</b>")  ;
			sp.css("color","red");
			return 1;
		}else{
			if(role.test(name)){
				sp.html("<b>✔</b> ");
				sp.css("color","lawngreen");
				return 0;
			}else{
				sp.html("<b>*姓名不合法！</b>")  ;
				sp.css("color","red");
				return 1;
			}
		}
   }
   
   function tpwd(){
	   var pwd = $("input[name=pwd]").val();
		var sp = $("#p3");
		var role =   /^[\dA-Za-z_]{6,}$/;//验证密码正则 
		if(pwd == "" || pwd ==null){
			sp.html("<b>*密码不能为空！</b>")  ;
			sp.css("color","red");
			return 1;
		}else{
			if(role.test(pwd)){
				sp.html("<b>✔</b> ");
				sp.css("color","lawngreen");
				return 0;
			}else{
				sp.html("<b>*密码不合法！</b>")  ;
				sp.css("color","red");
				return 1;
			}
		}
   }
   
   function taddress(){
	   var ad = $("input[name=address]").val();
	   var sp = $("#p2");
	   if(ad==null || ad==""){
		   sp.html("<b>*地址不能为空！</b>")  ;
			sp.css("color","red");
			return 1;
	   }else{
		   sp.html("<b>✔</b> ");
			sp.css("color","lawngreen");
			return 0;
	   }
	   
   }
   </script>
</body>
</html>		
