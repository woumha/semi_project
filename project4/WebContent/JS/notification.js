/**
 * 
 */
$(function () {
	$.ajaxSetup({
			ContentType: "application/x-www-form-urlencoded;charset=UTF-8", //한글처리
			type: "post"
	});


	$.ajax({
		url: "/project4/notifi.do",
		dataType: "xml",
		success: function(data) {
			const notice = document.querySelector("#notice-table"); //테이블 이름
			const rowIcnt = notice.rows.length; // 테이블 길이

			if(data.length != 21) {
				$(data).find("notice").each(function() {
					let newRow = notice.insertRow();

					no = $(this).find("notice_no").text().trim();
					content = $(this).find("notice_cont").text();
					date = $(this).find("created_date").text().trim();

					newRow.className = "notice_td";

					let noCell = newRow.insertCell(0);
					let contCell = newRow.insertCell(1);
					let dateCell = newRow.insertCell(2);
					let deleteCell = newRow.insertCell(3);

					noCell.innerHTML = no;
					contCell.innerHTML = content;
					dateCell.innerHTML = date;	
					deleteCell.innerHTML = "<a href='#' onClick=\"delRow()\">X</a>";
				});
			} else {
				let newRow = notice.insertRow();
				const emptyCell = newRow.insertCell();
				emptyCell.innerHTML = "알림이 텅텅 비었어요!!!";
			}
		}
	});
});

function delRow() {
	$.ajax({
		url: "/project4/notiDelete.do",
		datatype: "xml",
		data: {
			num: no
		},
		success: function(data) {
			const notice = document.querySelector("#notice-table"); //테이블 이름
			const rowIcnt = notice.rows.length; // 테이블 길이

			if(data.length != 21) {
				location.reload();
				$(data).find("notice").each(function() {
					let newRow = notice.insertRow();

					no = $(this).find("notice_no").text().trim();
					content = $(this).find("notice_cont").text();
					date = $(this).find("created_date").text().trim();

					newRow.className = "notice_td";

					let noCell = newRow.insertCell(0);
					let contCell = newRow.insertCell(1);
					let dateCell = newRow.insertCell(2);
					let deleteCell = newRow.insertCell(3);

					noCell.innerHTML = no;
					contCell.innerHTML = content;
					dateCell.innerHTML = date;	
					deleteCell.innerHTML = "<a href='#' onClick=\"delRow()\">X</a>";
				});
			} else {
				let newRow = notice.insertRow();
				const emptyCell = newRow.insertCell();
				emptyCell.innerHTML = "알림이 텅텅 비었어요!!!";
			}
		}
	});
};