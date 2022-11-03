<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>NaverLoginSDK</title>
<!-- (1) LoginWithNaverId JavaScript SDK -->


<!-- (2) LoginWithNaverId JavaScript 설정 정보 및 초기화 -->
<script>
	var naverLogin = new naver.LoginWithNaverId({
		clientId: "zROYJp38WO0IxEpiDz0u",
		callbackUrl: "http://localhost:8756/project4/API/naverLoginApi.jsp", // 콜백함수
		isPopup: false, /* 팝업을 통한 연동처리 여부 */
		callbackHandle: true
		/* callback 패이지가 분리되었을 경우 callback 페이지에서는 callback처리를 해줄수 있도록 설정 */
	});
	
	/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
 	naverLogin.init();
 	
 	/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* PMEMBER_EMAIL
				PMEMBER_DOMAIN
				PMEMBER_CODE
				PMEMBER_FIRSTNAME
				PMEMBER_LASTNAME
				PMEMBER_GENDER
				PMEMBER_BIRTH
				PMEMBER_PHONE
				PMEMBER_DATE
				PMEMBER_USERLEVEL */
				/*
					getAge
					getBirthday
					getEmail
					getGender
					getId
					getName
					getNickName
					getProfileImage
					constructor
				*/
				
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				let email = naverLogin.user.getEmail();
				let name = naverLogin.name.getName();
				let gender = naverLogin.gender.getGender();
				let birth = naverLogin.birthday.getBirthday();
				const id = naverLogin.id.getId();
				
        		
                if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				} else if (name == undefined || name == null) {
					alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
				} else if(gender == undefined || gender == null) {
					alert("생년월일은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
				}
                
				window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/project4/signUp.do");
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
</script>
</head>
<body>
	callback 처리 중
</body>
</html>