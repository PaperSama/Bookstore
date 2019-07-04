<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="cmn-Hans">
  <head>
    <title>订单详细</title>
    
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
		border: solid 2px gray;
		width: 75px;
		height: 75px;
		text-align: center;
	}
	li {
		margin: 10px;
	}
	
	#pay {
		background: url(<c:url value='/images/all.png'/>) no-repeat;
		display: inline-block;
		
		background-position: 0 -412px;
		margin-left: 30px;
		height: 36px;
		width: 146px;
	}
	#pay:HOVER {
		background: url(<c:url value='/images/all.png'/>) no-repeat;
		display: inline-block;
		
		background-position: 0 -448px;
		margin-left: 30px;
		height: 36px;
		width: 146px;
	}
</style>
  </head>
  
  <body>
<h1>当前订单</h1>

<table border="1" style="width: 100%;">
	<c:if test="${not empty order}">
		<tr bgcolor="gray" bordercolor="gray">
			<td colspan="6">
				订单编号：${order.id}
				创建时间：${order.createtime}
				<c:if test="${not empty order.dealtime}">
				付款时间：${order.dealtime}
				</c:if>
				金额：<font color="red"><b>${order.total}元</b></font>
			</td>
		</tr>		
	</c:if>
	<c:if test="${not empty orderList}">
		<c:forEach var="item" items="${bookAndOrderList}">
			<tr bordercolor="gray" align="center">
				<td width="15%">
					<div><img src="<c:url value='/resource/book_img/${bookList[item.bookid-1].img}.jpg'/>" height="75"/></div>
				</td>
				<td>书名：${bookList[item.bookid-1].title}</td>
				<td>单价：<fmt:formatNumber value="${bookList[item.bookid-1].price}" pattern="0.00"/>元</td>
				<td>作者：${bookList[item.bookid-1].author}</td>
				<td>数量：${item.booknumber}</td>
				<td>小计：<fmt:formatNumber value="${bookList[item.bookid-1].price * item.booknumber}" pattern="0.00" />元</td>
			</tr>
		</c:forEach>
	</c:if>

</table>
<br/>
<form method="post" action="/Bookstore/order/purchase" id="form">
	<input type="hidden" name="orderid" value="${order.id}" />
	收货地址：<input type="text" name="address" size="50" placeholder="请填写你的地址"/><br/>

	选择银行：<br/>
	<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
	<img src="/Bookstore/resource/bank_img/icbc.bmp" align="middle"/>
	<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
	<img src="/Bookstore/resource/bank_img/bc.bmp" align="middle"/><br/><br/>
	<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
	<img src="/Bookstore/resource/bank_img/abc.bmp" align="middle"/>
	<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
	<img src="/Bookstore/resource/bank_img/ccb.bmp" align="middle"/><br/><br/>
	<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
	<img src="/Bookstore/resource/bank_img/bcc.bmp" align="middle"/><br/>
	<input type="submit" class="layui-btn layui-btn-warm" value="支付"/>
</form>

  </body>
</html>

