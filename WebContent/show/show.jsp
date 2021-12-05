<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entity.*" import="Interface.*"
	import="user.Interface.*" import="merchant.Interface.*"
	import="goods.Interface.*" import="java.util.ArrayList"
	import="java.util.List" import="java.io.UnsupportedEncodingException"
	import="java.net.URLDecoder" import="user.Interface.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>爱淘商城</title>
<link rel="stylesheet" href="../css/mdui.css">
<link rel="stylesheet" href="../css/core.css">
<link rel="stylesheet" href="../css/show.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/index.css">
<script type="text/javascript" src="../js/mdui.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="../bootstrap-4.6.0-dist/css/bootstrap.min.css">
<script src="../bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"> </script>
<!-- <script script th: src="@{js/jquery-3.3.1.js}" type="text/javascript" charset="utf-8">
    </script>
    <script type="text/javascript" th:src="@{js/mdui.js}"></script> -->

<script src="../js/animate.js"></script>
<!-- 引入我们首页的js文件 -->
<script src="../js/index1.js"></script>
<link rel="stylesheet" href="../css/alone/show.css">
</head>
<body>
	<%
		GoodsDaoImpl goodsDaoImpl = new GoodsDaoImpl();
	UserDaoImpl userDaoImpl = new UserDaoImpl();
	List<User> userList = userDaoImpl.getAllusers();
	/* 获取url参数值 */
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
			+ request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/") + 1);
	if (request.getQueryString() != null) {
		url += "?" + request.getQueryString();
	}
	String parameter = "";
	String type = "";
	String name = "";
	String id = "";
	if (request.getQueryString() != null) {
		try {
			parameter = URLDecoder.decode(request.getQueryString(), "utf-8");//将中文转码
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	String str = parameter.substring(0, 5);
	parameter = parameter.substring(6);
	String temp[];
	temp = parameter.split("&Uid=");
	type = temp[0];
	String value = temp[1];
	value = value.substring(7);
	if (!value.equals("")) {
		parameter = temp[1];
		String temp2[];
		temp2 = parameter.split("&Uname=");
		id = temp2[0];
		name = temp2[1];
	}
	List<Goods> goodsList;
	if (str.equals("Gtype")) {
		goodsList = goodsDaoImpl.getAllgoodss();
	} else {
		goodsList = goodsDaoImpl.searchGoods(type);
	}
	System.out.println(goodsList.size());
	System.out.println("URL参数：" + type);
	System.out.println("URL参数：" + value);
	System.out.println("URL参数：" + name);
	System.out.println("URL参数：" + id);
	%>
	<span id="Uid" style="display: none;"><%=id%></span>
	<div id="header">
		<p class="p1">爱淘商城,只有想不到,没有买不到!!!</p>
	</div>
	<div id="header_1">
		<div class="login">
			<div class="login_1">
				<span class="span"><span id="dl"><a
						href='../user/Userlogin.jsp'>登录</a> <a
						href='../user/Userregister.jsp'>注册</a></span> </span>
				<p class="span">
					<a id="get"
						href="#" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><%=name%></a>
				</p>
				<ul class="ul1">
					<li class="li1"><a href="cart.jsp?Uname=<%=name%>&Uid=<%=id%>"
						class="a1">购物车 </a></li>
					<li class="li1"><a
						href="order.jsp?Uname=<%=name%>&Uid=<%=id%>" class="a1">我的订单</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="userModal">
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
			<div class="modal-dialog modal-md" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="exampleModalLabel">个人信息</h4>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="recipient-name" class="control-label">账&emsp;号:</label>
								<input type="text" class="form-control" id="recipient-name" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label">昵&emsp;称:</label>
								<input type="text" class="form-control change" id="recipient-name" readonly="readonly" autocomplete="off">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">密&emsp;码:</label>
								<input type="text" class="form-control change" id="recipient-name" readonly="readonly" autocomplete="off">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">性&emsp;别:</label>
								<input type="text" class="form-control change" id="recipient-name" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">电&emsp;话:</label>
								<input type="text" class="form-control change" id="recipient-name" readonly="readonly" autocomplete="off">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">收货人:</label>
								<input type="text" class="form-control change" id="recipient-name" readonly="readonly" autocomplete="off">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">地&emsp;址:</label>
								<input type="text" class="form-control change" id="recipient-name" readonly="readonly" autocomplete="off">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default update1">更改信息</button>
						<button type="button" class="btn btn-default update2">确认更改</button>
						<a type="button" class="btn btn-default" href="../user/Userlogin.jsp">退出登录</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		for(User User : userList){
			if(User.getUid().equals(id)){
	%>
				<div class="showUser" style="display:none;"><%=User.getUname() %></div>
				<div class="showUser" style="display:none;"><%=User.getUpassword() %></div>
				<div class="showUser" style="display:none;"><%=User.getUsex() %></div>
				<div class="showUser" style="display:none;"><%=User.getUphone() %></div>
				<div class="showUser" style="display:none;"><%=User.getUreceiving() %></div>
				<div class="showUser" style="display:none;"><%=User.getUaddress() %></div>
	<%		
			}
		}
	%>
	<script>
		$('.update2').hide();
		$('#get').click(function(){
			$('.update2').hide();
			$('.update1').show();
			$('.userModal .change').attr('readonly',true);
			$('.userModal input').eq(0).val($('#Uid').html());
			$('.userModal input').eq(1).val($('.showUser').eq(0).html());
			$('.userModal input').eq(2).val($('.showUser').eq(1).html());
			$('.userModal input').eq(3).val($('.showUser').eq(2).html());
			$('.userModal input').eq(4).val($('.showUser').eq(3).html());
			$('.userModal input').eq(5).val($('.showUser').eq(4).html());
			$('.userModal input').eq(6).val($('.showUser').eq(5).html());
		})
		$('.update1').click(function(){
			$('.userModal .change').attr('readonly',false);
			$('.update1').hide();
			$('.update2').show();
			$('.update2').click(function(){
				if($('.userModal .change').val() === '') {
					swal("值不能为空!", "请输入值!", "error");
					return;
				} else {
					swal({
				        title: "是否确认修改信息",
				        text: "修改后将重新登录",
				        icon: "warning",
				        buttons: true,
				        dangerMode: true,
				    })
				        .then((willDelete) => {
				            if (willDelete) {
								var Uid = $('#Uid').html();
								var Uname = $('.userModal input').eq(1).val();
								var Upassword = $('.userModal input').eq(2).val();
								var Usex = $('.userModal input').eq(3).val();
								var Uphone = $('.userModal input').eq(4).val();
								var Ureceiving = $('.userModal input').eq(5).val();
								var Uaddress = $('.userModal input').eq(6).val();
								$.ajax({
									url : "${pageContext.request.contextPath }/userServlet?method=updateUser",
									type : "post",
									data : {
										"Uid" : Uid,
										"Uname" : Uname,
										"Upassword" : Upassword,
										"Usex" : Usex,
										"Uphone" : Uphone,
										"Ureceiving" : Ureceiving,
										"Uaddress" : Uaddress
									},
									success : function(data) {
										console.log(11);
									}
								})
								swal("请重新登录,三秒钟后自动跳转!", {
								     icon: "success",
								});
								$('.userModal .modal').modal('hide');
								setTimeout(function(){
									window.location.href="../user/Userlogin.jsp";
								},3000)
				            } else {
				                swal("取消修改！！");
				            }
				        });
					}
				})
			})
	</script>
	<script>
		if (
	<%=name.equals("")%>
		) {
			$('#get').hide();
		} else {
			$('#dl').hide();
		}
		$('.ul1 a').click(function() {
			if ($('#get').html()) {
				console.log($('#get').html());
			} else {
				$(this).attr('href', 'javascript:;');
				swal("请先登录", "", "error");
			}
		})
	</script>
	<div id="listBody">
		<div id="body">
			<!-- logo直接使用文字替代 -->
			<a class="logo" href="../index.jsp?Uname=<%=name%>&Uid=<%=id%>">爱淘商城</a>
			<div id="body-1">
				<input id="serach_Input" class="textinput" type="text"
					placeholder=请输入商品名称 /><p id="serach_Btn" class="button1">搜索</p>
					<a id="serach_a" href="javascript:void();" style="display:none;"><span id="tz">跳转</span></a>
				<script>
					<%
						String Umessage= "&Uid="+id+"&Uname="+name+"";
					%>
					$(".button1").click(function() {
						var Gname = $('#serach_Input').val();
						var sBufferBlank = Gname.replace(/\ +/g, "");
						Gname = sBufferBlank;
						if (sBufferBlank != "") {
							console.log(Gname);
							
							var site = "show.jsp?Gname="+Gname+"<%=Umessage%>";
							console.log(site);
							$('#serach_a').attr('href', site);
							$('#tz').trigger("click");
							$('#serach_Input').val("");
						} else {
							swal("请输入商品名称", "", "error");
						}
					})
					$(".textinput").keyup(function(event){
						var isFocus = $(".textinput").is(":focus");
						var x = event.which;
						console.log(x);
				        if(x == 13){
				        	console.log(x);
				        	console.log(isFocus);
				    		// 判断光标是否在input上
				            if(isFocus == true){
				            	// 如果是 则触发点击事件
					            var Gname = $('#serach_Input').val();
								var sBufferBlank = Gname.replace(/\ +/g, "");
								Gname = sBufferBlank;
								if (sBufferBlank != "") {
									console.log(Gname);
									var site = "show.jsp?Gname="+Gname+"<%=Umessage%>";
									console.log(site);
									$('#serach_a').attr('href', site);
									$('#tz').trigger("click");
									$('#serach_Input').val("");
								} else {
									swal("请输入商品名称", "", "error");
								}
				            }
				        }
			        });
				</script>
			</div>
		</div>
		<div id="commodity">
			<h1 class="flooer"><%=type%></h1>
			<ul class="ul4">
				<%
					if (goodsList.size() != 0) {
					for (int i = 0; i < goodsList.size(); i++) {
						if (str.equals("Gtype")) {
					String Gtype = goodsList.get(i).getGtype();
					if (Gtype.equals(type)) {
				%>
				<li class="li3" data-target="#myModal"><a><img class="img"
						data-lazy-src="../clothing/<%=goodsList.get(i).getGtype()%>/image/<%=goodsList.get(i).getGphoto()%>"
						width="160" height="165" /> <span class="span3"><%=goodsList.get(i).getGname()%></span>
						<span style="color: rgb(233, 30, 30)" class="money">￥ </span><span
						style="color: rgb(233, 30, 30)" class="span4"><%=goodsList.get(i).getGprice()%></span>
						<span class="span5" style="display: none;"><%=goodsList.get(i).getGsize()%></span></a>
				</li>
				<%
					}
				} else {
				%>
				<li class="li3" data-target="#myModal"><a><img class="img"
						data-lazy-src="../clothing/<%=goodsList.get(i).getGtype()%>/image/<%=goodsList.get(i).getGphoto()%>"
						width="160" height="165" /> <span class="span3"><%=goodsList.get(i).getGname()%></span>
						<span style="color: rgb(233, 30, 30)" class="money">￥ </span><span
						style="color: rgb(233, 30, 30)" class="span4"><%=goodsList.get(i).getGprice()%></span>
						<span class="span5" style="display: none;"><%=goodsList.get(i).getGsize()%></span></a>
				</li>
				<%
					}
				}
				} else {
				%>
				<span>很抱歉，没有你想要的商品，正在加紧上架中！！！</span>
				<%
					}
				%>
			</ul>
		</div>
		<div class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myLargeModalLabel" id="myModal">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>
							<img src="" alt="" class="illustration">
						</p>
						<div class="content">
							<p class="modal-lg introduce">服装名</p>
							<p class="price modal-lg">
								<i>价格</i> <span class="unit1">￥</span><span class="unit"></span>
							</p>
							<p class="size modal-lg"></p>
							<div class="count modal-lg">
								<i>数量</i>
								<div id="app">
									<button id="btn1" class="jian">-</button>
									<div id="zhi">
										<span>1</span>
									</div>
									<button id="btn2" class="jia">+</button>
								</div>
							</div>
							<script>
								$('#btn1').css('cursor', 'not-allowed');
								$('.jian').click(function(){
									var i = $('#zhi span').html();
									if($('#zhi span').html() === '1') {
										$('#btn1').css('cursor', 'not-allowed');
										return;
									}
									console.log(11);
									$('#zhi span').html(--i);
									if($('#zhi span').html() === '1') {
										$('#btn1').css('cursor', 'not-allowed');
										return;
									}
								})
								$('.jia').click(function(){
									var i = $('#zhi span').html();
									if($('#zhi span').html() === '99999999') return;
									console.log(11);
									$('#zhi span').html(++i);
									$('#btn1').css('cursor', '');
								})
							</script>
							<!-- <script>
								$('#btn1').css('cursor', 'not-allowed');
								var app = new Vue({
									el : "#app",
									data : {
										num : 1
									},
									methods : {
										jian : function() {
											// console.log("11");
											if (this.num > 1) {
												this.num--;
												if (this.num == 1) {
													$('#btn1').css('cursor',
															'not-allowed');
												}
											}
										},
										jia : function() {
											// console.log('22');
											if (this.num < 99999999) {
												this.num++;
												$('#btn1').css('cursor',
														'pointer');
											} else {
												$('#btn2').css('cursor',
														'not-allowed');
											}
										}
									}
								})
							</script> -->
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">立即购买</button>
						<button type="button" class="btn btn-primary">加入购物车</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<script src="../js/EasyLazyload.min.js"></script>
		<script>
			console.log(11);
			$('.li3').click(
					function() {
						$('#myModal').modal('show');
						$('.illustration').attr('src',
								$(this).find('img').attr('src'));
						$('.introduce').html($(this).find('.span3').html());
						$('.unit').html($(this).find('.span4').html());
						$('.size').html('');
						$('.size').append("<i>尺码</i>");
						$('#zhi span').html(1);
						var str = $(this).find('.span5').html();
						var arr = str.split(",");
						for (var i = 0; i < arr.length; i++) {
							$('.size').append("<span>" + arr[i] + "</span>");
							$('.size').on(
									'click',
									'span',
									function() {
										$(this).addClass('bgc')
												.siblings('span').removeClass(
														'bgc');
									})
						}
					})

			/* 购买 */
			$('.btn-primary')
					.eq(0)
					.click(
							function() {
								if ($('#get').html()) {
									if ($(this).parent()
											.siblings('.modal-body').find(
													'.size span').hasClass(
													'bgc')) {
										var Uid = $('#Uid').html();
										var Gname = $(this).parent().siblings(
												'.modal-body').find(
												'.introduce').html();
										var Gprice = $(this).parent().siblings(
												'.modal-body').find('.unit')
												.html();
										var Gsize = $(this).parent().siblings(
												'.modal-body').find(
												'.size .bgc').html();
										var Gnum = $(this).parent().siblings(
												'.modal-body').find(
												'.count span').html();
										var Gphoto = $(this).parent().siblings(
												'.modal-body').find(
												'.illustration').attr('src')
												.replace("../", "");
										/* console.log(name1); */
										/* $('.Uid1').val('11');
										$('.Gname1').val('11');
										$('.submit1').click(); */
										$
												.ajax({
													url : "${pageContext.request.contextPath }/orderServlet?method=orderAdd",
													type : "post",
													data : {
														"Uid" : Uid,
														"Gname" : Gname,
														"Gprice" : Gprice,
														"Gsize" : Gsize,
														"Gnum" : Gnum,
														"Gphoto" : Gphoto
													},
													success : function(data) {
														console.log(11);
													}
												})
										swal("购买成功!", "欢迎继续选购!", "success");
										$('.modal').modal('hide');
									} else {
										swal("请选择尺寸", "", "error");
									}
								} else {
									swal("请先登录", "", "error");
								}
							})
			/* 加入购物车 */
			$('.btn-primary')
					.eq(1)
					.click(
							function() {
								if ($('#get').html()) {

									if ($(this).parent()
											.siblings('.modal-body').find(
													'.size span').hasClass(
													'bgc')) {
										var Uid = $('#Uid').html();
										var Gname = $(this).parent().siblings(
												'.modal-body').find(
												'.introduce').html();
										var Gprice = $(this).parent().siblings(
												'.modal-body').find('.unit')
												.html();
										var Gsize = $(this).parent().siblings(
												'.modal-body').find(
												'.size .bgc').html();
										var Gnum = $(this).parent().siblings(
												'.modal-body').find(
												'.count span').html();
										var Gphoto = $(this).parent().siblings(
												'.modal-body').find(
												'.illustration').attr('src')
												.replace("../", "");
										/* console.log(name1); */
										/* $('.Uid1').val('11');
										$('.Gname1').val('11');
										$('.submit1').click(); */
										$
												.ajax({
													url : "${pageContext.request.contextPath }/cartServlet?method=cartAdd",
													type : "post",
													data : {
														"Uid" : Uid,
														"Gname" : Gname,
														"Gprice" : Gprice,
														"Gsize" : Gsize,
														"Gnum" : Gnum,
														"Gphoto" : Gphoto
													},
													success : function(data) {
														console.log(11);
													}
												})
										swal("添加成功!", "欢迎继续选购!", "success");
										$('.modal').modal('hide');
									} else {
										swal("请选择尺寸", "", "error");
									}
								} else {
									swal("请先登录", "", "error");
								}
							})
		</script>
		<script type="text/javascript">
			var arrImg = new Array("appstyle/img/No.5/timg.jpg",
					"appstyle/img/No.6/timg1.jpg", "appstyle//img/3.jpg",
					"appstyle//img/4.jpg");
			var indexImg = 0;
			var intervalNext = window.setInterval("imgCutNext()", 3000);
			$(document).ready(function() {
				// 第一次进入 直接显示第一张图片
				$("#slideshow").css("background", "url(" + arrImg[0] + ")");
				$("#leftpre").click(function() {
					imgCutPrev();
				})
				$("#rightnext").click(function() {
					imgCutNext();
				})
			})

			function imgCutNext() {
				indexImg++;
				if (indexImg == 4) {
					indexImg = 0;
				}
				$("#slideshow").css("background",
						"url(" + arrImg[indexImg] + ")");
			}

			function imgCutPrev() {
				indexImg--;
				if (indexImg == -1) {
					indexImg = 3;
				}
				$("#slideshow").css("background",
						"url(" + arrImg[indexImg] + ")");
			}
			lazyLoadInit({
	            coverColor: "white",
	            //图片距离屏幕底部出现时间点的距离差值（注解：同上，距离顶部）
	            showTime: 300,
	        });
		</script>
</body>
</html>