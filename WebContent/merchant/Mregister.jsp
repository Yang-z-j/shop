<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>爱淘商家-注册系统</title>
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
	height: 514px;
	background-color: white;
	margin-top: 35px;
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

.file {
	padding: 10px 0 10px 0px;
	margin: 5px;
	margin-bottom: 13px;
	width: 160px;
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
	height: 580px;
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
	width: 100px;
	position: absolute;
	top: 75px;
	left: 50%;
	text-align: center;
	margin-left: -50px;
	color: red;
	text-align: center;
	position: absolute;
	top: 75px;
	left: 50%;
	text-align: center;
	margin-left: -50px;
	top: 75px;
	left: 50%;
	text-align: center;
	margin-left: -50px;
	color: red;
	text-align: center;
	position: absolute;
	top: 75px;
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

#c {
	display: inline-block;
	width: 75px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	font-size: 13px;
	background-color: rgb(196, 193, 193);
	margin-left: 6px;
	margin-top: 10px;
}

#c:hover {
	color: white;
	background-color: rgb(141, 141, 141);
}

#b {
	width: 50px;
	height: 50px;
	background-color: wheat;
	float: right;
	margin-right: 8px;
	border: 1px solid #000;
	overflow: hidden;
}

#b div {
	width: 100%;
	height: 80%;
	padding-top: 11px;
	text-align: center;
	color: rgb(111, 116, 131);
	font-size: 27px;
	border: 0;
	position: relative;
	top: -108%;
	background-color: #fffdfd;
}

img {
	width: 100%;
	height: 100%;
}

textarea {
	resize: none;
}
</style>

</head>

<body>
	<div id="logo">
		<span class="logo_1">购物系统</span>
	</div>
	<div id="foot">
		<div id="denglu">
			<p id="tips">
				<%=request.getAttribute("tips") == null ? "" : request.getAttribute("tips")%>
			</p>
			<h1>商家注册</h1>
			<div id="zuc">
				<form
					action="${pageContext.request.contextPath }/merchantServlet?method=merchantRegist"
					method="post">
					<input class="input" type="text" id="username" name="Mid"
						placeholder="店铺账号" required="required" title="请输入6-10位的字母加数字"
						maxlength="10" onblur="if(value.length<6)value=''" autocomplete="off"/>
					<br /> <input class="input" type="password" id="password"
						name="Mpassword" placeholder="输入密码" required="required"
						title="请输入5-10位的字母加数字 " maxlength="10"
						onblur="if(value.length<5)value='' ;
                    "
						onkeyup="value=value.replace(/[^\d|chun ^\w]/g, '') " /> <br />
					<input class="input" type="text" id="Uname" name="Mname"
						placeholder="店铺名" required="required" title="请输入6位的字母、汉字、数字"
						maxlength="6" onkeyup="value=value.replace(/[^\d|chun \w]/g, '') " autocomplete="off"/>

					<br />
					<textarea class="input" rows="10" cols="25" id="Sintroduction"
						name="Mintroduction" placeholder="店铺介绍" maxlength="40" autocomplete="off"></textarea>
					<br /> <input class="input" type="text" id="Sphone" name="Mphone"
						placeholder="电话" required
						oninvalid="setCustomValidity('请输入11位数字！')" maxlength="11"
						onkeyup="value=value.replace(/[^\d]/g,'')" autocomplete="off"/> <br /> <input
						type="hidden" name="Micon" class="Micon" />
					<div>
						<label for="a" id="c">上传商标</label>
						<div id="b">
							<img src="" alt="">
							<div>+</div>
						</div>
					</div>
					<input type="file" id="a" required="required" style="display: none"
						onchange="changepic(this)" class="file" />
					<script>
						$(function() {
							var file = document.querySelector(".file");
							file
									.addEventListener(
											"change",
											function() {
												document
														.querySelector(".Micon").value = file.value
														.replace(
																'C:\\fakepath\\',
																'');
												$('#b div').hide();
											})

						})
						function changepic() {
							var reads = new FileReader();
							f = document.getElementById("a").files[0];
							reads.readAsDataURL(f);
							reads.onload = function(e) {
								document.querySelector("img").src = this.result;
							};
						}
					</script>
					<br /> <input class="button" type="submit" id="registerBtn"
						value="立即注册" />
				</form>
				<div id="zuce">
					<a href="/shopping/merchant/Mlogin.jsp" class="zuce1">已有帐号，去登录>></a>
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


