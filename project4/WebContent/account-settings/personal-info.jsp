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
</script>
<style type="text/css">
	 
</style>
</head>
<body>
	<div id="parentdiv" align="center">
		<table>
			<tr>
				<td>
					<div class="childdiv">
						<h4>개인 > 개인정보</h4>
						<div>
							실명
							<br>
							<span id="pname"></span>
							<span>
							<button aria-hidden="false" 
								id="legalName-row-action" 
								aria-labelledby="legalName-row-action legalName-row-title" 
								type="button" class="reWrite">수정</button>
							</span>
						</div>
					</div>
				<hr>
					</td>
				</tr>
			<tr>
				<td>
					<div class="childdiv">
						<div>
							핸드폰 번호
							<br>
							<span id="pemail"></span>
							<span>
							<button aria-hidden="false" 
								id="legalName-row-action" 
								aria-labelledby="legalName-row-action legalName-row-title" 
								type="button" class="reWrite">수정</button>
							</span>
						</div>
					</div>sx
				<hr>
				</td>
			</tr>
			<tr>
				<td>
					<div class="childdiv">
						<div>
							생년월일
							<br>
							<span id="pbirth"></span>
							å<span>
							<button aria-hidden="false" 
								id="legalName-row-action" 
								aria-labelledby="legalName-row-action legalName-row-title" 
								type="button" class="reWrite">수정</button>
							</span>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>