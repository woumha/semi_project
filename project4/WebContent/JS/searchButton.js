/**
 * 
 */

$(function() {
	
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
	
	
	$("checkinbtn").on("click", function() {
		StartCalendar();
		EndCalendar();
	});
	
	
	
});

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
	
function StartCalendar() {
		
}

function EndCalendar() {
	
}
