<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="cmn-Hans">
<head>

<title>Bookstore - 书城</title>

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
}

body {
	text-align: center;
}

.table {
	width: 1024px;
	height: 100%;
	border: 1px solid gray; /*固定边框,1像素*/
	border-collapse: collapse; /*单线的列表边框*/
}

.table td {
	border: 1px solid gray; /*固定边框,1像素*/
}

iframe {
	width: 100%;
	height: 100%;
}
</style>
</head>

<body>
	<table class="table" style="margin:auto;">
		<tr style="background: #4682B4; height: 120px;">
			<td colspan="2" align="center">
				<iframe style="border:0;" src="<c:url value='/views/jsps/top.jsp'/>" name="top"></iframe>
			</td>
		</tr>
		<tr>
			<td width="120" style="padding: 5px;" align="center" valign="top" height="620">
				<iframe style="border:0;" width="120" src="<c:url value='/views/jsps/left.jsp'/>" name="left"></iframe>
			</td>
			<td>
				<iframe style="border:0;" src="<c:url value='/views/jsps/body.jsp'/>" name="body"></iframe>
			</td>
		</tr>
	</table>
</body>
</html>
