<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");
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

	<link href="css/responsive.css" rel="stylesheet">
    <link href="fonts/stylesheet.css" rel="stylesheet">
 
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="<%=basePath%>images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=basePath%>images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=basePath%>images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=basePath%>images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>images/ico/apple-touch-icon-57-precomposed.png">

       <link id="pagestyle" rel="stylesheet" type="text/css"  href="<%=basePath%>css/main.css" />
                    


<script src="<%=basePath%>js/dw_event.js" type="text/javascript"></script>
<script src="<%=basePath%>js/dw_cookies.js" type="text/javascript"></script>
<script src="<%=basePath%>js/dw_sizerdx.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>scripts/md5.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/form_validations.js"></script>
<script type="text/javascript">
dw_Event.add( window, 'load', dw_fontSizerDX.init );
</script>
	<script type="text/javascript">
function swapStyleSheet(sheet){
	document.getElementById('pagestyle').setAttribute('href', sheet);

}
</script>

<script type="text/javascript" src="<%=basePath%>js/jsapi.js"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Total Number of Tanks ',      46530],
          ['Proposed tanks in First Phase', 9306]
         
        ]);

        var options = {
          title: '',
		  chartArea:{left:0,top:0,width:"100%",height:"100%"},
		  legend:{position: 'right', textStyle: {color: 'blue', fontSize: 10, top:20}}
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
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
		
		function changeContent(tabPressed)
		{
			var content="";
			if (tabPressed=="accounts")
			{
				content="<h2>Accounts</h2>The Accounting System has been prepared based on National Municipal Accounting Manual and the ULB requirements. It can be customized for bigger corporations as well as for smaller municipalities. It has been designed to be user friendly so that users at all levels can operate it and generate the required accounting reports and MIS reports. Although the accounting system is based on double entry book keeping principles, the user need not have the knowledge of double entry accounting principles as this is abstracted and carried out in the back-end processing through the business logic in the programme. The principal features of the accounting module include:<br><br><ul><li>It is a web based application with simple and easy to use screens which will make it possible to deploy the system across multiple zones and departments/sections</li><li>Role-based access control providing logical security to use the system</li><li>The accounting entries are passed automatically in the back-end and are posted in the respective General Ledger based on the NMAM guidelines</li><li>Generates the financial statements and other reports at any point of time/for any given period</li><li>Supports fund-based accounting also for all types of transactions â Receipts, Payments, Journal Vouchers and Contra Entries</li></ul>";
				document.getElementById("contentId").innerHTML=content;
			}
			else if (tabPressed=="budget")
			{
				content="<h2>Budget</h2>Budget is a summary of anticipated expenditure along with corresponding revenue proposals. Receipts and Expenditure are classified as Revenue Receipts, Capital Receipts, Revenue Expenditure and Capital Expenditure. It plays an important role in planning and controlling operations of the ULBs. It reflects principles, policies, priorities and programmes of the ULBs. It communicates financial objectives and resources requirement to staff, administrators, elected representatives and the public in order to secure their support for planned allocation of resources and for performance objectives. The Budget module will be integrated with accounting module and the main features of the module are:<br><br><ul><li>No expenditure will be permitted unless backed by a Budget</li><li>Any expenditure, prior to its being incurred, must be identified to its Fund, Function, Major Head, Minor Head & Detailed Head for fund allocation</li><li>Maintenance of Budget Watch Register</li><li>Analysis of variances (i.e, Actual vs Budget) on monthly basis</li></ul>";
				document.getElementById("contentId").innerHTML=content;
			}
			else if (tabPressed=="assets")
			{
				content="<h2>Fixed Assets</h2>Asset accounting is a complex and time-consuming process. CGG had developed Fixed Assets Register System. The FARS reduce the complexity and increase productivity as well as accuracy in accounting of fixed assets. It also helps the ULB to effectively track, analyze, and utilize assets to the best possible extent. Main feature of the module are :<br><br><ul><li>FARS can help to quickly and accurately record, track, and analyze ULB's assets with minimal effort and gives the end users a tremendous flexibility, with multiple features and powerful reporting tools</li><li>FARS functionality allows the user to update and maintain records of the existing Fixed Assets with an option to create and maintain new Assets</li><li>FARS is very handy in maintaining accurate accounting on Fixed Assets</li></ul>";
				document.getElementById("contentId").innerHTML=content;
			}
			else if (tabPressed=="payroll")
			{
				content="<h2>Payroll</h2>Each ULB has different grades/levels of employees ranging from officers to field level workers attending to various functions of urban governance. ULB has to undertake various HR activities also from the stage of recruitment to retirement. Among HR activities, payroll management is one of the major activities consuming about 40 percent of human resources. CGG has developed payroll as one of the modules under Municipal e-Governance which can be integrated with core module i.e. accounting. The main features of this module are:<br><br><ul><li>Facilitates defining codes for itemized earnings and deductions</li><li>Uses a formula for calculating various allowances on the basis of basic pay</li><li>Provision for modification of salary templates for individual employees, configuring various earnings and deductions as per eligibility</li><li>Facility for management of employee attendance and leaves; and loans and advances</li></ul>";
				document.getElementById("contentId").innerHTML=content;
			}
		}
	</script>
	
</head><!--/head-->

<body  onload="clearFields();">
	<header id="header"><!--header-->
        <div class="header-middle">    
           <div class="container">
				<div class="row" style="padding:0px;">
             
					<div class="col-sm-9 bgtop" style="padding:0px; z-index:1">
                   
						<div class="logo ">
							<img src="<%=basePath%>images/telanganalogo.png" alt="Government of India Logo"  width="110" height="110" /> 
                          <h1>Swachh Telangana<br> <span>CDMA, Government of Telangana </span></h1>
						</div>
						
					</div>
                    
                    <div class="col-sm-3 bgtop pull-right" style="padding:0px; z-index:1">
                   
						<div class="logo ">
							                        <img src="<%=basePath%>images/cm&minister.png" alt="CM & Minister Photo" class="pull-right" />
                           

                          
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
								<li><a href="#">About Us</a>
                                   
                                </li> 
								<li  class="dropdown"><a href="#">Downloads <i class="fa fa-angle-down"></i></a>
                                
                                <ul role="menu" class="sub-menu">
                                        <li><a href="#">Forms</a></li>
										<li><a href="#">Forms</a></li> 

                                    </ul>
                                
                                </li>
                                
                                <li  class="dropdown"><a href="#">Related Links <i class="fa fa-angle-down"></i></a>
                                
                                <ul role="menu" class="sub-menu">
                                        <li><a href="#">Link - 1 </a></li>
											<li><a href="#">Link - 2</a></li>
											<li><a href="#">Link - 3</a></li>
  											<li><a href="#">Link - 4 </a></li>
   											<li><a href="#">Link - 5 </a></li>
                                            <li><a href="#">Link - 6  </a></li>
                                    </ul>
                                </li>
                              <li><a href="#">Feedback</a></li>    
                             
                      <li><a href="#">Contact Us</a></li> 
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
    
    <div class="col-sm-4">
   
					<a href="#" class="a-btn">
						<span class="a-btn-symbol"><i class="fa fa-download"> </i></span>
						<span class="a-btn-text">Download Now</span> 
						<span class="a-btn-slide-text">Form - Swachh Telangana </span>
						<span class="a-btn-slide-icon"></span>
					</a>
					<a href="#" class="a-btn">
						<span class="a-btn-symbol"><i class="fa fa-download"> </i></span>
						<span class="a-btn-text">Download Now</span> 
						<span class="a-btn-slide-text">Form - Swachh Telangana </span>
						<span class="a-btn-slide-icon"></span>
					</a>
					<a href="#" class="a-btn">
						<span class="a-btn-symbol"><i class="fa fa-download"> </i></span>
						<span class="a-btn-text">Download Now</span> 
						<span class="a-btn-slide-text">Form - Swachh Telangana </span>
						<span class="a-btn-slide-icon"></span>
					</a>
                </div>
   
                <div class="col-sm-8">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
                            <li data-target="#slider-carousel" data-slide-to="3"></li>
                            <li data-target="#slider-carousel" data-slide-to="4"></li>
						</ol>
						
						<div class="carousel-inner">
							
                            
                            <div class="item active">
													
                            <img src="images/slider/slider1.jpg" class="girl img-responsive" alt="" />

							</div>
                            
                            <div class="item ">
													
                            <img src="images/slider/slider2.jpg" class="girl img-responsive" alt="" />
							</div>
                            
                            <div class="item ">
													
                            <img src="images/slider/slider3.jpg" class="girl img-responsive" alt="" />
					
							</div>
                             <div class="item ">
													
                            <img src="images/slider/slider4.jpg" class="girl img-responsive" alt="" />
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
    </div>
    
                    
            <div class="row">
            
            </div>
                    </div>
		</div>
  <br>
    <section class="container">
 <div class="row">
 
 <div class="col-sm-8">
 <h2>Welcome to Swachh Telangana</h2>
<p> Stating that the Swachh Hyderabad' campaign launched by his government this week was a success, Telangana Chief Minister K Chandrasekhar Rao today asked government officials and political leaders to work for betterment of civic amenities. Stating that the Swachh Hyderabad' campaign launched by his government this week was a success, Telangana Chief Minister K Chandrasekhar Rao today asked government officials and political leaders to work for betterment of civic amenities. </p>
 </div>
 
        <div class="col-sm-4">
        
      
     <div class="schemescontainer">
                <div id="login-3" class="widget_login" >
	<h3>Login <span class="fa fa-key" style="float:right"></span> </h3>

	<div class="login-container" >
	<div>
	<html:form action="/Welcome">
    	<html:hidden property="mode" name="welcomeForm" />
	
		<div class="prl-form-row login-username">
			<html:text property="username" style="width:325px"/>
		</div>
		<div class="prl-form-row login-password">
			<html:password property="password"  style="width:325px"/>
		</div>	
		<div class="prl-form-row ">
			<!-- <button type="submit" class="btn btn-danger pull-left" style="padding:5px; margin-right:5px ">Official Login</button> -->
			<input type="button" id="button" class="btn btn-danger pull-left" 
																		class="button" value="Login" onclick="return checkValues();" />

		</div>
	
	</html:form>
	<div class="clearfix"> </div>
		</div>
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
Copy right @ 2015. Swachh Telangana 
    </div>
    
     <div class="col-sm-7 ">
<p style="text-align:right">Designed and Developed by Centre for Good Governance </p>
    </div>

   </div>
     </div>
      </footer>
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
           <script src="js/jquery.modern-ticker.min.js"></script>
    <script type="text/javascript">
$(function(){$(".ticker1").modernTicker({effect:"scroll",scrollType:"continuous",scrollStart:"inside",scrollInterval:20,transitionTime:500,autoplay:true});
$(".ticker2").modernTicker({effect:"fade",displayTime:4e3,transitionTime:300,autoplay:true});$(".ticker3").modernTicker({effect:"type",typeInterval:10,displayTime:4e3,transitionTime:300,autoplay:true});$(".ticker4").modernTicker({effect:"slide",slideDistance:100,displayTime:4e3,transitionTime:350,autoplay:true})})</script>
    
</body>
</html>