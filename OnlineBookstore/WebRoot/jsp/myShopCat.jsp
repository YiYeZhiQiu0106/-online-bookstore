<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>我的购物车</title>
<meta charset="utf-8"/>
<link href="${pageContext.request.contextPath}/jsp/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/jsp/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/jsp/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href='https://fonts.googleapis.com/css?family=Oxygen:300,400,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jquery-1.11.1.min.js"></script>

<script src="${pageContext.request.contextPath}/jsp/js/jquery.easydropdown.js"></script>
<script src="${pageContext.request.contextPath}/jsp/js/responsiveslides.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/js/easyResponsiveTabs.js"></script>
<style>

</style>
<script type="text/javascript">
   function changeNum(num,b_id){
	   debugger;
	   var bid = b_id;
	   var num1=num;
	   var id = ${user.id};
	   var url = "${pageContext.request.contextPath}/shopCat/upNum.action?u_id="+id+"&b_id="+bid+"&num="+num1+"";
	   window.location.href=url;
   }
   function changeStatis(b_id,statis){
	   if(statis==1){
		   statis=0;
	   }else{
		   statis=1;
	   }
	   var id = ${user.id};
	   var url ="${pageContext.request.contextPath}/shopCat/upStatis.action?u_id="+id+"&b_id="+b_id+"&statis="+statis+"";
	   alert(url);
	   window.location.href=url;
}

</script>
<script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
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
         <span class="red" style="font-size: 20px"> &nbsp;我的购物车&nbsp;</span>
     </li>
 </div>
</ul>
<div>
<c:if test="${count!=0}">
      <table  align="left" class="table" id="shopcat" >
      <c:forEach items="${catlist}" var="shop" varStatus="st" >
       <tr>
          <td width="650px"><a href="${pageContext.request.contextPath}/book/getOneBook.action?b_id=${shop.b_id}"><div><img src="${pageContext.request.contextPath}/jsp/img/${shop.img}" width="286px" height="300px"><div style="float:right;"><h3>《${shop.b_name }》  ${shop.author }</h3><h4>价格：${shop.price} |  ${shop.packing }</h4><h4>${shop.press}   出版时间：${shop.pre_time}</h4>${shop.paper}<hr/></div></div></a></td>
          <td align="center">
          <c:if test="${shop.statis==1}"><input type="checkbox" checked="checked" style="width:25px;height:25px" onclick="changeStatis(${shop.b_id},${shop.statis})"></c:if>
          <c:if test="${shop.statis!=1 }"><input type="checkbox"  style="width:25px;height:25px" onclick="changeStatis(${shop.b_id},${shop.statis})"></c:if>
          <div align="right" ><a href="${pageContext.request.contextPath}/shopCat/delShop.action?u_id=${user.id}&b_id=${shop.b_id}" class="btn btn-info">X</a></div><hr/>
          购买数量：<input type="number" value="${shop.num}" style="width:70px"  class="form-control" min="1" onkeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))" onchange="changeNum(this.value,${shop.b_id})"/>
          <hr/>
         <h3 >小计：${shop.reporter}</h3></td>
         </tr>
        </c:forEach> 
         
          <tr>
          <td></td><td></td>
            <td  align="center"><h3>总价:${sum}</h3></td>
          </tr>
           <tr>
           <td></td><td></td>
            <td  align="center"><a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-info" style="width: 150px">结算</a></td>
          </tr>
       </table>
  </c:if>  
  <c:if test="${count==0 }">
   <table height="300px">
    <tr>
     <h3 align="center"> 您还没有选购图书，快去<a style="color: red" href="${pageContext.request.contextPath}/jsp/index.jsp">选购图书</a>吧！ </h3>
 	</tr>
   </table>
  </c:if>     
   
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

</body>
</html>		
