<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entity.*" import="Interface.*"
	import="user.Interface.*" import="merchant.Interface.*"
	import="goods.Interface.*" import="java.util.ArrayList"
	import="java.util.List" import="cart.Interface.*"
	import="java.text.DecimalFormat"
	import="java.io.UnsupportedEncodingException"
	import="java.net.URLDecoder"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
<script src="../js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="../css/shop/base.css">
<!-- 引入公共样式的css 文件 -->
<link rel="stylesheet" href="../css/shop/common.css">
<!-- 引入car css -->
<link rel="stylesheet" href="../css/shop/car.css">
<!-- 先引入jquery  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"> </script>
<link rel="stylesheet"
	href="../bootstrap-4.6.0-dist/css/bootstrap.min.css">
<script src="../bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/alone/cart.css">
</head>
<style>
.btn {
    float: left;
    width: 92px;
    height: 36px;
    background-color: #b1191a;
    border: 0;
    font-size: 16px;
    color: #fff;
}

a{
	text-decoration:none!important;
}

.login a:hover {
    color: #66CCFF;
}
</style>
<body>
	<%
		CartDaoImpl cartDaoImpl = new CartDaoImpl();
	List<Cart> cartList = cartDaoImpl.getAllcarts();
	GoodsDaoImpl goodsDaoImpl = new GoodsDaoImpl();
	List<Goods> goodsList = goodsDaoImpl.getAllgoodss();
	UserDaoImpl userDaoImpl = new UserDaoImpl();
	List<User> userList = userDaoImpl.getAllusers();
	DecimalFormat df = new DecimalFormat("#.00");
	/* 获取url参数值 */
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
			+ request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/") + 1);
	if (request.getQueryString() != null) {
		url += "?" + request.getQueryString();
	}
	String name = "";
	if (request.getQueryString() != null) {
		try {
			name = URLDecoder.decode(request.getQueryString(), "utf-8");//将中文转码
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	name = name.substring(6);
	String temp[];
	temp = name.split("&Uid=");
	name = temp[0];
	String id = "";
	id = temp[1];
	System.out.println("URL参数：" + name);
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
					<li class="li1"><a href="../index.jsp?Uname=<%=name%>&Uid=<%=id%>" class="a1">&lt;&lt;&ensp;返回首页
					</a></li>
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
				alert("请先登录");
			}
		})
	</script>
	<div id="listBody">
		<div id="body">
			<!-- logo直接使用文字替代 -->
			<a class="logo" href="../index.jsp?Uname=<%=name%>&Uid=<%=id%>">爱淘商城</a>
			<!-- js返回上一个页面 -->
			<!-- <script>
				$('#body>a').click(function() {
					window.history.back();
				})
			</script> -->
			<!-- <div id="body-1">
				<input id="serach_Input" class="textinput" type="text"
					placeholder=请输入商品名称 /><a id="serach_Btn" class="button1" href="#">搜索</a>
			</div> -->
		</div>
	</div>
	<div id="center">
		<div class="c-container">
			<div class="w">
				<div class="cart-filter-bar">
					<em>我的购物车</em>
				</div>
				<!-- 购物车主要核心区域 -->
				<div class="cart-warp">
					<!-- 头部全选模块 -->
					<div class="cart-thead">
						<div class="t-checkbox">
							<input type="checkbox" name="" id="" class="checkall"> 全选
						</div>
						<div class="t-goods">商品</div>
						<div class="t-size">尺寸</div>
						<div class="t-price">单价</div>
						<div class="t-num">数量</div>
						<div class="t-sum">小计</div>
						<div class="t-action">操作</div>
					</div>
					<!-- 商品详细模块 -->

					<div class="cart-item-list">
						<%
							for (int i = 0; i < cartList.size(); i++) {
							String Uid = cartList.get(i).getUid();
							if (Uid.equals(id)) {
						%>
						<div class="cart-item">
							<div class="p-checkbox">
								<input type="checkbox" name="" id="" class="j-checkbox">
							</div>
							<div class="p-goods">
								<div class="p-img">
									<img src="../<%=cartList.get(i).getGphoto()%>" alt="">
								</div>
								<div class="p-msg"><%=cartList.get(i).getGname()%></div>
							</div>
							<div class="p-size"><%=cartList.get(i).getGsize()%></div>
							<div class="p-price">￥<%=cartList.get(i).getGprice()%></div>
							<div class="p-num">
								<div class="quantity-form">
									<a href="javascript:;" class="decrement">-</a> <input
										type="text" class="itxt"
										value="<%=cartList.get(i).getGnum()%>"> <a
										href="javascript:;" class="increment">+</a>
								</div>
							</div>
							<div class="p-sum">￥<%=df.format(Float.parseFloat(cartList.get(i).getGprice()) * Float.parseFloat(cartList.get(i).getGnum()))%></div>
							<div class="p-action">
								<a href="javascript:;">删除</a>
							</div>
						</div>
						<%
							}
						}
						%>
					</div>
					<!-- 结算模块 -->
					<div class="cart-floatbar">
						<div class="select-all">
							<input type="checkbox" name="" id="" class="checkall">全选
						</div>
						<div class="operation">
							<a href="javascript:;" class="remove-batch"> 删除选中的商品</a> <a
								href="javascript:;" class="clear-all">清理购物车</a>
						</div>
						<div class="toolbar-right">
							<div class="amount-sum">
								已经选<em>1</em>件商品
							</div>
							<div class="price-sum">
								总价： <em>￥1000</em>
							</div>
							<div class="btn-area">去结算</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div id="buttom">
		<div class="buttom_center">
			<dl class="w">
				<dt>购物指南</dt>
				<dd>
					<a href="#">购物流程 </a>
				</dd>
				<dd>
					<a href="#">会员介绍 </a>
				</dd>
				<dd>
					<a href="#">生活旅行/团购 </a>
				</dd>
				<dd>
					<a href="#">常见问题 </a>
				</dd>
				<dd>
					<a href="#">联系客服 </a>
				</dd>
			</dl>
			<dl class="w">
				<dt>购物指南</dt>
				<dd>
					<a href="#">购物流程 </a>
				</dd>
				<dd>
					<a href="#">会员介绍 </a>
				</dd>
				<dd>
					<a href="#">生活旅行/团购 </a>
				</dd>
				<dd>
					<a href="#">常见问题 </a>
				</dd>
				<dd>
					<a href="#">联系客服 </a>
				</dd>
			</dl>
			<dl class="w">
				<dt>购物指南</dt>
				<dd>
					<a href="#">购物流程 </a>
				</dd>
				<dd>
					<a href="#">会员介绍 </a>
				</dd>
				<dd>
					<a href="#">生活旅行/团购 </a>
				</dd>
				<dd>
					<a href="#">常见问题 </a>
				</dd>
				<dd>
					<a href="#">联系客服 </a>
				</dd>
			</dl>
			<dl class="w">
				<dt>购物指南</dt>
				<dd>
					<a href="#">购物流程 </a>
				</dd>
				<dd>
					<a href="#">会员介绍 </a>
				</dd>
				<dd>
					<a href="#">生活旅行/团购 </a>
				</dd>
				<dd>
					<a href="#">常见问题 </a>
				</dd>

				<dd>
					<a href="#">联系客服 </a>
				</dd>
			</dl>

		</div>
	</div>
	<script>
		$(function() {
			// 1. 全选 全不选功能模块
			// 就是把全选按钮（checkall）的状态赋值给 三个小的按钮（j-checkbox）就可以了
			// 事件可以使用change
			$(".checkall").change(
					function() {
						// console.log($(this).prop("checked"));
						$(".j-checkbox, .checkall").prop("checked",
								$(this).prop("checked"));
						if ($(this).prop("checked")) {
							// 让所有的商品添加 check-cart-item 类名
							$(".cart-item").addClass("check-cart-item");
						} else {
							// check-cart-item 移除
							$(".cart-item").removeClass("check-cart-item");
						}
						getSum();
					});
			// 2. 如果小复选框被选中的个数等于3 就应该把全选按钮选上，否则全选按钮不选。
			$(".j-checkbox")
					.change(
							function() {
								// if(被选中的小的复选框的个数 === 3) {
								//     就要选中全选按钮
								// } else {
								//     不要选中全选按钮
								// }
								// console.log($(".j-checkbox:checked").length);
								// $(".j-checkbox").length 这个是所有的小复选框的个数
								if ($(".j-checkbox:checked").length === $(".j-checkbox").length) {
									$(".checkall").prop("checked", true);
								} else {
									$(".checkall").prop("checked", false);
								}
								if ($(this).prop("checked")) {
									// 让当前的商品添加 check-cart-item 类名
									$(this).parents(".cart-item").addClass(
											"check-cart-item");
								} else {
									// check-cart-item 移除
									$(this).parents(".cart-item").removeClass(
											"check-cart-item");
								}
								getSum();
							});
			// 3. 增减商品数量模块 首先声明一个变量，当我们点击+号（increment），就让这个值++，然后赋值给文本框。
			$(".increment").click(function() {
				// 得到当前兄弟文本框的值
				var n = $(this).siblings(".itxt").val();
				// console.log(n);
				n++;
				$(this).siblings(".itxt").val(n);
				// 3. 计算小计模块 根据文本框的值 乘以 当前商品的价格  就是 商品的小计
				// 当前商品的价格 p  
				var p = $(this).parents(".p-num").siblings(".p-price").html();
				// console.log(p);
				p = p.substr(1);
				console.log(p);
				var price = (p * n).toFixed(2);
				// 小计模块 
				// toFixed(2) 可以让我们保留2位小数
				$(this).parents(".p-num").siblings(".p-sum").html("￥" + price);
				var Uid = $('#Uid').html();
				var Gname = $(this).parents(".p-num").siblings(".p-goods").find('.p-msg').html();
				$.ajax({
					url : "${pageContext.request.contextPath }/cartServlet?method=cartUpdate",
					type : "post",
					data : {
						"Uid":Uid,
						"Gname":Gname,
						"Gnum":n
					},
					success : function(data) {
						console.log(11);
					}
				});
				getSum();
			});
			// --
			$(".decrement").click(
					function() {
						// 得到当前兄弟文本框的值
						var n = $(this).siblings(".itxt").val();
						if (n == 1) {
							return false;
						}
						// console.log(n);
						n--;
						$(this).siblings(".itxt").val(n);
						// var p = $(this).parent().parent().siblings(".p-price").html();
						// parents(".p-num") 返回指定的祖先元素
						var p = $(this).parents(".p-num").siblings(".p-price")
								.html();
						// console.log(p);
						p = p.substr(1);
						console.log(p);
						// 小计模块 
						$(this).parents(".p-num").siblings(".p-sum").html(
								"￥" + (p * n).toFixed(2));
						var Uid = $('#Uid').html();
						var Gname = $(this).parents(".p-num").siblings(".p-goods").find('.p-msg').html();
						$.ajax({
							url : "${pageContext.request.contextPath }/cartServlet?method=cartUpdate",
							type : "post",
							data : {
								"Uid":Uid,
								"Gname":Gname,
								"Gnum":n
							},
							success : function(data) {
								console.log(11);
							}
						});
						getSum();
					});
			//  4. 用户修改文本框的值 计算 小计模块  
			$(".itxt").change(
					function() {
						// 先得到文本框的里面的值 乘以 当前商品的单价 
						var n = $(this).val();
						// 当前商品的单价
						var p = $(this).parents(".p-num").siblings(".p-price")
								.html();
						// console.log(p);
						p = p.substr(1);
						$(this).parents(".p-num").siblings(".p-sum").html(
								"￥" + (p * n).toFixed(2));
						getSum();
					});
			// 5. 计算总计和总额模块
			getSum();

			function getSum() {

				var count = 0; // 计算总件数 
				var money = 0; // 计算总价钱
				$(".itxt").each(
						function(i, ele) {
							if ($(this).parents('.p-num').siblings(
									'.p-checkbox').find('.j-checkbox').prop(
									"checked")) {
								count += parseInt($(ele).val());
							}
						});
				$(".amount-sum em").text(count);
				$(".p-sum").each(
						function(i, ele) {
							if ($(this).siblings('.p-checkbox').find(
									'.j-checkbox').prop("checked")) {
								money += parseFloat($(ele).text().substr(1));
							}
						});
				$(".price-sum em").text("￥" + money.toFixed(2));

			}
			// 6. 删除商品模块
			// (1) 商品后面的删除按钮
			$(".p-action a").click(function() {
				// 删除的是当前的商品 
				swal({
			        title: "是否确定删除所选商品",
			        text: "这将无法撤销",
			        icon: "warning",
			        buttons: true,
			        dangerMode: true,
			    })
			        .then((willDelete) => {
			            if (willDelete) {
			            	var Uid = $('#Uid').html();
			            	var Gname = $(this).parents(".cart-item").find('.p-msg').html();
			            	$.ajax({
								url : "${pageContext.request.contextPath }/cartServlet?method=cartDelete",
								type : "post",
								data : {
									"Uid": Uid,
									"Gname":Gname
								},
								success : function(data) {
									console.log(11);
								}
							});
			            	$(this).parents(".cart-item").remove();
							getSum();
			                swal("删除成功", {
			                    icon: "success",
			                })
			            } else {
			                swal("删除失败！！");
			            }
			        });
			});
			// (2) 删除选中的商品
			$(".remove-batch").click(function() {
				if($(".j-checkbox:checked").length != 0){
				// 删除的是小的复选框选中的商品
				swal({
			        title: "是否确定删除所选商品",
			        text: "这将无法撤销",
			        icon: "warning",
			        buttons: true,
			        dangerMode: true,
			    })
			        .then((willDelete) => {
			            if (willDelete) {
			            	console.log("选中"+$(".j-checkbox:checked").length);
			            	for(var i = 0;i<$(".j-checkbox:checked").length;i++){
			            		var Uid = $('#Uid').html();
			            		var Gname = $(".j-checkbox:checked").eq(i).parents(".cart-item").find('.p-msg').html();
			            		console.log(Gname);
			            		$.ajax({
									url : "${pageContext.request.contextPath }/cartServlet?method=cartDelete",
									type : "post",
									data : {
										"Uid": Uid,
										"Gname":Gname
									},
									success : function(data) {
										console.log(11);
									}
								});
			            	}
			            	$(".j-checkbox:checked").parents(".cart-item").remove();
							getSum();
			                swal("删除成功", {
			                    icon: "success",
			                })
			            } else {
			                swal("删除失败！！");
			            }
			        });
				} else {
					swal("请选择要删除的商品", "", "error");
				}
			});
			// (3) 清空购物车 删除全部商品
			$(".clear-all").click(function() {
				swal({
			        title: "是否确定删除所有商品",
			        text: "这将无法撤销",
			        icon: "warning",
			        buttons: true,
			        dangerMode: true,
			    })
			        .then((willDelete) => {
			            if (willDelete) {
			            	var Uid = $('#Uid').html();
		            		$.ajax({
								url : "${pageContext.request.contextPath }/cartServlet?method=cartDeleteAll",
								type : "post",
								data : {
									"Uid": Uid
								},
								success : function(data) {
									console.log(11);
								}
							});
			            	$(".cart-item").remove();
							getSum();
			                swal("删除成功", {
			                    icon: "success",
			                })
			            } else {
			                swal("删除失败！！");
			            }
			        });
			});
			//加入订单
			$('.btn-area').click(function(){
				if($(".j-checkbox:checked").length != 0){
					swal({
				        title: "是否确定购买所选商品",
				        text: "请确认你的订单",
				        icon: "warning",
				        buttons: true,
				        dangerMode: true,
				    })
				        .then((willDelete) => {
				            if (willDelete) {
						for(var i = 0;i<$(".j-checkbox:checked").length;i++){
							var Uid = $('#Uid').html();
		            		var Gname = $(".j-checkbox:checked").eq(i).parents(".cart-item").find('.p-msg').html();
		            		var Gprice = $(".j-checkbox:checked").eq(i).parents(".cart-item").find('.p-price').html().replace('￥','');
		            		var Gsize = $(".j-checkbox:checked").eq(i).parents(".cart-item").find('.p-size').html();
		            		var Gnum = $(".j-checkbox:checked").eq(i).parents(".cart-item").find('.itxt').val();
		            		var Gphoto = $(".j-checkbox:checked").eq(i).parents(".cart-item").find('.p-img img').attr('src').replace('../','');
		            		console.log(Gname);
		            		console.log(Gprice);
		            		console.log(Gphoto);
		            		$.ajax({
								url : "${pageContext.request.contextPath }/orderServlet?method=orderAdd",
								type : "post",
								data : {
									"Uid":Uid,
									"Gname":Gname,
									"Gprice":Gprice,
									"Gsize":Gsize,
									"Gnum":Gnum,
									"Gphoto":Gphoto
								},
								success : function(data) {
									console.log(11);
								}
							});
		            		$.ajax({
								url : "${pageContext.request.contextPath }/cartServlet?method=cartDelete",
								type : "post",
								data : {
									"Uid":Uid,
									"Gname":Gname
								},
								success : function(data) {
									console.log(11);
								}
							});
		            	}
        		$(".j-checkbox:checked").parents(".cart-item").remove();
        		$('.amount-sum em').html(0);
        		$('.price-sum em').html('￥0.00');
        		swal("购买成功", {
                    icon: "success",
                })
	            } else {
	                swal("购买失败！！");
	            }
				        });
			} else {
				swal("请选择要购买的商品", "", "error");
			}
		});
		})
	</script>
</body>

</html>