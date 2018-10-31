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
	<script language="JavaScript" src="<%=basePath%>js/disable_f5.js"></script>
	<link rel="icon" href="<%=basePath%>images/url_cgglogo_large.jpeg"
		type="image/x-icon" />
	<link rel="shortcut icon"
		href="<%=basePath%>images/url_cgglogo_large.jpeg" type="image/x-icon" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="AUTOCOMPLETE" content="OFF" />
	
	<%-- <META HTTP-EQUIV="Refresh" CONTENT="2659;URL=<%=basePath%>sessionExpired.do"> --%>
	<title>Swachh Telangana</title>
	
	<script language="JavaScript" src="<%=basePath%>js/disable_f5.js"></script>
	 <script language="JavaScript" src="<%=basePath%>js/rightclickdisabled.js"></script> 
	<link rel="icon" href="<%=basePath%>images/url_cgglogo_large.jpeg" type="image/x-icon" />
	<link rel="shortcut icon" href="<%=basePath%>images/url_cgglogo_large.jpeg" type="image/x-icon" />
	
	<link href="<%=basePath %>css1/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>css1/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath %>css1/prettyPhoto.css" rel="stylesheet">
    <link href="<%=basePath %>css1/price-range.css" rel="stylesheet">
    <link href="<%=basePath %>css1/animate.css" rel="stylesheet">

	<link href="<%=basePath%>css1/responsive.css" rel="stylesheet">
    <link href="<%=basePath%>fonts/hevetica/helvetica_stylesheet.css" rel="stylesheet">
	
	<link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=basePath%>images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=basePath%>images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=basePath%>images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>images/ico/apple-touch-icon-57-precomposed.png">	
   	<link id="pagestyle" rel="stylesheet" type="text/css"  href="<%=basePath%>css1/main.css" />
   	
   	
   	
	
	
	<script type="text/javascript">
        if(window.history.length>0)
        {
                window.history.forward(1);
        }
	</script>
	
	<script src="<%=basePath%>js/alertbox/jquery.js" type="text/javascript"></script>
	
<script src="<%=basePath%>js/alertbox/jquery.ui.draggable.js" type="text/javascript"></script>
<script src="<%=basePath%>js/alertbox/jquery.alerts.js" type="text/javascript"></script>
<link href="<%=basePath%>js/alertbox/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
	
    <script src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/select2.js"></script>	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/select2.css">
	
	<script type="text/javascript" src="<%=basePath%>js/jquery-ui.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/jquery-ui.css" type="text/css"></link>
</head>

<body >
<center>
<div class="container" style="background:#fff; box-shadow:none; ">
			<div class="row" style="padding:0px;" style="height: 100%">
				<div class="col-sm-12" >
					<tiles:insert attribute="header" name="header" />
				</div>
				<div class="col-sm-12 " style="height:10%">
					<tiles:insert attribute="menu" name="menu"></tiles:insert>
				</div>
				<div class="col-sm-12 " style="min-height: 600px"> 
					<tiles:insert attribute="cont" name="cont" />
				</div>
				<div class="col-sm-12 ">
					<tiles:insert attribute="footer" name="footer" />
				</div>
			</div>
		</div>
	</center>
	
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/jquery.scrollUp.min.js"></script>
	<script src="<%=basePath%>js/price-range.js"></script>
    <script src="<%=basePath%>js/jquery.prettyPhoto.js"></script>
    <script src="<%=basePath%>js/main.js"></script>
   
    	<%--  <script src="<%=basePath%>js/jquery-1.11.3.min.js"></script> --%>
		<script type="text/javascript" src="<%=basePath%>js/jquery.smartmenus.js"></script>

   
    <script type="text/javascript">
	$(function() {
		$('#main-menu').smartmenus({
			subMenusSubOffsetX: 1,
			subMenusSubOffsetY: -8
		});
	});
</script>
</body>
</html:html>