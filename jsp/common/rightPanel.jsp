<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rightPanel.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="row">

							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">	
								<br>
								<ul class="list-group">
								<li style="text-align: center; background: #fc7658; color:#fff; padding:5px 5px; font-weight:bold;">SERVICES</li>
									<li class="list-group-item"><strong><a href="<%=basePath%>schemeEntry.do">Scheme Categorisation Online Format</a></strong></li>
								 <%--  <li class="list-group-item"><strong><a href="<%=basePath%>worksUpload.do">Works Entry</a></strong></li>
								  <li class="list-group-item"><strong><a href="<%=basePath%>formats/TSPTS_Family_Beneficiary_Format.xls">Family Beneficiary Schemes</a></strong></li>
								  <li class="list-group-item"><strong><a href="<%=basePath%>formats/TSPTS_Individual_Format.xls">Individual</a></strong></li>
								  <li class="list-group-item"><strong><a href="<%=basePath%>formats/TSPTS_Group_Beneficiary_Format.xls">Group Beneficiary Schemes</a></strong></li> --%>
								  <li class="list-group-item"><strong><a href="<%=basePath%>schemeDetailsReport.do">Scheme Details Report</a></strong></li>
								</ul> 
								<!-- <div class="user">
									<img src="Dashboard/images/default-avatar-tech-guy.png" class="img-responsive img-circle"/>
										<span class="badge badge-notify">3</span>
								</div>
								<hr class="style14"/>
								  <h1 class="title-widget">Adilabad</h1>
								    <hr class="style14"/>
								 <ul class="list-group">
								  <li class="list-group-item"><strong>Sri Jyothi Budha Prakash, IAS</strong></li>
								  <li class="list-group-item"><strong>Collector</strong></li>
								  <li class="list-group-item"><strong>08732-226203</strong></li>
								  <li class="list-group-item"><strong>collector_adbd@telangana.gov.in</strong></li>
								</ul> 
								 <div class="list-group">
									  <a href="#" class="list-group-item block1">
										<div class="d-flex w-100 justify-content-between">
										  <i class="fa fa-sign-in pull-left fa-3x" aria-hidden="true"></i>
										   <span class="rank">Last Login</span>
										  <div class="rank-date">3 days ago /  28/01/2017</div>
										</div>
										
									  </a>
									  <a href="#" class="list-group-item block2">
										<div class="d-flex w-100 justify-content-between">
										  <i class="fa fa-sort-numeric-asc pull-left fa-3x" aria-hidden="true"></i>
										  <span class="rank">Rank 3</span>
										 <div class="rank-date">as on 01/01/2017</div>
										</div>
										
									  </a>
									  
								 </div>
								   <h1 class="title-widget">Active Departments</h1>
								     <hr class="style14"/>
								 <ul class="list-group">
								  <li class="list-group-item">Activity 1</li>
								  <li class="list-group-item">Activity 2</li>
								
								</ul>
							
								   <h1 class="title-widget">Send Message</h1>
								     <hr class="style14"/>
									<div class="chat-box">
									<div class="form-group">
									  <label for="comment">Send Message</label>
									  <textarea class="form-control" rows="5" id="comment"></textarea>
									
									</div>
										<a class="btn btn-success btn-md" style="">Send</a>
									</div> -->
							</div>
							
						</div>
  </body>
</html>
