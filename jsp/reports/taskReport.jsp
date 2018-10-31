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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%-- <link href="<%=basePath %>css/style1.css" rel="stylesheet" type="text/css" media="all" /> --%>

<script src="<%=basePath%>js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="<%=basePath%>js/date_validations.js" language="javascript" type="text/javascript" /></script>	

	<script type="text/javascript" src="<%=basePath%>js/select2.js"></script>	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/select2.css">
	
	<script src="<%=basePath%>js/alertbox/jquery.ui.draggable.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/alertbox/jquery.alerts.js" type="text/javascript"></script>
	<link href="<%=basePath%>js/alertbox/jquery.alerts.css" rel="stylesheet" type="text/css" media="all" />
	
	<script>
		$(document).ready(function ()
		{
		$("input:button").addClass("buttony");
		$("input").addClass(".inputy");
		$("select").addClass("selecty");
		$("select").select2();
		});

		</script>
		
	<script type="text/javascript">
		
	
	
	</script>	
		
	<style type="text/css">

table.taskTable {
	font-family: verdana, arial, sans-serif;
	color:white;
	font-size: 10pt;
	/* text-shadow: 1px 1px 0px #fff; */
	/* background: #eaebfc; */
	background:#993300;
	border: #ccc 2px solid;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 3px;
	-moz-box-shadow: 0 5px 2px #d1d1d1;
	-webkit-box-shadow: 0 5px 2px #d1d1d1; 
	 box-shadow: 0 1px 2px #d1d1d1;
}

table.taskTable td {
	padding: 8px;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	/* background: #fafafa; */
	color:black;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb),to(#fafafa) );
	background: -moz-linear-gradient(top, #fbfbfb, #fafafa);
}
</style>
</head>
<body>
	<div style="width: 100%">
	<br>
	<center>
  		<h4><font color="#CC6600" size="5">Task Report</font></h4>
  	</center>
  		
  		<html:form action="/addTask">
			<html:hidden property="mode" name="commonApplicationForm" />
			<html:hidden property="property(noOfRows)" name="commonApplicationForm" />
			
			<logic:equal value="showTaskReport" property="property(DisplayTable)" name="commonReportsForm">
				<font color="red">Downloads:&nbsp;
					<a href="<%=request.getAttribute("Excelfilename")%>" target="_blank">
						<img src="<%=basePath%>images/xl.jpg" />
					</a>&nbsp;
					<a href="<%=request.getAttribute("PDFfilename")%>" target="_blank">
						<img src="<%=basePath%>images/pdf.jpg" />
					</a>
				</font>
				<br>
				
			<table cellpadding="2" cellspacing="1" border="0" width="100%" align="center"  id="reportTable" class="taskTable">
				<logic:notEmpty property="property(headings)" name="commonReportsForm">	
					<thead>
						<tr>
							<logic:iterate id="item" indexId="outer" property="property(headings)" name="commonReportsForm">
								<th><bean:write name="item"/></th>
							</logic:iterate>
						</tr>
					</thead>
				</logic:notEmpty>
				<tbody>
				<%-- <logic:notEmpty name="commonReportsForm" property="property(taskData)">
					<logic:iterate id="row" name="commonReportsForm" property="property(taskData)" indexId="i">
						<tr>
							<td align="center">${i+1 }</td>
							<td align="center">${row.work_date }</td>
							<td align="left">${row.project_name }</td>
							<td align="left">${row.category_name }</td>
							<td align="left">${row.work_name }</td>
							<td align="left">${row.work_done }</td>
							<td align="left">${row.status_name }</td>
						</tr>
					</logic:iterate>				
				</logic:notEmpty>
				<logic:empty name="commonReportsForm" property="property(taskData)">		
					<tr>
						<!-- <td colspan="15" align="center">No Data to Display	</td> -->
						<td class="border-disable">No Data to Display	</td>
					</tr>
				</logic:empty>
								
				</tbody> --%>
				<logic:notEmpty property="property(taskData)" name="commonReportsForm">	
					<logic:iterate id="item" indexId="outer" property="property(taskData)" name="commonReportsForm">
						<tbody>
							<tr>
								<logic:iterate id="item1" indexId="inner" name="item">
									<td align="center">
										<bean:write name="item1"/>
									</td>
								</logic:iterate>
							</tr>
						</tbody>
					</logic:iterate>
				</logic:notEmpty>
				<logic:empty name="commonReportsForm" property="property(taskData)">		
					<tr>
						<td> No Data to Display	</td>
					</tr>
				</logic:empty>
			</table>
		</logic:equal>	
	</html:form>
</div>
</body>

</html>