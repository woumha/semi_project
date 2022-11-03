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
	뒤로가기 막기 완료
</body>
</html>