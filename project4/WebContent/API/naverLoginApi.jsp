<<<<<<< HEAD
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		 naverLogin.getLoginStatus(function (status) {
		      if (status) {
		          const nickName=naverLogin.user.getNickName();
		          const age=naverLogin.user.getAge();
		          const birthday=naverLogin.user.getBirthday();
=======
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
 <script type="text/javascript">
		var naver_id_login = new naver_id_login("zROYJp38WO0IxEpiDz0u", "http://localhost:8756/project4/API/naverLoginApi.jsp"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
		
		// 접근 토큰 값 출력
		alert(naver_id_login.oauthParams.access_token);
		
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			alert(naver_id_login.getProfileData('email'));
			alert(naver_id_login.getProfileData('nickname'));
			alert(naver_id_login.getProfileData('age'));
		}
	</script>
  </body>
</html>

<!-- 
	<!doctype html>
	<html lang="ko">
	<head>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	</head>
	<body>
	<script type="text/javascript">
>>>>>>> refs/remotes/origin/이호찬
	
<<<<<<< HEAD
		        //닉네임을 선택하지 않으면 선택창으로 돌아갑니다.
		          if(nickName===null||nickName===undefined ){ 
		            alert("별명이 필요합니다. 정보제공을 동의해주세요.");
		            naverLogin.reprompt(); 
		            return ;  
		         }else{
		          setLoginStatus(); //모든 필수 정보 제공 동의하면 실행하는 함수
		         }
		      }
		    }); 
	</script>
</body>
	
</html>
=======
	
	/*
	  var naver_id_login = new naver_id_login("zROYJp38WO0IxEpiDz0u", "http://localhost:8756/project4/API/naverLoginApi.jsp");
	  // 접근 토큰 값 출력
	  //alert(naver_id_login.oauthParams.access_token);
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  console.log(naver_id_login);
	  var email, username, id;
	  function naverSignInCallback() {
		  // 이름, 이메일, 생일, 출생, 휴대전화
		  email = naver_id_login.getProfileData('email');
		  username = naver_id_login.getProfileData('nickname');
	      age = naver_id_login.getProfileData('age');
	      
	      // id
	      id = naver_id_login.getProfileData('id');
	      // 프로필 사진
	      img = naver_id_login.getProfileData('profileImage');
	      
	      // 정보 가지고 가서 저장할 url
	      var url = "http://" + window.location.hostname + 
	      		( (location.port==""||location.port==undefined)?"":":" + location.port) + "최종 로그인 url"; 
		
	  }
	*/
	</script>
	</body>
	
	</html>
 -->
>>>>>>> refs/remotes/origin/이호찬
