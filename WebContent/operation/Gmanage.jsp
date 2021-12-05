<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entity.*" import="Interface.*"
	import="user.Interface.*" import="merchant.Interface.*"
	import="goods.Interface.*" import="java.util.ArrayList"
	import="java.util.List" import="order.Interface.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
<style>
* {
	margin: 0;
	padding: 0;
}

#add {
	background-color: rgb(56, 61, 75);
	color: white;
	font-size: 18px;
	padding: 10px 10px;
	margin-bottom: 5px;
}

#btn {
	width: 100px;
	height: 30px;
	background-color: #ff2d51;
	color: white;
	border-radius: 5px;
	border: 1px solid #ff2d51;
	margin-left: 5%;
	margin-bottom: 5px;
}

#total {
	display: inline;
	float: right;
	margin-bottom: 5px;
}

#total1 {
	display: inline;
	float: right;
	margin-bottom: 5px;
}

#total2 {
	display: inline;
	float: right;
	margin-right: 5%;
	margin-bottom: 5px;
}

table {
	table-layout: fixed;
	empty-cells: show;
	border-collapse: collapse;
	margin: 0 auto;
	font-size: 12px;
}

td {
	height: 30px;
}

.table {
	border: 1px solid #cad9ea;
	color: #666;
}

.table th {
	background-repeat: repeat-x;
	height: 30px;
	background-color: rgb(150, 150, 150);
	color: rgb(230, 227, 227);
}

.table td, .table th {
	border: 1px solid #cad9ea;
	padding: 0 1em 0;
	text-align: center;
}

.table tr.alter {
	background-color: #f5fafe;
}

.btn {
	width: 60px;
	height: 25px;
}

.btn:hover {
	background-color: #ff2d51;
	color: white;
	border: 2px solid #ff2d51;
}

.show td {
	height: 72px;
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
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"> </script>
</head>

<body>
	<div id="add">商品管理</div>
	<a href="#"><button id="btn">删除所有</button></a>
	<!-- 注：删除所有需要再次确认身份 -->
	<%
		GoodsDaoImpl goodsDaoImpl = new GoodsDaoImpl();
	List<Goods> goodsList = goodsDaoImpl.getAllgoodss();
	OrderDaoImpl orderDaoImpl = new OrderDaoImpl();
	List<Order> orderList = orderDaoImpl.getAllMorders();
	%>
	<div id="total2">个</div>
	<div id="total1"><%=goodsList.size()%></div>
	<div id="total">共有商品：</div>

	<table width="90%" class="table">
		<tr>
			<th>商品名</th>
			<th>商品价格</th>
			<th>商品尺寸</th>
			<th>商品类型</th>
			<th>商品总库存</th>
			<th>样图</th>
			<th>销售量</th>
			<th>商品剩余库存</th>
			<th>操作</th>
		</tr>
		<%
			for (Goods goods : goodsList) {
		%>
		<tr class="show">
			<td class="Gname"><%=goods.getGname()%></td>
			<td><%=goods.getGprice()%></td>
			<td><%=goods.getGsize()%></td>
			<td><%=goods.getGtype()%></td>
			<td><%=goods.getGoitw()%></td>
			<td class="p"><img
				src="../clothing/<%=goods.getGtype()%>/image/<%=goods.getGphoto()%>"
				class="photo"></td>
			<td><%=Integer.parseInt(goods.getGoitw())-Integer.parseInt(goods.getGstock()) %></td>
			<td><%=goods.getGstock()%></td>
			<%-- <%
				if (orderList.size() != 0) {
				int num = 0;
				for (Order order : orderList) {
					num++;
					if (goods.getGname().equals(order.getGname())) {
			%>
			<td><%=order.getGnum()%></td>
			<td><%=(Integer.parseInt(goods.getGoitw()) - Integer.parseInt(order.getGnum()))%></td>
			<%
				break;
			} else if (orderList.size() == num) {
			%>
			<td>0</td>
			<td><%=goods.getGoitw()%></td>
			<%
				}
			}
			} else {
			%>
			<td>0</td>
			<td><%=goods.getGoitw()%></td>
			<%
				}
			%> --%>
			<td><button class="btn btn1">删除</button></td>
		</tr>
		<%
			}
		%>

	</table>
	<script>
	/* 删除所有商品 */
	$('#btn').click(function(){
		console.log(11);
		swal({
	        title: "是否确定删除所有商品",
	        text: "这将无法撤销",
	        icon: "warning",
	        buttons: true,
	        dangerMode: true,
	    })
	        .then((willDelete) => {
	            if (willDelete) {
	            	$.ajax({
						url : "${pageContext.request.contextPath }/GoodsServlet?method=goodsDeleteAll",
						type : "post",
						data : {},
						success : function(data) {
							console.log(11);
						}
					});
	            	$(".show").remove();
					$('#total1').html(0);
	                swal("删除成功", {
	                    icon: "success",
	                })
	            } else {
	                swal("删除失败！！");
	            }
	        });
	})
	
	/* 删除指定商品 */
	$('.btn1').click(function(){
		console.log(11);
	swal({
        title: "是否确定删除所选商品",
        text: "该商品将被删除",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {
            	var Gname = $(this).parents('td').siblings('.Gname').text();
            	$.ajax({
					url : "${pageContext.request.contextPath }/GoodsServlet?method=goodsDelete",
					type : "post",
					data : {
						"Gname" : Gname,
					},
					success : function(data) {
						console.log(11);
					}
				});
            	$(this).parents(".show").remove();
            	$('#total1').html(parseInt($('#total1').html())-1);
                swal("删除成功", {
                    icon: "success",
                })
            } else {
                swal("删除失败！！");
            }
        });
	})
	</script>
</body>

</html>