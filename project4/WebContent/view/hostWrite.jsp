<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 모달 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- 모달 end -->

<style type="text/css">

#Host_list_box {
	text-align: center;
}

#Host_list {
	border: 1px;
	cellspacing: 0;
	width: 1200px;
	align: center;
	text-align: center;
}

#paging_box {
	text-align: center;
}


</style>
</head>
<body>
<jsp:include page="../include/top2.jsp"/>
<div id="Host_list_box" id="Host_list">
	<div align="center">
		<hr width="50%" color="marmoon">
		<h3>UPLOAD 테이블 자료실 게시판 글쓰기 폼 페이지</h3>
		<hr width="50%" color="marmoon">
		<br>
               <%-- enctype : 파일을 업로드하기 위한 속성 --%>
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/host_write_ok.do">
		<input type="hidden" value="${member_code_session }" name="pcode">
			<table>
				<tr>
					<th>숙소이름</th>
					<td> <input name="house_name"> </td>
				</tr>
				<tr>
					<th>숙소카테고리</th>
					<td>
						<select name="house_category">
							<option value="호텔" selected>호텔</option>
							<option value="아파트" >아파트</option>
							<option value="리조트">리조트</option>
							<option value="게스트하우스">게스트하우스</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>숙소주소</th>
					<td>
						<textarea rows="7" cols="25" name="house_location"></textarea>
					</td>
				</tr>
				<tr>
					<th>숙소가격</th>
					<td> <input name="house_price"> </td>
				</tr>
				<tr>
					<th>숙소설명</th>
					<td>
						<textarea rows="7" cols="25" name="house_content"></textarea>
					</td>
				</tr>
				<tr>
					<th>숙소전화번호</th>
					<td> <input name="house_phone"> </td>
				</tr>
				<tr>
					<th>숙소인원</th>
					<td> <input name="house_person"> </td>
				</tr>
				<tr>
					<th>파일첨부1</th>
					<td> <input type="file" name="house_img1"> </td>
				</tr>
				<tr>
					<th>파일첨부2</th>
					<td> <input type="file" name="house_img2"> </td>
				</tr>
				<tr>
					<th>파일첨부3</th>
					<td> <input type="file" name="house_img3"> </td>
				</tr>
				<tr>
					<th>수변인접 여부</th>
					<td>
						<input type="radio" name="house_water" value="0">없음
						<input type="radio" name="house_water" value="1">있음
					</td>
				</tr>
				<tr>
					<th>수영장 여부</th>
					<td>
						<input type="radio" name="house_pool" value="0">없음
						<input type="radio" name="house_pool" value="1">있음
					</td>
				</tr>
				<tr>
					<th>스키장 여부</th>
					<td>
						<input type="radio" name="house_ski" value="0">없음
						<input type="radio" name="house_ski" value="1">있음
					</td>
				</tr>
				<tr>
					<th>식사제공 여부</th>
					<td>
						<input type="radio" name="house_food" value="0">없음
						<input type="radio" name="house_food" value="1">있음
					</td>
				</tr>
				<tr>
					<th>무료주차 여부</th>
					<td>
						<input type="radio" name="house_parking" value="0">없음
						<input type="radio" name="house_parking" value="1">있음
					</td>
				</tr>
				<tr>
					<th>바베큐 그릴 여부</th>
					<td>
						<input type="radio" name="house_gril" value="0">없음
						<input type="radio" name="house_gril" value="1">있음
					</td>
				</tr>
				<tr>
					<th>흡연장 여부</th>
					<td>
						<input type="radio" name="house_smoking" value="0">없음
						<input type="radio" name="house_smoking" value="1">있음
					</td>
				</tr>
				<tr>
					<th>헬스장 여부</th>
					<td>
						<input type="radio" name="house_gym" value="0">없음
						<input type="radio" name="house_gym" value="1">있음
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글쓰기">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<jsp:include page="../include/bottom.jsp"/>
</body>
</html>