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
	<title>Work Log Report</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<style type="text/css">
		.ui-datepicker select.ui-datepicker-month,.ui-datepicker select.ui-datepicker-year 
		{ 
			width: 49%;
			float: left;
			font-size: 12px;
			height: 35px;
			padding: 2px;
		}
	</style>
	
	<script>
		$(document).ready(function ()
		{
			$("input:button").addClass("buttony");
			$("input").addClass(".inputy");
			$("select").addClass("selecty");
			$("select").select2();
			
			$(".datePicker").datepicker(
		   	{
		       	dateFormat: 'dd/mm/yy',
		       	changeMonth : true,
		       	changeYear : true,
		      	//minDate	: '${selectedFYList.startingdate}',
				//maxDate: '${selectedFYList.max_date}'
		  	});
		});
		
		function getDetails()
		{
			if(document.forms[0].elements["property(fromDate)"].value=="")
			{
				jAlert("Enter From Date");
				return false;
			}
			else if(document.forms[0].elements["property(toDate)"].value=="")
			{
				jAlert("Enter To Date ");
				return false;
			}
			else
			{
				document.forms[0].mode.value="getDetails";
				document.forms[0].submit();
			}
		}
		
	</script>
		
</head>
<body>
<br>
	<h4><font color="#AB1E00" size="5">Work Log Report</font></h4>	
	
	<div class="container_form">
	
  		<br>
  		<html:form action="/workLogReport">
  		<center>
			<html:hidden property="mode" name="commonReportsForm" />
			<html:hidden property="property(noOfRows)" name="commonReportsForm" />
			
			 <div class="table-responsive col-md-12 col-sm-12 col-xs-12" >
				 <table class="table table-striped table-bordered " style="width: 100%">
		        	<tr>
		        		<td class="headingClass">
			        		From Date:
			        	</td>
			        	<td>	
							<html:text property="property(fromDate)" styleId="fromDate" style="width:100px;" name="commonReportsForm"
							onkeypress="return letternumberforDays(event);" maxlength="10" onkeyup="buildDate(this)" onblur="isValidDate(this)" styleClass="datePicker" />
						</td>
						<td class="headingClass">
			        		To Date:
			        	</td>
			        	<td>	
							<html:text property="property(toDate)" styleId="toDate" style="width:100px;" name="commonReportsForm"
							onkeypress="return letternumberforDays(event);" maxlength="10" onkeyup="buildDate(this)" onblur="isValidDate(this)" styleClass="datePicker" />
						</td>
						
						<td class="headingClass">Project </td>
		        		<td>
		        			<html:select property="property(projectId)" styleId="projectId" name="commonReportsForm" style="width:250px" > <!-- onchange="getData()" -->  
								<html:option value="0">All</html:option>
								<logic:notEmpty property="property(projectList)" name="commonReportsForm">
									<html:optionsCollection property="property(projectList)" name="commonReportsForm" />
								</logic:notEmpty>
							</html:select>
		        		</td>
		        	</tr>
		        	<tr>
						<td colspan="6" style="text-align: center;"><input type="button" onclick="getDetails()" value="Get Details" class="btn btn-primary buttony .inputy"></td>
					</tr>
		        </table>
			</div>
			
			<logic:equal value="show" property="property(displayTable)" name="commonReportsForm">
				<font color="red">Downloads:&nbsp;
					<a href="<%=request.getAttribute("pdfFileName")%>" target="_blank"> <img src="<%=basePath%>images/pdf.jpg" /> </a>&nbsp;
					<a href="<%=request.getAttribute("excelFileName")%>" target="_blank"> <img src="<%=basePath%>images/xl.jpg" /> </a>
				</font>
				<br>
				<div class="table-responsive col-md-12 col-sm-12 col-xs-12" >
					<table class="table table-striped table-bordered " style="width: 100%">
						<thead>
							<tr>
								<th style="text-align: center">S. No.</th>
								<th style="text-align: center">Date</th>
								<th style="text-align: center">Project</th>
								<th style="text-align: center">Task Category</th>
								<th style="text-align: center">Work Type</th>
								<th style="text-align: center">Work Done</th>
								<th style="text-align: center">Task Status</th>
								<th style="text-align: center">Description</th>
							</tr>
						</thead>
						<logic:notEmpty property="property(workLogList)" name="commonReportsForm">
							<tbody>
								<logic:iterate id="item" indexId="outer" property="property(workLogList)" name="commonReportsForm">
									<tr>
										<td style="text-align: center">${outer+1 }</td>
										<td >${item.work_date }</td>
										<td >${item.project_name }</td>
										<td >${item.task_category }</td>
										<td >${item.work_type }</td>
										<td >${item.work_done }</td>
										<td >${item.task_status }</td>
										<td >${item.description }</td>
									</tr>
								</logic:iterate>
							</tbody>
						</logic:notEmpty>
						<logic:empty property="property(workLogList)" name="commonReportsForm">
							<tbody>
								<tr>
									<td colspan="8" align="center">
										No Data to Display
									</td>
								</tr>
							</tbody>
						</logic:empty>
					</table>
				</div>
			</logic:equal>
		</center>	
	</html:form>
</div>
</body>

</html>