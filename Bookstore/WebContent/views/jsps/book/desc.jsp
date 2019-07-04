<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="cmn-Hans">
<head>
<title>图书详细</title>

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
body {
	font-size: 10pt;
}

div#d {
	margin: 20px;
	border: solid 2px gray;
	width: 150px;
	height: 150px;
	text-align: center;
}

li {
	margin: 10px;
}

a {
	background: url(< c : url value = '/resource/images/all.png'/ >)
		no-repeat;
	display: inline-block;
	background-position: 0 -70px;
	margin-left: 30px;
	height: 36px;
	width: 146px;
}

a:HOVER {
	background: url(< c : url value = '/resource/images/all.png'/ >)
		no-repeat;
	display: inline-block;
	background-position: 0 -106px;
	margin-left: 30px;
	height: 36px;
	width: 146px;
}
</style>
</head>

<body>
	<div id="d">
		<img src="<c:url value='/resource/book_img/${book.img}.jpg'/>"
			border="0" />
	</div>
	<ul>
		<li>书名：${book.title}</li>
		<li>作者：${book.author}</li>
		<li>单价：${book.price}元</li>
	</ul>
	<form id="form" action="<c:url value='/cart/add'/>" method="post">
		<label class="layui-form-label">购买数量：</label>
		<div class="layui-input-inline">
			<input class="layui-input" type="number" name="count" autofocus="autofocus" required="required" size="3" value="1" min="1" max="99999" />
		</div>
		<label>（请输入1~99999之间的数字）</label><br />
		<input type="hidden" name="id" value="${book.id}"/>
		<input class="layui-btn layui-btn-warm" type="submit" value="购买"/>
	</form>

</body>
</html>
