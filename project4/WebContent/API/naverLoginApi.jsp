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
 <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
 <script type="text/javascript">
		var naver_id_login = new naver_id_login("tIubopvs1z_FqQjYOHzP", "http://localhost:8756/project4/API/naverLoginApi.jsp"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
		
		// 접근 토큰 값 출력
		alert(naver_id_login.oauthParams.access_token);
		
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			alert(naver_id_login.getProfileData('email'));
			alert(naver_id_login.getProfileData('nickname'));
			alert(naver_id_login.getProfileData('age'));
			alert(naver_id_login.getProfileData('mobile'));
		}
	</script>
  </body>
</html>
