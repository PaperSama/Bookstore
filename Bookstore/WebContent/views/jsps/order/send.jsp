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
${pageContext.request.queryString}     ȡ������Ĳ����ַ���
<br />
${pageContext.request.requestURL}      ȡ�������URL��������������֮�����ַ���
<br />
${pageContext.request.contextPath}     �����web application ������
<br />
${pageContext.request.method}          ȡ��HTTP �ķ���(GET��POST)
<br />
${pageContext.request.protocol}        ȡ��ʹ�õ�Э��(HTTP/1.1��HTTP/1.0)
<br />
${pageContext.request.remoteUser}      ȡ���û�����
<br />
${pageContext.request.remoteAddr}      ȡ���û���IP ��ַ
<br />
${pageContext.session.id}              ȡ��session ��ID
<br />
${pageContext.servletContext.serverInfo}  ȡ�������˵ķ�����Ϣ
<br />
����һ�� ${header}  ���Ҳ�ܺ����
  </body>
</html>
