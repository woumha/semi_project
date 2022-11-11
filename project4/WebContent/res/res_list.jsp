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
					<input type="button" value="삭제"
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
   
   <jsp:include page="../include/bottom.jsp"/>
   
</body>
</html>