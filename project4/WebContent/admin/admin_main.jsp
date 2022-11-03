<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/top.jsp"/>
	<ul>
		<li> <a href="<%=request.getContextPath() %>/admin_house_list.do">숙소 리스트</a></li>
	</ul>
	<jsp:include page="../include/bottom.jsp"/>
</body>
</html>