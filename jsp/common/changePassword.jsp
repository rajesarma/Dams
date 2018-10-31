<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">


<style type="text/css">
@import "css/jquery-ui-1.10.2.custom.css";

@import "css/table.css";

@import "css/jquery.multiselect.css";

@import "css/jquery.multiselect.filter.css";
</style>
<script type="text/javascript"
	src="js/jquery-1.9.1.js"></script>

<script type="text/javascript"
	src="jQuery/ui/jquery-ui-1.10.2.custom.js"></script>
<script type="text/javascript" src="jQuery/ui/jquery.multiselect.js"></script>
<script type="text/javascript"
	src="jQuery/ui/jquery.multiselect.filter.js"></script>

<script type="text/javaScript" src="js/md5.js"></script>

<script type="text/javascript">
	function update() {
		var txt = "";
		
		if (document.forms[0].oldPassword.value.trim() == "") {
			txt += "Old Password is required\n";
		}
		else if (document.forms[0].newPassword.value.trim() == "") {
			txt += "New Password is required\n";
		}
		else if (!validatePassword((document.forms[0].newPassword.value))) {
			txt += "New Password is not valid\n";
		}
		if (txt != "") {
			alert(txt + "(*) indicates mandatory");
			return false;
		} else {
			document.forms[0].mode.value = "changePassword";
			document.forms[0].submit();
			
		}
		
		
	}
	function deleteDetails(slno) {

		document.forms[0].elements["property(sl_no)"].value = slno;
		if (confirm("Are sure want to delete ??")) {
			document.forms[0].key.value = "deleteDetails";
			document.forms[0].submit();
		}
	}
	
	function validatePassword(newPassword)
			{
				 if (newPassword.length < 8) 
				 {
			        alert("Your password must be at least 8 characters"); 
			        document.getElementById("newPassword").value="";
			        return false;
			     }
			     else if (newPassword.length > 10) 
				 {
			        alert("Your password should not be greater than 10 characters"); 
			        document.getElementById("newPassword").value="";
			        return false;
			     }
			     else if (newPassword.search(/[a-z]/) < 0) {
			        alert("Your password must contain at least one lower case letter.");
			        document.getElementById("newPassword").value="";
			        return false;
			    }
			    else if (newPassword.search(/[A-Z]/) < 0) {
			        alert("Your password must contain at least one upper case letter.");
			        document.getElementById("newPassword").value="";
			        return false;
			    }
			    else if (newPassword.search(/[0-9]/) < 0) {
			        alert("Your password must contain at least one digit.");
			       document.getElementById("newPassword").value="";
			        return false; 
			    }
			     else if (newPassword.search(/[!@#$%^&*]/) < 0) {
			        alert("Your password must contain at least special character");
			        document.getElementById("newPassword").value="";
			        return false; 
			    }
				else
				{
					document.getElementById("oldPassword").value=hex_md5(document.getElementById("oldPassword").value.trim());
		         	document.getElementById("newPassword").value=hex_md5(document.getElementById("newPassword").value.trim());
		         	 return true; 
				}
				
			}
			
			function clearValues()
			{
				document.getElementById("oldPassword").value="";
		         	document.getElementById("newPassword").value="";
			}
</script>
</head>

<body onload="clearValues()">
	<html:form action="/changePassword">
		<html:hidden property="mode" name="changePasswordForm"/>
		<br>
		<center>
			<font style="font-weight: normal;">${msg}</font>
		</center>
		
		<div class="col-md-12 col-sm-12 col-xs-12">
		
			<div class="col-md-3 col-sm-3 col-xs-3" style="margin-bottom: 20px">
			
			</div>
			<div class="table-responsive col-md-6 col-sm-6 col-xs-6" style="margin-bottom: 20px;" align="center">
				<table align="center" class="table displayTable table-striped table-hover table-bordered" >
			<!-- <table align="center" id="table" style="min-width: 60%"> -->
					<tr>
						<th colspan="4">Change Password</th>
					</tr>
					<tr>
						<td><b>Old Password:</b> <font color="red"> * </font> </td>
						<td><html:password property="oldPassword" style="width:180px" styleId="oldPassword" name="changePasswordForm" /></td>
					</tr>
					 <tr>
						<td><b>New Password: </b><font color="red"> * </font> </td>
						<td><html:password property="newPassword" style="width:180px" styleId="newPassword" name="changePasswordForm" /></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input type="button" class="btn btn-lg btn-primary" value="Change" onclick="update()"/></td>
					</tr>
				</table>
				<font size="3" color="red"><b>Note: Password should contain minimum 8 and maximum 10 characters with atleast 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character.</b></font>
				</div>
		
				<div class="col-md-3 col-sm-3 col-xs-3" style="margin-bottom: 20px">
				
				</div>
			</div>
		<center>
	
	</center>
	</html:form>

</body>
<style type="text/css">
#ui-id-1 {
	max-height: 300px;
	overflow: scroll;
}
</style>
</html>