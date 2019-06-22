<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Login</title>
<meta charset="utf-8"/>
<link href="${pageContext.request.contextPath}/jsp/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/jsp/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href='https://fonts.googleapis.com/css?family=Oxygen:300,400,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/js/jquery.easydropdown.js"></script>
<style>
input[type="password"]{
		border: 1px solid #EEEEEE;
		width: 96%;
		font-size:1em ;
		padding: 0.5em;
	}

</style>
	
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
				   <li class="bag_right"> 0 Items | $ 0</li>
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
          <span class="red" style="font-size: 20px"> &nbsp;登录注册&nbsp;</span>
     </li>
 </div>
</ul>
    <div class="contact">
      	<div class="container">
      	   <div class="account_grid">
			   <div class="col-md-6 login-left">
			  	 <h3>注册新用户</h3>
				 <p></p>
				 <a class="acount-btn" href="${pageContext.request.contextPath}/jsp/register.jsp">立即注册</a>
			   </div>
			   <div class="col-md-6 login-right">
			  	<h3>密码登录</h3>
				<p></p>
				<form action="${pageContext.request.contextPath}/login/login.action" method="post">
				  <div>
					<span>账号<label>*</label></span>
					<input type="text" name="phone"> 
				  </div>
				  <div>
					<span>密码<label>*</label></span>
					<input type="password" name="pwd"> 
				  </div>
				  <a class="forgot" src="${pageContext.request.contextPath}/jsp/#">忘记密码?</a>
				  <input type="submit" value="登录">
			    </form>
			   </div>	
			   <div class="clearfix"> </div>
			 </div>
      	 </div>
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
       				<li><a src="${pageContext.request.contextPath}/jsp/contact.jsp">Contact</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">FAQ</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Terms of payment</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Terms of sale</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Terms and conditions</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Returns and Refunds</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Information</h3>
       			<ul class="footer_list">
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Affiliate</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Cookies</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">How to Shop</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">About Nelly</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Investor relations</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Campaigns</h3>
       			<ul class="footer_list">
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Evening Dresses</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Makeup</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Fashion forward</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Training clothes</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Special Occasion Dresses</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Stores</h3>
       			<ul class="footer_list">
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Paris</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">New York</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">London</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Madrid</a></li>
       				<li><a src="${pageContext.request.contextPath}/jsp/#">Tokio</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Social</h3>
       			<ul class="footer_social">
				  <li><a src="${pageContext.request.contextPath}/jsp/#"> <i class="tw1"> </i> </a></li>
				  <li><a src="${pageContext.request.contextPath}/jsp/#"> <i class="db1"> </i> </a></li>
				  <li><a src="${pageContext.request.contextPath}/jsp/#"> <i class="fb1"> </i></a></li>
				  <li><a src="${pageContext.request.contextPath}/jsp/#"> <i class="g1"> </i></a></li>
				  <li><a src="${pageContext.request.contextPath}/jsp/#"> <i class="thumb"> </i></a></li>
				  <li><a src="${pageContext.request.contextPath}/jsp/#"> <i class="vimeo"> </i></a></li>
				</ul>
       		</div>
       		<div class="col-sm-2">
       			<img src="${pageContext.request.contextPath}/jsp/images/secure.png" alt=""/>
       		</div>
       	</div>
       </div>
       <div class="footer_bottom">
       	<div class="container">
       		<div class="cssmenu">
				<ul>
					<li class="active"><a src="${pageContext.request.contextPath}/jsp/login.jsp">Privacy & Cookies</a></li> |
					<li><a src="${pageContext.request.contextPath}/jsp/checkout.jsp">Terms & Conditions</a></li> |
					<li><a src="${pageContext.request.contextPath}/jsp/checkout.jsp">Accessibility</a></li> |
					<li><a src="${pageContext.request.contextPath}/jsp/login.jsp">Store Directory</a></li> |
					<li><a src="${pageContext.request.contextPath}/jsp/register.jsp">About Us</a></li>
				</ul>
			</div>
			
		    <div class="clearfix"> </div>
       	</div>
       </div>

</body>
</html>	
