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
    <base href="<%=basePath%>">
    
    <title>My JSP 'header.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
		
            <a class="navbar-brand" href="#menu-toggle" id="menu-toggle"><span class="glyphicon glyphicon-list" aria-hidden="true"></span>&nbsp;Chat System</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" style="border-bottom: 1px solid gray;">
            <ul class="nav navbar-nav navbar-right">
            	 <% 
	            	if(session.getAttribute("state_admin")!=null && session.getAttribute("state_admin").equals("Y"))
            	{
	            %>
	                <li><a href="dashboardHome.do"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a></li>
	                
	             <% 
	             	}
	             	else
	             	{
	             %>
	             	<li><a href="Home.do"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
	             <% 
	             	}
	             %>  
            
				<!-- <li><a href="#"><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> Messages </a></li> -->
             	<li><a href="<%=basePath%>Documents/SCST-FMS-Usermanual.pdf" target="_blank"><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> Help</a></li>
             	<%
             		if (session.getAttribute("role")!=null && session.getAttribute("role").equals("2"))
             		{
             	 %>
             	<li><a href="<%=basePath%>Documents/EntryFormat.pdf" target="_blank"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> Entry Format</a></li>
             	<%
             		} 
             	%>
             	<li><a href="changePassword.do"><i class="fa fa-key" aria-hidden="true"></i></span> Change Password</a></li>
                <li><a href="Logout.do"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> Log Out</a></li>
            </ul>
        </div>
    </div>
    
    <%
		String is_change_req = "";
		
		if(session!=null)
		{
			is_change_req = (String)session.getAttribute("is_change_req");
		
	%>
	<script src="js/menu.js" type="text/javascript"></script>
	<%
		 	if(is_change_req !=null && (is_change_req.equalsIgnoreCase("f") || is_change_req.equalsIgnoreCase("false"))) 
		 	{ 
	 %>
	
		<logic:notEmpty name="services1" scope="session">
			<div class="navbg">
			    <nav id="main-nav" role="navigation"> <!-- Sample menu definition -->
			        <!-- <div class="container"> -->
			            <div class="row">
			                <div class="col-sm-2" ></div>
			                <div class="col-sm-7" id="menu1" ></div>
			                <div class="col-sm-3" >
				                <div  style="float:right; font-size:13px; padding:10px;">
									<font face='monospace, Arial' color='#FFF'>&nbsp;&nbsp;<b>Welcome! ${dept_name}</b> </font>
								</div>
							</div>
			            </div>
			        <!-- </div> -->
			    </nav>
			    
			</div>
			<% 
            	if(session.getAttribute("state_admin")!=null && !session.getAttribute("state_admin").equals("Y"))
            	{
            %>
			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" >
	           	<marquee>
	           		<font color="red"><b>For any feedback, suggestion or complaints related to application, please use Post Query service in Post Queries section</b></font>
	           	</marquee>
			</div>
			
			<% 
            	}
            %>
			<%-- <div  style="float:right; font-size:13px; padding:10px;">
            
				<font face='monospace, Arial' color='#2E609F'>&nbsp;&nbsp;<b>Welcome! ${dept_name}</b> </font>
			</div> --%>
			
			<script type="text/javascript">
				buildMenu('menu1',eval('${services1}'));
				    $(function() {
				        $('#main-menu').smartmenus({
				            subMenusSubOffsetX: 1,
				            subMenusSubOffsetY: -8
				        });
				    });
			</script>
		</logic:notEmpty>
	<% 
			}
 		}
 	%>
</nav>
	<%-- <div class="col-sm-12" style="padding:0px;margin:0px;">
		<div style="float:right; font-size:13px; padding:15px;">
			<font face='monospace, Arial' color='#2E609F'>&nbsp;&nbsp;<b>Welcome! ${dept_name}</b> </font>
		</div>
	</div> --%>
	
	<!-- <br><br><br><br><br> -->
	<div class="clearfix" style="min-height: 80px;"></div>

</body>
</html>
