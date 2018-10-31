<%@ page language="java" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
		function getSchemeReport(dept_id)
	  	{
	  		document.forms[0].elements["property(reportType)"].value=document.getElementById("reportType").value;
	  		var url = "<%=basePath%>dashboardHome.do?key=schemeReport&dept_id="+dept_id;
	  		window.location=url;
	  	}
	</script>
	
  </head>
  
  <body>
    <div id="sidebar-wrapper">
		<div class="inner-content-div">
			<div class="sidenav-title">
				<input id="search-district" type="text" class="form-control" placeholder="Search Department" style="margin: 10px 0px;" />
			</div>
			<ul class="nav nav-sidebar" style="margin-bottom:60px;">
			  	<logic:present name="departments" scope="session">
					<li style="text-align: center; background: #fc7658; color:#fff; padding:5px 5px; font-weight:bold;">DEPARTMENTS</li>
					<li><a href="dashboardHome.do?key=unspecified"><img data-name="All" class="profile"/> All</a></li>
			  		<logic:iterate id="dept" name="departments">
			  			<%-- <li><a href="dashboardHome.do?key=schemeReport&did=${dept.dept_id}"><img data-name="${dept.dept_name}" class="profile"/> ${dept.dept_name}</a></li> --%>
			  			
			  			<%-- <li><a onclick="getSchemeReport(${dept.dept_id})" style="cursor: pointer;"><img data-name="${dept.dept_name}" class="profile"/> ${dept.dept_name}</a></li> --%>
			  			
			  			<c:choose>
						  	<c:when test="${dept.dept_id == 2 }">
						  		<li><a href="<%=basePath%>agricultureReport.do" style="cursor: pointer;"><img data-name="${dept.dept_name}" class="profile"/> ${dept.dept_name}</a></li>
						  	</c:when>
						  	<c:when test="${ dept.dept_id == 3 }">
						    	<li><a href="<%=basePath%>nhmReport.do" style="cursor: pointer;"><img data-name="${dept.dept_name}" class="profile"/> ${dept.dept_name}</a></li>
						  	</c:when>
						  	<c:otherwise>
						    	<li><a onclick="getSchemeReport(${dept.dept_id})" style="cursor: pointer;"><img data-name="${dept.dept_name}" class="profile"/> ${dept.dept_name}</a></li>
						  	</c:otherwise>
						</c:choose>
			  			
			  		</logic:iterate>
			  	</logic:present>
			</ul>
	  	</div>
	</div>
  </body>
</html>
