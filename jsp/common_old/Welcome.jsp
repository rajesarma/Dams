
<%@ page language="java" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles"
	prefix="tiles"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested"
	prefix="nested"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		<title>DAMS</title>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="AUTOCOMPLETE" content="OFF" />
	</head>
	<body>
		<br>
		<center>
			 <a
				href="<%=basePath%>Documents/Swachh-Telangana-User-Manual.pdf"
				target="_blank"><font size="4">Download User manual</font>
			</a> 
		</center>
		<br>
		<!-- <center>
			<font color="red" size="3">Please uninstall the mobile app of Swachh Telangana, installed before 30-06-2015. Download the new app once again and install it. Sorry for the incovenience.</font>
			
		</center> -->
		
		<logic:notEmpty name="roleid">
		<logic:equal value="3" name="roleid">
		<script type="text/javascript">location.replace('commissioner.do');</script>
		
		</logic:equal>
		
		</logic:notEmpty>
		
		
		<br>
	</body>
</html>