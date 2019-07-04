<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="cmn-Hans">
  <head>
    <title>购物车列表</title>
    
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
	div {
		margin:20px;
		border: solid 2px gray;
		width: 150px;
		height: 150px;
		text-align: center;
	}
	li {
		margin: 10px;
	}
	/*
	#buy {
		background: url(<c:url value='/images/all.png'/>) no-repeat;
		display: inline-block;
		
		background-position: 0 -902px;
		margin-left: 30px;
		height: 36px;
		width: 146px;
	}
	#buy:HOVER {
		background: url(<c:url value='/images/all.png'/>) no-repeat;
		display: inline-block;
		
		background-position: 0 -938px;
		margin-left: 30px;
		height: 36px;
		width: 146px;
	}
	*/
</style>
  </head>
  
  <body>
<h1>购物车</h1>

<table border="1" style="width: 100%;">
	<c:if test="${empty cart}">
		你的购物车空空如也，<a href="/Bookstore/book/all">去购物</a>
	</c:if>
	<c:if test="${not empty cart}">
	<tr>
		<td colspan="7" align="right" style="font-size: 15pt; font-weight: 900">
			<a href="/Bookstore/cart/deleteAll">清空购物车</a>
		</td>
	</tr>
	<tr>
		<th>图片</th>
		<th>书名</th>
		<th>作者</th>
		<th>单价</th>
		<th>数量</th>
		<th>小计</th>
		<th>操作</th>
	</tr>
	<c:forEach var="item" varStatus="status" items="${cart}">
		<tr>
			<td><div><img src="<c:url value='/resource/book_img/${item.book.img}.jpg'/>"/></div></td>
			<td>${item.book.title}</td>
			<td>${item.book.author}</td>
			<td>${item.book.price}元</td>
			<td>${item.number}</td>
			<td><fmt:formatNumber value="${item.book.price*item.number}" pattern="0.00"/>元</td>
			<td><a href="/Bookstore/cart/delete/${status.index}">删除</a></td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="7" align="right" style="font-size: 15pt; font-weight: 900">
			合计：<fmt:formatNumber value="${total}" pattern="0.00"/> 元
		</td>
	</tr>
	<tr>
		<td colspan="7" align="right" style="font-size: 15pt; font-weight: 900">
			<a id="buy" href="<c:url value='/views/jsps/order/send.jsp?url=/order/add'/>">
				<button class="layui-btn layui-btn-warm layui-btn-sm">支付</button>
			</a>
		</td>
	</tr>
	</c:if>
</table>
  </body>
</html>
