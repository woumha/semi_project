<%@page import="com.model.pmemberDTO"%>
<%@page import="com.model.pmemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String houseName = request.getParameter("houseName");
String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");
int houseNo = Integer.parseInt(request.getParameter("houseNo"));
int houseprice = Integer.parseInt(request.getParameter("houseprice"));
String houseImg1 = request.getParameter("houseImg1");
int id = Integer.parseInt(request.getParameter("houseNo"));
int count = Integer.parseInt(request.getParameter("count"));
int result = Integer.parseInt(request.getParameter("result"));
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="pay.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
//약관동의
$(document).ready(function(){
	//전체 체크 클릭 시, 나머지 체크 
	$("#all").click(function(){
	var check = $("#all").prop("checked");
	    if(check){
	        $(".all").prop("checked",true);
	        $(".btn").css({"backgroundColor":"#d2201d","color":"#fff"}).prop("disabled",false);
	    } else{
	        $(".all").prop("checked",false);
	        $(".btn").css({"backgroundColor":"#cbcbcb","color":"#303033"}).prop("disabled",true);
	    }
	});

	// 모든 체크박스를 클릭하면 버튼 활성화시키기
	$('.all').click(function(){
	    var tmpp = $(this).prop('checked'); 
	    //자식 체크 전체 체크시, 부모 체크박스 체크 됨
	    var tt = $(".all").length;
	    var ss = $(".all:checked").length;
	    
	    //선택한 체크박스 값이 true 이거나 체크박스 3개 체크시 버튼 활성화시키기
	    if(tmpp==true && ss==3){
	    	$(".btn").css({"backgroundColor":"#d2201d","color":"#fff"}).prop("disabled",false);
	    } else{
	    	$(".btn").css({"backgroundColor":"#cbcbcb","color":"#303033"}).prop("disabled",true);
	    }
	    
	    // 체크박스가 모두 선택되었을 때 상위 체크박스 선택되도록 설정
	    if(tt == ss){
	    	$("#all").prop("checked",true);
	    } else{
	    	$("#all").prop("checked",false);
	    }
		});
	});
	
	//결제 api
	var IMP = window.IMP; 
    IMP.init("imp68070036"); 
      
    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

    function requestPay() {
    	IMP.request_pay({
      	pg : 'kcp',
        pay_method : 'card',
        merchant_uid: "IMP"+makeMerchantUid, 
        name : '<%=houseName %>',
        amount : '<%=houseprice %>',
        buyer_email : '',
        buyer_name : '${m_name}',
        buyer_tel : '010-5654-0265',
        buyer_addr : '서울특별시 중구',
        buyer_postcode : '123-456'
    	}, function (rsp) {           
    		console.log(rsp);            
    		if (rsp.success) {   
    		var msg = '결제가 완료되었습니다.\n';       
    		msg += '결제 금액 : ' + rsp.paid_amount+'\n';            
    		msg += '카드 승인번호 : ' + rsp.apply_num+'\n';
    		window.location.href = "reservation_list.do?&houseName=<%=houseName %>&startDate=<%=startDate %>&endDate=<%=endDate %>&no=<%=houseNo %>&houseprice=<%=houseprice %>&pmember_code=${member_code_session }";
    		} else {               
    			var msg = '결제에 실패하였습니다.\n';           
    			msg += '에러내용 : ' + rsp.error_msg; 
    			window.location.href = "house_list.do";
    		}          
    		alert(msg);       
    		});
    	}
  </script>
</head>
<body>
<jsp:include page="include/top2.jsp"/>
<form method="post" id="form1">
<div class="cover">

<!-- 왼쪽 -->
<div>
	<h1>예약자 정보</h1>
	<br><br>
	<p>&nbsp;이름</p>
	<input class="textbox" name="name" value="${m_name }" readonly>
	<br><br>
	<p>&nbsp;휴대폰 번호</p>
	<!-- DB 넣기 -->
	<input class="textbox" name="phone" value="${m_phone }" readonly>
	<br><br><br>

	<!-- 약관동의 -->
	<div class="checkT">
		<input type="checkbox" name="c1" class="all"> 숙소 이용규칙 및 취소 / <U>환불규정</U> 동의<br><br>
		<input type="checkbox" name="c2" class="all"> 개인정보 수집 및 이용 동의<br><br>
		<input type="checkbox" name="c3" class="all"> 개인정보 제3자 제공동의<br><br>
		<input type="checkbox" name="all" id="all"> 모두 동의
	</div>
</div>

<!-- 모달 -->
<input type="checkbox" id="popup">
	<label for="popup">환불규정</label>
	<div class="modal_b">
		<div>
			<label for="popup"></label>
			<b><h3>환불 정책</h3></b><br>
			<b>예약 전</b><br>
			환불 정책에 관한 상세 정보는 숙소 페이지와 결제 전 예약 단계에서 확인하실 수 있습니다.
			<br><br>
			<b>예약 후</b><br>
			여행에서 환불 정책 및 옵션을 언제든 확인하실 수 있습니다. 여행 세부 정보 보기를 클릭하면 환불 정책을 확인할 수 있습니다.
			환불 정책에 표시되는 시간과 날짜는 숙소가 위치한 지역의 현지 시간대를 기준으로 합니다.
			환불이 가능한 취소 마감 시한은 숙소 정보에 표시된 시간(현지 시간)이 적용되며, 명시되지 않은 경우에는 오후 3시로 간주됩니다.
			숙박 기간, 취소 시기, 예약에 적용되는 환불 정책에 따라 체크인 후 예약을 취소하면 일부 환불이 가능할 수 있습니다.
		</div>
		<label for="popup"></label>
	</div>

<!-- 오른쪽 -->
<div class="card" style="width: 18rem;">

<!-- 이미지 넣어야 함 -->
  <img src="upload/<%=houseImg1 %>" width="267" height="180"/>
  
  <!-- 수정 -->
  <!-- 내용 -->
  <div class="card-body">
    <div class="cover_in">
	    <div>숙소 이름</div>
	    <div><%=houseName %></div>
	</div>
	<p></p>
  
    <div class="cover_in">
	    <div class="cont" id="startDate">체크인</div>
	    <div>
	    	<%=startDate %>
	    </div>
	</div>
	<p></p>
	
	<div class="cover_in">
	    <div class="cont" id="endDate">체크아웃</div>
	    <div>
	    	<%=endDate %>
	    </div>
	</div>
	<!-- 수정 끝 -->
	
    <hr color="gray">
    <h5>요금 세부정보</h5>
	    
    <!-- 텍스트 양쪽 끝에 위치 -->
    <div class="cover_in">
	    <div class="cont">요금</div>
	    <div><%=result %>원</div>
	</div>
	
	<!-- 결제하기 버튼 -->
	<c:if test="${!empty member_code_session}">
   		<button type="button" class="btn" style="background-color:#cbcbcb" onclick="requestPay()">결제</button>
   	</c:if>
	<c:if test="${empty member_code_session}">
   		<button type="button" disabled class="btn" style="background-color:#cbcbcb" onclick="alert('로그인을 먼저 진행해주세요')">결제</button>
   	</c:if>
  </div>
</div>
</div>
</form>
<jsp:include page="include/bottom.jsp"/>
</body>
</html>