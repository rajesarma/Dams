<%-- <%@ page isELIgnored="false" %> --%>
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
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="Dashboard/images/favicon.ico">

    <title>DAMS</title>
    
    <!-- Bootstrap core CSS -->
    <link href="Dashboard/css/bootstrap.min.css" rel="stylesheet">
 	<link href="Dashboard/css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="Dashboard/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="Dashboard/css/dashboard.css" rel="stylesheet">
	<link href="Dashboard/css/dashboard-media.css" rel="stylesheet">
	
	<script src="<%=basePath%>js/date_validations.js" type="text/javascript" type="text/javascript" /></script>
	<script src="<%=basePath%>js/form_validations.js" type="text/javascript" type="text/javascript" /></script>
	<script src="<%=basePath%>js/alertbox/jquery.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/alertbox/jquery.ui.draggable.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/alertbox/jquery.alerts.js" type="text/javascript"></script>
	<link href="<%=basePath%>js/alertbox/jquery.alerts.css" rel="stylesheet" type="text/css" media="all" />
	
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>js/select2.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/select2.css">
	<link rel="stylesheet" href="css/jquery-ui.css" type="text/css"></link>
	
		<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="AUTOCOMPLETE" content="OFF" /> -->
		
		<%-- <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
	    <link href="<%=basePath %>css/font-awesome.min.css" rel="stylesheet">
	    <link href="<%=basePath %>css/prettyPhoto.css" rel="stylesheet">
	    <link href="<%=basePath %>css/price-range.css" rel="stylesheet">
	    <link href="<%=basePath %>css/animate.css" rel="stylesheet">
	    
		<link href="<%=basePath%>css/responsive.css" rel="stylesheet">
		<link id="pagestyle" rel="stylesheet" type="text/css"  href="css/main.css" />
		
	    <link rel="stylesheet" type="text/css"  href="css/home-page.css" />
	    <link rel="stylesheet" type="text/css"  href="css/open-sans.css" /> --%>
		
		<script type="text/javascript">
	        if(window.history.length>0)
	        {
	                window.history.forward(1);
	        }
		</script>
	</head>

	<body>
		<tiles:insert attribute="header" name="header" />
	
		<div id="wrapper" class="" >
		    <div class="container-fluid">
		       	<%-- <tiles:insert attribute="menu" name="menu" /> --%>
				<tiles:insert attribute="sidemenu" name="sidemenu" />
		        <div id="page-content-wrapper">
		            <div class="container-fluid" style="margin-left: 250px;">
		                <div class="row">
		                	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		                		<tiles:insert attribute="content" name="content" />
		                	</div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<%-- <center>
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
		</center> --%>
	</body>
	
	
	<!-- <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
	
	<script src="js/slick.min.js"></script>
	<script type="text/javascript" src="js/jquery.smartmenus.js"></script>
	
	<script type="text/javascript">
		$(function() {
			$('#main-menu').smartmenus({
				subMenusSubOffsetX: 1,
				subMenusSubOffsetY: -8
			});
		});
	</script> -->
	
	<!-- <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script> -->
    <script src="Dashboard/js/bootstrap.min.js"></script>
    
    <!-- <script src="js/bootstrap.3.3.2.js"></script> -->
	<script src="js/bootstrap-dialog.js"></script>
    
    <script src="Dashboard/js/jquery.slimscroll.min.js" type="text/javascript"></script> 
	<script src="Dashboard/js/initial.js" type="text/javascript"></script> 
    <script src="Dashboard/js/ie10-viewport-bug-workaround.js"></script>
	
	<script type="text/javascript">
		$(function()
		{
			$('.inner-content-div').slimScroll(
			{
				height: '100%'
			});
			
			/* $('.chat-people-div').slimScroll(
			{ height: '50%' }); */
			
			$('.chat-people-div').slimScroll(
			{ height: '80%' });
			
			$('.chat-box-div').slimScroll(
			{ height: '50%' });
		});
	</script>
	<script type="text/javascript">	
		$(function(){
	
	    $('#search-people').keyup(function()
	    {
	        var searchText = $(this).val();
			searchText=searchText.toLowerCase();
	        $('.nav-sidebar > li').each(function()
	        {
	            var currentLiText = $(this).text(),
				currentLiText=currentLiText.toLowerCase();
	                showCurrentLi = currentLiText.indexOf(searchText) !== -1;
	            $(this).toggle(showCurrentLi);
	        });     
	    });
	
	});
	$('.profile').initial({
	width:34,
	height:34,
	fontSize:19
	}); 
		$("#menu-toggle").click(function(e) {
	        e.preventDefault();
	        $("#wrapper").toggleClass("toggled");
	    });
		$('[data-toggle="tooltip"]').tooltip({container:'.row'}); 
		
	</script>
	
	 
	<script type="text/javascript" src="js/jquery.smartmenus.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#main-menu').smartmenus({
				subMenusSubOffsetX: 1,
				subMenusSubOffsetY: -8
			});
		});
	</script>
	
</body>
</html>
