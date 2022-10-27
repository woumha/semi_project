
$(document).ready(function(){
	$(".filter_menu1 li").click(function(e) {
   		e.stopPropagation();
	});
	$('.filter_menu1').hide();
	var count = 0;
	$('.house_place1').click(function(){
		if(count == 0) {
			$('.filter_menu1').slideDown();
			count = 1;
		} else{
			$('.filter_menu1').hide();
			count = 0;
		}
	});
});
$(document).ready(function(){
	$(".filter_menu2 li").click(function(e) {
   		e.stopPropagation();
	});
	$('.filter_menu2').hide();
	var count = 0;
	$('.house_place2').click(function(){
		if(count == 0) {
			$('.filter_menu2').slideDown();
			count = 1;
		} else{
			$('.filter_menu2').hide();
			count = 0;
		}
	});
});
$(document).ready(function(){
	$(".filter_menu3 li").click(function(e) {
   		e.stopPropagation();
	});
	$('.filter_menu3').hide();
	var count = 0;
	$('.house_place3').click(function(){
		if(count == 0) {
			$('.filter_menu3').slideDown();
			count = 1;
		} else{
			$('.filter_menu3').hide();
			count = 0;
		}
	});
	
	
});

var lnb = $("#header_category").offset().top;
$(window).scroll(function() {
  	var window = $(this).scrollTop();

    if(lnb <= window) {
      $("#header_category").addClass("fixed");
    } else {
      $("#header_category").removeClass("fixed");
    }
})