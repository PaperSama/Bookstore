<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="cmn-Hans">
<head>

<title>登录</title>

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
</head>

<body class="layui-main">
	<h1 class="layui-bg-green">登录</h1>
	<p style="color: red; font-weight: 900" class="layui-bg-red">${msg}</p>
	<br />
	<form class="layui-form" action="<c:url value='/user/login'/>" method="post">
	
		<div class="layui-form-item">
			<label class="layui-form-label">用户名：</label>
			<div class="layui-input-inline">
				<input class="layui-input" type="text" name="username" autofocus="autofocus" />
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">密码：</label>
			<div class="layui-input-inline">
				<input class="layui-input" type="password" name="password" />
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<input class="layui-btn" type="submit" value="登录" />
			</div>
		</div>
	</form>
</body>
<script src="/Bookstore/layui/layui.js"></script>
</html>
