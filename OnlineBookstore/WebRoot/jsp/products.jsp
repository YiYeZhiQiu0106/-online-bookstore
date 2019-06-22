<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书详情</title>
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
   
</script>
<script type="text/javascript">
			   function addCat(b_id){
				   var u_id = ${user.id};
				   var num =$("#num1").val();
				   var url = "${pageContext.request.contextPath}/shopCat/addCat.action?u_id="+u_id+"&b_id="+b_id+"&num="+num+"";
				   alert("加入到购物车成功！");
				   window.location.href=url;
			   }
			   
			   function addEva(b_id){
				   var eva = $("#evatext").val();
				   $.ajax({
					   url:"${pageContext.request.contextPath}/book/addEva.action",
					   data:{"b_id":b_id,"evaluate":eva},
					   type:"POST",
					   dataType:"json",
					   success:function(data){
						   alert(data.eva);
					   }
				   })
			   }
			   
			   function addColl(b_id){
				   var u_id = ${user.id};
				   $.ajax({
					   url:"${pageContext.request.contextPath}/book/addCollection.action",
					   data:{"b_id":b_id,"u_id":u_id},
					   type:"POST",
					   dataType:"json",
					   success:function(data){
						   alert(data.coll);
					   }
				   })
			   }
			   
	
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
	        
	        function login(){
	     	   alert("请先登录！");
	     	   window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
	     	}
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
         <span class="red" style="font-size: 25px">&nbsp;图书详情&nbsp;</span>
     </li>
  </div>
</ul>
<div class="product_banner">
 <div class="container">
    <div class="wmuSlider example1">
				   	 <div class="banner-wrap">
				   	       <div class="banner_left">
				   	       	  <img src="${pageContext.request.contextPath}/jsp/img/${oneBook.img}" class="img-responsive" alt=""/>
				   	       </div>
				   		 	<div class="banner_right">
				   		 		<h1>${oneBook.b_name}  ${oneBook.author}</h1>
				   		 		<p class="p1">$ ${oneBook.price} </p><br/>
				   		 		<p class="p2">简介：${oneBook.synopsis }</p>
				   		 		<input type="number" value="1" style="width:70px" id="num1" class="form-control" min="1" max="${oneBook.stock }"  onkeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))" onchange="changeNum(this.value)"/>
				   		 		<h5 style="margin-left: 110px;margin-top: -25px">库存:${oneBook.stock }</h5><hr/>
				   		 		<c:if test="${user!=null}">
				   		 		<a href="#" class="btn1 btn2 btn-primary1" onclick="addCat(${oneBook.b_id})"><span>加入购物车</span><img src="images/plus.png" alt=""/></a>
				   		 		<a href="#" class="btn1 btn2 btn-primary1" onclick="addColl(${oneBook.b_id})"><span>加入收藏</span><img src="images/plus.png" alt=""/></a>
				   		 	    </c:if>
				   		 	    <c:if test="${user==null}">
				   		 		<a href="#" onclick="login()" class="btn1 btn2 btn-primary1" "><span>加入购物车</span><img src="images/plus.png" alt=""/></a>
				   		 		<a href="#" onclick="login()" class="btn1 btn2 btn-primary1" "><span>加入收藏</span><img src="images/plus.png" alt=""/></a>
				   		 	    </c:if>
				   		 	</div>
				   		 	<div class='clearfix'></div>
				   	  </div>
            </div>
       </div>
   </div>
     	<div class="container">
     		<table class="table">
              <tr><td><label>出版社：</label>&nbsp;&nbsp;&nbsp;&nbsp;${oneBook.press}</td><td><label>是否套装：</label>&nbsp;&nbsp;&nbsp;&nbsp;${oneBook.suit}</td><td><label>分类：&nbsp;&nbsp;&nbsp;&nbsp;</label>${oneBook.b_type}</td><td><label>包装：</label>&nbsp;&nbsp;&nbsp;&nbsp;${oneBook.packing}</td></tr> 
              <tr><td><label>出版时间：</label>&nbsp;&nbsp;&nbsp;&nbsp;${oneBook.pre_time}</td><td><label>国际标准书号：</label>&nbsp;&nbsp;&nbsp;&nbsp;${oneBook.isbn}</td><td><label>纸张：</label>&nbsp;&nbsp;&nbsp;&nbsp;${oneBook.paper}</td><td><label>开本：</label>&nbsp;&nbsp;&nbsp;&nbsp;${oneBook.openbook}</td></tr>    		
     		</table>
     		
     	<div class="form-group">
   			 <label for="name" ><h2 style="color: #FF8C00">评论区(${evaCount})</h2></label>
    		<textarea id="evatext" class="form-control" rows="3" style="width:700px;p" ></textarea>
   		<c:if test="${user!=null}">
  			<a href="#" class="btn btn-info" onclick="addEva(${oneBook.b_id})" style="margin-left: 615px"><span>发表评论</span></a>
  		</c:if>
  		<c:if test="${user==null}">
  		<a href="#" class="btn btn-info" onclick="login()" style="margin-left: 615px"><span>发表评论</span></a>
  		</c:if>
  		</div>
  	
  		<div id="pinglun">
  		<c:forEach items="${elist}" var="eva">
  		<table class="table">
              <tr><td>${eva.e_time}  &nbsp;&nbsp;&nbsp;&nbsp;用户：${eva.name}   评论：</td></tr> 
                 		<tr><td>${eva.evaluate }</td></tr>
     	</table>
     	</c:forEach>
     	</div>
 </div>
      <hr/>
  
      <div class="grid-2">
       	<div class="container">
       		<p>We accept<img src="images/paypal.png" class="img-responsive" alt="" align="middle" /></p>
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
			<div class="copy">
			    <p>Copyright &copy; 2014.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
		    </div>
		    <div class="clearfix"> </div>
       	</div>
       </div>

</body>
</html>		
