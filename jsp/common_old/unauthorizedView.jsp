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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">	
 <link rel="stylesheet" type="text/css" href="<%=basePath%>css/CGGInLine.css">
    
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
<table width="775" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="frame" id="Table_01" align="center">
    <!--DWLayoutTable-->
     <tr>
		<td> 
			<img name="index_r1_c1" src="<%=basePath%>images/index2_r1_c1.jpg" border="0" id="index_r1_c1" alt="" />
		</td>
	</tr>
    <tr>
      <td height="10" colspan="14" align="center" valign="top">
      	<marquee style="color:#FFFFFF" bgcolor="#0099CC" behavior="scroll" direction="left">
        		Welcome to ERP
        </marquee>
      </td>
    </tr>
    <tr>
    	<td height="100" colspan="14" align="center" valign="bottom"> 
    	<font color="orange" size="4" face="verdana">You are not Authorized to view this Service.......</font></td>
    <tr>
  
    <tr>
    	<td height="300" colspan="14"  align="center" valign="top">
    	<a href="<%=basePath%>Login.do" style="text-decoration: none"><font size="2">(Re Login Here)</font></a> </td>
    <tr>
    <tr>
		<td> 
			<jsp:include page="LoginFooter.jsp" />
		</td>
	</tr>
  </table>
    <%
    	session.invalidate();
    	session=null;
    %>
</body>
</html:html>
