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
		<c:set var="dto" value="${Cont }" />
		<hr width="50%" color="tomato">
			<h3>${dto.getPmember_firstname() }${dto.getPmember_lastname() } 상세 내역</h3>
		<hr width="50%" color="tomato">		
		<br>
		<table border="1" cellspacing="0" width="600">
			<tr>
				<th>코드</th>
				<td>${dto.getPmember_code() }</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td>${dto.getPmember_firstname() }${dto.getPmember_lastname() }</td>
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td>${dto.getPmember_birth() }</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>${dto.getPmember_phone() }</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td>${dto.getPmember_email() }@${dto.getPmember_domain() }</td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td>${dto.getPmember_gender() }</td>
			</tr>
			
			<tr>
				<th>가입일</th>
				<td>${dto.getPmember_date().substring(0,10) }</td>
			</tr> 
			
			<tr>
				<th>등급</th>
				<td>${dto.getPmember_userlevel() }</td>
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
					<input type="button" value="수정" onclick="location.href='admin_p_update.do?no=${dto.getPmember_code()}'">
					<input type="button" value="삭제" onclick="if(confirm('게시글을 삭제 하시겠습니까?')){
						location.href='admin_p_delete.do?no=${dto.getPmember_code()}'
					} else {return;}">
					<input type="button" value="목록으로" onclick="location.href='admin_house_list.do'">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>