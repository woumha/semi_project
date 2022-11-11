/**
 * 
 */

$(function() {
	$("#hidebtn").hide();
	
	function searchToggle(obj, evt){
	    var container = $(obj).closest('.search-wrapper');
	        if(!container.hasClass('active')){
	            container.addClass('active');
	            evt.preventDefault();
	        }
	        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
	            container.removeClass('active');
	            // clear input
	            container.find('.search-input').val('');
	        }
	}	
	
	
	$("#startDate").hide();
	$("#endDate").hide();
	$(".button.btnBorder").hide();
	
	$("#checkinbtn").on("click", function() {
		$("#startDate").toggle();
		$("#endDate").toggle();
	});
	
	$("#checkoutbtn").on("click", function() {
		$("#startDate").toggle();
		$("#endDate").toggle();
	});
	
});

function searchToggle(obj, evt){
	    var container = $(obj).closest('.search-wrapper');
	        if(!container.hasClass('active')){ // 돋보기
	            container.addClass('active');
	            evt.preventDefault();
				
				
				$(".button.btnBorder").show();
	           	$("#clickbtn").on("click", function() {
	           		$("#clickbtn").hide();
	           		$("#hidebtn").show();
	           		
	           		$("#hidebtn").on("click", function() {
						var text = $(".search-input").val();
						
	   					var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    				var request = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
						
						
						if(text != null) {
							location.href=request + "/topSearch.do?content=" + text;
						}
	           		});
						
				});
				
				$(".search-input").on("keyup", function(e) {
					if(e.keyCode == 13) {
						var text = $(".search-input").val();
					
					
	   					var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    				var request = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	
						
						location.href=request + "/topSearch.do?content=" + text;
					}
				});
	        }
	        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
	        //x 클릭시
	            container.removeClass('active');
	            // clear input
	            container.find('.search-input').val('');
	            $(".button.btnBorder").hide();
	            $("#hidebtn").hide();
	            $("#clickbtn").show();
	        }
	}	
	
function dateDiff(startDate, endDate) {
	if (startDate === '' || endDate === '') return 1;
    var start = new Date(startDate);
    var end = new Date(endDate);
 
    start = new Date(start.getFullYear(), start.getMonth()+1, start.getDate());
    end = new Date(end.getFullYear(), end.getMonth()+1, end.getDate());
 
    var diff = Math.abs(end.getTime() - start.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));
 
    return diff;
}

function calcResult(e, type) {
	var startDate = type === 'start' ? e.target.value : document.getElementById('startDate').value;
    var endDate = type === 'end' ? e.target.value : document.getElementById('endDate').value;
    var price = Number(document.getElementById('houseprice').value);
    var diff = dateDiff(startDate, endDate);
    document.getElementById('count').value = diff;
    document.getElementById('result').value = diff * price;
}