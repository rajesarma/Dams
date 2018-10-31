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
<title>Work Log</title>
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
		
		.modal-content 
		{
		    width: 730px;
		}
		
		.modal-dialog
		{
		     overflow-y: initial !important;
		     display:table; 
		}
		.modal-body
		{
		  height: 400px;
		  overflow-y: auto;
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

	</script>
		
	<script type="text/javascript">
		function closeButton()
		{
			document.forms[0].mode.value="unspecified";
			document.forms[0].submit();
		}
	
		/*  function addRow()
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
				
				document.forms[0].elements["property(noOfRows)"].value=table.rows.length;
		} */
		
		function textAreaCounter(field,cntfield,maxlimit) 
	    {
			if (field.value.length > maxlimit) 
				field.value = field.value.substring(0, maxlimit);
			else
			{
				cntfield.value = maxlimit - field.value.length;
				document.getElementById(cntfield).innerHTML = "<b>"+(maxlimit - field.value.length) + " left </b>";
			}
	 	}
		
		var addOrModify="Add Work Log";
	
		function addModify(addModifyValue)
		{
			addOrModify = addModifyValue;
			$("#dialogTitle").html(addOrModify);
			
			if(addModifyValue =="Add Work Log")
			{
				$("#workLogId").val("");
				$("#work_date").val("");
				$("#projectId").val("0").trigger('change');
				$("#taskCategoryId").val("0").trigger('change');
				$("#workTypeId").val("0").trigger('change');
				$("#workDone").val("");
				$("#taskStatusId").val("0").trigger('change');
				$("#desc").val("");
				
				$("#saveUpdateDeleteButton").html('Save &amp; Close');
			}
		}
	  
	  	function editDetails(url, action)
	  	{
			/* Order : id, work_date, projectId, taskCategoryId, workTypeId, workDone, taskStatusId, desc */
			
			$("#workLogId").val(url.split("#")[0]);
			$("#work_date").val(url.split("#")[1]);
			$("#projectId").val(url.split("#")[2]).trigger('change');
			$("#taskCategoryId").val(url.split("#")[3]).trigger('change');
			$("#workTypeId").val(url.split("#")[4]).trigger('change');
			$("#workDone").val(url.split("#")[5]);
			$("#taskStatusId").val(url.split("#")[6]).trigger('change');
			$("#desc").val(url.split("#")[7]);
			
			if(action =="update")
			{
				document.getElementById("saveUpdateDeleteButton").removeAttribute('onclick');
				document.getElementById("saveUpdateDeleteButton").setAttribute('onclick', "callSubmit('update')");
				
				$("#saveUpdateDeleteButton").html('Update &amp; Close');
				
				addModify("Modify Work Log");
			}
			
			else if(action =="delete")
			{
				document.getElementById("saveUpdateDeleteButton").removeAttribute('onclick');
				document.getElementById("saveUpdateDeleteButton").setAttribute('onclick', "callSubmit('delete')");
				
				$("#saveUpdateDeleteButton").html('Delete &amp; Close');
				
				addModify("Delete Work Log");
			}
			
			$("#addWorkLogDialog").modal("show"); 
	  	}
		
		function callSubmit(obj)
		{
			if(document.getElementById("work_date").value=="")
	  		{
	  			jAlert("Enter Task Date");
	  			return false;
	  		}
	  		
			else if (document.getElementById("projectId").value=="0")
			{
				jAlert("Selet Project for task : ");
				return false;
			}
			else if (document.getElementById("taskCategoryId").value=="0")
			{
				jAlert("Selet Task Category ");
				return false;
			}
			else if (document.getElementById("workTypeId").value=="0")
			{
				jAlert("Selet Work Type ");
				return false;
			}
			else if (document.getElementById("workDone").value=="")
			{
				jAlert("Selet Work done ");
				return false;
			}
			else if (document.getElementById("taskStatusId").value=="0")
			{
				jAlert("Selet Task Status ");
				return false;
			}
			else
			{
				document.forms[0].actionToPerform.value= obj;
				
				document.forms[0].mode.value="submitting";
				document.forms[0].submit();
			}
		}
		
	</script>	
		
</head>

<body>
<br>
	<h4><font color="#AB1E00" size="5">Work Log</font></h4>	
	
	<div class="container_form">
  		<html:form action="/workLog">
			<html:hidden property="mode" name="commonApplicationForm" />
			<html:hidden property="property(noOfRows)" name="commonApplicationForm" />
			<html:hidden property="property(actionToPerform)" styleId="actionToPerform" name="commonApplicationForm"/>
			<html:hidden property="property(workLogId)" styleId="workLogId" name="commonApplicationForm"/>
		
			<center>
			
			<logic:equal value="show" property="property(displayTable)" name="commonApplicationForm">
				<div class="row" >
					<div class="col-md-12 col-sm-12 col-xs-12" >
						<div class="col-md-2 col-sm-2 col-xs-2" >
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addWorkLogDialog" onclick="addModify('Add Work Log')">Add Work Log</button>
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10" >
							<logic:notEmpty property="property(msg)" name="commonApplicationForm">
								<div align="center" style="font-size: 15px;font-weight: bold; color: red; vertical-align: middle "> 
									<bean:write property="property(msg)" name="commonApplicationForm" />
								</div>
							</logic:notEmpty>
						</div>
						
						<div class="table-responsive col-md-12 col-sm-12 col-xs-12" >
							<table class="table table-striped table-bordered " >
								<thead>
									<tr>
										<th style="text-align: center">Date</th>
										<th style="text-align: center">Project</th>
										<th style="text-align: center">Task Category</th>
										<th style="text-align: center">Work Type</th>
										<th style="text-align: center">Work Done</th>
										<th style="text-align: center">Task Status</th>
										<th style="text-align: center">Description</th>
										<th style="text-align: center">Action</th>
									</tr>
								</thead>
								<logic:notEmpty property="property(workLogList)" name="commonApplicationForm">
									<tbody>
										<logic:iterate id="item" indexId="outer" property="property(workLogList)" name="commonApplicationForm">
											<tr>
												<td >${item.work_date }</td>
												<td >${item.project_name }</td>
												<td >${item.task_category }</td>
												<td >${item.work_type }</td>
												<td >${item.work_done }</td>
												<td >${item.task_status }</td>
												<td >${item.description }</td>
												<td align="center">${item.action }</td>
											</tr>
										</logic:iterate>
									</tbody>
								</logic:notEmpty>
								<logic:empty property="property(workLogList)" name="commonApplicationForm">
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
					</div>
				</div>
			</logic:equal>
			
			<div id="addWorkLogDialog" class="modal fade" tabindex="-1" data-width="760" style="display: none;">
				<div class="modal-dialog">
					<div class="modal-content">
				        <div class="modal-header">
				    		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				    		 	<span aria-hidden="true">&times;</span>
			                </button>
				    		<h4 class="modal-title" style="color:#AB1E00"><span id="dialogTitle">Add Work Log</span> </h4>
				  		</div>
				  		<div class="modal-body">
						    <div class="row">
								<div class="col-md-12">
							        <table class="table table-striped table-bordered" id="projectTable">
							        	<tr>
							        		<td class="headingClass" style="vertical-align: middle">
								        		Date:
								        	</td>
								        	<td>	
												<html:text property="property(work_date)" styleId="work_date" style="width:100px;" name="commonApplicationForm"
												onkeypress="return letternumberforDays(event);" maxlength="10" onkeyup="buildDate(this)" onblur="isValidDate(this)" styleClass="datePicker" />
											</td>
							        	</tr>
							        	<tr>
							        		<td class="headingClass" style="vertical-align: middle">Project </td>
							        		<td>
							        			<html:select property="property(projectId)" styleId="projectId" name="commonApplicationForm" style="width:250px" > <!-- onchange="getData()" -->  
													<html:option value="0">Select</html:option>
													<logic:notEmpty property="property(projectList)" name="commonApplicationForm">
														<html:optionsCollection property="property(projectList)" name="commonApplicationForm" />
													</logic:notEmpty>
												</html:select>
							        		</td>
							        	</tr>
							        	<tr>
							        		<td class="headingClass" style="vertical-align: middle">Task Category </td>
							        		<td>
							        			<html:select property="property(taskCategoryId)" styleId="taskCategoryId" name="commonApplicationForm" style="width:250px" > <!-- onchange="getData()" -->  
													<html:option value="0">Select</html:option>
													<logic:notEmpty property="property(taskCategoriesList)" name="commonApplicationForm">
														<html:optionsCollection property="property(taskCategoriesList)" name="commonApplicationForm" />
													</logic:notEmpty>
												</html:select>
							        		</td>
							        	</tr>
							        	<tr>
							        		<td class="headingClass" style="vertical-align: middle">Work Type </td>
							        		<td>
							        			<html:select property="property(workTypeId)" styleId="workTypeId" name="commonApplicationForm" style="width:250px" >  <!-- onchange="getData()" -->
													<html:option value="0">Select</html:option>
													<logic:notEmpty property="property(workTypeList)" name="commonApplicationForm">
														<html:optionsCollection property="property(workTypeList)" name="commonApplicationForm" />
													</logic:notEmpty>
												</html:select>
							        		</td>
							        	</tr>
							        	<tr>
							        		<td class="headingClass" style="vertical-align: middle">Work done </td>
							        		<td>
							        			<html:textarea property="property(workDone)" name="commonApplicationForm" style="width:250px" styleId="workDone"
											    	onkeyup="validCharWithSymbols(this);textAreaCounter(this,'workDoneCounter',200)" 
											    	onblur="validCharWithSymbols(this);textAreaCounter(this,'workDoneCounter',200)" />
											    <span id="workDoneCounter">200</span>
							        		</td>
							        	</tr>
							        	<tr>
							        		<td class="headingClass" style="vertical-align: middle">Task Status </td>
							        		<td>
							        			<html:select property="property(taskStatusId)"  styleId="taskStatusId" name="commonApplicationForm" style="width:250px" > <!-- onchange="getData()" -->  
													<html:option value="0">Select</html:option>
													<logic:notEmpty property="property(taskStatusList)" name="commonApplicationForm">
														<html:optionsCollection property="property(taskStatusList)" name="commonApplicationForm" />
													</logic:notEmpty>
												</html:select>
							        		</td>
							        	</tr>
							        	<tr>
							        		<td class="headingClass" style="vertical-align: middle">Description</td>
							        		<td>
												<html:textarea property="property(desc)" name="commonApplicationForm" style="width:350px" styleId="desc"
											    	onkeyup="validChar(this);textAreaCounter(this,'descCounter',200)" 
											    	onblur="validChar(this);textAreaCounter(this,'descCounter',200)" />
											    <span id="descCounter">200</span>
							        		</td>
							        	</tr>
							        </table>
								</div>
							</div>
				  		</div>
				  		<div class="modal-footer" id="dialogFooter">
						    <button type="button" data-dismiss="modal" class="btn btn-primary" onclick="callSubmit('save')" id="saveUpdateDeleteButton">Save &amp; Close</button>
						    <span style="padding: 10px"></span>
						    <button type="button" data-dismiss="modal" class="btn btn-primary" >Close</button>
					  	</div>
					</div>
				</div>
			</div>
			
		</center>
		</html:form>
	</div>
</body>

</html>