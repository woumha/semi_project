

$(document).ready(function(){
	
	$(".filter_menu1 li").click(function(e) {
   		e.stopPropagation();
	});
	
	$('.filter_menu1').hide();
	var count = 0;
	
	$('.house_place').click(function(){
		if(count ==0) {
			$('.filter_menu1').slideDown();
			count = 1;
		} else{
			$('.filter_menu1').hide();
			count = 0;
		}
	});
	
});