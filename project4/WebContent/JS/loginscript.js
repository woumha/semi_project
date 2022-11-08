/**
 * 
 */
/**
 * 
 */
 
 $(function() {
	$.ajaxSetup({
		ContentType: "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post"
	});
	
	//====================== loginSelect.jsp =========================
	$(".member_login").hide();
	
	//====================== loginSelet.jsp end =====================
	
	
	//====================== tokenCheck.jsp =========================
	
		$("#inputToken").keyup(function() {
			if($.trim($("#inputToken").val()).length < 6) {
				let warning = '<font color="red">숫자 6개를 입력해주세요.</font>';
				$("#ck").text('');
				$("#ck").show();
				$("#ck").append(warning);
			} else if($.trim($("#inputToken").val()).length > 6) {
				let over = $("#inputToken").val();
				console.log(over);
				$("#inputToken").val(over.substring(0, over.length -1));
				$("#ck").text('');
				$("#ck").show();
			} else if($.trim($("#inputToken").val()).length == 6) {
				$("#formsubmit").submit();
			}
		});
	
	//====================== tokenCheck.jsp =========================
	
	
	//====================== memberSignUp.jsp =========================
	$("#signUpbtn").on("click", function() {
		if($("#lname").val() == '' || $("#fname").val() =='') {
			alert("이름을 입력해주세요.");
			return false;
		}
		else if($("#bir").val() == '') {
			alert("생년월일을 입력해주세요.");
			return false;
		} else if($("#ph").val() == '') { 
			alert("번호를 입력해주세요.");
			return false;			
		} else {
			$("#inform").submit();
		}
	});	 // $("#signUpbtn")
	//====================== memberSignUp.jsp end=========================

	
	
}); //function
