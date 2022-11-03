/**
 * 
 */
 
$(function() {
	$.ajaxSetup({
			ContentType: "application/x-www-form-urlencoded;charset=UTF-8", //한글처리
			type: "post"
	});
	
	let hiddentr = document.querySelector("#hiddentr");
	let showtr = document.querySelector("#showtr");
	hiddentr.style.display = 'none';
	
	
	$.ajax({
		url: "/project4/account.do",
		datatype: "xml",
		success: function(data) {
			let email = $(data).find("pmember_email").text();
			let domain = $(data).find("pmember_domain").text();
			$("#email").text(email + "@" + domain);
			
		}
		
	});
	
		
	$("#member-delete-btn").on("click", function() {
		let btnValue = document.querySelector("#member-delete-btn").innerText;
		
		if(btnValue != "계정 삭제") {
			document.querySelector("#member-delete-btn").innerText = "계정 삭제";
			showtr.style.display = 'none';
			hiddentr.style.display = 'block';
		} else {
			$.ajaxSetup({
					ContentType: "application/x-www-form-urlencoded;charset=UTF-8", //한글처리
					type: "post"
				});
				
				$.ajax({ 
					url: "/project4/memberDelete.do",
					datatype: "text",
					success: function(data) {
						if(data == 1) {
							location.href="byebye.jsp";
						}
					}
				});
		}
	});
	
});



