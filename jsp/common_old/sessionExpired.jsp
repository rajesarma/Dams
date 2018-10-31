<%@ page language="java" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<html>
<head>
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/url_cgglogo_large.jpeg" type="image/x-icon">
	<link rel="shortcut icon" href="images/url_cgglogo_large.jpeg" type="image/x-icon" />
	
</head>
<body >
		<div class="row" style="padding:0px;" style="height: 100%">
			<div class="col-sm-12 " style="min-height: 600px">
				<div align="center">
					<br /><br /><br /><br />
					<font color="blue" size="4" face="verdana">This service is not assigned to you<br>(or)<br>Your Session has Expired.......(or)<br>Your Pressed Refresh.......</font>
					<br>
					<a href="Login.do" style="text-decoration: none;color: blue"><font size="2">(Re Login Here)</font></a>
				</div>
			</div>
		</div>
</body>
</html>