<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
  padding-top: 8%;
}
	
.header {
  width: 100%;
  height: 8%;
  left: 0px;
  top: 0px;
  position: fixed;
  background: #FFFFFF;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.15);
}

*{
  margin: 0;
  padding: 0;
  list-style: none;
  text-decoration: none;
  font-family: 'Open Sans', sans-serif;
}

/* 위치 조정 */
.wrapper{
  position: absolute;
  top: 25%;
  left: 80%;
}

.wrapper .container{
  width: 200px;
}

.wrapper .icon{
  width: 40px;
  height: 40px;
  margin: 0 auto 16px;
  position: relative;
  cursor: pointer;
  content: url("../main_img/login.png");
}

.wrapper .icon > div{
  position: absolute;
  top: 45%;
  left: 25%;
  width: 50%;
  height: 3px;
  background: #fff;
  border-radius: 50px;
  transition: all 0.3s linear;
}

.wrapper .container .menu{
  width: 180px;
  height: auto;
  margin: 0 auto;
  background: #fff;
  position: relative;
  opacity: 0;
  top: -10px;
  transition: all 0.5s linear;
}

.wrapper .container .menu ul li{
  text-align: center;
  text-transform: uppercase;
  transition: all 0.2s linear;
  border: solid 0.1px;
}

.wrapper .container .menu ul li a{
  padding: 10px;
  font-size: 12px;
  color: #757575;
  display: block;
  transition: all 0.2s linear;
}

.wrapper .container .menu:before{
  content: "";
  position: absolute;
  top: -19px;
  left: 50%;
  transform: translateX(-50%);
  border-top: 10px solid transparent;
  border-bottom: 8px solid black;
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
}

.wrapper .icon.active{
  trasform: rotate(90deg);
}

.wrapper .container .menu.active{
  opacity: 1;
  top: 0px;
}

.modal{
  height: 40%;
}
</style>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
		  	$(".icon").click(function(){
			  $(this).toggleClass("active");
			  $(".menu").toggleClass("active");
			});
		});
	</script>
	<script type="text/javascript">
	
		icon.addEventListener('click', () => {
		  const dropdown = document.querySelector('.dropdown');
		  dropdown.style.display = 'block';
		});

		button.addEventListener('blur', () => {
		  const dropdown = document.querySelector('.dropdown');
		  dropdown.style.display = '';
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
<div class="wrapper">
  <div class="container">
    <div class="icon">
    </div>

    <div class="menu">
      <ul>
        <li><a href="#e">로그인</a></li>
        <li><a href="#">profile</a></li>
        <li><a href="#">about</a></li>
        <li><a href="#">contact</a></li>
        <li><a href="#">maps</a></li>
      </ul>
    </div>
  </div>
</div>
<div id="e" class="modal">
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
</div>

<script>
    $('a[href="#e"]').click(function(event) {
      event.preventDefault();
 
      $(this).modal({
        fadeDuration: 250
      });
    });
</script>
</body>
</html>