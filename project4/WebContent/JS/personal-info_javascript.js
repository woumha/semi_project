/**
 * 
 */
 
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
				$("#inputcode").hide();
				
				// 전화번호
				$("#td_phone_btn").hide();
				
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
								$("#pemail").text("언제든지 확인하실 수 있는 주소를 입력해주세요.");
								$("#emailbtn").text("취소");
								$(".classmail").show();
							} else {
								$("#pemail").text(pemail);
								$(".classmail").hide();
								$("#emailbtn").text("수정");
								$("#tokencheck").hide();
								$("#inputcode").hide();
							}
							break;
						case "phonebtn":
							if($("#phonebtn").text().trim() == "수정") {
								$("#phonebtn").text("취소");
								$("#td_phone_btn").show();
							} else {
								$("#phonebtn").text("수정");
								$("#td_phone_btn").hide();
								$("#inputphone").val('');
							}
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
		
		// 이메일 인증
		$("#sendcode").on("click", function() {
			m = $("#emailtext").val();
			d = $("#emailSelect").val();
			$.ajax({
				url: "/project4/sendMail.do",
				datatype: "text",
				data: {
					tag: "emailbtn",
					email: m,
					domain: d
				},
				success: function(data) {
					$("#tokencheck").show();
					$("#inputcode").show();
					member_code = data.substring(0, 6);
				},
				error: function() {
					alert("코드 전송을 실패했습니다.");
				}
			});
			
			//$('#formmail').submit();
			
			
			
		});
	});
	
	function insertsubmit() {
		$.ajaxSetup({
			ContentType: "application/x-www-form-urlencoded;charset=UTF-8", //한글처리
			type: "post"
		});
		//if($("#input[type=text]").val() == null) {
			//alert("값을 입력해주세요.");
		//} else {
			if($("#nameinsert").text().trim() == "취소") {
				$.ajax({
					url: "/project4/personal_update.do",
					data: {
						find: "name",
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
			} // name if
			
			if($("#genderbtn").text().trim() == "취소") {
				select = $("select[name=genderSelect] option:selected" ).text();
				console.log(select);
				
				$.ajax({
					url: "/project4/personal_update.do",
					data: {
						find: "gender",
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
			} // gender if
			
			if($("#emailbtn").text().trim() == "취소") {
				if(member_code == $("#inputcode").val()) {
					$.ajax({
						url: "/project4/personal_update.do",
						datatype: "xml",
						data: {
							find: "mail",
							code: pcode,
							mail: m,
							domain: d
						},
						success: function(data) {
							$(data).find("personal").each(function() {
								updateMail = $(this).find("pmember_email").text().trim();
								updateDomain = $(this).find("pmember_domain").text().trim();
								
								$("#pemail").text(updateMail + "@" + updateDomain);
								$(".classmail").hide();
								$("#emailbtn").text("수정");
								$("#tokencheck").hide();
								$("#inputcode").hide();
								$("#inputcode").val('');
							});
							
						},
						error: function() {
							alert("이메일 수정 실패");
						}
					});
				} else {
					alert("인증코드가 잘못되었습니다.");
				}
			} // email if
			
			if($("#phonebtn").text().trim() == "취소") {
				$.ajax({
					url: "/project4/personal_update.do",
					datatype: "xml",
					data: {
						find: "phone",
						code: pcode,
						num: $("#inputphone").val()
					},
					success: function(data) {
						$(data).find("personal").each(function() {
							updatePhone = $(this).find("pmember_phone").text().trim();
							$("#pphone").text(updatePhone);
							$("#pphone").show();
							$("#phonebtn").text("수정");
							$("#td_phone_btn").hide();
							$("#inputphone").val('');
						});
					},
					error: function() {
						alert("수정 실패");
					}
				});
			} // phone if
		//} // if/else
		
	}; // insertsubmit();