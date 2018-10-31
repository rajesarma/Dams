<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>index.jpg</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
td img {display: block;}body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
<!--Fireworks CS3 Dreamweaver CS3 target.  Created Mon Apr 13 10:44:43 GMT+0530 (India Standard Time) 2009-->
<link href="<%=basePath%>css/ulbcss.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style3 {color: #FF0000}
-->
</style>

</head>
<body bgcolor="#ffffff">
<script type="text/javascript" src="<%=basePath%>js/wz_tooltip.js"></script>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
<!-- fwtable fwsrc="index.png" fwpage="Page 1" fwbase="index.jpg" fwstyle="Dreamweaver" fwdocid = "694805835" fwnested="0" -->
  <tr>
   <td><img src="<%=basePath%>images/spacer.gif" width="1000" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td><img name="index_r1_c1" src="<%=basePath%>images/index2_r1_c1.jpg" width="1000" height="74" border="0" id="index_r1_c1" alt="CFS to ULBs" /></td>
  </tr>
  <tr>
   <td height="444" align="center" valign="top"  style="background-image:url(<%=basePath%>images/index_r2_c1.jpg);"><table width="90%" border="0" cellspacing="0" cellpadding="1">
     
     <tr>
       <td height="90" valign="top"><table width="100%" border="0" cellpadding="1" cellspacing="5" bgcolor="#E5EEF3">
         
         <tr>
           <td width="65%" align="center" valign="top"><table width="90%" border="0" cellspacing="3" cellpadding="1">
             <tr>
               <td height="34" colspan="2" align="center" valign="middle" bgcolor="#F4F9FB"><span class="top"><span class="style3">e</span>-Tools</span></td>
               </tr>
               <tr>
               	<td width="50%" align="right" valign="top">&nbsp;</td>
             	<td width="50%" align="right" valign="top"><a href="<%=basePath%>Logout.do"><font size="3"><b>Logout</b></font></a></td>
             </tr>
             <tr>
             	<td width="50%" align="left"><a href="<%=basePath%>dashBoard.do?mode=unspecified&flag=10" class="clsLinkMain" > <img src="<%=basePath%>images/accounts.jpg" alt="" width="279" height="55" border="0"/></a></td>
               <td width="50%" align="left"><a href="http://webapps.cgg.gov.in/payroll" class="clsLinkMain" target="_blank"> <img src="<%=basePath%>images/payroll.jpg" alt="" width="279" height="55"  border="0"/></a></td>
               
             </tr>
             <tr>
               <td width="50%" align="left" valign="top"><a href="http://wms.cgg.gov.in:8090" class="clsLinkMain" target="_new"> <img src="<%=basePath%>images/wms.jpg" alt="" width="279" height="55" border="0" /></a></td>
               <%--<td width="50%" align="left" valign="top"><a href="#" class="clsLinkMain"> <img src="<%=basePath%>images/birthanddeathreg.jpg" alt="" width="279" height="55" border="0" /></a></td>
               --%><td width="50%" align="left" valign="top"><a href="http://webapps.cgg.gov.in/uws" class="clsLinkMain" target="_new"> <img src="<%=basePath%>images/uws.jpg" alt="" width="279" height="55" border="0" /></a></td>
             </tr>
             <tr>
               <%--<td width="50%" align="left" valign="top"><a href="http://webapps.cgg.gov.in/uws" class="clsLinkMain" target="_new"> <img src="<%=basePath%>images/uws.jpg" alt="" width="279" height="55" border="0" /></a></td>
               --%><td width="50%" align="left" valign="top"><a href="<%=basePath%>dashBoard.do?mode=unspecified&flag=12" class="clsLinkMain"> <img src="<%=basePath%>images/revenue.jpg" alt="" width="279" height="55" border="0" /></a></td>
             </tr>
           </table></td>
           </tr>
         <tr>
           <td align="left" class="top">&nbsp;</td>
           </tr>
         <tr>
           <td>&nbsp;</td>
           </tr>
       </table></td>
     </tr>
   </table></td>
  </tr>
  <tr>
    <td height="42" align="center" valign="middle" style="background-image:url(<%=basePath%>images/index_r2_c1.jpg);"><table width="90%" border="0" cellspacing="0" cellpadding="1">
      <tr>
        <td width="70%">Designed and Developed by <a href="http://www.cgg.gov.in" target="_new">Centre for Good Governance</a></td>
        <td width="30%"><table width="90%" border="0" cellspacing="0" cellpadding="1">
            <tr>
              
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
