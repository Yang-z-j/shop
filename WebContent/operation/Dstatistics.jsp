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
<title>Insert title here</title>
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
	margin-bottom: 5px;
}

.box {
	margin: 0 auto; 
	width : 1273px;
	height: 578px;
	width: 1273px;
}
</style>
<script src="../js/echarts.min.js"></script>
<script src="../js/jquery.min.js"></script>
</head>
<script>
	$(function() {
		var myChart = echarts.init(document.querySelector('.box'));
		var option = {
			//标题
			title : {
				text : '折线图堆叠'
			},
			// 提示框组件
			tooltip : {
				// 坐标轴触发
				trigger : 'axis'
			},
			// 图例组件
			legend : {
				// 图例的数据数组
				data : [ '衬衫', '短袖', '长裤', '棉袄', '鞋帽', '卫衣', '短裤' ]
			},
			// 直角坐标系内绘图网格
			grid : {
				// 组件离容器的距离
				left : '3%',
				right : '4%',
				bottom : '3%',
				// grid 区域是否包含坐标轴的刻度标签
				containLabel : true
			},
			// 工具栏
			toolbox : {
				feature : {
					// 保存为图片
					saveAsImage : {}
				}
			},
			// 直角坐标系 grid 中的 x 轴
			xAxis : {
				// 坐标轴类型'category' 类目轴
				type : 'category',
				// 坐标轴两边留白策略
				boundaryGap : false,
				// 类目数据，在类目轴（type: 'category'）中有效
				data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
			},
			yAxis : {
				// 'value' 数值轴
				type : 'value'
			},
			// 调色盘颜色列表
			color : [ 'yellow', 'red', 'blue', 'green', 'skyblue', 'pink', 'purple' ],
			// 系列列表
			series : [ {
				// 系列名称
				name : '衬衫',
				// 类型 line 折线
				type : 'line',
				// 数据堆叠
				stack : '总量1',
				// 系列中的数据内容数组
				data : [ 120, 132, 101, 134, 90, 230, 210 ]
			}, {
				name : '短袖',
				type : 'line',
				stack : '总量2',
				data : [ 220, 182, 191, 234, 290, 360, 310 ]
			}, {
				name : '长裤',
				type : 'line',
				stack : '总量3',
				data : [ 150, 232, 201, 154, 190, 330, 410 ]
			}, {
				name : '棉袄',
				type : 'line',
				stack : '总量4',
				data : [ 320, 332, 301, 334, 390, 420, 320 ]
			}, {
				name : '鞋帽',
				type : 'line',
				stack : '总量5',
				data : [ 820, 932, 901, 934, 1290, 1330, 1320 ]
			}, {
				name : '卫衣',
				type : 'line',
				stack : '总量6',
				data : [ 960, 520, 601, 434, 1200, 1130, 1480 ]
			}, {
				name : '短裤',
				type : 'line',
				stack : '总量7',
				data : [ 866, 632, 701, 734, 690, 930, 1020 ]
			} ]
		};
		myChart.setOption(option);
	})
</script>
<body>
	<div id="add">数据统计</div>
	<div class="box"></div>
</body>
</html>