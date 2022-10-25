<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "./css/list.css">

</head>
<body>
<div class = "_mypage_ask" align=center>

<hr width = "1920px" height = "1px" margin = "9px 0 0"color = "#e4e4e4">
				<div class="contents">
				<h1 class="tit_h1">FAQ</h1>
				<h2>자주하는 질문</h2>
				
				<div class="summary sub02_text" style="margin-bottom:75px">
				자주 문의하시는 내용을 자세히 보실 수 있습니다. 추가로 궁금하신 부분이 있으시거나
				<br>
				자주하는 질문에서 답변을 찾지못하셨다면 고객의 소리를 이용하세요.
				<div class="list_btn_area" style="margin-top:30px">
		
		<input type="button" value="고객의 소리 바로가기" onclick="location.href = 'qna_list.do'" class="btnn">

		
			<br>
			<br>
			
			<div class="content-bottom-area">
				<ul class="content-bottom-list">
					<li class="type01">고객상담센터</li>
					<li class="type02">
						<div class="title">평일</div>
						<div class="copy">
							<span class="text01">0000-0000</span>
							<span class="s-text">(예약 및 상담시간 : 09시 ~ 18시)</span>
						</div>
					</li>
					
					<li class="type02">
						<div class="title">주말</div>
						<div class="copy">
							<span class="text02">000-000-0000</span>
							<span class="s-text">
							" (상담시간 : 09시 ~ 18시)"
							<br>
							"호스트의 (체크인,체크아웃)에 따라"
							<br>
							"전화 연결이 지연 될 수 있습니다."
							</span>
						</div>
					</li>
					
					<li class="type02">
						<div class="title">이메일</div>
						<div class="copy">
							<span class="text02">평일 상담 가능</span>
								<span class="s-text">(상담 시간 : 09시 ~ 18시) </span>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
			
			<hr width = "1300px" height = "2px" margin = "16px 445px"color = "#383d48">
		</div>
		<br>
		
			<table>
				<tr class = "trclass">
					<th>번호</th> <th>질문과 답변</th>
					<th>조회수</th> <th>작성일자</th>
				</tr>
				
			<c:set var="list" value="${List }"/>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr class="tr_class" onclick="location.href = '<%=request.getContextPath() %>/faq_content.do?no=${dto.getFaq_num() }'">
							<td>${dto.getFaq_num() }</td>
							<td>${dto.getFaq_title() }</td>
							<td>${dto.getFaq_hit() }</td>
							<td>${dto.getFaq_date().substring(0,10) }</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<tr>
					<td colspan = "4" align = "center">
						<br>
						<input type = "button" value = "글쓰기" onclick = "location.href = 'faq_write.do'" class = "btn" >
					</td>
				</tr>
				
			</table>

</body>
</html>