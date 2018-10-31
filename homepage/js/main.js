
// Login Form
$(document).ready(function($) {
	$("#topNav a.login").click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active').addClass('inactive');
			$("#loginForm").fadeOut().removeClass('active');
		} else {
			$(this).addClass('active').removeClass('inactive');
			$("#loginForm").fadeIn().addClass('active');
		}
	});
});


 $('.accordion').on('click', '.title', function(event) {
        event.preventDefault();
        $(this).siblings('.accordion .active').next().slideUp('normal');
        $(this).siblings('.accordion .title').removeClass("active");
        
        if($(this).next().is(':hidden') == true) {
            $(this).next().slideDown('normal');
            $(this).addClass("active");
        }
    });
    $('.accordion .content').hide();
    $('.accordion .active').next().slideDown('normal');
    

// for hover dropdown menu
  $('ul.nav li.dropdown').hover(function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(200);
    }, function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(200);
    });


$("#latest-news").owlCarousel({ 
		items : 4,
		pagination	: true,	
		autoPlay	: true,
		stopOnHover	: true,
	});
 // slick slider call 
    $('.slick_slider').slick({
      dots: true,
      infinite: true,      
      speed: 500,      
      slidesToShow: 1,
      slide: 'div',
      autoplay: true,
      autoplaySpeed: 2000,
      cssEase: 'linear'

    });
    // slick slider2 call 
    $('.slick_slider2').slick({
      dots: true,
      infinite: true,      
      speed: 500,      
      autoplay: true,
      autoplaySpeed: 2000,
      fade:true,
      slide: 'div',
      cssEase: 'linear'
    });

    $('#foo1').carouFredSel({
                items: 6,
                height: 220,
                prev: '.prev',
                next: '.next',
                auto: true,
                scroll: 1
            });


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



"use strict";if("undefined"==typeof jQuery)throw new Error("AdminLTE requires jQuery");$.AdminLTE={},$.AdminLTE.options={navbarMenuSlimscroll:!0,navbarMenuSlimscrollWidth:"3px",navbarMenuHeight:"200px",sidebarToggleSelector:"[data-toggle='offcanvas']",sidebarPushMenu:!0,sidebarSlimScroll:!0,enableBoxRefresh:!0,enableBSToppltip:!0,BSTooltipSelector:"[data-toggle='tooltip']",enableFastclick:!0,enableBoxWidget:!0,boxWidgetOptions:{boxWidgetIcons:{collapse:"fa fa-minus",open:"fa fa-plus",remove:"fa fa-times"},boxWidgetSelectors:{remove:'[data-widget="remove"]',collapse:'[data-widget="collapse"]'}},directChat:{enable:!0,contactToggleSelector:'[data-widget="chat-pane-toggle"]'},colors:{lightBlue:"#3c8dbc",red:"#f56954",green:"#00a65a",aqua:"#00c0ef",yellow:"#f39c12",blue:"#0073b7",navy:"#001F3F",teal:"#39CCCC",olive:"#3D9970",lime:"#01FF70",orange:"#FF851B",fuchsia:"#F012BE",purple:"#8E24AA",maroon:"#D81B60",black:"#222222",gray:"#d2d6de"},screenSizes:{xs:480,sm:768,md:992,lg:1200}},$(function(){var a=$.AdminLTE.options;$.AdminLTE.layout.activate(),$.AdminLTE.tree(".sidebar"),a.navbarMenuSlimscroll&&"undefined"!=typeof $.fn.slimscroll&&$(".navbar .menu").slimscroll({height:"200px",alwaysVisible:!1,size:"3px"}).css("width","100%"),a.sidebarPushMenu&&$.AdminLTE.pushMenu(a.sidebarToggleSelector),a.enableBSToppltip&&$(a.BSTooltipSelector).tooltip(),a.enableBoxWidget&&$.AdminLTE.boxWidget.activate(),a.enableFastclick&&"undefined"!=typeof FastClick&&FastClick.attach(document.body),a.directChat.enable&&$(a.directChat.contactToggleSelector).click(function(){var a=$(this).parents(".direct-chat").first();a.toggleClass("direct-chat-contacts-open")}),$('.btn-group[data-toggle="btn-toggle"]').each(function(){var a=$(this);$(this).find(".btn").click(function(b){a.find(".btn.active").removeClass("active"),$(this).addClass("active"),b.preventDefault()})})}),$.AdminLTE.layout={activate:function(){var a=this;a.fix(),a.fixSidebar(),$(window,".wrapper").resize(function(){a.fix(),a.fixSidebar()})},fix:function(){var a=$(".main-header").outerHeight()+$(".main-footer").outerHeight(),b=$(window).height(),c=$(".sidebar").height();$("body").hasClass("fixed")?$(".content-wrapper, .right-side").css("min-height",b-$(".main-footer").outerHeight()):b>=c?$(".content-wrapper, .right-side").css("min-height",b-a):$(".content-wrapper, .right-side").css("min-height",c)},fixSidebar:function(){return $("body").hasClass("fixed")?("undefined"==typeof $.fn.slimScroll&&console&&console.error("Error: the fixed layout requires the slimscroll plugin!"),void($.AdminLTE.options.sidebarSlimScroll&&"undefined"!=typeof $.fn.slimScroll&&($(".sidebar").slimScroll({destroy:!0}).height("auto"),$(".sidebar").slimscroll({height:$(window).height()-$(".main-header").height()+"px",color:"rgba(0,0,0,0.2)",size:"3px"})))):void("undefined"!=typeof $.fn.slimScroll&&$(".sidebar").slimScroll({destroy:!0}).height("auto"))}},$.AdminLTE.pushMenu=function(a){var b=this.options.screenSizes;$(a).click(function(a){a.preventDefault(),$(window).width()>b.sm-1?$("body").toggleClass("sidebar-collapse"):$("body").hasClass("sidebar-open")?($("body").removeClass("sidebar-open"),$("body").removeClass("sidebar-collapse")):$("body").addClass("sidebar-open")}),$(".content-wrapper").click(function(){$(window).width()<=b.sm-1&&$("body").hasClass("sidebar-open")&&$("body").removeClass("sidebar-open")})},$.AdminLTE.tree=function(a){var b=this;$("li a",$(a)).click(function(a){var c=$(this),d=c.next();if(d.is(".treeview-menu")&&d.is(":visible"))d.slideUp("normal",function(){d.removeClass("menu-open")}),d.parent("li").removeClass("active");else if(d.is(".treeview-menu")&&!d.is(":visible")){var e=c.parents("ul").first(),f=e.find("ul:visible").slideUp("normal");f.removeClass("menu-open");var g=c.parent("li");d.slideDown("normal",function(){d.addClass("menu-open"),e.find("li.active").removeClass("active"),g.addClass("active"),b.layout.fix()})}d.is(".treeview-menu")&&a.preventDefault()})},$.AdminLTE.boxWidget={activate:function(){var a=$.AdminLTE.options,b=this;$(a.boxWidgetOptions.boxWidgetSelectors.collapse).click(function(a){a.preventDefault(),b.collapse($(this))}),$(a.boxWidgetOptions.boxWidgetSelectors.remove).click(function(a){a.preventDefault(),b.remove($(this))})},collapse:function(a){var b=a.parents(".box").first(),c=b.find(".box-body, .box-footer");b.hasClass("collapsed-box")?(a.children(".fa-plus").removeClass("fa-plus").addClass("fa-minus"),c.slideDown(300,function(){b.removeClass("collapsed-box")})):(a.children(".fa-minus").removeClass("fa-minus").addClass("fa-plus"),c.slideUp(300,function(){b.addClass("collapsed-box")}))},remove:function(a){var b=a.parents(".box").first();b.slideUp()},options:$.AdminLTE.options.boxWidgetOptions},function(a){a.fn.boxRefresh=function(b){function c(a){a.append(f),e.onLoadStart.call(a)}function d(a){a.find(f).remove(),e.onLoadDone.call(a)}var e=a.extend({trigger:".refresh-btn",source:"",onLoadStart:function(){},onLoadDone:function(){}},b),f=a('<div class="overlay"><div class="fa fa-refresh fa-spin"></div></div>');return this.each(function(){if(""===e.source)return void(console&&console.log("Please specify a source first - boxRefresh()"));var b=a(this),f=b.find(e.trigger).first();f.click(function(a){a.preventDefault(),c(b),b.find(".box-body").load(e.source,function(){d(b)})})})}}(jQuery),function(a){a.fn.todolist=function(b){var c=a.extend({onCheck:function(){},onUncheck:function(){}},b);return this.each(function(){"undefined"!=typeof a.fn.iCheck?(a("input",this).on("ifChecked",function(){var b=a(this).parents("li").first();b.toggleClass("done"),c.onCheck.call(b)}),a("input",this).on("ifUnchecked",function(){var b=a(this).parents("li").first();b.toggleClass("done"),c.onUncheck.call(b)})):a("input",this).on("change",function(){var b=a(this).parents("li").first();b.toggleClass("done"),c.onCheck.call(b)})})}}(jQuery);





    	
var regions=[
    {
        "region_name": "Lombardia",
        "region_code": "lom",
        "population": 9794525
    },
    {
        "region_name": "Campania",
        "region_code": "cam",
        "population": 5769750
    },
    {
        "region_name": "Lazio",
        "region_code": "laz",
        "population": 5557276
    },
    {
        "region_name": "Sicilia",
        "region_code": "sic",
        "population": 4999932
    },
    {
        "region_name": "Veneto",
        "region_code": "ven",
        "population": 4881756
    },
    {
        "region_name": "Emilia-Romagna",
        "region_code": "emi",
        "population": 4377487
    },
    {
        "region_name": "Piemonte",
        "region_code": "pie",
        "population": 4374052
    },
    {
        "region_name": "Puglia",
        "region_code": "pug",
        "population": 4050803
    },
    {
        "region_name": "Toscana",
        "region_code": "tos",
        "population": 3692828
    },
    {
        "region_name": "Calabria",
        "region_code": "cal",
        "population": 1958238
    },
    {
        "region_name": "Sardegna",
        "region_code": "sar",
        "population": 1640379
    },
    {
        "region_name": "Liguria",
        "region_code": "lig",
        "population": 1565127
    },
    {
        "region_name": "Marche",
        "region_code": "mar",
        "population": 1545155
    },
    {
        "region_name": "Abruzzo",
        "region_code": "abr",
        "population": 1312507
    },
    {
        "region_name": "Friuli-Venezia Giulia",
        "region_code": "fri",
        "population": 1221860
    },
    {
        "region_name": "Trentino-Alto Adige",
        "region_code": "tre",
        "population": 1039934
    },
    {
        "region_name": "Umbria",
        "region_code": "umb",
        "population": 886239
    },
    {
        "region_name": "Basilicata",
        "region_code": "bas",
        "population": 576194
    },
    {
        "region_name": "Molise",
        "region_code": "mol",
        "population": 313341
    },
    {
        "region_name": "Val d'Aosta",
        "region_code": "vao",
        "population": 127844
    }
];


var temp_array= regions.map(function(item){
    return item.population;
});
var highest_value = Math.max.apply(Math, temp_array);

$(function() {

    for(i = 0; i < regions.length; i++) {

        $('#'+ regions[i].region_code)
        .css({'fill': 'rgba(11, 104, 170,' + regions[i].population/highest_value +')'})
        .data('region', regions[i]);
    }

    $('.map g').mouseover(function (e) {
        var region_data=$(this).data('region');
        $('<div class="info_panel">'+
            region_data.region_name + '<br>' +
            'Population: ' + region_data.population.toLocaleString("en-UK") +
            '</div>'
         )
        .appendTo('body');
    })
    .mouseleave(function () {
        $('.info_panel').remove();
    })
    .mousemove(function(e) {
        var mouseX = e.pageX, //X coordinates of mouse
            mouseY = e.pageY; //Y coordinates of mouse

        $('.info_panel').css({
            top: mouseY-50,
            left: mouseX - ($('.info_panel').width()/2)
        });
    });

});


var menuClick = $('a.elemadded'),
		navbarVertical = $('.navbar-vertical');
		
	menuClick.on('click', function(e){
		e.preventDefault();

		if( navbarVertical.hasClass('active') ){
			navbarVertical.removeClass('active');
		} else {
			navbarVertical.addClass('active');
		}
	});

	winDow.bind('resize', function(){
		navbarVertical.removeClass('active');
	});







var dayarray=new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat")
var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December")

function getthedate(){
var mydate=new Date()
var year=mydate.getYear()
if (year < 1000)
year+=1900
var day=mydate.getDay()
var month=mydate.getMonth()
var daym=mydate.getDate()
if (daym<10)
daym="0"+daym
var hours=mydate.getHours()
var minutes=mydate.getMinutes()
var seconds=mydate.getSeconds()
var dn="AM"
if (hours>=12)
dn="PM"
if (hours>12){
hours=hours-12
}
if (hours==0)
hours=12
if (minutes<=9)
minutes="0"+minutes
if (seconds<=9)
seconds="0"+seconds
//change font size here
var cdate=dayarray[day]+". "+montharray[month]+" "+daym+", "+year+"<font color='cyan'> "+hours+":"+minutes+":"+seconds+"</font>";
if (document.all)
document.all.clock.innerHTML=cdate
else if (document.getElementById)
document.getElementById("clock").innerHTML=cdate
else
document.write(cdate)
}
if (!document.all&&!document.getElementById)
getthedate()
function goforit(){
if (document.all||document.getElementById)
setInterval("getthedate()",1000)
}