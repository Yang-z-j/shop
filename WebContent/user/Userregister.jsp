<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>爱淘商城-注册系统</title>
<link rel="stylesheet" href="../css/mdui.css">
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
	height: 580px;
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
	height: 661px;
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

#tips {
	color: red;
	text-align: center;
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
</style>

</head>
<body>
	<div id="logo">
		<a class="logo_1" href="../index.jsp">爱淘商城</a>
	</div>
	<div id="foot">
		<div id="denglu">
			<p id="tips"><%=request.getAttribute("tips") == null ? "" : request.getAttribute("tips")%></p>
			<h1>用户注册</h1>
			<div id="zuc">
				<form
					action="${pageContext.request.contextPath }/userServlet?method=userRegist"
					method="post">
					<input class="input" type="text" id="Uid" name="Uid"
						placeholder="请输入账号" required="required" title="请输入字母加数字"
						maxlength="10" onblur="if(value.length<5)value=''"
						autocomplete="off" /> <br /> <input class="input" type="text"
						id="Uname" name="Uname" placeholder="请输入昵称" required="required"
						title="请输入8位以内的昵称" maxlength="8" autocomplete="off" /> <br /> <input
						class="input" type="password" name="Upassword" placeholder="请输入密码"
						required="required" title="请输入6-16位以内的字母+数字 " maxlength="16"
						onblur="if(value.length<6)value='';
                        " /> <br /> <select name="Usex"
						class="input">
						<option value="男">男</option>
						<option value="女">女</option>
					</select> <br /> <input class="input " type="text" id="Uphone"
						name="Uphone" placeholder="请输入电话" required="required"
						title="请输入11位的数字！" maxlength="11"
						oninput="value=value.replace(/[^\d]/g, '') " autocomplete="off" />
					<br /> <input class="input " type="text" id="Receiving"
						name="Ureceiving" placeholder="收货人" required="required"
						title="请输入你的收货名！ " maxlength="5"
						onblur="this.value=this.value.replace(/[^\u4E00-\u9FA5]/g, '')"
						autocomplete="off" /> <br /> <input class="input " type="text"
						id="Uaddress" name="Uaddress" placeholder="收货地址"
						required="required" title="请输入收货地址,--省--市--县--村--号"
						onkeyup="this.value=this.value.replace(/[^\d^\u4E00-\u9FA5]/g, '') "
						autocomplete="off" /> <br /> <input class="button" type="submit"
						id="registerBtn" value="立即注册 " />
				</form>
				<div id="zuce">
					<a href="/shopping/user/Userlogin.jsp" class="zuce1">已有帐号，去登录>></a>
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


