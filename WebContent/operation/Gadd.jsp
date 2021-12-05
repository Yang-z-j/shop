<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品添加</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}

#add {
	background-color: rgb(56, 61, 75);
	color: white;
	font-size: 18px;
	padding: 10px 10px;
}

#box {
	width: 50%;
	height: 500px;
	/* background-color: burlywood; */
	margin: 40px auto;
}

select, .input {
	width: 45%;
	height: 40px;
	margin: 8px 0px;
	font-size: 18px;
}

#fir {
	margin: 9px 0px 9px 13px;
}

.Gsize {
	margin: 9px 0px 9px 5px;
	width: 21px;
}

.one {
	margin-left: 16px;
}

.two {
	margin-left: 32px;
}

.tree {
	margin-left: 16px;
}

.four {
	margin-left: 17px;
}

#box span {
	color: crimson;
}

#sub {
	margin: 25px 0px 0px 108px;
	border-radius: 10px;
}

#sub:hover {
	background-color: #16a951;
	color: white;
	border: 1px solid #16a951;
}

#Addphoto .b div {
	width: 100%;
	height: 88.6%;
	padding-top: 24px;
	text-align: center;
	color: rgb(111, 116, 131);
	font-size: 100px;
	border: 0;
	position: relative;
	top: -102%;
	background-color: white;
	z-index: 99;
}

#Addphoto {
	width: 174px;
	height: 275px;
	/* background-color: yellow; */
	position: absolute;
	top: 14.5%;
	left: 58%;
}

#Addphoto div {
	width: 170px;
	height: 210px;
	/* background-color: rgb(119, 45, 45); */
	border: 2px solid #000;
	margin-bottom: 19px;
}

#Addphoto label {
	display: block;
	width: 170px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border: 2px solid #000;
	background-color: #ccc;
}

#Addphoto label:hover {
	background-color: #16a951;
	color: white;
	border: 2px solid #16a951;
}

img {
	width: 100%;
	height: 100%;
}

#tips {
	position: absolute;
	left: 50%;
	color: red;
	text-align: center;
}

#succeed {
	position: absolute;
	left: 50%;
	color: #0aa344;
	text-align: center;
}
</style>
<script>
	function changepic() {
		var reads = new FileReader();
		f = document.getElementById("a").files[0];
		reads.readAsDataURL(f);
		reads.onload = function(e) {
			document.querySelector("img").src = this.result;
		};
	}
</script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
</head>

<body>
	<div id="add">商品添加</div>
	<p id="tips"><%=request.getAttribute("tips") == null ? "" : request.getAttribute("tips")%>
	</p>
	<p id="succeed"><%=request.getAttribute("succeed") == null ? "" : request.getAttribute("succeed")%></p>
	<form
		action="${pageContext.request.contextPath }/GoodsServlet?method=goodsAdd"
		method="post">
		<div id="box">
			<label for="2"><span>*</span>商品名：</label> <input type="text"
				name="Gname" id="2" class="two input" required="required" /><br />
			<label for="3"><span>*</span>商品价格：</label> <input type="number"
				name="Gprice" id="3" class="one input" required="required" /><br />
			<label for="4"><span>*</span>商品尺寸：</label> <input type="checkbox"
				name="Gsize1" value="S" class="Gsize" id="fir">S <input
				type="checkbox" name="Gsize2" value="M" class="Gsize">M <input
				type="checkbox" name="Gsize3" value="L" class="Gsize">L <input
				type="checkbox" name="Gsize4" value="XL" class="Gsize">XL <input
				type="checkbox" name="Gsize5" value="XXL" class="Gsize">XXL
			<input type="checkbox" name="Gsize6" value="XXXL" class="Gsize">XXXL

			<br> <label for="6"><span>*</span>商品类型：</label> <select
				name="Gtype" id="6" class="four">
				<option>衬衫</option>
				<option>短袖</option>
				<option>长裤</option>
				<option>棉袄</option>
				<option selected>裙子</option>
				<option>卫衣</option>
				<option >短裤</option>
			</select><br /> <label for="7"><span>*</span>商品总库存：</label> <input
				type="number" id="7" name="Goitw" class="input" value="1000"/><br />
			<!-- 图片添加 -->
			<div id="Addphoto">
				<div class="b">
					<img src="" alt="">
					<div>+</div>
				</div>
				<label for="a" id="c">上传样图</label>
			</div>
			<input type="hidden" name="Gphoto" class="Gphoto" /> <input
				type="file" id="a" required="required" style="display: none"
				onchange="changepic(this)" class="file" /> <input type="submit"
				value="提交" id="sub" class="input" />
			<script>
				$(function() {
					var file = document.querySelector(".file");
					file.addEventListener("change", function(e) {
						document.querySelector(".Gphoto").value = file.value
								.replace('C:\\fakepath\\', '');
						$('#Addphoto .b div').hide();
					})
				})
			</script>
		</div>
	</form>
</body>

</html>