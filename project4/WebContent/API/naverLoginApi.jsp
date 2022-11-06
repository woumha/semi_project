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