<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="cmn-Hans">
<head>

<title>注册</title>

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
	<h1 class="layui-bg-green">注册</h1>
	<p style="color: red; font-weight: 900">${msg }</p>
	<form class="layui-form" action="javascript:alert('注册功能已被关闭！');" method="post">
		<div class="layui-form-item">
			<input type="hidden" name="method" value="regist" />
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">用户名：</label>
			<div class="layui-inline">
				<input class="layui-input" type="text" name="username" value="" autofocus="autofocus" autocomplete="off" placeholder="用户名必须独一无二" /><br /> 
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">密码：</label>
			<div class="layui-inline">
				<input class="layui-input" type="password" name="password" autocomplete="off" placeholder="密码必须大于8位" /><br />
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">电子邮箱：</label>
			<div class="layui-inline">
				<input class="layui-input" type="text" name="email" value="" autocomplete="off" placeholder="找回账号的依据" /><br />
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<input class="layui-btn" type="submit" value="注册" />
			</div>
		</div>
	</form>
</body>
<script src="/Bookstore/layui/layui.js"></script>
</html>
