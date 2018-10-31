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

if (request.getAttribute("reportData")!=null)
reportData=(ArrayList)request.getAttribute("reportData");
%>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Welcome </title>
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
	
</head><!--/head-->

<body>
<form action="/aboutUs">
	<header id="header"><!--header-->
				    
		
        <div class="header-middle">    
           <div class="container">
				<div class="row" style="padding:0px;">
             
					<div class="col-sm-8 bgtop" style="padding:0px; z-index:1">
                   
						<div class="logo ">
							<img src="<%=basePath%>images/SBM-Logo.png" alt="Government of India Logo"  width="200"/> 
                          <h1>Swachh Bharat - Swachh Telangana<br><span>Commissioner & Director of Municipal Administration, Government of Telangana </span></h1>
						</div>
						
					</div>
                    
                    <div class="col-sm-4 bgtop pull-right" style="padding:0px; z-index:1">
                   
						<div class="logo "><img src="<%=basePath%>images/telanganalogo.png" alt="CM & Minister Photo" width="80" class="pull-left" style="padding-top:10px"/><img src="<%=basePath%>images/swts_logo.png" alt="CM & Minister Photo" style="padding-top:10px" width="120" class="pull-left" />
							                        <img src="<%=basePath%>images/cm&minister.png" alt="CM & Minister Photo" class="pull-right" width="130"/>
                           

                          
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
								<li><a href="<%=basePath%>">Home</a></li>
								<li><a href="#">About Us</a>
                                   
                                </li> 
								<li  class="dropdown"><a href="<%=basePath%>downloads.do">Downloads</a>                             
                                
                                </li>
                                
                                <li  class="dropdown"><a href="#">Related Links <i class="fa fa-angle-down"></i></a>
                                
                                <ul role="menu" class="sub-menu">
                                        <li><a href="http://india.gov.in" target="_blank">National Portal of India</a></li>
											<li><a href="https://swachhbharaturban.gov.in/ISNAHome.aspx?id=ad0aaf60a241a10388daf5da0808d21d" target="_blank">Swachh Bharat - GOI</a></li>
											<li><a href="http://cdma.telangana.gov.in/" target="_blank">CDMA</a></li>
  											<li><a href="http://www.telangana.gov.in/" target="_blank">State Portal</a></li>
                                    </ul>
                                
                                </li>
                             <!--  <li><a href="#">Feedback</a></li>     -->
                           <li><a href="<%=basePath%>photoGalleryDisplay.do">Photo Gallery</a></li>    
                       <li><a href="<%=basePath%>contactUs.do">Contact Us</a></li>
                        <li><a href="http://vmax.solutions/STS/index.php" target="_blank"><font color="orange">Formats</font></a></li>
                        
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
    

        
        
    
  <br>
 
    
    
    <section class="container">
 <div class="row">
 
  
 <div class="col-sm-12">
<h3>About us</h3>
        <p>Sanitation improvement faces a challenge for demand creation and people’s initiative to construct and use toilets, urban sanitation improvement is dependent to a great extent. The challenge of access to toilets arises for a variety of social and economic factors and not simply from individual behavioral resistance. Access to toilet and usage is the most important aspect of sanitation. Besides, restoration of dignity, privacy, safety and social status, sanitation has strong bearings on child mortality, maternal health, water quality, gender equity, reduction of hunger and food security, environmental sustainability and ultimately poverty alleviation & improvement of overall quality of life. Open defecation is still in practice in many urban areas resulting in serious social, health, economic and environmental problems. Openly left human waste helps in breeding and transmission of pathogens, which carry diseases and infections. </p>

<p>As per the census report 2011 91.12 percent of urban HHs in Telangana have access to toilets as compared to  national figure of 81.4 percent. Open Defecation in Urban Households of Telangana  is 8.98 % which is lower than the national average of 12.6%.</p> 
<p>The Govt of India has launched the flagship program Swachh Bharat Mission with the vision of ensuring hygiene, waste management and sanitation across the nation as a tribute to Mahatma Gandhi on his 150th birth anniversary to be celebrated in the year 2019.</p> 


<p>Government of  has launched the Swachh Telangana Mission with a goal of achieving “Open defecation free cities” by  2019 in line with the above vision.</p> 

<p>Elimination of open defecation is one of the key components of the Swachh Telangana Mission. In order to achieve open defecation free towns, ensuring adequacy through construction of toilets –individual, community and public toilets and effective operations and maintenance is the strategic approach which the scheme emphasizes. However, awareness and IEC  are equally important components that provide the base for implementing the project.</p>
<h3>Our Vision</h3>
<p> “All cities and towns in Telangana become totally clean, sanitized, healthy, liveable, ensuring and sustaining good public health and environmental outcomes for all citizens, with a special focus on hygienic and affordable sanitation for the urban poor and women”.</p>        
<h3>Objective</h3>                
        <li>Providing sanitation and household toilet facilities with ecologically safe and sustainable sanitation systems for urban households of all statutory towns in the state</li>
        <li>To bring about Behavioral change by promoting cleanliness, hygiene and to eliminate open defecation among the urban households and to adopt</li>
        <li>Effective operation and maintenance of public & community toilets on sustainable basis</li>
        <li>To create  an enabling environment for private sector participation for community & public toilets 
        </li>
<h3>Components</h3>                
        <li>Construction of individual toilets  including conversion of  insanitary  & pit Toilets into sanitary  Toilets </li>
        <li>Construction of Community toilets</li>
        <li>Construction  of public toilets in public spaces as required under PPP</li>
        <li>IEC & Public Awareness activities</li>                
        <li>Capacity Building</li>                
    </div>
    
    
    
    
                            </div>
	</section>
    <br> 
    <footer class="footer" >    
    <div class="container">
    <div class="row">

       <div class="col-sm-5 ">
Copy right @ 2015. Swachh Telangana 
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
		<font size="6" color="red"> <%
		if (request.getAttribute("msg")!=null)
		out.println(request.getAttribute("msg"));
		%> 
		</font>
	</center>
	
           <script src="<%=basePath%>js/jquery.modern-ticker.min.js"></script>
    <script type="text/javascript">
$(function(){$(".ticker1").modernTicker({effect:"scroll",scrollType:"continuous",scrollStart:"inside",scrollInterval:20,transitionTime:500,autoplay:true});
$(".ticker2").modernTicker({effect:"fade",displayTime:4e3,transitionTime:300,autoplay:true});$(".ticker3").modernTicker({effect:"type",typeInterval:10,displayTime:4e3,transitionTime:300,autoplay:true});$(".ticker4").modernTicker({effect:"slide",slideDistance:100,displayTime:4e3,transitionTime:350,autoplay:true})})</script>
    </form>
</body>
</html>