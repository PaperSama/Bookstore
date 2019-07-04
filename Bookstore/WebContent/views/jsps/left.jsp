<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="cmn-Hans">
<head>
<title>left</title>
<base target="body" />
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
* {
	font-size: 10pt;
	text-align: center;
}

div {
	background: #87CEFA;
	margin: 3px;
	padding: 3px;
}

a {
	text-decoration: none;
}
</style>
</head>

<body>
	<div id="div-all">
		<a href="<c:url value='/book/all'/>">全部分类</a>
	</div>
	<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$.getJSON("/Bookstore/get/cls", function(result) {
				$.each(result, function(i, field) {
					$("#div-all").after("<div id=\"div-" + JSON.stringify(field.id) + "\"></div>");
					$("#div-" + JSON.stringify(field.id)).append("<a href='/Bookstore/book/" 
							+ JSON.stringify(field.id) + "'>"+JSON.stringify(field.cls)+"</a>");
				});
			});
		});
	</script>
</body>
</html>
