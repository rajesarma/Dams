<%@ page language="java"%>
<%@ page import="java.util.ResourceBundle" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<%@ page import="java.util.ArrayList" %> 

<%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ResourceBundle labels =(ResourceBundle)session.getAttribute("labels");
 %>
 
<!DOCTYPE HTML>
<html:html lang="true">
<head>

	<title>Projects Data</title>
	<!-- <script src="js/bootstrap.3.3.2.js"></script>
	<script src="js/bootstrap-dialog.js"></script> -->

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

	<script type="text/javascript">
	
		var addOrModify="Add Project";
	
		function addModify(addModifyValue)
		{
			addOrModify = addModifyValue;
			$("#dialogTitle").html(addOrModify);
			
			if(addModifyValue =="Add Project")
			{
				document.getElementById("projectName").value = "";
				document.getElementById("projectDesc").value = "";
				
				$("#saveUpdateDeleteButton").html('Save &amp; Close');
			}
		}
	
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
	  
		function callSubmit(obj)
		{
			if (document.getElementById("projectName").value=="")
			{
				jAlert("Enter Project name");
				return false;
			}
			else if (document.getElementById("projectDesc").value=="")
			{
				jAlert("Enter Project Description");
				return false;
			}
			else
			{
				document.forms[0].actionToPerform.value= obj;
				
				document.forms[0].mode.value="submitting";
				document.forms[0].submit();
			}
		}
	  
	  	function editDetails(url, action)
	  	{
			document.getElementById("projectId").value = url.split("#")[0];
			document.getElementById("projectName").value = url.split("#")[1];
			document.getElementById("projectDesc").value = url.split("#")[2];
			
			if(action =="update")
			{
				document.getElementById("saveUpdateDeleteButton").removeAttribute('onclick');
				document.getElementById("saveUpdateDeleteButton").setAttribute('onclick', "callSubmit('update')");
				
				$("#saveUpdateDeleteButton").html('Update &amp; Close');
				
				addModify("Modify Project");
			}
			
			else if(action =="delete")
			{
				document.getElementById("saveUpdateDeleteButton").removeAttribute('onclick');
				document.getElementById("saveUpdateDeleteButton").setAttribute('onclick', "callSubmit('delete')");
				
				$("#saveUpdateDeleteButton").html('Delete &amp; Close');
				
				addModify("Delete Project");
			}
			
			$("#addProjectDialog").modal("show"); 
	  	}
	  	
	</script>
	
</head>
<body >
<br>
	<h4><font color="#AB1E00" size="5">Projects Master</font></h4>
		  		
	<div class="container_form">
		<html:form action="/projects" enctype="multipart/form-data">
			<html:hidden property="mode" name="commonMasterForm"/>
			<html:hidden property="property(actionToPerform)" styleId="actionToPerform" name="commonMasterForm"/>
			<html:hidden property="property(projectId)" styleId="projectId" name="commonMasterForm"/>
			<center>
			
			<div id="wait" align="center"style="font-size: 15px;font-weight: bold"> </div>
			
			<logic:equal property="property(showMode)" value="displayPage" name="commonMasterForm">
				<div class="row" >
					<div class="col-md-12 col-sm-12 col-xs-12" >
						<div class="col-md-2 col-sm-2 col-xs-2" >
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProjectDialog" onclick="addModify('Add Project')">Add Project</button>
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10" >
							<logic:notEmpty property="property(msg)" name="commonMasterForm">
								<div align="center" style="font-size: 15px;font-weight: bold; color: red; vertical-align: middle "> 
									<bean:write property="property(msg)" name="commonMasterForm" />
								</div>
							</logic:notEmpty>
						</div>
						
						<div class="table-responsive col-md-12 col-sm-12 col-xs-12" >
							<table class="table table-striped table-bordered" style="margin-bottom: 0px;">
								<thead>
									<tr>
										<th style="text-align: center"> S.No. </th>
										<th style="text-align: center"> Project Name </th>
										<th style="text-align: center"> Project Description</th>
										<th style="text-align: center"> Action</th>
									</tr>
								</thead>
								<logic:notEmpty property="property(projectsList)" name="commonMasterForm">
									<tbody>
										<logic:iterate id="item" indexId="outer" property="property(projectsList)" name="commonMasterForm">
											<tr>
												<td align="center">${outer+1}</td>
												<td >${item.project_name }</td>
												<td >${item.project_desc }</td>
												<td style="text-align: center">${item.action }</td>
											</tr>
										</logic:iterate>
									</tbody>
								</logic:notEmpty>
								<logic:empty property="property(projectsList)" name="commonMasterForm">
									<tbody>
										<tr>
											<td colspan="5" align="center">
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
			
			<div id="addProjectDialog" class="modal fade" tabindex="-1" data-width="760" style="display: none;">
				<div class="modal-dialog">
					<div class="modal-content">
				        <div class="modal-header">
				    		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				    		 	<span aria-hidden="true">&times;</span>
			                </button>
				    		<h4 class="modal-title" style="color:#AB1E00"><span id="dialogTitle">Add Project</span> </h4>
				  		</div>
				  		<div class="modal-body">
						    <div class="row">
								<div class="col-md-12">
							        <table class="table table-striped table-bordered " style="width: 80%" id="projectTable">
							        	<tr>
							        		<td class="headingClass" style="vertical-align: middle">Project Name</td>
							        		<td>
							        			<html:text property="property(projectName)" name="commonMasterForm" styleId="projectName" style="width:250px" onkeyup="validChar(this)" onblur="validChar(this)" />
							        		</td>
							        	</tr>
							        	<tr>
							        		<td class="headingClass" style="vertical-align: middle">Project Description </td>
							        		<td>
												<html:textarea property="property(projectDesc)" name="commonMasterForm" style="width:350px" styleId="projectDesc"
											    	onkeyup="validChar(this);textAreaCounter(this,'projectDescCounter',200)" 
											    	onblur="validChar(this);textAreaCounter(this,'projectDescCounter',200)" />
											    <span id="projectDescCounter">200</span>
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
</html:html>
