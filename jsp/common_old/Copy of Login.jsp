<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java"%>
<%@ page import="java.util.ArrayList" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");

ArrayList reportData=null;
ArrayList reportAmountData=null;

if (request.getAttribute("reportAmountData")!=null)
reportAmountData=(ArrayList)request.getAttribute("reportAmountData");

String msgString="";
%>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Welcome </title>
    
    <script src="<%=basePath%>js/alertbox/jquery.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/alertbox/jquery.ui.draggable.js"
		type="text/javascript"></script>
	<script src="<%=basePath%>js/alertbox/jquery.alerts.js"
		type="text/javascript"></script>
	<link href="<%=basePath%>js/alertbox/jquery.alerts.css"
		rel="stylesheet" type="text/css" media="all" />
		
		
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/prettyPhoto.css" rel="stylesheet">
    <link href="<%=basePath%>css/price-range.css" rel="stylesheet">
    <link href="<%=basePath%>css/animate.css" rel="stylesheet">

	<link href="<%=basePath%>css/responsive.css" rel="stylesheet">
    <link href="<%=basePath%>fonts/stylesheet.css" rel="stylesheet">
    <script type="text/javascript" src="<%=basePath%>scripts/md5.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/form_validations.js"></script>
		
		 <link id="pagestyle" rel="stylesheet" type="text/css"  href="<%=basePath%>css/main.css" />
		 
<script type="text/javascript">
 
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="<%=basePath%>images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=basePath%>images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=basePath%>images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=basePath%>images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>images/ico/apple-touch-icon-57-precomposed.png">

      
                    


<script src="<%=basePath%>js/dw_event.js" type="text/javascript"></script>
<script src="<%=basePath%>js/dw_cookies.js" type="text/javascript"></script>
<script src="<%=basePath%>js/dw_sizerdx.js" type="text/javascript"></script>
<script type="text/javascript">
dw_Event.add( window, 'load', dw_fontSizerDX.init );
</script>
	<script type="text/javascript">
function swapStyleSheet(sheet){
	document.getElementById('pagestyle').setAttribute('href', sheet);

}
</script>
<script type="text/javascript" src="<%=basePath%>js/jsapi.js"></script>
<script type="text/javascript" src="<%=basePath%>js/fusionCharts/FusionCharts.js"></script>
<script type="text/javascript" src="<%=basePath%>js/fusionCharts/fusioncharts.charts.js"></script>
    <script type="text/javascript">
function openFundChart() {
  
    var revenueChart = new FusionCharts(
    <%
      	if (request.getAttribute("reportAmountData")!=null && ((ArrayList)request.getAttribute("reportAmountData")).size()>0)
      	{
      %>
	    {
	        type: 'column2d',
	        renderAt: 'chart_Amount_div',
	        width: '280',
	        height: '260',
	        dataFormat: 'json',
	        dataSource: {
	            "chart": {
	                "caption": "Fund Releases",
	                "subCaption": "",
	                "xAxisName": "",
	                "yAxisName": "Amount (In Rs.)",
	                "numberPrefix": "", /* ₹ */
	                "paletteColors": "#0075c2",
	                "bgColor": "#ffffff",
	                "borderAlpha": "20",
	                "canvasBorderAlpha": "0",
	                "usePlotGradientColor": "0",
	                "plotBorderAlpha": "10",
	                "placevaluesInside": "1",
	                "rotatevalues": "1",
	                "valueFontColor": "#ffffff",                
	                "showXAxisLine": "1",
	                "xAxisLineColor": "#999999",
	                "divlineColor": "#999999",               
	                "divLineIsDashed": "1",
	                "showAlternateHGridColor": "0",
	                "subcaptionFontBold": "0",
	                "subcaptionFontSize": "14",
	               /*  "formatNumberScale":"0", */
	                "numberScaleValue":"1000,100,100",
	                "numberScaleUnit":"Thousand,Lakhs, Cr",
	                "thousandSeparatorPosition":"2,3",
	                "labelDisplay":"ROTATE",
	                "slantLabels":"1"
	            },            
	            "data": [
	                {
	                    "label": "Amt. Approved",
	                    "value": "<%=((ArrayList)reportAmountData).get(8).toString()%>"
	                }, 
	                {
	                    "label": "Amt. Released",
	                    "value": "<%=((ArrayList)reportAmountData).get(9).toString()%>"
	                },
	                {
	                    "label": "Stage I Amt.",
	                    "value": "<%=((ArrayList)reportAmountData).get(10).toString()%>"
	                }, 
	                {
	                    "label": "Compl. Toilets Amt.",
	                    "value": "<%=((ArrayList)reportAmountData).get(11).toString()%>"
	                }
	                , 
	                {
	                    "label": "InSan. Toilets Amt.",
	                    "value": "<%=((ArrayList)reportAmountData).get(12).toString()%>"
	                }
	            ]
	        }
	    }
     <%
        }
        %>
    
    ).render();
}
      
     function openStatusChart() {
    	var revenueChart = new FusionCharts(
    <%
      	if (request.getAttribute("reportAmountData")!=null && ((ArrayList)request.getAttribute("reportAmountData")).size()>0)
      	{
      %>
	    {
	        type: 'column2d',
	        renderAt: 'chart_div',
	        width: '280',
	        height: '260',
	        dataFormat: 'json',
	        dataSource: {
	            "chart": {
	                "caption": "Status of Toilets",
	                "subCaption": "",
	                "xAxisName": "",
	                "yAxisName": "No. of Applicants",
	                "numberPrefix": "",
	                "paletteColors": "#006600",
	                "bgColor": "#ffffff",
	                "borderAlpha": "20",
	                "canvasBorderAlpha": "0",
	                "usePlotGradientColor": "0",
	                "plotBorderAlpha": "10",
	                "placevaluesInside": "1",
	                "rotatevalues": "1",
	                "valueFontColor": "#ffffff",                
	                "showXAxisLine": "1",
	                "xAxisLineColor": "#999999",
	                "divlineColor": "#999999",               
	                "divLineIsDashed": "1",
	                "showAlternateHGridColor": "0",
	                "subcaptionFontBold": "0",
	                "subcaptionFontSize": "14",
	                "formatNumberScale":"0",
	                /* "numberScaleValue":"1000,100,100",
	                "numberScaleUnit":"Th,Lakhs, Cr", */
	                "thousandSeparatorPosition":"2,3",
	                "labelDisplay":"ROTATE",
	                "slantLabels":"1"
	            },            
	            "data": [
	                {
	                    "label": "Received",
	                    "value": "<%=((ArrayList)reportAmountData).get(0).toString()%>"
	                }, 
	                {
	                    "label": "Sanctioned",
	                    "value": "<%=((ArrayList)reportAmountData).get(1).toString()%>"
	                },
	                 {
	                    "label": "Rejected",
	                    "value": "<%=((ArrayList)reportAmountData).get(2).toString()%>"
	                },
	                 {
	                    "label": "Geo-tagging",
	                    "value": "<%=((ArrayList)reportAmountData).get(3).toString()%>"
	                },
	                {
	                    "label": "Yet to be grounded",
	                    "value": "<%=((ArrayList)reportAmountData).get(4).toString()%>"
	                },
	                 {
	                    "label": "Grounded",
	                    "value": "<%=((ArrayList)reportAmountData).get(3).toString()%>"
	                },
	               
	                {
	                    "label": "Stage I",
	                    "value": "<%=((ArrayList)reportAmountData).get(6).toString()%>"
	                },
	                 {
	                    "label": "Completed",
	                    "value": "<%=((ArrayList)reportAmountData).get(7).toString()%>"
	                }
	            ]
	        }
	    }
   	<%
        }
        %> 
    ).render();
} 
      
      
    </script>

<script type="text/javascript">
		function OpenWindow()
		{
			var url="<%=basePath%>entryStatus.do";
  			var features="width=700,height=700,menubar=no,status=no,location=no,toolbar=no,scrollbars=yes,top=10,left=50";
			popup =window.open(url,"_blank",features);
		}
  		function clearFields()
  		{
  			document.forms[0].username.value="";
  			document.forms[0].password.value="";
  			document.forms[0].username.focus();
  		}
		function checkValues()
		{
			if (trim(document.forms[0].username.value)=="")
			{
				jAlert("Enter Username");
				document.forms[0].username.value="";
				return false;
			}
			else if (trim(document.forms[0].password.value)=="")
			{
				jAlert("Enter Password");
				document.forms[0].password.value="";
				return false;
			}
			/* else if (document.forms[0].financialYear.value=="0")
			{
				jAlert("Select Financial Year");
				return false;
			} */
			else
			{
				document.forms[0].password.value=hex_md5(document.forms[0].password.value);
				document.forms[0].mode.value="change";
				document.forms[0].submit();
			}
		}
		
		function alertUser()
		{
			var text="You are leaving the Centre for Good Governance and are subject to the privacy and security policies of the owners/sponsors of the outside website. Centre for Good Governance, does not guarantee the availability of such linked pages at all times. Centre for Good Governance cannot authorise the use of copyrighted materials contained in linked websites. Users are advised to request such authorisation from the owner of the linked website. Centre for Good Governance, does not guarantee that linked websites comply with Indian Government Web Guidelines.";
			if (!confirm(text))
				return false;
		}
	</script>
	
</head><!--/head-->

<body onload="clearFields();openFundChart();openStatusChart();">
<!--  -->
	<header id="header"><!--header-->
	<!-- <script type="text/javascript">jAlert("Proforma to enter the data of National Cleanliness campaign is given under Quiz Programs & Training Programs section, after login. Check it.");</script> -->   
		<div class="header-middle">    
           <div class="container">
				<div class="row" style="padding:0px;">
             
					<div class="col-sm-3 bgtop" style="padding:0px; z-index:1">
                   
						<div class="logo ">
							<img src="<%=basePath%>images/SBM-Logo.png" alt="Government of India Logo"  width="150"/> 
							<img src="<%=basePath%>images/swts_logo.png" alt="CM & Minister Photo" style="padding-top:10px" width="110" class="pull-right"/>
						</div>
						
					</div>
                    <div class="col-sm-6" style="padding:0px; z-index:1">
                   
						<div class="logo ">
                          <h1>Swachh Telangana - Swachh Hyderabad<br><span>Greater Hyderabad Municipal Corporation</span></h1>
					</div>
						
					</div>
                    <div class="col-sm-3 bgtop pull-right" style="padding:0px; z-index:1">
                   
						<div class="logo "><img src="<%=basePath%>images/cm&minister.png" alt="CM & Minister Photo" class="pull-right" width="192" style="padding-top:8px"/>
						<img src="<%=basePath%>images/telanganalogo.png" alt="Telangana Logo" width="71" class="pull-right" style="padding-top:8px"/>
							                        
                           

                          
						</div>
						
					</div>
                    
					</div>
				</div>
				</div>
			
		
	
		<div class="header-bottom navbg">
    
			<div class="container">
            <div class="row">
				<div class="col-lg-12">
                <div class="col-sm-12">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
                        
               	  <div class="mainmenu pull-left">
                            
					<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="#">Home</a></li>
								<%-- <li><a href="<%=basePath%>aboutUs.do">About Us</a>
                                   
                                </li>  --%>
								<li  class="dropdown"><a href="<%=basePath%>downloads.do">Downloads</a>                             
                                
                                </li>
                                
                                <li  class="dropdown"><a href="#">Related Links <i class="fa fa-angle-down"></i></a>
                                
                                <ul role="menu" class="sub-menu">
                                        <li><a href="http://india.gov.in" target="_blank" onclick="return alertUser();">National Portal of India</a></li>
											<li><a href="https://swachhbharaturban.gov.in/ISNAHome.aspx?id=ad0aaf60a241a10388daf5da0808d21d" target="_blank" onclick="return alertUser();">Swachh Bharat - GOI</a></li>
  											<li><a href="http://www.telangana.gov.in/" target="_blank" onclick="return alertUser();">State Portal</a></li>
                                    </ul>
                                
                                </li>
                             <!--  <li><a href="#">Feedback</a></li>     -->
                           <li><a href="<%=basePath%>photoGalleryDisplay.do">Photo Gallery</a></li>    
                       <li><a href="<%=basePath%>contactUs.do">Contact Us</a></li>
                       <!--  <li><a href="http://vmax.solutions/STS/index.php" target="_blank">Formats</a></li> -->
                        
                        <li  class="dropdown"><a href="#">Mobile App<i class="fa fa-angle-down"></i></a>
                        <ul role="menu" class="sub-menu">
                        	<li><a href="<%=basePath%>knowBeneficiaryID.do" target="_blank">Download Mobile App.</a></li>
                        	<li><a href="<%=basePath%>Documents/Swachh-Telangana-MobileApp-UserManual.pdf" target="_blank">Mobile App. User Manual</a></li>
                        	<li><a href="<%=basePath%>Documents/Swachh-Telangana-User-Manual.pdf" target="_blank">User Manual</a></li>
                        </ul>
 <li><a href="<%=basePath%>Documents/Quiz-Material.rar">Swachh Bharat  Quiz Material</a></li>   
                                    </ul>
                                  </li>
                                                          
				  </div>
                  
					</div>
                    </div>
					</div>
				</div>
                </div>
	</header><!--/header-->
    <div class="banner">

    <div class="container">
    <div class="row">
   
    <div class="col-sm-3">
<div class="row">
    <div class="col-sm-6 no-padding no-margin">
    <br> <br>
       
<div class="cm_dgbox">
<img src="images/mayor.jpg" alt="Sri Bonthu Rammohan" >
<h4>Sri Bonthu Rammohan, <span></span> </h4>
<p>Mayor</p>
</div>
	
				
          </div>
                <div class="col-sm-6 no-padding no-margin">
     <br>  <br>  
   <div class="cm_dgbox">
<img src="images/ghmccommissioner.jpg" alt="Sri. Dr.B.Janardhan Reddy" width="95px" height="98px">
<h4>Sri. Dr.B.Janardhan Reddy, <span>IAS</span></h4>
<p>Commissioner</p>
</div>
    
    
   </div>
		</div>
		</div>
                <div class="col-sm-5">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						
						<div class="carousel-inner">
							
                            
                            <div class="item active">
													
                            <img src="<%=basePath%>images/slider/slider1.jpg" class="girl img-responsive" alt="" />

					
							</div>
                            
                            <div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider2.jpg" class="girl img-responsive" alt="" />

					
							</div>
                            
                            
                            <div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider3.jpg" class="girl img-responsive" alt="" />

					
							</div>
							<div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider5.jpg" class="girl img-responsive" alt="" />

					
							</div>
							<div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider6.jpg" class="girl img-responsive" alt="" />

					
							</div>
							<div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider7.jpg" class="girl img-responsive" alt="" />

					
							</div>
							<div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider8.jpg" class="girl img-responsive" alt="" />

					
							</div>
							
							<div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider10.jpg" class="girl img-responsive" alt="" />

					
							</div>
							<div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider11.jpg" class="girl img-responsive" alt="" />

					
							</div>
							<div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider12.jpg" class="girl img-responsive" alt="" />

					
							</div>
							<div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider13.jpg" class="girl img-responsive" alt="" />

					
							</div>
							<div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider15.jpg" class="girl img-responsive" alt="" />

					
							</div>
							<div class="item ">
													
                            <img src="<%=basePath%>images/slider/slider16.jpg" class="girl img-responsive" alt="" />

					
							</div>
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
                
                
                 
    <div class="col-sm-4">
    <h3>Welcome to Swachh Hyderabad</h3>
    <h4>Our Vision</h4>
 <p>“All Circles and divisions in Hyderabad become totally clean, sanitized, healthy, liveable, ensuring and sustaining good public health and environmental outcomes for all citizens, with a special focus on hygienic and affordable sanitation for the urban poor and women”. </p>
<!-- <li>
	<ul>Providing sanitation and household toilet facilities with ecologically safe and sustainable sanitation systems for urban households of all statutory towns in the state. </ul>
</li>
<li>
<ul>Effective operation and maintenance of public & community toilets on sustainable basis</ul>
</li>
<li>
<ul>To create an enabling environment for private sector participation for community & public toilets</ul> 
</li> -->
				
                </div>
    </div>
    
                    
            <div class="row">
            
            </div>
                
                    </div>
                 
		</div>
 <marquee width="80%" scrolldelay="70"><font color="red" size="3"><b><% if (request.getAttribute("scrolling")!=null) out.print(request.getAttribute("scrolling")); %></b></font></marquee>
    <section class="container">
 <div class="row">
 
  
  <div class="col-sm-3" style="padding: 3px;">
	<div class="statusbox" style="height: 300px;">
   	  <!-- <a href="http://gisserver.cgg.gov.in/cdma/swachhts.html" target="_blank" > -->
   	  	<img src="<%=basePath%>images/map.png" width="100%" height="85%" alt="telangana map"><!-- </a> -->
	</div>
</div>
<div class="col-sm-3" style="padding: 3px;">
	<div class="statusbox">
   	<!-- <h3> Fund Releases </h3> -->
	   	<div id="chart_Amount_div" style="width: 200px; height: 240px;"></div>
	   	<br/>
	   <%-- 	<a href="<%=basePath%>municipalFundPercentageReport.do" target="_blank" class="btn btn-danger" > <i class="fa fa-search"></i> Fund Releases Report</a>&nbsp;  --%>
	   <br/>
	</div>
</div>

    <div class="col-sm-3" style="padding: 3px;">
    <div class="statusbox">
    	
       	<!-- <h3> Status of Toilets </h3> -->
   	  	<div id="chart_div" style="width: 200px; height: 240px;"></div>
		<br> 
       
        <%-- <a href="<%=basePath%>searchBeneficiary.do" target="_blank" class="btn btn-danger" > <i class="fa fa-search"></i> Search</a> --%>
       <br>   
    </div>
        
                
    </div>
    
    <div class="col-sm-3" >
    <div class="schemescontainer">
                <div id="login-3" class="widget_login" style="height: 245px;">
	<h3>Login <span class="fa fa-key" style="float:right"></span> </h3>

	<!-- <div class="login-container" >
	</div> -->
	<html:form action="/Welcome">
    	<html:hidden property="mode" name="welcomeForm" />
	
		<div class="prl-form-row login-username">
			<html:text property="username" style="width:225px"/>
		</div>
		<div class="prl-form-row login-password">
			<html:password property="password"  style="width:225px"/>
		</div>	
		<div class="prl-form-row ">
		 <input type="submit" id="button" class="btn btn-danger pull-left" class="button" value="Login" onclick="return checkValues();"/>
		</div>
	
	</html:form><br/><br/><br/>
	 <font color="red"><b>Mail id: swachhtscgg@gmail.com<br>Contact: Ravi Kiran - 7893001100, <br/>Rajeshwar - 8121610936</b></font> 
	<div class="clearfix"> </div>
		</div>
 <font color="red"><b><!-- Mail id: swachhts@cgg.gov.in --><!-- Contact: Saidulu - 7842588678, --> <br/><!-- Rajeshwar - 8121610936 --></b></font> 
	<br/>
        </div>
	</div>
                </div>
    </div>
    
                            </div>
	</section>
    <br> 
    <footer class="footer" >    
    <div class="container">
    <div class="row">

       <div class="col-sm-5 ">
Copy right @ 2016. Swachh Hyderabad 
    </div>
    
     <div class="col-sm-7 ">
<p style="text-align:right">Designed and Developed by Centre for Good Governance </p>
    </div>

   </div>
      
      
     </div>
      </footer>


	
    <script src="<%=basePath%>js/jquery.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/jquery.scrollUp.min.js"></script>
	<script src="<%=basePath%>js/price-range.js"></script>
    <script src="<%=basePath%>js/jquery.prettyPhoto.js"></script>
    <script src="<%=basePath%>js/main.js"></script>
    
     <center>
		<font size="6" color="red"> 
		<%
		if (request.getAttribute("msg")!=null)
		{
		 msgString=request.getAttribute("msg").toString();
		%>
		<script type="text/javascript">
								jAlert('<%=msgString%>');
								
							</script>	
		<%
		}
		%> 
		</font>
	</center>
	
           <script src="<%=basePath%>js/jquery.modern-ticker.min.js"></script>
    <script type="text/javascript">
$(function(){$(".ticker1").modernTicker({effect:"scroll",scrollType:"continuous",scrollStart:"inside",scrollInterval:20,transitionTime:500,autoplay:true});
$(".ticker2").modernTicker({effect:"fade",displayTime:4e3,transitionTime:300,autoplay:true});$(".ticker3").modernTicker({effect:"type",typeInterval:10,displayTime:4e3,transitionTime:300,autoplay:true});$(".ticker4").modernTicker({effect:"slide",slideDistance:100,displayTime:4e3,transitionTime:350,autoplay:true})})</script>
    
</body>
</html>