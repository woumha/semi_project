<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	HttpSession sessionOut = request.getSession();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="../JS/loginscript.js"></script>
<script type="text/javascript" src="JS/loginscript.js"></script>
<link rel="stylesheet" href="CSS/top.css">
<link rel="stylesheet" href="../CSS/top.css">
<script>
	$(document).ready(function(){
 		  $(".icon").click(function(){
			$(".wrapper").toggleClass("active");
		});  	
	});
</script>

<!-- 로그인 관련 영역 =========================================================================================== -->
<script type="text/javascript">
$(function() {
	$.ajaxSetup({
		ContentType: "application/x-www-form-urlencoded;charset=UTF-8", //한글처리
		type: "post"
	});
	
	$("#modal").click(function() {
		$(".member_login").toggle();
	});
	
	$("#message").click(function() {
		
	});
});
</script>
<style type="text/css">
	.tag {
		display: block;
		border: 0px;
		outline: 0px;
		background-color: white;
	}
</style>
<!-- 로그인 관련 영역 end ======================================================================================= -->
	
<!-- 모달 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>
<body>
<div class="header">
	
	<a href="<%=request.getContextPath() %>/house_list.do"><div id="logo_loction"></div></a>
	<a href="<%=request.getContextPath() %>/host_list.do?pcode=${member_code_session }"><span class="icon_leftText">숙소호스팅하기</span></a>
	<span id="modal" style="background-color: white;">
		<c:set var="list" value="${List }"/>
		<c:if test="${empty list }">
			<img src="../main_img/login.png" width="40px" height="40px" class="open_modal">	
		</c:if>
		<c:if test="${!empty list }">
			<img src="main_img/login.png" width="40px" height="40px" class="open_modal">	
		</c:if>
	</span>
	
	<c:set var="code" value="${member_code_session }" />
	<div class="member_login">
		<c:if test="${empty code }">
			<form>
				<div class="member_login_insert">
					<a href="#login">회원가입</a>
				</div>
				<div class="member_login_input">
					<a href="#login">로그인</a>
				</div>
				<hr>
				<div class="member_home_hosting_admin">
					<a href="#login">숙소 호스팅하기</a>
				</div>
				<div class="member_home_hosting_experience">
					<a href="#login">고객센터</a>
				</div>
				<div class="member_help">
					<a href="#">Q&A</a>
				</div>
			</form>
		</c:if>
		<c:if test="${!empty member_code_session }">
			<div id="logout_menu">
				<button id="message" class="tag">메세지</button>
				<p>
				<button id="alram" class="tag">알림</button>
				<p>
				<button id="travel" class="tag">여행</button>
				<p>
				<button id="wishlist" class="tag">위시리스트</button>
				<p>
				<hr>
				<button id="hoster" class="tag">숙소 호스트 되기</button>
				<p>
				<button id="suggestion_hoster" class="tag">호스트 추천하기</button>
				<p>
				<form method="post" id="mypage" action="<%=request.getContextPath()%>/account-settings.do">
				<c:set var="co" value="${member_code_session }" />
					<input type="hidden" name="code" value="${co }">
					<button type="submit" class="tag">계정</button>
				</form>
				<p>
				<button id="help" class="tag">Q&A</button>
				<p>
				<button id="signOut" class="tag" onclick="location.href='<%=request.getContextPath() %>/logout.do'">로그아웃</button>
			</div>
		</c:if>
	</div>

	<!-- 로그인 모달 ======================================================================================== -->
	<div id="login" class="modal">
		<%-- <c:set var="code" value="${member_code_session }" /> --%>
		<div align="center">
			<p id="login_hi">로그인 또는 회원가입</p>
			<hr>
			<p id="login_welcom">에어비앤비에 오신 것을 환영합니다.</p>
			<table>
				<tr>
					<td>
						<form method="post" id="email_input" action="<%=request.getContextPath() %>/sendMail.do">
							<input type="hidden" name="tag" value="first">
							<input type="text" id="email" name="email" placeholder="Email">
							<div id="email_text">
								@
							</div>
							<div id="email_select_box">
								<select name="domain" id="email_select">
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
								</select>
							</div>
							<div id="div_sendEmail">
								<input type="submit" id="sendEmail" name="sendEmail" value="인증번호 보내기">
							</div>
						</form>
						<br>
						<div id="naverIdLogin" align="center"></div>
						<script type="text/javascript">
							/* var naver_id_login = new naver_id_login(clientId, callbackUrl);
							var state = naver_id_login.getUniqState();
							naver_id_login.setButton("white", 3, 40);
							naver_id_login.setDomain("http://localhost:8756/project4/include/top.jsp"); // 현재 버튼 출력 위치
							naver_id_login.setState(state);
							naver_id_login.setPopup();
							naver_id_login.init_naver_id_login(); */
							
							var naverLogin = new naver.LoginWithNaverId(
									{
										clientId: "zROYJp38WO0IxEpiDz0u",
										callbackUrl: "http://localhost:8756/project4/API/naverLoginApi.jsp",
										isPopup: false, /* 팝업을 통한 연동처리 여부 */
										loginButton: {color: "green", type: 3, height: 30} /* 로그인 버튼의 타입을 지정 */
									}
								);
							
							naverLogin.init();
						</script>
						
						
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 로그인 모달 끝 ======================================================================================== -->
	
</div>

<script>
    $('a[href="#login"]').click(function(event) {
      event.preventDefault();
 
      $(this).modal({
        fadeDuration: 250
      });
    });
    $('a[href="#token_model"]').click(function(event) {
      event.preventDefault();
   
      $(this).modal({
        fadeDuration: 250
      });
    });
</script>
</body>
</html>
