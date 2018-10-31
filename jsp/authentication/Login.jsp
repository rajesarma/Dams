<%@ page language="java" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Welcome </title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">

	<link href="css/responsive.css" rel="stylesheet">
    <link href="fonts/stylesheet.css" rel="stylesheet">
 
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

    <link id="pagestyle" rel="stylesheet" type="text/css"  href="css/main.css" />
    <link rel="stylesheet" type="text/css"  href="css/home-page.css" />
    <link rel="stylesheet" type="text/css"  href="css/open-sans.css" />
    <script type="text/javascript" src="<%=basePath%>js/md5.js"></script>
                    
	<script type="text/javascript">
  		function clearFields()
  		{
  			document.forms[0].username.value="";
  			document.forms[0].password.value="";
  			document.forms[0].username.focus();
  		}
		function checkValues()
		{
			
			if (document.forms[0].username.value=="")
			{
				jAlert("Enter Username");
				document.forms[0].username.value="";
				return false;
			}
			else if (document.forms[0].password.value=="")
			{
				jAlert("Enter Password");
				document.forms[0].password.value="";
				return false;
			}
			else
			{
				document.forms[0].mode.value="loginCheck";
				//alert("Mode .. "+document.forms[0].mode.value);
				document.forms[0].password.value=hex_md5(document.forms[0].password.value);
				document.forms[0].submit();
			}
		}
		
	</script>
	
</head><!--/head-->

<body onload="clearFields();">
	
	<header id="header"><!--header-->
        <div class="header-middle ">    
           <div class="container header_background" >
				<div class="row" style="padding:0px;">
					<div class="col-sm-4 bgtop" style="padding:0px; z-index:1">
						<div class="logo ">
                          <h1>DAMS<br> </h1>
						</div>
					</div>
					<div class="col-sm-6 bgtop" style="padding:0px; z-index:1">
						<div class="logo ">
                         <!-- <span>Daily Activity Monitoring System</span> --> 
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	</header><!--/header-->
        
	<div class="container" >
    	<div class="row navbg">
        	<div class="col-sm-12">
				<div class="navbar-header" style="padding-top: 10px;">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span> <span class="icon-bar"></span> 
						<span class="icon-bar"></span>
					</button>
				</div>
				<!-- <div class="icons-social pull-right" style="padding-top: 10px;">
					<div class="btn-group">
						<a class="btn btn-danger" href="login"> <i
							class="fa fa-sign-in"></i> Sign in
						</a>
					</div>
				</div> -->
			</div>
		</div><!--/conatiner-->
	</div> <!--/navbg-->
			
	<div class="container" style="background:#fff; min-height:500px;" >
		<br>

		<div class="row banner">
			<!-- <div class="col-sm-2 ">
				<div class="row">
	       			<div class="col-sm-12">
						<a href="#">
							<div class="small-box bg-wood">
								
								<div class="icon">
									<i class="fa fa-dashboard"></i>
								</div>
								<span class="small-box-footer">Dashboard</span>
							</div>
						</a>
					</div>
				</div>
				
				<div class="row">
				
				<div class="col-sm-12 ">
							<a href="#">
							<div class="small-box bg-grass">
								
								<div class="icon">
									<i class="fa fa-bar-chart"></i>
								</div>
								<span  class="small-box-footer">Reports</span>
							</div>
						</a>
					</div>
				</div>                
	        </div> -->
		
            <div class="col-sm-8"> 
                <div class="boxwrapper" style="min-height:245px;">
	                <h4 style="padding-top:10px;">Welcome  </h4>
					<p>
						The DAMS (Daily Activity Montoring System) project is used for monitoring of tasks assigend from one another. 
						This Project can also used to Log works done by each Individual every day.
						This Project can be used to generate variety of Reports based on the data entered. 
					</p>
	            </div>
            </div>
			<div class="col-sm-4"> 
            	<div class="login-container boxwrapper" style="min-height:245px;">
                <p class="text-center" style="width:100%; background:#4b6367; color:#fff; font-size:18px; padding:5px; ">
					LOGIN 
				</p>
                <table class="table table-condensed table-hover table-striped" > 
               		<tbody>
	               		<tr>
	               			<td>
						 		<html:form action="/Login">
						 		<html:hidden property="mode" styleId="mode" name="authenticationForm"/>
						 			<div class="form-group">
									  <html:text property="property(userName)" name="authenticationForm" styleClass="form-control required" styleId="username" />
										<span class="input-icon"><i class="fa fa-user"></i></span>
									</div>
						 			<div class="form-group">
									  <html:password property="property(password)" name="authenticationForm" styleClass="form-control required" style="margin-bottom:5px;" styleId="password"></html:password>
										<span class="input-icon"><i class="fa fa-lock"></i></span>
									</div>
									<div class="form-group">
							       		 <input type="submit" name="button" id="button" class="btn btn-danger btn-10px" value="Sign  in" onclick="return checkValues();" />
							       	</div>
						 		</html:form>
						 	</td>
					 	</tr>
					 	<tr>
					 		<logic:notEmpty property="property(msg)" name="authenticationForm">
						 		<td>
									<font color="red"><bean:write property="property(msg)" name="authenticationForm"></bean:write></font>						 		
						 		</td>		
					 		</logic:notEmpty>
					 	</tr>
                	</tbody>
            	</table>
                </div>
            </div>
		</div>
	
  	<br>
    
	</div>
	
	<div class="container" style="background:#fff; " >
		<div class="row footercompany">
	       	<div class="col-sm-5 ">
				Copy right @ 2017. DAMS
			</div>
	     	<div class="col-sm-7 ">
				<p style="text-align:right">Designed and Developed by Centre for Good Governance </p>
	    	</div>
		</div>
	</div>
	
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/main.js"></script>
	
    
</body>
</html>