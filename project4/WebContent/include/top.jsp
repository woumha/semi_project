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
	
	$(".sign").on("click", function() {
		location.href="<%=request.getContextPath()%>/inputEmail.do";
	});
	
	<%--
	$("#mypage").click(function() {
		location.href="<%=request.getContextPath()%>/account-settings.do?code=${member_code_session}";
	});
	--%>
	
	<%--
	function account() {
		$.ajax({
			url: "/project4/account-settings.do",
			data: {id: ${member_code_session}},
			datatype: "text",
			success: function(data) {
				
			},
			error: function() {
				alert("계정 통신 오류");
			} 
			
		});
	}
	--%>
	
	$(".sign").on("click", function() {
			location.href="<%=request.getContextPath()%>/inputEmail.do";
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>
<body>
<div class="header">
	
	<div id="logo_loction"></div>
	
	<a href="#"><span class="icon_leftText">숙소호스팅하기</span></a>
	<span id="modal" style="background-color: white;">
		<img src="../main_img/login.png" width="40px" height="40px" class="open_modal">
	</span>
	
	<c:set var="code" value="${member_code_session }" />
	<div class="member_login">
		<c:if test="${empty code }">
		   <form>
		     <div class="member_login_insert">
		        <input type="button" class="sign" value="회원가입">
		     </div>
		    <div class="member_login_input">
		       <input type="button" class="sign" value="로그인">
		    </div>
		
			
			
		    <div class="member_home_hosting_admin">
		     <input type="button" class="sign" value="숙소 호스팅하기">
		    </div>
		            
			<div class="member_home_hosting_experience">
		      <input type="button" class="sign" value="체험 호스팅하기">
		    </div>
		         
		    <div class="member_help">
		       <input type="button" value="도움말">
			</div>
			
			<div id="naver_id_login"></div>
			<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
			<script type="text/javascript">
				var clientId = "zROYJp38WO0IxEpiDz0u";
				var callbackUrl = "http://localhost:8787/project4/view2/naverLoginAPI.jsp";
				var naver_id_login = new naver_id_login(clientId, callbackUrl);
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("white", 3, 40);
				naver_id_login.setDomain("http://localhost:8787/project4/view/login_btn.jsp");
				naver_id_login.setState(state);
				naver_id_login.setPopup();
				naver_id_login.init_naver_id_login();
			</script>
			</form>
		</c:if>
		<c:if test="${!empty member_code_session }">	
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
			<button id="ex_hoster" class="tag">체험 호스팅하기</button>
			<p>
			<button id="suggestion_hoster" class="tag">호스트 추천하기</button>
			<p>
			<form method="post" id="mypage" action="<%=request.getContextPath()%>/account-settings.do">
				<input type="hidden" name="code" value="${member_code_session }">
				<button type="submit" class="tag">계정</button>
			</form>
			<p>
			<hr>
			<button id="help" class="tag">도움말</button>
			<p>
			<button id="signOut" class="tag">로그아웃</button>
			<%--
			<script type="text/javascript">
				$("#signOut").on("click", function() {
					<%
						sessionOut.invalidate();
					%>
					alert("로그아웃 되었습니다.");
					location.reload();
				});
			</script>
			 --%>
		</c:if>
	</div>

	<!-- 로그인 모달 ======================================================================================== -->
	<div id="login" class="modal">
	<c:set var="code" value="${member_code_session }" />
	  <div align="center">
			<br><h4>로그인</h4><br>
			<hr>
			<br><h2>에어비앤비에 오신 것을 환영합니다.</h2><br>
			<table>
				<tr>
					<td>
						<form method="post" action="<%=request.getContextPath() %>/sendMail.do">
							<input type="text" id="email" name="email" placeholder="Email">
							@
							<select name="domain">
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
							</select>
							<input type="submit" id="sendEmail" name="sendEmail" value="확인">
						</form>
					</td>
				</tr>
			</table>
		</div><br>
		<div id="naver_id_login" align="center">
				<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
			<script type="text/javascript">
				var clientId = "zROYJp38WO0IxEpiDz0u";
				var callbackUrl = "http://localhost:8787/project4/view2/naverLoginAPI.jsp";
				var naver_id_login = new naver_id_login(clientId, callbackUrl);
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("white", 3, 40);
				naver_id_login.setDomain("http://localhost:8787/project4/view/login_btn.jsp");
				naver_id_login.setState(state);
				naver_id_login.setPopup();
				naver_id_login.init_naver_id_login();
			</script>
		</div>
	</div>
	<!-- 로그인 모달 끝 ======================================================================================== -->

	<!-- 회원가입 모달  ======================================================================================== -->
	<div id="sign" class="modal">
	  <div align="center">
			<br><h4>회원가입</h4><br>
			<hr>
			<br><br><h2>에어비앤비에 오신 것을 환영합니다.</h2><br>
			<table>
				<tr>
					<td>
						<form method="post" action="<%=request.getContextPath() %>/sendMail.do">
							<input type="text" id="email" name="email" placeholder="Email">
							@
							<select name="domain">
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
							</select>
							<input type="submit" id="sendEmail" name="sendEmail" value="확인">
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 회원가입 모달 끝 ======================================================================================== -->
</div>

<script>
    $('a[href="#login"]').click(function(event) {
      event.preventDefault();
 
      $(this).modal({
        fadeDuration: 250
      });
    });
    $('a[href="#sign"]').click(function(event) {
      event.preventDefault();
   
      $(this).modal({
        fadeDuration: 250
      });
    });
</script>
</body>
</html>