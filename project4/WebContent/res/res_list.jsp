<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#box {
	margin-left: 17%
	}

	#list {
		border: 1px;
		cellspacing: 0;
		width: 1200px;
		align: center;
		text-align: center;
	}
	
	#paging {
	    margin-left: 38%;
	    margin-top: 1%;
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
   <jsp:include page="../include/top.jsp"/>
   <div id="box">
      <table id="list">
         <tr>
            <th>숙소 이름</th>
            <th>체크인</th>
            <th>체크아웃</th>
            <th>가격</th>
            <th>예약일</th>
            <th>삭제</th>
         </tr>
      
         <c:set var="list" value="${ResList }"/>
         
         <c:if test="${!empty list }">
            <c:forEach items="${list }" var="dto">
               <tr>
                  <td>
					   <a href="<%=request.getContextPath() %>/res_content.do?pcode=${member_code_session }&no=${dto.getHouse_no() }">
				  	   ${dto.getHouse_name() }</a>
				  </td>
                  <td> ${dto.getCheckin().substring(0,10) } </td>
                  <td> ${dto.getCheckout().substring(0,10) } </td>
                  <td> ${dto.getprice() } </td>
                  <td> ${dto.getCreated_date().substring(0,10) } </td>
                  <td>
					<input id="btn" type="button" value="삭제"
						onclick="if(confirm('예약을 취소하시겠습니까?')) {location.href='res_delete.do?no=${dto.getId() }&pcode=${member_code_session }'
	                        }else { return; }">
				  </td>
               </tr>
            </c:forEach>
         </c:if>

         <c:if test="${empty list }">
            <tr>
               <td colspan="7" align="center">
                  <h3>카테고리 코드 목록이 없습니다..</h3>
               </td>
            </tr>
         </c:if>
      </table>
      
      <!-- 페이징 처리 -->
  <div id="paging">
      <c:if test="${page > block }">
			<a href="res_list.do?p_page=${p_page }&pcode=${member_code_session}">◀◀︎</a>
			<a href="res_list.do?page=${startBlock - 1 }&pcode=${member_code_session}">◀︎</a>
		</c:if>
		
		<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
			<c:if test="${i == page }">
				<b><a href="res_list.do?page=${i }&pcode=${member_code_session}">[${i }]</a></b>
			</c:if>
			<c:if test="${i != page }">
				<a href="res_list.do?page=${i }&pcode=${member_code_session}">[${i }]</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${endBlock < allPage }">
			<a href="res_list.do?page=${endBlock + 1 }&pcode=${member_code_session}">▶︎︎</a>
			<a href="res_list.do?page=${allPage }&pcode=${member_code_session}">▶▶︎︎</a>
		</c:if>
  </div>
</div>
      <br><br>
   
   <jsp:include page="../include/bottom.jsp"/>
   
</body>
</html>
