// for hover dropdown menu
  $('ul.nav li.dropdown').hover(function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(200);
    }, function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(200);
    });


 // slick slider call 
    /*$('.slick_slider').slick({
      dots: true,
      infinite: true,      
      speed: 500,      
      slidesToShow: 1,
      slide: 'div',
      autoplay: true,
      autoplaySpeed: 2000,
      cssEase: 'linear'
    });*/
    
    
    // slick slider2 call 
    /*$('.slick_slider2').slick({
      dots: true,
      infinite: true,      
      speed: 500,      
      autoplay: true,
      autoplaySpeed: 2000,
      fade:true,
      slide: 'div',
      cssEase: 'linear'
    });*/

   /* $('#foo1').carouFredSel({
                items: 6,
                height: 220,
                prev: '.prev',
                next: '.next',
                auto: true,
                scroll: 1
            });*/


/*price range*/

 $('#sl2').slider();

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	
		
/*scroll to top*/

$(document).ready(function(){
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
});



	$(function(){
		$(".dropdown-menu > li > a.trigger").on("mouseenter",function(e){
			var current=$(this).next();
			var grandparent=$(this).parent().parent();
			if($(this).hasClass('left-caret')||$(this).hasClass('right-caret'))
				$(this).toggleClass('right-caret left-caret');
			grandparent.find('.left-caret').not(this).toggleClass('right-caret left-caret');
			grandparent.find(".sub-menu:visible").not(current).hide();
			current.toggle();
			e.stopPropagation();
		});
		$(".dropdown-menu > li > a:not(.trigger)").on("click",function(){
			var root=$(this).closest('.dropdown');
			root.find('.left-caret').toggleClass('right-caret left-caret');
			root.find('.sub-menu:visible').hide();
		});
	});

   (function(){
        $(" #nav ul ").css({
            display: "none"
        }); // Opera Fix
        $(" #nav li").hover(function(){
            $(this).find('ul:first').css({
                visibility: "visible",
                display: "none"
            }).slideDown(250);
        },function(){
            $(this).find('ul:first').css({
                visibility: "hidden"
            });
        });
    })();        
    
    (function(){
        $('#nav-responsive').on('change', function() {
            window.location = $(this).val();
        }); 
    })();    