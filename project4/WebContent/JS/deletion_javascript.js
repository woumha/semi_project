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
			$("#emailId").text(email + "@" + domain);
			
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
	}); // memeber-delete-btn
	
	$("#deletion-page").on("click", function() {
		let btnValue = document.querySelector("#member-delete-btn").innerText;
		if(btnValue != "계정 삭제") {
			location.href="../privacy-and-sharing.jsp";
		} else {
			location.href="deletion.jsp";
		}
	}); // deletion-page
	
	$("#closeMemeber").on("click", function() {
        var input = confirm("비활성화 하시겠습니까?");
        if(input != false) {
            $.ajax({
                url: "/project4/shutdownMember.do",
                datatype: "text",
                success: function(data) {
                    if(data > 0) {
                        alert("계정이 비활성화 되었습니다.");
                        location.href="/project4/logout.do";
                    } else {
                        alert("잠시 후 다시 시도해주세요.");
                        location.reload();
                    }

                }
            });
        }
    });
});



