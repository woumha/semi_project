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
<script type="text/javascript">
	$(function() {
		$.ajaxSetup({
			ContentType: "application/x-www-form-urlencoded;charset=UTF-8", //한글처리
			type: "post"
		});
		
		$.ajax({
			url: "/project4/account.do",
			datatype: "xml",
			success: function(data) {
				
				$(data).find("personal").each(function() {
					pcode = $(this).find("pmember_code").text().trim();
					pfirstname = $(this).find("pmember_firstname").text();
					plastname = $(this).find("pmember_lastname").text();
					pname = plastname + " " + pfirstname;
					pmembergender = $(this).find("pmember_gender").text();
					pe = $(this).find("pmember_email").text();
					pemail = $(this).find("pmember_email").text() + "@" + $(this).find("pmember_domain").text();
					pphone = $(this).find("pmember_phone").text();
					pbirth = $(this).find("pmember_birth").text();
				});
				$("#pname").text(pname);
				
				if(pmembergender == "null") {
					$("#pgender").text("지정되지 않음");
				} else {
					$("#pgender").text(pmembergender);
				}
				$("#pemail").text(pemail);
				$("#pphone").text(pphone);
				
				// 이름
				$(".tdinput").hide();
				$("#nameinsert").hide();
				
				// 성별
				$(".classgender").hide();
				
				// 이메일
				$(".classmail").hide();
				$("#tokencheck").hide();
				
				$(".reWrite").on("click", function() {
					let tagid = $(this).attr("id");
					
					switch(tagid) {
						case "namebtn": //이름
							if($("#namebtn").text().trim() == "수정") {
								$("#namebtn").text("취소");		
								$("#pname").text("허가증이나 여권 등 여행 서류에 기재되어 있는 이름을 말합니다.");
								$("#lastName").val(plastname);
								$("#firstName").val(pfirstname);
								$(".ha").show();
								$("#nameinsert").show();
								$(".tdinput").show();
							} else {
								$("#namebtn").text("수정");
								$("#pname").text(pname);
								$("#nameinsert").hide();
								$(".ha").hide();
							}
							break; //namebtn end
						case "genderbtn": // 성별
							if($("#genderbtn").text().trim() == "수정") {
								$("#genderbtn").text("취소")
								$(".classgender").show();
								$("#pgender").hide();
								
							} else {
								$("#genderbtn").text("수정");
								$(".classgender").hide();
								$("#pgender").show();
								
							}
							break;
						case "emailbtn":
							if($("#emailbtn").text().trim() == "수정") {
								$("#pemail").text("언제든지 확인하실 수 있는 주소를 확인하세요.");
								$("#emailbtn").text("취소");
								$(".classmail").show();
								$("#sendcode").on("click", function() {
									$.ajax({
										url: "/project4/"
									});
									$("#tokencheck").show();						
								});
							} else {
								$("#pemail").text(pemail);
								$(".classmail").hide();
								$("#emailbtn").text("수정");
								
								
							}
							break;
						case "phonebtn":
							$("#phonebtn").hide();
							break;
						case "addrbtn":
							$("#addrbtn").hide();
							break;
					}
				});
			},
			error: function() {
				alert("계정 통신 오류");
			}
			
		}); // ajax
		
	});
	
	function insertsubmit() {
		$.ajaxSetup({
			ContentType: "application/x-www-form-urlencoded;charset=UTF-8", //한글처리
			type: "post"
		});
		if($("#namebtn").text().trim() == "취소") {
			$.ajax({
				url: "/project4/personal_update.do",
				data: {
					find: "1",
					code: pcode,
					last: $("#lastName").val(),
					first: $("#firstName").val()
				},
				success: function(data) {
					$(data).find("personal").each(function() {
						lastname = $(this).find("pmember_lastname").text().trim();
						firstname = $(this).find("pmember_firstname").text().trim();
						$("#namebtn").text("수정");
						$(".tdinput").hide();
						$("#nameinsert").hide();
						$("#pname").text(lastname + " " + firstname);
					});
				},
				
			});
		} else if($("#genderbtn").text().trim() == "취소") {
			select = $("select[name=genderSelect] option:selected" ).text();
			console.log(select);
			
			$.ajax({
				url: "/project4/personal_update.do",
				data: {
					find: "2",
					code: pcode,
					gender: select 
				},
				success: function(data) {
					$(data).find("personal").each(function() {
						gender = $(this).find("pmember_gender").text().trim();
						$("#genderbtn").text("수정");
						$("#pgender").text(gender);
						$(".classgender").hide();
						$("#pgender").show();
					});
				}
			});
		}
	}; // insertsubmit()
</script>
<style type="text/css">
	 .btntd {
	 	float: right
	 }
</style>
</head>
<body>
	<div align="center" class="childdiv">
		<h4>개인 > 개인정보</h4>
	</div>
	<p> <p>
	<div id="parentdiv" align="center">
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
							<input type="text" id="emailtext">
							@
							<select name="emailSelect">
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
							</select>						
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="tired">
							<input type="button" value="인증코드발송" class="classmail" id="sendcode">
							<input type="button" value="수정" class="tokencheck" id="tokencheck">
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
			</div>
			
			<tr>
				<td colspan="2">
					<p>
					<hr>
				</td>
			</tr>
			
			<div id="divaddr">
				<tr>
					<th>
						주소
					</th>
					<td class="btntd">
						<span>
							<button aria-hidden="false" 
								id="addrbtn" 
								aria-labelledby="legalName-row-action legalName-row-title" 
								class="reWrite">
									수정
							</button>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<div id="paddr"></div>
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
</body>
</html>