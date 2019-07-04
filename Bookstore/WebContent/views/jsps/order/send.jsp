<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'send.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	window.location.href = "/Bookstore/${param.url}";
</script>
  </head>
  
  <body>
${param.url}
<br />
${pageContext.request.queryString}     取得请求的参数字符串
<br />
${pageContext.request.requestURL}      取得请求的URL，但不包括请求之参数字符串
<br />
${pageContext.request.contextPath}     服务的web application 的名称
<br />
${pageContext.request.method}          取得HTTP 的方法(GET、POST)
<br />
${pageContext.request.protocol}        取得使用的协议(HTTP/1.1、HTTP/1.0)
<br />
${pageContext.request.remoteUser}      取得用户名称
<br />
${pageContext.request.remoteAddr}      取得用户的IP 地址
<br />
${pageContext.session.id}              取得session 的ID
<br />
${pageContext.servletContext.serverInfo}  取得主机端的服务信息
<br />
还有一个 ${header}  这个也很好玩的
  </body>
</html>
