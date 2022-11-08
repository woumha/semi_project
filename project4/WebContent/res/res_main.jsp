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
		<li> <a href="<%=request.getContextPath() %>/res_list.do?pcode=${member_code_session }">예약내역</a>
	</ul>
	<form name="resform" class="form" method="post" action="<%=request.getContextPath() %>/res_list.do">
		<input type="hidden" id="pcode" name="pcode" value="${member_code_session }" />
		<button type="submit">예약내역</button>
	</form>
	<jsp:include page="../include/bottom.jsp"/>
</body>
</html>