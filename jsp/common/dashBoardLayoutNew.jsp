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
<!DOCTYPE html>
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
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="Dashboard/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <META HTTP-EQUIV="Refresh" CONTENT="2699;URL=<%=basePath%>sessionExpired.do">

    <!-- Custom styles for this template -->
	
    <link href="Dashboard/css/dashboard.css" rel="stylesheet">

	<link href="Dashboard/css/dashboard-media.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    
  </head>

  <body>
	<tiles:insert attribute="header" name="header" />
	
	<div id="wrapper" class="" >
	    <div class="container-fluid">
	        <!-- Sidebar -->
	       	<tiles:insert attribute="menu" name="menu" />
			
			<tiles:insert attribute="sidemenu" name="sidemenu" />
			
	       	 <%-- <tiles:insert attribute="menu" name="menu" /> --%>
	        <!-- /#sidebar-wrapper -->
	  
	        <!-- Page Content -->
	        <div id="page-content-wrapper">
	            <div class="container-fluid" style="margin-left: 250px;">
	                <div class="row">
	                	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	                		<tiles:insert attribute="content" name="content" />
	                	</div>
	                </div>
	            </div>
	        </div>
	        <!-- /#page-content-wrapper -->
	    </div>
	</div>
<!-- /#wrapper -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="Dashboard/js/bootstrap.min.js"></script>
    <script src="Dashboard/js/jquery.slimscroll.min.js" type="text/javascript"></script> 
	<script src="Dashboard/js/initial.js" type="text/javascript"></script> 
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="Dashboard/js/ie10-viewport-bug-workaround.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$('.inner-content-div').slimScroll({
				height: '100%'
			});
		});
	</script>
<script type="text/javascript">	
	$(function(){

    $('#search-district').keyup(function(){
        
        var searchText = $(this).val();
        
		searchText=searchText.toLowerCase();
		
        $('.nav-sidebar > li').each(function(){
            
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

<script type="text/javascript">
	$(function() {
		$('#main-menu').smartmenus({
			subMenusSubOffsetX: 1,
			subMenusSubOffsetY: -8
		});
	});
</script> 
<script type="text/javascript" src="homepage/js/jquery.smartmenus.js"></script> 

  </body>
</html>
