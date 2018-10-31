<%@ page isELIgnored="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Home Page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link id="pagestyle" rel="stylesheet" type="text/css"  href="homepage/css/main.css" />
  </head>
  
  <body>
   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	    <div class="container-fluid">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
			
	            <a class="navbar-brand" href="#menu-toggle" id="menu-toggle"><span class="glyphicon glyphicon-list" aria-hidden="true"></span>&nbsp;SC ST Fund Monitoring System</a>
	        </div>
	        <div id="navbar" class="navbar-collapse collapse" style="border-bottom: 1px solid gray;">
	            <ul class="nav navbar-nav navbar-right">
	             	<li><a href="Welcome.do"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
					<!-- <li><a href="#"><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> Messages </a></li> -->
	             	<li><a href="<%=basePath%>Documents/SCST-FMS-Usermanual.pdf" target="_blank"><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> Help</a></li>
	                <li><a href="Logout.do"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> Log Out</a></li>
	            </ul>
	        </div>
	    </div>
	    
	<!-- <script src="js/jquery-1.11.1.js"></script> -->
	<script src="js/menu.js" type="text/javascript"></script>
	
	<div class="navbg">
	    <nav id="main-nav" role="navigation"> <!-- Sample menu definition -->
	            <div class="row">
	            	<div class="col-sm-2" ></div>
	                <div class="col-sm-7" id="menu" ></div>
	                <div class="col-sm-3" >
	                	<% 
							if (session.getAttribute("userName")!=null)
							{ 
						%>
								<font face='monospace, Arial' color='#FFF' >&nbsp;&nbsp;<span style="vertical-align: middle;"><b>Welcome! <%=session.getAttribute("userName")%></b></span></font>
						<%  } 
							//System.out.print(session.getAttribute("services"));
						%>
					</div>
	            </div>
	        </div>
	    </nav>
	</div>
	<script type="text/javascript" >
		<logic:notEmpty name="services" scope="session">
			buildMenu('menu',eval('${services}'));
			 $(function() {
		        $('#main-menu').smartmenus({
		            subMenusSubOffsetX: 1,
		            subMenusSubOffsetY: -8
		        });
		    });
		</logic:notEmpty>
	</script>
	<div class="clearfix" style="min-height: 80px;"></div>
</body>
</html>
