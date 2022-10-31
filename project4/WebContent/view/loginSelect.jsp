<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HttpSession sessionOut = request.getSession();
%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="EUC-KR">
<title>login_btn</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="../JS/loginscript.js"></script>
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
</head>
<body>
	<span id="modal" style="background-color: gray;">
		<img src="../image/login_image.jpg" width="150" height="150" class="open_modal">
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
					
			<hr>
					
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
			<c:set var="co" value="${member_code_session }" />
				<input type="hidden" name="code" value="${co }">
				<button type="submit" class="tag">계정</button>
			</form>
			<p>
			<hr>
			<button id="help" class="tag">도움말</button>
			<p>
			<button id="signOut" class="tag" onclick="location.href='<%=request.getContextPath() %>/logout.do'">로그아웃</button>
		</c:if>
	</div>
</body>
</html>