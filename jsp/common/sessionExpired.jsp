<%@ page language="java"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<br />
<br />
 <table width="775" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="frame" id="Table_01" align="center">
    <!--DWLayoutTable-->
    <tr>
      <td height="10" colspan="14" align="center" valign="top">
      	
      </td>
    </tr>
    <tr>
    	<td height="100" colspan="14" align="center" valign="bottom"> 
    	<font color="blue" size="5" face="verdana">This service is not assinged to you<br>or<br>Your Session has Expired.......</font></td>
    <tr>
    <tr>
    	<td height="300" colspan="14"  align="center" valign="top">
    	<a href="Login.do" style="text-decoration: none;color: blue"><font size="4">(Re Login Here)</font></a> </td>
    <tr>
    
  </table>