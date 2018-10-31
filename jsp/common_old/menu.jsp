<%@page import="java.util.HashMap"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>

	<script src="js/jquery-1.11.1.js"></script>
	<script src="js/menu.js" type="text/javascript"></script>
	
	<link id="pagestyle" rel="stylesheet" type="text/css"  href="<%=basePath%>css1/main.css" />
	
	<!-- <div class="container" > -->
		<div class="row navbg">
        	<div class="col-sm-12">
				<div class="navbar-header" style="padding-top: 10px;">
				</div>
			</div>
		</div>
		
		<div class="row" >
			<div class="col-sm-2 ">
			</div>
			<div class="col-sm-8 ">
				<div id="menu" class="navbg"> </div>
			</div>
			<div class="col-sm-2" >
				<div class="pull-left">	
					<% 
					if (session.getAttribute("userName")!=null)
					{ 
					%>
					<font color="#088AC4" face="verdana" size=2><b>Welcome : </b> </font>
					<font face="verdana" size=2  color="#9305FF">
					<b><%=session.getAttribute("userName")%></b>
					<%  } %>
					</font>
				</div>
			</div>	
		</div>
	<!-- </div> -->	
	<script type="text/javascript" >
		<logic:notEmpty name="services" scope="session">
			buildMenu('menu',eval('${services}'));
		</logic:notEmpty>
	</script>