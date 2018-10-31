<%@ page language="java" %>
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
	<script language="JavaScript" src="js/disable_f5.js"></script>
	 <script language="JavaScript" src="js/rightclickdisabled.js"></script> 
	<link rel="icon" href="<%=basePath%>images/url_cgglogo_large.jpeg" type="image/x-icon" />
	<link rel="shortcut icon" href="<%=basePath%>images/url_cgglogo_large.jpeg" type="image/x-icon" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="AUTOCOMPLETE" content="OFF" />
	<link rel="stylesheet" type="text/css"
		href="<%=basePath%>css/styles.css">
	<%-- <META HTTP-EQUIV="Refresh" CONTENT="2659;URL=<%=basePath%>sessionExpired.do"> --%>
	<title>SCSTFMS</title>
	<script type="text/javascript">
        if(window.history.length>0)
        {
                window.history.forward(1);
        }
	</script>
</head>

<body>
	<center>
		<div id="wrapper" >
		<table border="0" height="700" bgcolor="white" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td>
					<table height="100%" cellspacing="0" cellpadding="2" align="center">
						<tr valign="top" height="8%">
							<td valign="bottom" width="100%" colspan="2" bgcolor="#CECECE">
								<tiles:insert attribute="header" name="header" />
							</td>
						</tr>
						<tr valign="top" height="8%">
							<td valign="top" width="100%" colspan="2">
								<tiles:insert attribute="menu" name="menu"></tiles:insert> 
							</td>
						</tr>
						<tr>
							<td height="100%" align="center" valign="top" >
									<tiles:insert attribute="content" name="content" />
							</td>
						</tr>
						<tr>
							<td height="1%" align="center" valign="baseline" width="100%"
								colspan="2">
								<tiles:insert attribute="footer" name="footer" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</div>
	</center>	
</body>
</html:html>