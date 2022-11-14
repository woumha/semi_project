<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 관리 - 4팀</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	.information {
		color: black;
		 text-decoration: none;
		 
	}
	
	.information:hover {
		
	}
	
	#bigTable {
		border-collapse: separate;
	  	border-spacing: 100px 40px;
	}
	
</style>
</head>
<body>
	<jsp:include page="/include/top.jsp"></jsp:include>
	<div align="center">
		<c:set var="list" value="${pmember }" />
		<h2>계정</h2>
		<br>
		<h4>${list.pmember_firstname }${list.pmember_lastname }님, ${list.pmember_email }@${list.pmember_domain } > <a href="/project4/account-settings/personal-info.jsp">프로필로 이동</a></h4>
	</div>
	<p>
	<div align="center">
		<table align="center" id="bigTable">
			<tr>
				<td>
					<a href="/project4/account-settings/personal-info.jsp" class="information" >
						<div style="margin-bottom: 16px;" id="0" class="box">
							<div>
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;">
									<path d="m29 5c1.0543618 0 1.9181651.81587779 1.9945143 1.85073766l.0054857.14926234v18c0 1.0543618-.8158778 1.9181651-1.8507377 1.9945143l-.1492623.0054857h-26c-1.0543618 0-1.91816512-.8158778-1.99451426-1.8507377l-.00548574-.1492623v-18c0-1.0543618.81587779-1.91816512 1.85073766-1.99451426l.14926234-.00548574zm0 2h-26v18h26zm-3 12v2h-8v-2zm-16-8c1.6568542 0 3 1.3431458 3 3 0 .6167852-.1861326 1.1900967-.5052911 1.6668281 1.4972342.8624949 2.5052911 2.4801112 2.5052911 4.3331719h-2c0-1.3058822-.8343774-2.4168852-1.9990993-2.8289758l-.0009007-3.1710242c0-.5522847-.4477153-1-1-1-.51283584 0-.93550716.3860402-.99327227.8833789l-.00672773.1166211.00008893 3.1706743c-1.16523883.4118113-2.00008893 1.5230736-2.00008893 2.8293257h-2c0-1.8530607 1.00805693-3.470677 2.50570706-4.3343854-.3195745-.4755179-.50570706-1.0488294-.50570706-1.6656146 0-1.6568542 1.34314575-3 3-3zm16 4v2h-8v-2zm0-4v2h-8v-2z">
									</path>
								</svg>
							</div>
						<div>
						<div class="0_1">개인정보</div>
						<div class="0_2">개인정보 및 연락처를 알려주세요</div>
						</div>
						</div>
					</a>
				</td>
				
				<td>
					<a href="account-settings/login-and-security.jsp" class="information" >
						<div class="_1uwb2q9">
							<div style="margin-bottom: 16px;" id="1" class="box">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;">
									<path d="M16 .798l.555.37C20.398 3.73 24.208 5 28 5h1v12.5C29 25.574 23.21 31 16 31S3 25.574 3 17.5V5h1c3.792 0 7.602-1.27 11.445-3.832L16 .798zm-1 3.005c-3.2 1.866-6.418 2.92-9.648 3.149L5 6.972V17.5c0 6.558 4.347 10.991 10 11.459zm2 0V28.96c5.654-.468 10-4.901 10-11.459V6.972l-.352-.02c-3.23-.23-6.448-1.282-9.647-3.148z">
									</path>
								</svg>
							<div>
						</div>
						<div class="1_1">로그인 및 보안</div>
						<div class="2_1">비밀번호를 변경하고 계정을 안전하게 보호하세요</div>
					</a>
				</td>
			</tr>
			
			<tr>
				<td> <!-- 결제 담당 -->
					<a href="<%=request.getContextPath() %>/res_list.do?pcode=${member_code_session }" class="information" id="2" class="box">
						<div class="_1uwb2q9">
							<div style="margin-bottom: 16px;">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;">
									<path d="M25 4a2 2 0 0 1 1.995 1.85L27 6v2h2.04c1.042 0 1.88.824 1.955 1.852L31 10v16c0 1.046-.791 1.917-1.813 1.994L29.04 28H6.96c-1.042 0-1.88-.824-1.955-1.852L5 26v-2H3a2 2 0 0 1-1.995-1.85L1 22V6a2 2 0 0 1 1.85-1.995L3 4zm2 18a2 2 0 0 1-1.85 1.995L25 24H7v2h22V10h-2zM25 6H3v16h22zm-3 12a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-8-8a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM6 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z">
									</path>
								</svg>
							</div>
						<div>
						<div class="2_1">결제 및 대금 수령</div>
						<div class="2_2">결제, 대금 수령, 쿠폰, 기프트카드 및 세금 검토하기</div>
					</a>
				</td>
				
				<td>
					<a href="account-settings/notifications.jsp" class="information" >
						<div class="_1uwb2q9">
							<div style="margin-bottom: 16px;" id="3" class="box">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;">
									<path d="M30.82812,3.72656A2.00276,2.00276,0,0,0,28.1875,2.71143L11.78772,10H7a5.99987,5.99987,0,0,0-.25928,11.99414L11,21.99811V29h2V22.53833l15.18848,6.75073A2.0003,2.0003,0,0,0,31,27.46094V4.53857A2.01958,2.01958,0,0,0,30.82812,3.72656ZM6.81641,19.99609A4.00016,4.00016,0,0,1,7,12h4v8H7.02246ZM29,27.46094,13,20.35059V11.6499L29,4.53857Z">
									</path>
								</svg>
							</div>
						<div>
						<div class="3_1">알림</div>
						<div class="3_2">알림 환경설정 및 연락 방식을 선택하세요</div>
					</a>
				</td>
			</tr>
			
			<tr>
				<td>
					<a href="account-settings/privacy-and-sharing.jsp" class="information" >
						<div class="_1uwb2q9">
							<div style="margin-bottom: 16px;" id="4" class="box">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;">
									<path d="m16 27a15.57488 15.57488 0 0 1 -14.51758-10.05811l-.10986-.29389.13281-.52051a15.00446 15.00446 0 0 1 28.98682-.01123l.13476.53272-.10937.293a15.57682 15.57682 0 0 1 -14.51758 10.05802zm-12.53174-10.46973a13.50587 13.50587 0 0 0 25.064-.001 13.00488 13.00488 0 0 0 -25.064.001zm12.53174 4.46973a5 5 0 1 1 5-5 5.00588 5.00588 0 0 1 -5 5zm0-8a3 3 0 1 0 3 3 3.00328 3.00328 0 0 0 -3-3z">
									</path>
								</svg>
							</div>
						</div>
						<div class="4_1">개인정보 및 공개 설정</div>
						<div class="4_2">연결된 앱, 공유하는 정보 및 공개 대상 관리하기</div>
					</a>
				</td>
				<td>
					<a href="account-settings/professional-hosting" class="information" >
						<div class="_1uwb2q9">
							<div style="margin-bottom: 16px;" id="7" class="box">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;">
									<path d="m27 5h-4a2.00229 2.00229 0 0 0 -2 2v4h-4v-8a2.002 2.002 0 0 0 -2-2h-4a2.002 2.002 0 0 0 -2 2v8h-4a2.002 2.002 0 0 0 -2 2v16a2.00229 2.00229 0 0 0 2 2h22a2.0026 2.0026 0 0 0 2-2v-22a2.00229 2.00229 0 0 0 -2-2zm-18 24h-4l-.00146-16h4.00146zm6 0h-4v-16l-.00092-.00891-.00054-9.99109h4.00146zm6 0h-4v-16h4zm6 0h-4v-16l-.00073-.007-.00027-5.993h4.001z">
									</path>
								</svg>
							</div>
						</div>
						<div class="7_1">전문 호스팅 도구</div>
						<div class="7_2">에어비앤비에서 여러 숙소를 관리하신다면 전문 도구를 이용해보세요.</div>
					</a>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="/include/bottom.jsp"></jsp:include>
</body>
</html>