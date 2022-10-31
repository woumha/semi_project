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
					pname = $(this).find("pmember_name").text();
					pemail = $(this).find("pmember_email").text();
					pbirth = $(this).find("pmember_birth").text();
				});
				
				$("#pname").text(pname);
				$("#pemail").text(pemail);
				$("#pbirth").text(pbirth);
			},
			error: function() {
				alert("계정 통신 오류");
			}
			
		}); // ajax
	});
	
	$("reWrite").on("click", function() {
		
	});
</script>
<style type="text/css">
	 
</style>
</head>
<body>
	<div class="childdiv">
		<h4>개인 > 개인정보</h4>
	</div>
	<p> <p>
	<div id="parentdiv" align="center">
		<table>
			<tr>
				<th>
					실명
				</th>
				<td>
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
					<div id="pname"></div>
				</td>
			</tr>
			
			<tr>
				<td>
					<hr>
				</td>
			</tr>
			
			<tr>
				<th>
					성별
				</th>
				<td>
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
				<td>
					<hr>
				</td>
			</tr>
			
			<tr>
				<th>
					이메일 주소
				</th>
				<td>
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
				<td>
					<hr>
				</td>
			</tr>
			
			<tr>
				<th>
					전화번호
				</th>
				<td>
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
				<td>
					<hr>
				</td>
			</tr>
			
			<tr>
				<th>
					주소
				</th>
				<td>
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
				<td>
					<hr>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>