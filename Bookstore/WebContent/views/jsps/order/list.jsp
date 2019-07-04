<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="cmn-Hans">
<head>
<title>订单列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="/Bookstore/layui/css/layui.css">

<style type="text/css">
* {
	font-size: 11pt;
}

.div {
	border: solid 2px gray;
	width: 75px;
	height: 75px;
	text-align: center;
}

li {
	margin: 10px;
}

#buy {
	background: url(< c : url value = '/images/all.png'/ >) no-repeat;
	display: inline-block;
	background-position: 0 -902px;
	margin-left: 30px;
	height: 36px;
	width: 146px;
}

#buy:HOVER {
	background: url(< c : url value = '/images/all.png'/ >) no-repeat;
	display: inline-block;
	background-position: 0 -938px;
	margin-left: 30px;
	height: 36px;
	width: 146px;
}
</style>
</head>

<body>
	<h1>我的订单</h1>

	<table border="1" style="width: 100%">
		<c:if test="${not empty orderList}">
			<c:forEach var="order" items="${orderList}" begin="${(param.page)*10}" end="${(param.page+1)*10-1}">
				<c:if test="${order.hide eq false}">
					<tr bgcolor="gray" bordercolor="gray">
						<td colspan="6">
							订单编号：${order.id} 
							创建时间：${order.createtime} 
							金额：<font color="red"><b><fmt:formatNumber value="${order.total}" pattern="0.00" /></b></font> 
							<c:choose>
								<c:when test="${order.status eq 0}">
									<a href="<c:url value='/order/pay/${order.id}'/>">付款</a>
								</c:when>
								<c:when test="${order.status eq 1}">
									等待发货
								</c:when>
								<c:when test="${order.status eq 2}">
									<a href="javascript:alert('已确认收货！');">确认收货</a>
								</c:when>
								<c:when test="${order.status eq 3}">
									订单结束
								</c:when>
							</c:choose>
						</td>
					</tr>
					<c:forEach var="bookAndOrder" items="${bookAndOrderList}">
						<c:if test="${bookAndOrder.orderid eq order.id}">
							<tr bordercolor="gray" align="center">
								<td width="15%">
									<div class="div-img">
										<img src="<c:url value='/resource/book_img/${bookList[bookAndOrder.bookid-1].img}.jpg'/>" height="75" />
									</div>
								</td>
								<td>书名：${bookList[bookAndOrder.bookid-1].title}</td>
								<td>单价：<fmt:formatNumber value="${bookList[bookAndOrder.bookid-1].price}" pattern="0.00"/>元</td>
								<td>作者：${bookList[bookAndOrder.bookid-1].author}</td>
								<td>数量：${bookAndOrder.booknumber}</td>
								<td>小计：<fmt:formatNumber value="${bookList[bookAndOrder.bookid-1].price * bookAndOrder.booknumber}" pattern="0.00" />元</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${empty orderList}">
			你没有任何订单，去购物<a href="/Bookstore/book/all">去购物</a>
		</c:if>
	</table>
	<div id="page" style="text-align: center;">
		<c:set var="pageMax" value="${orderList.size()/10+0.49}" scope="request"></c:set>
		<c:set var="pageNow" value="${param.page}" scope="request"></c:set>
		<div>
			第 ${pageNow+1} 页 / 共 <fmt:formatNumber value="${pageMax}" pattern="#0" /> 页<br />
			<c:if test="${pageNow ge 4}">
				<a href="/Bookstore/order/list?page=0"><button class="layui-btn layui-btn-primary">1</button></a>
				<c:if test="${pageNow ne 4}">...</c:if>
			</c:if>
			<c:if test="${pageNow-3 ge 0}">
				<a href="/Bookstore/order/list?page=${pageNow-3}"><button class="layui-btn layui-btn-primary">${pageNow-2}</button></a>
			</c:if>
			<c:if test="${pageNow-2 ge 0}">
				<a href="/Bookstore/order/list?page=${pageNow-2}"><button class="layui-btn layui-btn-primary">${pageNow-1}</button></a>
			</c:if>
			<c:if test="${pageNow-1 ge 0}">
				<a href="/Bookstore/order/list?page=${pageNow-1}"><button class="layui-btn layui-btn-primary">${pageNow}</button></a>				
			</c:if>
			<c:if test="${pageNow+1 lt pageMax}">
				<a href="/Bookstore/order/list?page=${pageNow}"><button class="layui-btn">${pageNow+1}</button></a>
			</c:if>
			<c:if test="${pageNow+2 lt pageMax}">
				<a href="/Bookstore/order/list?page=${pageNow+1}"><button class="layui-btn layui-btn-primary">${pageNow+2}</button></a>
			</c:if>
			<c:if test="${pageNow+3 lt pageMax}">
				<a href="/Bookstore/order/list?page=${pageNow+2}"><button class="layui-btn layui-btn-primary">${pageNow+3}</button></a>
			</c:if>
			<c:if test="${pageNow+4 lt pageMax}">
				<a href="/Bookstore/order/list?page=${pageNow+3}"><button class="layui-btn layui-btn-primary">${pageNow+4}</button></a>
			</c:if>
			<c:if test="${pageMax-pageNow ge 5}">
				<c:if test="${pageMax-pageNow gt 6}">...</c:if>
				<a href="/Bookstore/order/list?page=<fmt:formatNumber value="${pageMax-1}" pattern="#0" />"><button class="layui-btn layui-btn-primary"><fmt:formatNumber value="${pageMax}" pattern="#0" /></button></a>
			</c:if>
		</div>
	</div>
</body>
</html>
