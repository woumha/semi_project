<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>

		$(document).ready(function(){
 		  	$(".icon").click(function(){

				$(".wrapper").toggleClass("active");
			});
		  	
		});
		
		
	</script>
	
	<script type="text/javascript">
	$(function() {
		$.ajaxSetup({
			// ajax에서 한글 깨짐 문제 해결
			ContentType: "application/x-www-form-urlencoded;charset=UTF-8",
			type="post"
		});
	});
</script>
	
	
<!-- 모달 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>
<body>
<div class="header">
	
	<div id="logo_loction"></div>
	<a href="#"><span class="icon_leftText">숙소호스팅하기</span></a>
	<div class="icon"></div>
	<div class="wrapper">

	  <div class="container">

	    <div class="menu">
	      <ul>
	        <li><a href="#login">로그인</a></li>
	        <li><a href="#sign">회원가입</a></li>
	        <li><a href="#">숙소호스팅하기</a></li>
	        <li><a href="#">고객센터</a></li>
	      </ul>
	    </div>
	  </div>
	</div>

	<!-- 로그인 모달 -->
	<div id="login" class="modal">
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
	<!-- 로그인 모달 끝 -->

	<!-- 회원가입 모달 -->
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
	<!-- 회원가입 모달 끝 -->
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