<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entity.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>用户信息</h1>
	<a href="${pageContext.request.contextPath }/userLogin/userLogin.jsp"
		class="a1">返回首页</a>
	<table border="1">
		<tr>
			<td>ID</td>
			<td>姓名</td>
			<td>性别</td>
			<td>专业</td>
			<td>操作</td>
		</tr>
		<c:forEach var="stu" items="${userList }">
			<tr>
				<td>${stu.stuid }</td>
				<td>${stu.stuname }</td>
				<td>${stu.stusex }</td>
				<td>${stu.stumajor }</td>
				<td><a
					href="${pageContext.request.contextPath }/userServlet?method=delete&id=${stu.stuid }"
					onclick="return check(${stu.stuid })">删除</a>&ensp;<a
					href="${pageContext.request.contextPath }/userServlet?method=selectUserBySid&id=${stu.stuid }">修改</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>