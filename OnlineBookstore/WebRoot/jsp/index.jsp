<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>书香网上书店</title>
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
<script type="text/javascript">
   $(function(){
	   $.ajax({
   		url:"${pageContext.request.contextPath}/sta/getOrderDesc.action",
   		dataType:"json",
   		type:"post",
   		success:function(t){
   			for(var i=0;i<4;i++){
   				var opt1 = $('<li style="width: 250px;"><div class="view view-first" style="width:260px"> <a href="${pageContext.request.contextPath}/book/getOneBook.action?b_id='+t[i].b_id+'">  <img src="${pageContext.request.contextPath}/jsp/img/'+t[i].img+'" class="img-responsive" alt="" style="height: 200px;margin-left: 40px;"/>'+
       					'<div class="tab_desc"><h3>《'+t[i].b_name+'》</h3></a> <p>$'+t[i].price+'</p>'+
       					'<c:if test="${user!=null}"><a href="#" onclick="addCat('+t[i].b_id+',${user.id})" class="btn1 btn-primary1"><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if><c:if test="${user==null}"><a href="#" onclick="login()" class="btn1 btn-primary1"><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if></div></div></li>');
       				$("#rexiao").append(opt1);
   			}
   			
			   }
   	})
   	
   	$.ajax({
    		url:"${pageContext.request.contextPath}/sta/getTypeDesc.action?type=文学",
    		dataType:"json",
    		type:"post",
    		success:function(t){
    			for(var i=0;i<6;i++){
    				var opt1 = $('<li style="width: 220px;"><div class="view view-first" style="margin-top: 40px;"> <a href="${pageContext.request.contextPath}/book/getOneBook.action?b_id='+t[i].b_id+'">  <img src="${pageContext.request.contextPath}/jsp/img/'+t[i].img+'" class="img-responsive" alt=""/>  '+
    						'<div class="mask"><div class="info"> </div></div><div class="tab_desc"><h3>'+t[i].b_name+'</h3></a><p>$'+t[i].price+'</p>'+
    						'<c:if test="${user!=null}"><a href="#" onclick="addCat('+t[i].b_id+',${user.id})" class="btn1 btn-primary1"><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if><c:if test="${user==null}"><a href="#" onclick="login()" class="btn1 btn-primary1" "><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if>'+
    						'</div></div></li>');
        				$("#top1").append(opt1);
    			}
    			
			   }
    		
    	})
    	
    	$.ajax({
    		url:"${pageContext.request.contextPath}/sta/getTypeDesc.action?type=历史",
    		dataType:"json",
    		type:"post",
    		success:function(t){
    			for(var i=0;i<6;i++){
    				var opt1 = $('<li style="width: 220px;"><div class="view view-first" style="margin-top: 40px;"> <a href="${pageContext.request.contextPath}/book/getOneBook.action?b_id='+t[i].b_id+'">  <img src="${pageContext.request.contextPath}/jsp/img/'+t[i].img+'" class="img-responsive" alt=""/>  '+
    						'<div class="mask"><div class="info"> </div></div><div class="tab_desc"><h3>'+t[i].b_name+'</h3></a><p>$'+t[i].price+'</p>'+
    						'<c:if test="${user!=null}"><a href="#" onclick="addCat('+t[i].b_id+',${user.id})" class="btn1 btn-primary1"><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if><c:if test="${user==null}"><a href="#" onclick="login()" class="btn1 btn-primary1" "><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if>'+
    						'</div></div></li>');
        				$("#top2").append(opt1);
    			}
    			
			   }
    		
    	})
    	
    	$.ajax({
    		url:"${pageContext.request.contextPath}/sta/getTypeDesc.action?type=考试",
    		dataType:"json",
    		type:"post",
    		success:function(t){
    			for(var i=0;i<6;i++){
    				var opt1 = $('<li style="width: 220px;"><div class="view view-first" style="margin-top: 40px;"> <a href="${pageContext.request.contextPath}/book/getOneBook.action?b_id='+t[i].b_id+'">  <img src="${pageContext.request.contextPath}/jsp/img/'+t[i].img+'" class="img-responsive" alt=""/>  '+
    						'<div class="mask"><div class="info"> </div></div><div class="tab_desc"><h3>'+t[i].b_name+'</h3></a><p>$'+t[i].price+'</p>'+
    						'<c:if test="${user!=null}"><a href="#" onclick="addCat('+t[i].b_id+',${user.id})" class="btn1 btn-primary1"><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if><c:if test="${user==null}"><a href="#" onclick="login()" class="btn1 btn-primary1" "><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if>'+
    						'</div></div></li>');
        				$("#top3").append(opt1);
    			}
    			
			   }
    		
    	})
    	
    	$.ajax({
    		url:"${pageContext.request.contextPath}/sta/getTypeDesc.action?type=哲学",
    		dataType:"json",
    		type:"post",
    		success:function(t){
    			for(var i=0;i<6;i++){
    				var opt1 = $('<li style="width: 220px;"><div class="view view-first" style="margin-top: 40px;"> <a href="${pageContext.request.contextPath}/book/getOneBook.action?b_id='+t[i].b_id+'">  <img src="${pageContext.request.contextPath}/jsp/img/'+t[i].img+'" class="img-responsive" alt=""/>  '+
    						'<div class="mask"><div class="info"> </div></div><div class="tab_desc"><h3>'+t[i].b_name+'</h3></a><p>$'+t[i].price+'</p>'+
    						'<c:if test="${user!=null}"><a href="#" onclick="addCat('+t[i].b_id+',${user.id})" class="btn1 btn-primary1"><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if><c:if test="${user==null}"><a href="#" onclick="login()" class="btn1 btn-primary1" "><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if>'+
    						'</div></div></li>');
        				$("#top4").append(opt1);
    			}
    			
			   }
    		
    	})
    	
    	$.ajax({
    		url:"${pageContext.request.contextPath}/sta/getTimeDesc.action",
    		dataType:"json",
    		type:"post",
    		success:function(t){
    			for(var i=0;i<4;i++){
    				var opt1 = $('<li style="width: 250px;"><div class="view view-first" style="margin-top: 40px;"> <a href="${pageContext.request.contextPath}/book/getOneBook.action?b_id='+t[i].b_id+'">  <img src="${pageContext.request.contextPath}/jsp/img/'+t[i].img+'" class="img-responsive" alt=""/>  '+
    						'<div class="mask"><div class="info"> </div></div><div class="tab_desc"><h3>'+t[i].b_name+'</h3></a><p>$'+t[i].price+'</p>'+
    						'<c:if test="${user!=null}"><a href="#" onclick="addCat('+t[i].b_id+',${user.id})" class="btn1 btn-primary1"><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if><c:if test="${user==null}"><a href="#" onclick="login()" class="btn1 btn-primary1" "><span>加入购物车</span><img src="${pageContext.request.contextPath}/jsp/images/plus.png" alt=""/></a></c:if>'+
    						'</div></div></li>');
        				$("#xinshu").append(opt1);
    			}
    			
			   }
    		
    	})
   	
   })
    
    function addCat(b_id,u_id){
				   var num =1;
				   var url = "${pageContext.request.contextPath}/shopCat/addCat.action?u_id="+u_id+"&b_id="+b_id+"&num="+num+"";
				   alert("加入到购物车成功！");
				   window.location.href=url;
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
			    
			    function login(){
			    	alert("请先登录");
			    	window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
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
<div class="slider">
	  <div class="callbacks_container">
	      <ul class="rslides" id="slider">
	        <li><a href="${pageContext.request.contextPath}/book/getOneBook.action?b_id=50"><img src="${pageContext.request.contextPath}/jsp/img/i1.jpg" class="img-responsive" alt=""/></a></li>
	        <li><a href="${pageContext.request.contextPath}/book/getOneBook.action?b_id=52"><img src="${pageContext.request.contextPath}/jsp/img/i2.gif" class="img-responsive" alt=""/></a></li>
	        <li><a href="${pageContext.request.contextPath}/book/getOneBook.action?b_id=51"><img src="${pageContext.request.contextPath}/jsp/img/i3.jpg" class="img-responsive" alt=""/></a></li>
	      </ul>
	  </div>
</div>
<div class="column_center">
  <div class="container">
	<div class="search">
	  <div class="stay" style="margin-left: 510px;margin-top: -6.5px"><span class="red" style="font-size: 25px;">&nbsp;全网推荐&nbsp;</span></div>
	 
	  <div class="clearfix"> </div>
	</div>
	<ul class="social">
	  <li class="find"></li>
	  <li><a href="#"> <i class="fb"> </i> </a></li>
	  <li><a href="#"> <i class="tw"> </i> </a></li>
	  <li><a href="#"> <i class="dribble"> </i></a></li>
	  <div class="clearfix"> </div>
	</ul>
	<div class="clearfix"> </div>
  </div>
</div>
<div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
<div class="brand">
 <div class="container">
 
 
	<div class="content_bottom">
          	<div class="container">
          		<ul class="grid1" id="rexiao">
          		  
				  <div class="clearfix"> </div>
				</ul>
          	</div>
          </div>
 </div>
</div>


<div class="sap_tabs">	
						 <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
						  <ul class="resp-tabs-list">
						  	  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab" ><span>文学TOP</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab" ><span>历史 Top</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-2" role="tab" ><span>考试Top</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-3" role="tab" ><span>哲学Top</span></li>
							  <div class="clear"></div>
						  </ul>				  	 
							<div class="resp-tabs-container">
							    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<ul class="tab_img" id="top1">
										<%--               top1 文学                --%>
									</ul>
							     </div>	
							     <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<ul class="tab_img" id="top2">
									 <%--               top2 历史                --%>
										<div class="clearfix"></div>
									</ul>
							     </div>	
							     <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
									<ul class="tab_img" id="top3" >
									  <%--               top3  考试                --%>
										<div class="clearfix"></div>
									</ul>
							     </div>	
							     <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-3">
									<ul class="tab_img" id="top4">
									<%--               top4  哲学                --%>
										<div class="clearfix"></div>
									</ul>
							     </div>		        					 	        					 
						  </div>	
                  </div>
          </div><br/>
          <div class="clearence">
          	<div class="container">
          		<div style="margin-top: 400px;margin-left: 520px"><span class="red" style="font-size: 25px">&nbsp;新书推荐&nbsp;</span></span></div>
          	</div>
          	
          </div>
          <div class="content_bottom">
          	<div class="container">
          		<ul class="grid1" id="xinshu">
          				<%--新书推荐--%>
				  <div class="clearfix"> </div>
				</ul>
          	</div>
          </div>
          
          
          
       <div class="brands">
       	<div class="m_3"><span class="left_line"> </span><h3>Favourite Brands</h3><span class="right_line"> </span></div>
       	<div class="container">
       		<ul class="brands_list">
       		  <li><img src="${pageContext.request.contextPath}/jsp/images/br1.jpg" class="img-responsive" alt=""/></li>
       		  <li><img src="${pageContext.request.contextPath}/jsp/images/br2.jpg" class="img-responsive" alt=""/></li>
       		  <li><img src="${pageContext.request.contextPath}/jsp/images/br3.jpg" class="img-responsive" alt=""/></li>
       		  <li><img src="${pageContext.request.contextPath}/jsp/images/br4.jpg" class="img-responsive" alt=""/></li>
       		  <li><img src="${pageContext.request.contextPath}/jsp/images/br5.jpg" class="img-responsive" alt=""/></li>
       		  <li><img src="${pageContext.request.contextPath}/jsp/images/br6.jpg" class="img-responsive" alt=""/></li>
       		  <li><img src="${pageContext.request.contextPath}/jsp/images/br7.jpg" class="img-responsive" alt=""/></li>
       		  <li class="brand_last"><img src="${pageContext.request.contextPath}/jsp/images/br8.jpg" class="img-responsive" alt=""/></li>
       		  <div class="clearfix"> </div>
       		</ul>
       	</div>
       </div>
       <div class="grid-1">
       	<div class="container">
       		<h1>About LookShop</h1>
       		<p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis</p>
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
       				<li><a href="${pageContext.request.contextPath}/jsp/contact.jsp">Contact</a></li>
       				<li><a href="#">FAQ</a></li>
       				<li><a href="#">Terms of payment</a></li>
       				<li><a href="#">Terms of sale</a></li>
       				<li><a href="#">Terms and conditions</a></li>
       				<li><a href="#">Returns and Refunds</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Information</h3>
       			<ul class="${pageContext.request.contextPath}/jsp/footer_list">
       				<li><a href="#">Affiliate</a></li>
       				<li><a href="#">Cookies</a></li>
       				<li><a href="#">How to Shop</a></li>
       				<li><a href="#">About Nelly</a></li>
       				<li><a href="#">Investor relations</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Campaigns</h3>
       			<ul class="${pageContext.request.contextPath}/jsp/footer_list">
       				<li><a href="#">Evening Dresses</a></li>
       				<li><a href="#">Makeup</a></li>
       				<li><a href="#">Fashion forward</a></li>
       				<li><a href="#">Training clothes</a></li>
       				<li><a href="#">Special Occasion Dresses</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Stores</h3>
       			<ul class="${pageContext.request.contextPath}/jsp/footer_list">
       				<li><a href="#">Paris</a></li>
       				<li><a href="#">New York</a></li>
       				<li><a href="#">London</a></li>
       				<li><a href="#">Madrid</a></li>
       				<li><a href="#">Tokio</a></li>
       			</ul>
       		</div>
       		<div class="col-sm-2 grid-3">
       			<h3>Social</h3>
       			<ul class="${pageContext.request.contextPath}/jsp/footer_social">
				  <li><a href="#"> <i class="tw1"> </i> </a></li>
				  <li><a href="#"> <i class="db1"> </i> </a></li>
				  <li><a href="#"> <i class="fb1"> </i></a></li>
				  <li><a href="#"> <i class="g1"> </i></a></li>
				  <li><a href="#"> <i class="thumb"> </i></a></li>
				  <li><a href="#"> <i class="vimeo"> </i></a></li>
				</ul>
       		</div>
       		<div class="col-sm-2">
       			<img src="${pageContext.request.contextPath}/jsp/images/secure.png" alt=""/>
       		</div>
       	</div>
       </div>
       

</body>
</html>
