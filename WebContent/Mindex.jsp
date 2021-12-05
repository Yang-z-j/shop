<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entity.*" import="Interface.*"
	import="user.Interface.*" import="merchant.Interface.*"
	import="goods.Interface.*" import="java.util.ArrayList"
	import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商家管理页面</title>
<script src="js/jquery-3.3.1.js"></script>
<style>
* {
	margin: 0;
	padding: 0px;
}

html, body {
	width: 100%;
	height: 100%;
}

a {
	text-decoration: none;
	color: rgb(185, 182, 182);
}

li {
	list-style: none;
	color: white;
}

#top {
	width: 100%;
	height: 13%;
	line-height: 90px;
	background-color: #283149;
}

#top .top_left {
	float: left;
	margin-left: 2%;
}

#top .top_right {
	float: right;
	margin-right: 2%;
}

#top .top_right li {
	float: left;
}

#center_left {
	width: 14%;
	height: 87%;
	float: left;
	background-color: rgb(49, 53, 62);
}

#center_left li {
	width: 100%;
	height: 100px;
	line-height: 100px;
	font-size: 20px;
	text-align: center;
	color: rgb(212, 211, 211);
}

.center_right {
	float: right;
	width: 86%;
	height: 87%;
	display: none;
}

.center_right li {
	display: none;
}

.top_right li {
	margin-right: 5px;
}

.top_right img {
	width:35px;
	height:35px;
	position:relative;
	top:10px;
	left:5px;
	border-radius:50%;
}
</style>
</head>

<body>
	<div id="top">
		<ul class="top_left">
			<li>
				<h1>爱淘商城后台购物系统</h1>
			</li>
		</ul>
		<ul class="top_right">
			<li><a id="get" href="#"><%=request.getAttribute("Mname") == null ? "" : request.getAttribute("Mname")%></a></li>
			<li><img src="images/<%=request.getAttribute("Micon") == null ? "" : request.getAttribute("Micon")%>"></li>
		</ul>
	</div>
	<div id="center_left">
		<ul>
			<a href="operation/Dstatistics.jsp" target="Dstatistics">
				<li>数据统计</li>
			</a>
			<a href="operation/Gadd.jsp" target="Gadd">
				<li>添加商品</li>
			</a>
			<a href="operation/Gmanage.jsp" target="Gmanage">
				<li>商品管理</li>
			</a>
			<a href="operation/Omanage.jsp" target="Omanage">
				<li>订单管理</li>
			</a>
			<li><a href="merchant/Mlogin.jsp">退出登录</a></li>
		</ul>
	</div>
	<iframe class="center_right" src="operation/Dstatistics.jsp"
		frameborder="0" name="Dstatistics" style="display: block"></iframe>
	<iframe class="center_right" src="operation/Gadd.jsp" frameborder="0"
		name="Gadd"></iframe>
	<iframe class="center_right" src="operation/Gmanage.jsp"
		frameborder="0" name="Gmanage"></iframe>
	<iframe class="center_right" src="operation/Omanage.jsp"
		frameborder="0" name="Omanage"></iframe>

	<script>
		$(function() {
			$("#center_left a").hover(
					function() {
						$(this).children('li').css("background",
								"rgba(228, 226, 226, .4)")
						$(this).children('li').css("color", "white");
					},
					function() {
						$(this).children('li').css("background", "");
						$(this).children('li').css("color",
								"rgb(185, 182, 182)")
					})
			$("#center_left a").click(function() {
				var index = $(this).index();
				$("iframe").eq(index).show().siblings("iframe").hide();
			})
			window.onresize = resizeBannerImage; //  窗口宽度改变时执行此函数
			function resizeBannerImage() {
				var a = $('#top').height()

				$('#top').css("line-height", a + "px");

			}
		})
	</script>
</body>
</html>