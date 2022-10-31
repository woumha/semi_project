<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				let pname ="";
				$(data).find("personal").each(function() {
					pfirstname = $(this).find("pmember_firstname").text();
					plastname = $(this).find("pmember_lastname").text();
					pgender = $(this).find("pmember_gender").text();
					pemail = $(this).find("pmember_email").text();
					pbirth = $(this).find("pmember_birth").text();
				});
				
				$("#fname").text(pfirstname);
				$("#lname").text(plastname)
				$("#pemail").text(pemail);
				$("#pbirth").text(pbirth);
				$("#pgender").text(pgender);
			},
			error: function() {
				alert("계정 통신 오류");
			}
			
		}); // ajax
		
		$("#cnamebtn").hide();
		$(".tdinput").hide();
		
		
		$(".reWrite").on("click", function() {
			var tagId = $(this).attr('id');
			$(".reWrite").text("취소");		
			switch(tagId) {
				case "namebtn":
					$("#pname").text("허가증이나 여권 등 여행 서류에 기재되어 있는 이름을 말합니다.");
					$(".tdinput").show();
					$("#lastName").text($("#lname"));
					$("#firstName").text($("#fname"));
					break;
				case "genderbtn":
					$("#genderbtn").hide();
					break;
				case "emailbtn":
					$("#emailbtn").hide();
					break;
				case "phonebtn":
					$("#phonebtn").hide();
					break;
				case "addrbtn":
					$("#addrbtn").hide();
					break;
			}
		});
		
	});
	
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
					<span id="fname"></span>
					<span id="lname"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="tdinput">
					<input type="text" name="lastName" id="lastName"> 
					<input type="text" name="firstName" id="firstName">
				</td>
			</tr>
			
			
			<tr>
				<td colspan="2">
					<p>
					<hr>
				</td>
			</tr>
			
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
				<td colspan="2">
					<p>
					<hr>
				</td>
			</tr>
			
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
					<div id="peamil"></div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<p>
					<hr>
				</td>
			</tr>
			
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
				<td colspan="2">
					<p>
					<hr>
				</td>
			</tr>
			
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