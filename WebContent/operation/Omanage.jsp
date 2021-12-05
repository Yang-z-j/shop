<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entity.*" import="Interface.*"
	import="user.Interface.*" import="merchant.Interface.*"
	import="goods.Interface.*" import="java.util.ArrayList"
	import="java.util.List" import="order.Interface.*"
	import="java.text.DecimalFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	border-bottom: 3px solid #bfd3eb;
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
	text-align: center;
}

.table tr.alter {
	background-color: #f5fafe;
}

tr td div {
	width: 100%;
	height: 100%;
	line-height: 100px;
	color: white;
	font-size: 16px;
	background-color: #f05654;
	cursor: default;
	cursor: pointer;
}

tr td div:hover {
	font-size: 20px;
}

img {
	width: 100px;
	height: 100px;
}

tr {
	font-size: 15px;
}
</style>
</head>

<body>
	<div id="add">订单管理</div>
	<table width="90%" class="table">
		<tr class="first">
			<th>订单编号</th>
			<th>商品名</th>
			<th>商品图</th>
			<th>尺码</th>
			<th>数量</th>
			<th>商品价格</th>
			<th>收货人</th>
			<th>收货地址</th>
			<th>用户电话</th>
			<th>发货状态</th>
		</tr>
		<%
			OrderDaoImpl orderDaolmpl = new OrderDaoImpl();
		List<Order> orderList = orderDaolmpl.getAllMorders();
		DecimalFormat df = new DecimalFormat("#.00");
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		for (int i = 0; i < orderList.size(); i++) {
			User user = userDaoImpl.selectUserByUid(orderList.get(i).getUid());
		%>
		<tr>
			<td>20211000<%=i+1%></td>
			<td class="Gname"><%=orderList.get(i).getGname()%></td>
			<td><img src="../<%=orderList.get(i).getGphoto()%>"></td>
			<td><%=orderList.get(i).getGsize()%></td>
			<td><%=orderList.get(i).getGnum()%></td>
			<td>￥<%=df.format(Float.parseFloat(orderList.get(i).getGprice()) * Float.parseFloat(orderList.get(i).getGnum()))%></td>
			<td><%=orderList.get(i).getUid()%></td>
			<td><%=user.getUaddress()%></td>
			<td><%=user.getUphone()%></td>
			<td><div><%=orderList.get(i).getGstate()%></div></td>
		</tr>
		<%
			}
		%>
	</table>
	<script src="../js/jquery-3.3.1.js">
		
	</script>
	<script>
		$(function() {
			$('tr td div').each(function(i,e){
				if($(this).text()==='已发货'){
					$(this).css("background", "#21a675");
				}
			})
			$('tr td div').click(
					function() {
						// $(this).replaceWith("<div>已发货</div>");
						if ($(this).text() == "已发货") {
							return;
						} else {
							swal({
								title : "确定发货",
								text : "确定发货",
								icon : "warning",
								buttons : true,
								dangerMode : true,
							}).then((willDelete)=>{
										if (willDelete) {
											$(this).text('已发货'), $(this).css(
													"background", "#21a675"),
													swal("发货成功", {
														icon : "success",
													})
										}
										var Gname = $(this).parent('td').siblings('.Gname').text();
										var Gstate = $(this).text();
										$
										.ajax({
											url : "${pageContext.request.contextPath }/orderServlet?method=orderUpdate",
											type : "post",
											data : {
												"Gname" : Gname,
												"Gstate" : Gstate
											},
											success : function(data) {
												console.log(11);
											}
										})
							});
						}
					})
		})
	</script>
</body>
</html>