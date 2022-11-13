<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 - 계정 관리 - 4팀</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="../JS/personal-info_javascript.js"></script>
<link rel="stylesheet" href="/project4/CSS/personInfo.css" />
</head>
<body>
	<jsp:include page="/include/top.jsp" />
<div id="position">
	<div class="childdiv">
		<h4><a href="<%=request.getContextPath()%>/account-settings.do">계정</a> > 개인정보</h4>
	</div>
	<p> <p>
	<div id="parentdiv">
		<table width="600">
			<div id="divman">
				<tr>
					<th>
						실명
					</th>
					<td class="btntd">
						<span>
							<button aria-hidden="false" 
								id="namebtn" 
								aria-labelledby="legalName-row-action legalName-row-title" 
								class="reWrite">
									수정
							</button>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span id="pname"></span>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="tdinput">
						<input type="text" class="ha" name="lastName" id="lastName"> 
						<input type="text" class="ha" name="firstName" id="firstName">
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="저장" class="inserbtn" id="nameinsert" onclick="insertsubmit()">
					</td>
				</tr>
			</div>
			<tr>
				<td colspan="2">
					<p>
					<hr>
				</td>
			</tr>
			
			<div id="divgender">
				<tr>
					<th>
						성별
					</th>
					<td class="btntd">
						<span>
							<button aria-hidden="false" 
								id="genderbtn" 
								aria-labelledby="legalName-row-action legalName-row-title" 
								class="reWrite">
									수정
							</button>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<div id="pgender"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="classgender">
						<select name="genderSelect" id="genderSelect">
							<option value="m">남자</option>
							<option value="f">여자</option>
							<option value="o">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="저장" class="classgender" id="genderinsert" onclick="insertsubmit()">
					</td>
				</tr>
			</div>
			
			<tr>
				<td colspan="2">
					<p>
					<hr>
				</td>
			</tr>
			
			<div id="divemail">
				<tr>
					<th>
						이메일 주소
					</th>
					<td class="btntd">
						<span>
							<button aria-hidden="false" 
								id="emailbtn" 
								aria-labelledby="legalName-row-action legalName-row-title" 
								class="reWrite">
									수정
							</button>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<div id="pemail"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="classmail">
							<form method="get" id="formmail" action="<%=request.getContextPath() %>/sendMail.do">
								<input type="hidden" name="tag" value="emailbtn">
								<input type="text" name="email" id="emailtext">
								@
								<select name="emailSelect" id="emailSelect" name="domain">
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
								</select>						
							</form>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="tired">
							<input type="button" value="인증" class="classmail" id="sendcode">
							<br>
							<input type="text" id="inputcode" class="inputcode" placeholder="인증 코드">
							<input type="button" value="수정" class="tokencheck" id="tokencheck" onclick="insertsubmit()">
						</div>
					</td>
				</tr>
			</div>
			
			
			
			<tr>
				<td colspan="2">
					<p>
					<hr>
				</td>
			</tr>
			
			<div id="divphone">
				<tr>
					<th>
						전화번호
					</th>
					<td class="btntd">
						<span>
							<button aria-hidden="false" 
								id="phonebtn" 
								aria-labelledby="legalName-row-action legalName-row-title" 
								class="reWrite">
									수정
							</button>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<div id="pphone"></div>
					</td>
				</tr>
				<tr>
					<td id="td_phone_btn">
						<input type="text" id="inputphone" class="classphone" placeholder="-를 제외하고 입력해주세요.">
						&nbsp;
						<input type="button" id="phone_input_btn" class="phone_input_btn" value="저장" onclick="insertsubmit()">
					</td>
				</tr>
			</div>
			<tr>
				<td colspan="2">
					<p>
					<hr>
				</td>
			</tr>
		</table>
	</div>
</div>
	<jsp:include page="/include/bottom.jsp" />
	<link rel="stylesheet" type="text/css" crossorigin="anonymous" href="https://a0.muscache.com/airbnb/static/packages/web/common/72f46196c8.css" media="all">
</body>
</html>