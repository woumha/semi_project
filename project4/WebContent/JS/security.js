/**
 * 
 */


$(function () {
	$.ajaxSetup({
		ContentType: "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post"
	});
	
	$(".membershutdown").on("click", function () {
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
	$(".updatespan").on("click", function() {
		location.reload();
	});
});
