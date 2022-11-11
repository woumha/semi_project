<%@page import="com.action.logOutAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	logOutAction action = new logOutAction();
	action.execute(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="deletion.jsp">
	<jsp:include page="/include/top.jsp"></jsp:include>
	<div align="center" style="font-size: 32px; font-weight: bold; margin: 8%; padding-bottom: 10%;">
		그동안 이용해 주셔서 감사합니다.
	</div>
	<jsp:include page="/include/bottom.jsp" />
</body>
</html>