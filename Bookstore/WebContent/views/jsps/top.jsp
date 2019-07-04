<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="cmn-Hans">
  <head>
    <title>top</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	body {
		background: #4682B4; 
	}
	a {
		text-transform:none;
		text-decoration:none;
	} 
	a:hover {
		text-decoration:underline;
	}
</style>
  </head>
  
  <body>
<h1 style="text-align: center;">JAVA1班书店</h1>
<div style="font-size: 10pt;">
		<c:if test="${not empty username}">
			<c:out value="您好，${username}"></c:out>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="<c:url value='cart/list.jsp'/>" target="body">我的购物车</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="<c:url value='/order/list?page=0'/>" target="body">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="<c:url value='/logout'/>" target="_parent">退出</a>
		</c:if>
		<c:if test="${empty username}">
			<c:out value="未登录"></c:out>
		<a href="<c:url value='/login'/>" target="_parent">登录</a> |&nbsp; 
		<a href="<c:url value='/register'/>" target="_parent">注册（未开放）</a>
		</c:if>
		<br/>
</div>
  </body>
</html>
