<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="cmn-Hans">
<head>
<title>My JSP 'msg.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<c:if test="${not empty login}">
		<a href="/Bookstore/login" target="_parent"><c:out value="${login}"></c:out></a>
	</c:if>
	<c:if test="${empty login}">
	<h1>${msg}</h1>
	<ul>
		<c:forEach items="${links}" var="link">
			<li>${link}</li>
		</c:forEach>
	</ul>
	</c:if>
</body>
</html>
