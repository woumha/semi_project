<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<c:set var="dto" value="${p_modify }"/>
		<hr width="50%" color="gray">
			<h3>${dto.getPmember_code()} 수정</h3>
		<hr width="50%" color="gray">
		<br>
		<form method="post" action="<%=request.getContextPath() %>/admim_p_modify_ok.do">
			<input type="hidden" name="pmember_code" value="${dto.getPmember_code() }">
			<table border="1" cellspacing="0" width="600">
				<tr>
					<th>성</th>
					<td>
						<input name="pmember_firstname" value="${dto.getPmember_firstname() }">
					</td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td>
						<input name="pmember_lastname" value="${dto.getPmember_lastname() }">
					</td>
				</tr>
				
				<tr>
					<th>생년월일</th>
					<td>
						<input name="pmember_birth" value="${dto.getPmember_birth() }">
					</td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td>
						<input name="pmember_phone" value="${dto.getPmember_phone() }">
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>
						<input name="pmember_email" value="${dto.getPmember_email() }">
						@
						<%-- <input name="pmember_domain" value="${dto.getPmember_domain() }"> --%>
						<div id="email_select_box">
							<select name="pmember_domain" id="email_select">
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
							</select>
						</div>
					</td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						<input name="pmember_gender" value="${dto.getPmember_gender() }">
					</td>
				</tr>
				
				<tr>
					<th>수정일</th>
					<td>
						<%-- <input name="pmember_date" value="${dto.getPmember_date().substring(0,10) }"> --%>
						${dto.getPmember_date().substring(0,10) }
					</td>
				</tr>
				
				<tr>
					<th>등급</th>
					<td>
						<%-- <input name="pmember_userlevel" value="${dto.getPmember_userlevel() }"> --%>
						${dto.getPmember_userlevel() }
					</td>
				</tr>
				
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>조회된 게시물이 없습니다</h3>
					</td>
				</tr>
			</c:if>
			
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>