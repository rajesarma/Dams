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
		 function addRow()
		 {
		 	var table=document.getElementById("taskTable");
		 	var lastRow = table.rows.length-1;
		 	
		 	 if(lastRow >= 25) 
		 	 {
		   	   jAlert("More than 25 rows cannot be inserted");
		   	 } 
		   	 else
		   	 {
		 	 	var iteration = lastRow;
				var row = table.insertRow(lastRow);
				var cel;
				var element;
				var colId=0;
				var colNum=0;
				
			  	cel = row.insertCell(colNum++);
			    var el = document.createElement('select');
			    el.style.width = "150px";
			    el.setAttribute('name','property(projectId'+(lastRow)+')');
			    el.setAttribute('id','projectId'+(lastRow)+'');
			    el.align = 'left';
				   for(var i=0;i<document.getElementById('projectId1').options.length;i++)
				   {
				    	el.options[i] = new Option(document.getElementById('projectId1').options[i].text,document.getElementById('projectId1').options[i].text);
				   }
				cel.appendChild(el);
			  	colId++;
			  	
				cel = row.insertCell(colNum++);
			    var el = document.createElement('select');
			    el.style.width = "150px";
			    el.setAttribute('name','property(taskCategoryId'+(lastRow)+')');
			    el.setAttribute('id','taskCategoryId'+(lastRow)+'');
			    el.align = 'left';
				   for(var i=0;i<document.getElementById('taskCategoryId1').options.length;i++)
				   {
				    	el.options[i] = new Option(document.getElementById('taskCategoryId1').options[i].text,document.getElementById('taskCategoryId1').options[i].text);
				   }
				cel.appendChild(el);
			  	colId++;
			  	
			  	cel = row.insertCell(colNum++);
			    var el = document.createElement('select');
			    el.style.width = "120px";
			    el.setAttribute('name','property(workTypeId'+(lastRow)+')');
			    el.setAttribute('id','workTypeId'+(lastRow)+'');
			    el.align = 'left';
				   for(var i=0;i<document.getElementById('workTypeId1').options.length;i++)
				   {
				    	el.options[i] = new Option(document.getElementById('workTypeId1').options[i].text,document.getElementById('workTypeId1').options[i].text);
				   }
				cel.appendChild(el);
			  	colId++;
			  	
			  	cel = row.insertCell(colNum++);
			    var el = document.createElement('textarea');
			    /* el.style.width = "120px"; */
			    el.cols = "30";
			    el.style.height = "30px";
			    el.setAttribute('name','property(workDone'+(lastRow)+')');
			    el.setAttribute('id','workDone'+(lastRow)+'');
			    el.align = 'left';
				cel.appendChild(el);
			  	colId++;
			  	
			  	cel = row.insertCell(colNum++);
			    var el = document.createElement('select');
			    el.style.width = "120px";
			    el.setAttribute('name','property(taskStatusId'+(lastRow)+')');
			    el.setAttribute('id','taskStatusId'+(lastRow)+'');
			    el.align = 'left';
				   for(var i=0;i<document.getElementById('taskStatusId1').options.length;i++)
				   {
				    	el.options[i] = new Option(document.getElementById('taskStatusId1').options[i].text,document.getElementById('taskStatusId1').options[i].text);
				   }
				cel.appendChild(el);
			  	colId++;
			  	
			  	
		 	 }
		 	  $("select").select2();
		 	// document.getElementById("noOfRows").value= table.rows.length;
		 	 document.forms[0].elements["property(noOfRows)"].value=table.rows.length-2;
		 	 
		 	
		}	
	
	function deleteRow(id) 
	{
		var table = document.getElementById(id);
		var lastRow = table.rows.length-1;
		if (lastRow != 2) 
				table.deleteRow(lastRow - 1);
		else
			alert('Minimum 1 Record should Present');
			
			//document.getElementById("noOfRows").value= table.rows.length;
			document.forms[0].elements["property(noOfRows)"].value=table.rows.length;
		}
		
	function callSubmit()
		{
			var table=document.getElementById("taskTable");
		 	var rowCount = table.rows.length-1;

			for (init=1; init < rowCount; init++)
			{
				if (document.getElementById("projectId"+init).value=="0")
				{
					jAlert("Selet Project for task : "+ init);
					return false;
				}
				else if (document.getElementById("taskCategoryId"+init).value=="0")
				{
					jAlert("Selet Task Category for task : "+ init);
					return false;
				}
				else if (document.getElementById("workTypeId"+init).value=="0")
				{
					jAlert("Selet Work Type for task : "+ init);
					return false;
				}
				else if (document.getElementById("workDone"+init).value=="")
				{
					jAlert("Selet Work done for task : "+ init);
					return false;
				}
				else if (document.getElementById("taskStatusId"+init).value=="0")
				{
					jAlert("Selet Task Status for task : "+ init);
					return false;
				}
			}
			
			if(document.getElementById("date").value=="")
	  		{
	  			jAlert("Enter Task Date");
	  			return false;
	  		}
			else
			{
				document.forms[0].elements["property(noOfRows)"].value=table.rows.length-2;
				document.forms[0].mode.value="submitting";
				document.forms[0].submit();
			}
		}
	
	
	</script>	
		
	<style type="text/css">

table.taskTable {
	font-family: verdana, arial, sans-serif;
	color:white;
	font-size: 10pt;
	/* text-shadow: 1px 1px 0px #fff; */
	/* background: #eaebfc; */
	background:#993300;
	border: #993300 2px solid;
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
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb),to(#fafafa) );
	background: -moz-linear-gradient(top, #fbfbfb, #fafafa);
}
</style>
</head>
<body>
	<div style="width: 100%">
	<br>
	<center>
  		<h4><font color="#CC6600" size="5">Add Task</font></h4>
  	</center>
  		
  		<html:form action="/addTask">
			<html:hidden property="mode" name="commonApplicationForm" />
			<html:hidden property="property(noOfRows)" name="commonApplicationForm" />
			
			<font color="#CC6600" size="3">Date:</font>
			<html:text property="property(date)" styleId="date" style="width:100px;height:10px" name="commonApplicationForm"
						onkeypress="return letternumberforDays(event);" maxlength="10"
						onkeyup="buildDate(this)" onblur="isValidDate(this)" />
						<%-- <img src="<%=basePath %>images/cal.gif" onclick="popUpCalendar(this,'applicantionFromDate', 'dd/mm/yyyy')" /> --%>
			
			<br>
			<br>
			
			<table class="taskTable" id="taskTable">
				<tr>
					<th>Project </th>
					<th>Task Category </th>
					<th>Work Type </th>
					<th>Work done </th>
					<th>Task Status </th>
				</tr>
				<tr>
					<td>
						<html:select property="property(projectId1)" styleId="projectId1" name="commonApplicationForm" style="width:150px" onchange="getData()" >  
							<html:option value="0">Select</html:option>
								<logic:notEmpty property="property(projectList)" name="commonApplicationForm">
									<html:optionsCollection property="property(projectList)" name="commonApplicationForm" />
								</logic:notEmpty>
						</html:select>
					</td>
					<td>
						<html:select property="property(taskCategoryId1)" styleId="taskCategoryId1" name="commonApplicationForm" style="width:150px" onchange="getData()" >  
							<html:option value="0">Select</html:option>
								<logic:notEmpty property="property(taskCategoriesList)" name="commonApplicationForm">
									<html:optionsCollection property="property(taskCategoriesList)" name="commonApplicationForm" />
								</logic:notEmpty>
						</html:select>
					</td>
					<td>
						<html:select property="property(workTypeId1)" styleId="workTypeId1" name="commonApplicationForm" style="width:120px" onchange="getData()" >  
							<html:option value="0">Select</html:option>
								<logic:notEmpty property="property(workTypeList)" name="commonApplicationForm">
									<html:optionsCollection property="property(workTypeList)" name="commonApplicationForm" />
								</logic:notEmpty>
						</html:select>
					</td>
					<td >
						<html:textarea property="property(workDone1)" styleId="workDone1" name="commonApplicationForm" cols="30" style="height:30px " />
					</td>
					<td>	
						<html:select property="property(taskStatusId1)"  styleId="taskStatusId1" name="commonApplicationForm" style="width:120px" onchange="getData()" >  
							<html:option value="0">Select</html:option>
								<logic:notEmpty property="property(taskStatusList)" name="commonApplicationForm">
									<html:optionsCollection property="property(taskStatusList)" name="commonApplicationForm" />
								</logic:notEmpty>
						</html:select>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input type="button" value="Add Task" onclick="addRow()"> 
						<input type="button" value="Delete Task" onclick="deleteRow('taskTable')">
						<input type='button' value='Submit' onclick="callSubmit()"/>
					</td>
				</tr>
			</table>	
		</html:form>
</div>
</body>

</html>