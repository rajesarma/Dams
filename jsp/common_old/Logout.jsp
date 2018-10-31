<%@ page
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="AUTOCOMPLETE" content="OFF" />
<%--<% session.invalidate(); %>
--%><style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-style: italic;
}
-->
</style>
<link rel="stylesheet" type="text/css"
		href="<%=basePath%>css/InputStyleSheet.css">
		<script language="JavaScript" src="<%=basePath%>scripts/md5.js"></script>
		<script src="<%=basePath%>js/alertbox/jquery.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/alertbox/jquery.ui.draggable.js"
		type="text/javascript"></script>
	<script src="<%=basePath%>js/alertbox/jquery.alerts.js"
		type="text/javascript"></script>
	<link href="<%=basePath%>js/alertbox/jquery.alerts.css"
		rel="stylesheet" type="text/css" media="all" />
		<script language="javascript" src="<%=basePath%>js/form_validations.js"></script>
		<script language="JavaScript">
    	
			function Validate()
			{
				if (trim(document.forms[0].oldpassword.value)=="")
				{
					jAlert("Please enter all the fields.You entered spaces !");
					return false;
				}
				else
				{
					oldpassword=hex_md5(trim(document.forms[0].oldpassword.value));
		         	document.forms[0].mode.value="change";
		         	document.forms[0].oldpassword.value=oldpassword;
		         	document.forms[0].submit();
				}
				
			}
			</script>
</head>
<body bgcolor="#FFFEFD" alink="Green"  link="Green">
<html:form action="/Logout" focus="oldpassword" onsubmit="return Validate();">
		<%--<input type="hidden" name="mode" value="" />
		--%><html:hidden property="mode" name="welcomeForm"/>
		<br>
		<br>
		<table cellpadding="2" cellspacing="1" border="0" width="50%"
			align="center" bgcolor="#FFFFFF">
			<tr>
				<td class="tdLabelForPasswords">
					Enter Password :
				<td class="tdField">
					<input type="password" name="oldpassword" />
				</td>
			</tr>
			
			<tr>
				<Td class="tdLabel" colspan="2" align="center">
					<input type="button" value="Submit" onclick="Validate()">
					
				</Td>
			</tr>
			
		</table>
		<logic:equal value="wrong" name="welcomeForm" property="displayMode">
		<center><font size="3" color="red">Entered Wrong Password </font></center>
		
		</logic:equal>
	</html:form>
<%--<center>
<br><br><br><br><br>
<img src="<%=basePath%>images/signout.gif"><br>
<a href="<%=basePath%>index.jsp" class="style1" style="text-decoration:none">
<font size="+1">
(Relogin again)</font></a>
</center>
    <logic:forward name="login" />
--%></body>
</html>
