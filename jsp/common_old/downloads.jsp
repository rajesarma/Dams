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
ArrayList scrolling=null;
boolean flash_flag=false;
	String msgString="";
%>
<head>

   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Welcome </title>
    <link href="<%=basePath %>css1/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>css1/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath %>css1/prettyPhoto.css" rel="stylesheet">
    <link href="<%=basePath %>css1/price-range.css" rel="stylesheet">
    <link href="<%=basePath %>css1/animate.css" rel="stylesheet">

	<link href="<%=basePath%>css1/responsive.css" rel="stylesheet">
    <link href="<%=basePath%>fonts/hevetica/helvetica_stylesheet.css" rel="stylesheet">
   
 
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=basePath%>images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=basePath%>images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=basePath%>images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>images/ico/apple-touch-icon-57-precomposed.png">

    <link id="pagestyle" rel="stylesheet" type="text/css"  href="<%=basePath%>css1/main.css" />
       

	<%-- <link href="<%=basePath%>css/responsive.css" rel="stylesheet">
    <link href="<%=basePath%>fonts/stylesheet.css" rel="stylesheet"> --%>
    <script type="text/javascript" src="<%=basePath%>scripts/md5.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/form_validations.js"></script>
		

<script src="<%=basePath%>js/dw_event.js" type="text/javascript"></script>
<script src="<%=basePath%>js/dw_cookies.js" type="text/javascript"></script>
<script src="<%=basePath%>js/dw_sizerdx.js" type="text/javascript"></script>
	<script type="text/javascript">
		function swapStyleSheet(sheet)
		{
			document.getElementById('pagestyle').setAttribute('href', sheet);
		}
	</script>
<script type="text/javascript" src="<%=basePath%>js/jsapi.js"></script>
<script type="text/javascript" src="<%=basePath%>js/fusionCharts/FusionCharts.js"></script>
<script type="text/javascript" src="<%=basePath%>js/fusionCharts/fusioncharts.charts.js"></script>
	
</head><!--/head-->
<body>
<form action="/downloads">
	<header id="header"><!--header-->
				    
		

	<div class="container" style="background:#fff; box-shadow:none; ">
		<div class="header-middle">
			<div class="row" style="padding:0px;">
				<div class="col-sm-3 bgtop">
					<div class="logo ">
						<img src="<%=basePath %>images/SBM-Logo.png" alt="Government of India Logo"  width="120"/> 
						<img src="<%=basePath %>images/swts_logo.png" alt="CM & Minister Photo" style="padding-top:10px" width="100" />
					</div>
				</div>
	            <div class="col-sm-6" style="padding:0px; z-index:1">
					<div class="logo ">
	    				<h1>Swachh Telangana - Swachh Hyderabad<br /><span>Greater Hyderabad Municipal Corporation </span></h1>
					</div>
				</div>
	            <div class="col-sm-3 bgtop pull-right" style="padding:0px; z-index:1">
					<div class="logo ">
						<img src="<%=basePath %>images/cm&minister.png" alt="CM & Minister Photo" class="pull-right" width="180" style="padding-top:8px"/>
						<img src="<%=basePath %>images/telanganalogo.png" alt="Telangana Logo" width="65" class="pull-right" style="padding-top:8px"/>
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
		
	<div class="container" style="background:#fff">
		<div class="header-bottom navbg">
			<div class="container" style="background:none; padding-left:0px; padding-right:0px">
	            <div class="row">
                	<div class="col-sm-10">
						<ul id="main-menu" class="sm sm-blue pull-left">
							<li><a href="<%=basePath%>">Home</a></li>
							<!-- <li><a href="http://swachhts.cgg.gov.in:80/aboutUs.do">About Us</a></li> --> 
							<li  class="dropdown"><a href="#">Downloads</a></li>
                            <li>
                            	<a href="#">Related Links <i class="fa fa-angle-down"></i></a>
                              	<ul>
	                                <li><a href="http://india.gov.in" target="_blank" onclick="return alertUser();">National Portal of India</a></li>
									<li><a href="https://swachhbharaturban.gov.in/ISNAHome.aspx?id=ad0aaf60a241a10388daf5da0808d21d" target="_blank" onclick="return alertUser();">Swachh Bharat - GOI</a></li>
									<!-- <li><a href="http://cdma.telangana.gov.in/" target="_blank" onclick="return alertUser();">CDMA</a></li> -->
									<li><a href="http://www.telangana.gov.in/" target="_blank" onclick="return alertUser();">State Portal</a></li>
                              	</ul>
                            </li>
                            <!--  <li><a href="#">Feedback</a></li>     -->
                        	<!-- <li><a href="http://swachhts.cgg.gov.in:80/photoGalleryDisplay.do">Photo Gallery</a></li> -->    
                    		<%-- <li><a href="<%=basePath%>contactUs.do">Contact Us</a></li> --%>
                      		<!--  <li><a href="http://vmax.solutions/STS/index.php" target="_blank">Formats</a></li> -->
                       
                       		<%-- <li ><a href="<%=basePath%>Documents/Swachh-Telangana-User-Manual.pdf" target="_blank">User Manual<!-- <i class="fa fa-angle-down"></i> --></a> --%>
		                      <!--   <ul> -->
		                        	<!-- <li><a href="http://swachhts.cgg.gov.in:80/knowBeneficiaryID.do" target="_blank">Download Mobile App.</a></li>
		                        	<li><a href="http://swachhts.cgg.gov.in:80/Documents/Swachh-Telangana-MobileApp-UserManual.pdf" target="_blank">Mobile App. User Manual</a></li> -->
		                        	<!-- <li><a href="http://swachhts.cgg.gov.in:80/Documents/Swachh-Telangana-User-Manual.pdf" target="_blank">User Manual</a></li> -->
		                        <!-- </ul> -->
		                    </li>
							<li><a href="<%=basePath%>Documents/Quiz-Material.rar">Swachh Bharat Quiz Material</a></li>   
  						</ul>	
					</div>
			</div>
		</div>
    </div>
    <br/>
		<div class="clearfix"> </div>
	    <section class="container">
 <div class="row">
 
  
 <div class="col-sm-12">
<h3>Downloads</h3>
<%
 if (request.getAttribute("reportData")!=null)
 {
 	reportData=(ArrayList)request.getAttribute("reportData");
 	for (int rowCount=0;rowCount<((ArrayList)reportData).size();rowCount++)
 	{
 		if (((ArrayList)reportData.get(rowCount)).get(2).toString().equals("0"))
 			flash_flag=false;
 		else
 			flash_flag=true;
 			
 	 %>
 	 	 <a href="<%=((ArrayList)reportData.get(rowCount)).get(1).toString()%>"  target="_blank"><%=((ArrayList)reportData.get(rowCount)).get(0).toString()%> </a> &nbsp; 
 	 	 <% 
 	 	 if (flash_flag==true)
 	 	 {
 	 	  %>
 	 	   <img src="<%=basePath%>images/new.gif" width="45"/>
 	 	  <%
 	 	  flash_flag=false;
 	 	 }
 	 	%>
 	 		<br/><br/>
 	 	<%  
 	}
 }
 %>
    </div>
    
                            </div>
	</section>
	<div class="footer" style="padding:5px 0px;" >    
	    <div class="row" >
	       	<div class="col-sm-5 ">
				Copy right @ 2016. Swachh Hydeabad
	    	</div>
		     <div class="col-sm-7 ">
				<p style="text-align:right">Designed and Developed by Centre for Good Governance </p>
		    </div>
		</div>
	</div>
	
	</div>

	</header><!--/header-->
    


	
    <script src="<%=basePath%>js/jquery.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/jquery.scrollUp.min.js"></script>
	<script src="<%=basePath%>js/price-range.js"></script>
    <script src="<%=basePath%>js/jquery.prettyPhoto.js"></script>
    <script src="<%=basePath%>js/main.js"></script>
    
	
           <script src="<%=basePath%>js/jquery.modern-ticker.min.js"></script>
    </form>
</body>
</html>