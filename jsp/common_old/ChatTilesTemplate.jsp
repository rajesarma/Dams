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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html >
	<head>
		<title>DAMS</title>
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="AUTOCOMPLETE" content="OFF" />
		
		<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
	    <link href="<%=basePath %>css/font-awesome.min.css" rel="stylesheet">
	    <link href="<%=basePath %>css/prettyPhoto.css" rel="stylesheet">
	    <link href="<%=basePath %>css/price-range.css" rel="stylesheet">
	    <link href="<%=basePath %>css/animate.css" rel="stylesheet">
	    
		<link href="<%=basePath%>css/responsive.css" rel="stylesheet">
		<link id="pagestyle" rel="stylesheet" type="text/css"  href="css/main.css" />
		
	    <link rel="stylesheet" type="text/css"  href="css/home-page.css" />
	    <link rel="stylesheet" type="text/css"  href="css/open-sans.css" />
		
		<script src="<%=basePath%>js/date_validations.js" type="text/javascript" type="text/javascript" /></script>
		<script src="<%=basePath%>js/form_validations.js" type="text/javascript" type="text/javascript" /></script>
		<script src="<%=basePath%>js/alertbox/jquery.js" type="text/javascript"></script>
		<script src="<%=basePath%>js/alertbox/jquery.ui.draggable.js" type="text/javascript"></script>
		<script src="<%=basePath%>js/alertbox/jquery.alerts.js" type="text/javascript"></script>
		<link href="<%=basePath%>js/alertbox/jquery.alerts.css" rel="stylesheet" type="text/css" media="all" />
		
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/select2.css">
		<link rel="stylesheet" href="css/jquery-ui.css" type="text/css"></link>
		
		<script type="text/javascript">
	        if(window.history.length>0)
	        {
	                window.history.forward(1);
	        }
		</script>
	</head>

	<body>
		<%-- <center>
			<div class="row" style="padding:0px;" style="height: 100%">
				<div class="col-sm-12" >
					<tiles:insert attribute="header" name="header" />
				</div>
				<div class="col-sm-12 " >	<!-- style="height:10%" -->
					<tiles:insert attribute="menu" name="menu"></tiles:insert>
					<script type="text/javascript" src="<%=basePath%>js/select2.js"></script>	
					<script type="text/javascript" src="js/jquery-ui.js"></script>
				</div>
				<div class="container" style="background:#fff; box-shadow:none; ">
					<div class="col-sm-12 " style="min-height: 600px"> 
						<tiles:insert attribute="content" name="content" />
					</div>
				</div>
				<div class="col-sm-12 ">
					<tiles:insert attribute="footer" name="footer" />
				</div>
			</div>
		</center> --%>
		
		<center>
			<div id="wrapper" class="" >
			    <div class="container-fluid">
			    	<div class="row" style="padding:0px;" style="height: 100%">
						<div class="col-sm-12" >
							<tiles:insert attribute="header" name="header" />
						</div>
						<div class="col-sm-12 " style="background:#fff; box-shadow:none;">
					       	<tiles:insert attribute="menu" name="menu" />
					       	<script type="text/javascript" src="<%=basePath%>js/select2.js"></script>
					       	<script type="text/javascript" src="js/jquery-ui.js"></script>
					    </div>
				        <div id="page-content-wrapper" style="background:#fff; box-shadow:none;" >
				        	<div class="col-sm-2" >
				        		<div style="min-height: 600px; background:#fff;" >
				        			<tiles:insert attribute="sidemenu" name="sidemenu" />
				        		</div>
							</div>
				        	<div class="col-sm-10">
					            <div class="container-fluid" style="min-height: 600px; background:#fff;" >
				                	<tiles:insert attribute="content" name="content" />
				                </div>
				            </div>
				            <div class="col-sm-12 ">
								<tiles:insert attribute="footer" name="footer" />
							</div>
			            </div>
				        
				    </div>
			    </div>
			</div>
		</center>
	</body>
	
	
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
	
	<!-- <script src="js/slick.min.js"></script> -->
	<script type="text/javascript" src="js/jquery.smartmenus.js"></script>
	
	<script type="text/javascript">
		$(function() {
			$('#main-menu').smartmenus({
				subMenusSubOffsetX: 1,
				subMenusSubOffsetY: -8
			});
		});
	</script>
	
</html:html>