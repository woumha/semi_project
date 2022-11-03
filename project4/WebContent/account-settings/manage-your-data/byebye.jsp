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
<script type="text/javascript">
window.onpopstate = function(event) {
	  // "event" object seems to contain value only when the back button is clicked
	  // and if the pop state event fires due to clicks on a button
	  // or a link it comes up as "undefined" 
	  if(event){
	    // Code to handle back button or prevent from navigation
		location.href="<%=request.getContextPath() %>/house_list.do";
	  }
	  else{
	    // Continue user action through link or button
	  }
	}
</script>
<title>Insert title here</title>
</head>
<body>
바이바이
</body>
</html>