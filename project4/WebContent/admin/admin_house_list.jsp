<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(no) {
		let res = confirm("정말로 삭제하시겠습니까?");
		
		if(res) {
			location.href = "admin_category_delete.do?cnum="+no;
		}
	}
</script>
<style type="text/css">
	table {
		border-collapse: separate;
  		border-spacing: 0 10px;
	}

	#list {
		border: 1px;
		cellspacing: 0;
		width: 1200px;
		align: center;
		text-align: center;
	}
	
	.btn {
		border: 0;
		width: 50px;
		height: 30px;
		border-radius: 5%;
	}
	
	.btn:hover {
		background-color: #e85255;
		color: white;
		cursor: pointer;	
	}
</style>
</head>
<body>
   <jsp:include page="../include/top2.jsp"/>
   <div id="box" style="text-align: -webkit-center;">
      <table id="list">
         <tr>
            <th>숙소 번호</th>
            <th>숙소 주인</th>
            <th>유저 코드</th>
            <th>숙소 이름</th>
            <th>숙소 종류</th>
            <th>숙소 위치</th>
            <th>숙소 가격(1박)</th>
            <th>숙소 연락처</th>
            <th>숙소 별점</th>
            <th>숙소 등록일</th>
            <th>숙소 삭제</th>
         </tr>
      
         <c:set var="list" value="${List }"/>
         
         <c:if test="${!empty list }">
            <c:forEach items="${list }" var="dto">
               <tr>
                  <td> ${dto.getHouse_no() } </td>
                  <td> ${dto.getHouse_owner() } </td>
                  <td> ${dto.getPmember_code() } </td>
                  
                  <td>
					   <a href="<%=request.getContextPath() %>/admin_content.do?no=${dto.getHouse_no() }&page=${page }">
				  	   ${dto.getHouse_name() }</a>
				  </td>
                  
                  <td> ${dto.getHouse_category() } </td>
                  <td> ${dto.getHouse_location() } </td>
                  <td> ${dto.getHouse_price() } </td>
                  <td> ${dto.getHouse_phone() } </td>
                  <td> ${dto.getHouse_star() } </td>
                  <td> ${dto.getHouse_update().substring(0,10) } </td>
                  <td>
                  	<input type="button" class="btn" value="삭제" onclick="location.href='admin_delete.do?no=${dto.getHouse_no()}'">
                  </td>
               </tr>
            </c:forEach>
         </c:if>

         <c:if test="${empty list }">
            <tr>
               <td colspan="4" align="center">
                  <h3>카테고리 코드 목록이 없습니다..</h3>
               </td>
            </tr>
         </c:if>
      </table>
      
      <!-- 페이징 처리 -->
      <div id="paging" align="center">
      <c:if test="${page > block }">
			<a href="admin_house_list.do?page=1&p_page=${p_page }">◀◀︎</a>
			<a href="admin_house_list.do?page=${startBlock - 1 }&p_page=${p_page }">◀︎</a>
		</c:if>
		
		<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
			<c:if test="${i == page }">
				<b><a href="admin_house_list.do?page=${i }&p_page=${p_page }">[${i }]</a></b>
			</c:if>
			<c:if test="${i != page }">
				<a href="admin_house_list.do?page=${i }&p_page=${p_page }">[${i }]</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${endBlock < allPage }">
			<a href="admin_house_list.do?page=${endBlock + 1 }&p_page=${p_page }">▶︎︎</a>
			<a href="admin_house_list.do?page=${allPage }&p_page=${p_page }">▶▶︎︎</a>
		</c:if>
      </div>
     </div>
      <br><br>
      
      <div id="box" style="text-align: -webkit-center;">
      <table id="list">
         <tr>
            <th>코드</th>
            <th>이름</th>
            <th>생년월일</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>성별</th>
            <th>가입일</th>
            <th>등급</th>
            <th>삭제</th>
         </tr>
      
       <c:set var="list" value="${p_List }"/>
         
         <c:if test="${!empty list }">
            <c:forEach items="${list }" var="dto">
               <tr>
                  <td> ${dto.getPmember_code() } </td>
                   <td>
					   <a href="<%=request.getContextPath() %>/admin_pcontent.do?no=${dto.getPmember_code() }&page=${page }">
				  	   ${dto.getPmember_firstname() }${dto.getPmember_lastname() }</a>
				  </td>
                  <td> ${dto.getPmember_birth() } </td>
                  <td> ${dto.getPmember_phone() } </td>
                  <td> ${dto.getPmember_email() }@${dto.getPmember_domain() } </td>
                  <td> ${dto.getPmember_gender() } </td>
                  <td> ${dto.getPmember_date().substring(0,10) } </td>
                  <td> ${dto.getPmember_userlevel() } </td>
                  <td>
                     <input type="button" class="btn" value="삭제" onclick="location.href='admin_p_delete.do?no=${dto.getPmember_code()}'">
                  </td>
               </tr>
            </c:forEach>
         </c:if>

         <c:if test="${empty list }">
            <tr>
               <td colspan="4" align="center">
                  <h3>카테고리 코드 목록이 없습니다..</h3>
               </td>
            </tr>
         </c:if>
      </table>
      
      <!-- 페이징 처리 -->
      <div id="paging_1" align="center">
      <c:if test="${p_page > p_block }">
			<a href="admin_house_list.do?p_page=1&page=${page }">◀◀︎</a>
			<a href="admin_house_list.do?p_page=${p_startBlock - 1 }&page=${page }">◀︎</a>
		</c:if>
		
		<c:forEach begin="${p_startBlock }" end="${p_endBlock }" var="p_i">
			<c:if test="${p_i == p_page }">
				<b><a href="admin_house_list.do?p_page=${p_i }&page=${page }">[${p_i }]</a></b>
			</c:if>
			<c:if test="${p_i != p_page }">
				<a href="admin_house_list.do?p_page=${p_i }&page=${page }">[${p_i }]</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${p_endBlock < p_allPage }">
			<a href="admin_house_list.do?p_page=${p_endBlock + 1 }&page=${page }">▶︎︎</a>
			<a href="admin_house_list.do?p_page=${p_allPage }&page=${page }">▶▶︎︎</a>
		</c:if>
		</div>
      </div>
   
   <jsp:include page="../include/bottom.jsp"/>
   
</body>
</html>