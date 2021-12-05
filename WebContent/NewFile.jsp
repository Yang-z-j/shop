<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entity.*" import="Interface.*"
	import="user.Interface.*" import="merchant.Interface.*"
	import="java.util.ArrayList" import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理页面</title>
<script src="js/jquery-3.3.1.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0px;
}

body {
	font-size: 12px;
	background-color: rgb(239, 239, 244);
}

#box {
	width: 1110px;
	margin: 0 auto;
	box-shadow: -1px 5px 6px #41555d;
}

ul, li, h2 {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

#top {
	width: 1110px;
	height: 40px;
	margin: 0 auto;
	background-color: #CCCC00
}

#top h2 {
	width: 150px;
	height: 70px;
	background-color: #11999e;
	float: left;
	text-align: center;
	line-height: 70px;
	font-size: 20px;
}

#topTags {
	width: 960px;
	height: 70px;
	margin: 0 auto;
	background-color: #e4f9f5;
	float: left
}

#topTags .hh {
	float: left;
	width: 875px;
	height: 65px;
}

#topTags .hh li {
	text-align: center;
	margin-top: 20px;
	font-size: 21px;
	font-weight: 700;
}

#topTags #login li {
	float: right;
	width: 30px;
	height: 30px;
	line-height: 30px;
	margin-right: 10px;
	margin-top: 18px;
}

#topTags #login .icon {
	border: 1px solid #000;
}

#main {
	width: 1110px;
	height: 630px;
	margin: 0 auto;
	background-color: #F5F7E6;
}

#leftMenu {
	width: 150px;
	height: 600px;
	/* background-color: #40514e; */
	background: -webkit-gradient(linear, 0 0, 0 100%, from(#007991),
		to(#78ffd6));
	float: left
}

#leftMenu ul li {
	width: 150px;
	height: 60px;
	display: block;
	cursor: pointer;
	line-height: 60px;
	text-align: center;
	color: rgb(212, 211, 211);
	font-size: 16px;
}
/* #leftMenu ul li a {
            color: #000000;
            text-decoration: none;
        } */
#content {
	width: 750px;
	height: 500px;
	float: left
}

#content h3 {
	margin-left: 46px;
	padding-top: 10px;
	font-size: 16px;
}

.content {
	width: 946px;
	height: 588px;
	display: none;
	padding: 5px;
	overflow-y: auto;
	line-height: 30px;
	border: 1px solid #000;
}

#footer {
	width: 1110px;
	height: 30px;
	margin: 0 auto;
	background-color: #ccc;
	line-height: 30px;
	text-align: center;
}

.content1 {
	width: 740px;
	height: 490px;
	display: block;
	padding: 5px;
	overflow-y: auto;
	line-height: 30px;
}
/* 用户信息模块 */
table {
	table-layout: fixed;
	empty-cells: show;
	border-collapse: collapse;
	margin: 0 auto;
	font-size: 12px;
	height: 70px;
	line-height: 70px;
}

.table {
	border: 1px solid #cad9ea;
	color: #666;
}

.table th {
	background-repeat: repeat-x;
	height: 30px;
}

.table td, .table th {
	border: 1px solid #cad9ea;
	padding: 0;
	text-align: center;
}

.table tr.alter {
	background-color: #f5fafe;
}
/* 用户操作按钮修改 */
#content .btn {
	/* padding: 16px 32px; */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	/* font-size: 16px; */
	/* margin: 4px 2px; */
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	cursor: pointer;
}

.btn1 {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}

.btn1:hover {
	background-color: #4CAF50;
	color: white;
}

.btn2 {
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
}

.btn2:hover {
	background-color: #008CBA;
	color: white;
}

.p {
	position: relative;
}

.photo {
	position: absolute;
	top: 0;
	left: 35px;
	width: 50px;
	height: 50px;
	margin-top: 10px;
}
</style>
<script type="text/javascript">
        $(function() {
            $("#leftMenu ul li").click(function() {
                $(this).css({
                    background: 'rgba(228, 226, 226, .4)',
                    color: "white"

                }).siblings().css({
                    background: '',
                    color: "rgb(212, 211, 211)"
                });
                var index = $(this).index();
                console.log(index);
                $("#content div").eq(index).show().siblings().hide();
            })
        })
    </script>
</head>

<body>
	<div id="box">
		<div id="top">
			<h2>管理菜单</h2>
			<div id="topTags">
				<ul class="hh">
					<li>欢迎使用超级管理员系统</li>
				</ul>
				<ul id="login">
					<li>Admin</li>
					<li class="icon"></li>
				</ul>
			</div>
		</div>
		<div id="main">
			<div id="leftMenu">
				<ul>
					<li>用户信息管理</li>
					<li>商家信息管理</li>
					<li>退出登录</li>
				</ul>
			</div>
			<div id="content">
				<div id="c0" class="content">
					<h3>用户信息</h3>

					<table width="90%" class="table">
						<tr>
							<th>用户账号</th>
							<th>用户密码</th>
							<th>昵称</th>
							<th>性别</th>
							<th>电话</th>
							<th>收货人</th>
							<th>收货地址</th>
							<th>操作</th>

						</tr>
						<%
							UserDaoImpl userDaoImpl = new UserDaoImpl();
						List<User> userList = userDaoImpl.getAllusers();
						System.out.print(userList.size());
						for (User user : userList) {
						%>
						<tr>
							<td><%=user.getUid()%></td>
							<td><%=user.getUname()%></td>
							<td><%=user.getUpassword()%></td>
							<td><%=user.getUsex()%></td>
							<td><%=user.getUphone()%></td>
							<td><%=user.getUreceiving()%></td>
							<td><%=user.getUaddress()%></td>
							<td><a
								href="${pageContext.request.contextPath }/userServlet?method=delete&id=${stu.stuid }"
								onclick="return check(${stu.stuid })"><button
										class="btn btn1">删除</button></a></td>
						</tr>
						<%
							}
						%>


						<tr class="alter">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<div id="c1" class="content">
					<h3>商家信息</h3>

					<table width="90%" class="table">
						<tr>
							<th>商家账号</th>
							<th>商家密码</th>
							<th>店铺名</th>
							<th>店铺介绍</th>
							<th>电话</th>
							<th>店铺图标</th>
							<th>操作</th>
						</tr>
						<%
							MerchantDaoImpl merchantDaoImpl = new MerchantDaoImpl();
						List<Merchant> merchantList = merchantDaoImpl.getAllmerchants();
						System.out.print(merchantList.size());
						for (Merchant merchant : merchantList) {
						%>
						<tr>
							<td><%=merchant.getMid()%></td>
							<td><%=merchant.getMpassword()%></td>
							<td><%=merchant.getMname()%></td>
							<td><%=merchant.getMintroduction()%></td>
							<td><%=merchant.getMphone()%></td>
							<td class="p"><img src="images/<%=merchant.getMicon()%>" class="photo"></td>
							<td><a
								href="${pageContext.request.contextPath }/userServlet?method=delete&id=${stu.stuid }"
								onclick="return check(${stu.stuid })"><button
										class="btn btn1">删除</button></a></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>

			</div>
		</div>
		<div id="footer">copyright for lalasxc</div>
	</div>
</body>

</html>