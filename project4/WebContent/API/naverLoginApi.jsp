<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("zROYJp38WO0IxEpiDz0u", "http://localhost:8756/project4/API/naverLoginApi.jsp");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	const newForm = document.createElement('form');
	newForm.name = 'newForm';
	newForm.method = 'post';
	newForm.action = '<%=request.getContextPath() %>/apicheck.do';

	console.log(naver_id_login);
	name = naver_id_login.getProfileData('name');
	email = naver_id_login.getProfileData('email');
	birth = naver_id_login.getProfileData('birthday');
	year = naver_id_login.getProfileData('birthyear');
	mobile = naver_id_login.getProfileData('mobile');
	
	
	console.log(name + " " + email + " " + birth + " " + year + " " + mobile);
	const input1 = document.createElement('input');
	const input2 = document.createElement('input');
	const input3 = document.createElement('input');
	const input4 = document.createElement('input');
	const input5 = document.createElement('input');
	
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "apiName");
	input1.setAttribute("value", name);
	
	input2.setAttribute("type", "hidden");
	input2.setAttribute("name", "apiEmail");
	input2.setAttribute("value", email);
	
	input3.setAttribute("type", "hidden");
	input3.setAttribute("name", "apiBirth");
	input3.setAttribute("value", birth);
	
	input4.setAttribute("type", "hidden");
	input4.setAttribute("name", "apiYear");
	input4.setAttribute("value", year);
	
	input5.setAttribute("type", "hidden");
	input5.setAttribute("name", "apiMobile");
	input5.setAttribute("value", mobile);
	
	
	newForm.appendChild(input1);
	newForm.appendChild(input2);
	newForm.appendChild(input3);
	newForm.appendChild(input4);
	newForm.appendChild(input5);
	
	document.body.appendChild(newForm);
	//newForm.submit();
	
  }
</script>
</body>
</html>