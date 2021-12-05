<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>爱淘商家-登录系统</title>
<link rel="stylesheet" href="../css/mdui.css">
<link rel="styleshett" href="../css/core.css">
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/mdui.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	min-width: 1080px;
}

#denglu {
	margin: 0px auto;
	width: 400px;
	height: 280px;
	background-color: white;
	margin-top: 40px;
}

h1 {
	text-align: center;
	border-bottom: 1px solid #ddd;
	padding: 10px;
	font-size: 18px;
	font-weight: 700;
	color: #666;
	margin-bottom: 20px;
}

.input {
	padding: 10px 0 10px 0px;
	margin: 5px;
	margin-bottom: 13px;
	width: 308px;
	height: 18px;
	line-height: 18px;
	font-size: 15px;
	color: #333;
	outline: none;
	text-align: center;
}

.button {
	margin: 5px;
	width: 312px;
	padding: 6px 0;
	background-color: #66CCFF;
	color: white;
	font-size: 20px;
	cursor: pointer;
	border: 0;
}

#zuc {
	width: 325px;
	margin: 0 auto;
}

#logo {
	margin: 0 auto;
	width: 1080px;
	height: 60px;
}

.logo_1 {
	font-size: 25px;
	font-weight: bold;
	color: #66CCFF;
	position: relative;
	top: 10px;
	text-decoration: none;
}

#foot {
	height: 361px;
	margin: 0 auto;
	border: 1px solid #66CCFF;
	background-color: #66CCFF;
}

.zuce1 {
	padding: 0 5px;
	color: #666;
	text-decoration: none;
	font-size: 12px;
}

#zuce {
	margin: 8px auto 0;
	text-align: right;
	color: #666;
}

.zuce1:hover {
	color: #66CCFF;
}

#tail {
	width: 1080px;
	height: 60px;
	margin: 0 auto;
}

.p2 {
	text-align: center;
	margin-top: 15px;
	color: #666;
	font-size: 12px;
	cursor: pointer;
}

#tips {
	width: 150px;
	position: absolute;
	top: 75px;
	left: 50%;
	text-align: center;
	margin-left: -75px;
	color: red;
}

#succeed {
	color: #0aa344;
	width: 100px;
	position: absolute;
	top: 75px;
	left: 50%;
	text-align: center;
	margin-left: -50px;
	text-align: center;
}
</style>
</head>
<body>

	<div id="logo">
		<span class="logo_1">购物系统</span>
	</div>
	<div id="foot">
		<div id="denglu">
			<p id="tips"><%=request.getAttribute("tips") == null ? "" : request.getAttribute("tips")%></p>
			<h1>商家登录</h1>
			<div id="zuc">
				<form
					action="${pageContext.request.contextPath }/merchantServlet?method=merchantLogin"
					method="post">
					<input class="input" id="username" name="Mid" type="text"
						placeholder="请输入账号" required="required" maxlength="10" autocomplete="off"/> <br /> <input
						class="input" id="password" name="Mpassword" type="password"
						placeholder="请输入密码" required="required" maxlength="10"/> <br /> <input
						class="button" id="loginBtn" type="submit" value="登录" />
				</form>

				<div id="zuce">
					<!-- <a href="findPwd.html" class="zuce1">忘记密码</a> -->
					<a href="/shopping/merchant/Mregister.jsp" class="zuce1">免费注册</a>
				</div>
			</div>
		</div>
	</div>
	<div id="tail">
		<p class="p2">爱淘商城</p>
		<p class="p2">Copyright © 2019 taobaostore.top All Rights Reserved
		</p>
	</div>

</body>
</html>
