<%@ page language="java"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html:html locale="true">
<head>

	<script type="text/javaScript" src="<%=basePath%>scripts/md5.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/styles.css">
	<script type="text/javascript" src="<%=basePath%>js/form_validations.js"></script>

	<script src="<%=basePath%>js/alertbox/jquery.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/alertbox/jquery.ui.draggable.js"
		type="text/javascript"></script>
	<script src="<%=basePath%>js/alertbox/jquery.alerts.js"
		type="text/javascript"></script>
	<link href="<%=basePath%>js/alertbox/jquery.alerts.css"
		rel="stylesheet" type="text/css" media="all" />
		<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="AUTOCOMPLETE" content="OFF" />

	<script type="text/javaScript">
    	
			function Validate()
			{
				/*if (document.forms[0].newpassword.value!=document.forms[0].renewpassword.value)
				{
						jAlert("New Passwords did not match!");
						document.forms[0].mode.value="";
		         		document.forms[0].oldpassword.value="";
						document.forms[0].newpassword.value="";
			         	//document.forms[0].renewpassword.value="";
					return false;
				}
				else*/ 
				if (trim(document.forms[0].newpassword.value)=="" || trim(document.forms[0].oldpassword.value)=="") //|| trim(document.forms[0].renewpassword.value)==""
				{
					jAlert("Please enter data in all the fields.");
					return false;
				}
				else
				{
					document.forms[0].changedPassword.value=document.forms[0].newpassword.value;
					//alert("value "+trim(document.forms[0].changedPassword.value));
					document.forms[0].previousPassword.value=trim(document.forms[0].oldpassword.value);
					
					oldpassword=hex_md5(trim(document.forms[0].oldpassword.value));
					newpassword=hex_md5(trim(document.forms[0].newpassword.value));
		         	//renewpassword=hex_md5(trim(document.forms[0].renewpassword.value));
		         	document.forms[0].mode.value="change";
		         	document.forms[0].oldpassword.value=oldpassword;
					document.forms[0].newpassword.value=newpassword;
		         	//document.forms[0].renewpassword.value=renewpassword;
		         	document.forms[0].submit();
				}
				
			}
			</script>
			
<style type="text/css">

/* table.ApplicantDataTable  
		{
			font-family: verdana,arial,sans-serif;
			font-size:10pt;
			border:1px solid #000;
			background: #f5f5ff;
		}
		table.ApplicantDataTable td  
		{
			padding: 6px;
			border:1px solid #000;
		} */
table.ApplicantDataTable {
	font-family: verdana, arial, sans-serif;
	font-size: 10pt;
	text-shadow: 1px 1px 0px #fff;
	/* background: #eaebfc; */
	background:#47c1a8;
	border: #ccc 2px solid;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 3px;
	-moz-box-shadow: 0 5px 2px #d1d1d1;
	-webkit-box-shadow: 0 5px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}

table.ApplicantDataTable td {
	padding: 8px;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb),
		to(#fafafa) );
	background: -moz-linear-gradient(top, #fbfbfb, #fafafa);
}
</style>
	


	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
<!--
.style3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
-->
    </style>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
	<br>
	<br>
	<!-- <div id="wrapper"> -->
	<center>
		<font size="3" color="red"> Change Password </font>
	</center>
	<br>
	<html:form action="/changePassword" focus="oldpassword">
		<%--<input type="hidden" name="mode" value="" />
		--%>
		<html:hidden property="previousPassword" name="changePasswordForm"/>
		<html:hidden property="changedPassword" name="changePasswordForm"/>
		<html:hidden property="mode" name="changePasswordForm"/>
		<html:hidden property="referer" name="changePasswordForm"/>

		<table cellpadding="2" cellspacing="1" border="0" width="100%"
			align="center"  bgcolor="#FFFFFF"  class="ApplicantDataTable">
			<tr>
				<th>
					Old Password :
				<th>
					<input type="password" name="oldpassword" />
				</th>
			</tr>
			<tr>
				<th>
					New Password :
				<th class="tdField">
					<input type="password" name="newpassword" />
				</th>
			</tr>
			<!-- <tr>
				<th>
					Retype New Password:
				<th class="tdField">
					<input type="password" name="renewpassword"/">
				</th>

			</tr> -->
			<tr>
				<th colspan="2" align="center">
					<input type="button" value="Change" onclick="Validate()">
					<%
						String cancelFunction="cancelTransaction('"+basePath+"Welcome.do"+"')";
					%>
					<%-- <input type="button" value="Cancel" onclick="<%=cancelFunction%>" /> --%>
				</Td>
			</tr>
		</table>
	</html:form>
<!-- </div> -->
	<br>
	<center>
		<font size="3" color="red"> <bean:write property="msg" name="changePasswordForm"/>
		</font>
	</center>

</body>

</html:html>
