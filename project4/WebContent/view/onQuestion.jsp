<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function() {
		var em = "<c:out value="${mail}" />";
		
		
		var check = confirm("계정이 비활성화 되었습니다. 활성화 하시겠습니까?");
		
		if(check == true) {
			location.href='<%=request.getContextPath() %>/onMember.do?email=' + em;
		} else if(!(check == true)) {
			location.href='<%=request.getContextPath() %>/house_list.do';
		}
	}
</script>
</head>
<body>

</body>
</html>