<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
   <link rel="icon" href="<%=basePath%>images/url_cgglogo_large.jpeg" type="image/x-icon"/>
    <script language="JavaScript" src="<%=basePath%>js/rightclickdisabled.js"> </script>
   
    <title>:: ERP ::</title>
    
    </head>
  
<body bgcolor="white">
<center>
	<TABLE border="0" width="950" height="700" bgcolor="white"
		cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td>
				<table width="100%" height="100%" cellspacing="0" cellpadding="2"
					align="center">
					<TR valign="top" height="5%">
						<TD valign="bottom" width="100%" colspan="2" bgcolor="#CECECE">
							<tiles:insert attribute="header" name="header" />
						</TD>
					</TR>
					<tr valign="top">
						<td valign="top" width="100%">
							<tiles:insert attribute="inputMenu" name="inputMenu"/>
						</td>
					</tr>
					<tr>
						<TD height="100%" align="center" valign="top">
							<tiles:insert attribute="cont" name="cont" />
						</TD>
					</tr>
					<TR>
						<TD height="1%" align="center" valign="baseline" width="100%"
							colspan="2">
							<tiles:insert attribute="footer" name="footer" />
						</TD>
					</TR>
				</table>
			</td>
		</tr>
	</table>
	</center>
</body>
</html:html>
