<%@ page language="java"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ResourceBundle labels = (ResourceBundle) session
			.getAttribute("labels");
	String tempCategories = "",tempCategories1 = "",tempCategories2 = "",width1="",width2="";
	Vector services = null;
	
%>
<logic:equal property="showReport" name="commonSummaryReportForm" value="getForm">
<%-- <logic:notEqual property="ajaxMode" name="commonSummaryReportForm" value="show"> --%>
<%-- <logic:notEqual property="ajaxMode" name="commonSummaryReportForm" value="getReport"> --%>
<html>
<head>
<title>:: Revenue Expenditure Report ::</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/ForReportStyleSheet.css">
 <script language="javascript" src="<%=basePath%>js/fusionCharts/FusionCharts.js"></script>
 <link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/sideMenuPage/main.css" />
<script type="text/javascript" src="<%=basePath%>js/sideMenuPage/jquery-1.3.2.min.js"></script>
<script type="text/javascript" language="javascript" src="<%=basePath%>js/sideMenuPage/main.js"></script>
<script type="text/javascript" language="javascript" src="<%=basePath%>js/sideMenuPage/jquery.js"></script>
<script type="text/javascript" language="javascript" src="<%=basePath%>js/sideMenuPage/jquery-1.4.1-and-plugins.min.js"></script>
</head>
<body>
<html:form action="/dashBoard">
<div id="loadImage"></div>
		<center>
			<font size="3"><b><bean:write name="title"/></b> </font>
		</center>
		<html:hidden property="mode" />
		<table cellpadding="2" cellspacing="1" border="0" width="100%"
			align="center" bgcolor="#fcf8f1">
			<logic:equal value="true" property="showUlb" name="commonSummaryReportForm">
				<tr>
					<td class="tdLabel">Ulb</td>
					<td class="tdField">
					<%String functn="getList('1', 'dashBoard.do?mode=unspecified&type=getYearsList', '"+basePath+"',this,'"+request.getAttribute("type")+"')" ;%>
					<html:select property="ulbId" styleId="ulbId"
							style="width:150px;" onchange="<%=functn%>">
							<logic:equal value="show" property="selectedValue" name="commonSummaryReportForm">
							<html:option value="All">All</html:option>
							</logic:equal>
							<logic:equal value="both" name="commonSummaryReportForm" property="selectedValue">
							<html:option value="0">--Select--</html:option>
							<html:option value="All">All</html:option>
							</logic:equal>
							<logic:equal value="dontShow" name="commonSummaryReportForm" property="selectedValue">
							<html:option value="0">--Select--</html:option>
							</logic:equal>
							<logic:notEmpty property="ulbsList"
								name="commonSummaryReportForm">
								<html:optionsCollection property="ulbsList"
									name="commonSummaryReportForm" />
							</logic:notEmpty>
						</html:select>
					</td>
				</tr>
			</logic:equal>
			<tr>
				<td class="tdLabel">Financial Year</td>
				<td class="tdField">
				<div id="finYearList">
				<%String funForFyers="remeoveData('"+request.getAttribute("type")+"')" ;%>
					<html:select property="financialYearId" styleId="finYrId"
						style="width:150px;" onchange="<%=funForFyers%>">
						<html:option value="0">--Select--</html:option>
						<logic:notEmpty name="financialYearsList">
							<html:optionsCollection 
								name="financialYearsList" />
						</logic:notEmpty>
					</html:select>
					</div>
				</td>
			</tr>
			<logic:equal value="true" property="showUlb" name="commonSummaryReportForm">
			<tr>
				<td colspan="2" align="center">
						<%String fun = "getReport('1', 'dashBoard.do?mode=getRevenueExpenditureReport','"+request.getAttribute("type")+"','"+basePath+"')";
						 %>
						<html:button property="sub"	value="Submit" onclick="<%=fun%>" />
				</td>
			</tr>
			</logic:equal>
			<logic:notEqual value="true" property="showUlb" name="commonSummaryReportForm">
			<tr>
				<td colspan="2" align="center">
						<%String fun = "getReport1('1', 'dashBoard.do?mode=getRevenueExpenditureReport','"+request.getAttribute("type")+"','"+basePath+"','"+session.getAttribute("ulbId").toString()+"')";
						 %>
						<html:button property="sub"	value="Submit" onclick="<%=fun%>" />
				</td>
			</tr>
			</logic:notEqual>
		</table>
		<%if(request.getAttribute("type")!=null && !request.getAttribute("type").equals("") && (request.getAttribute("type").equals("financialStatus") || request.getAttribute("type").equals("finStatus"))){ %>
		<div style="width: 100%;">
		<div id="reportDiv"></div>
		<div style="overflow: auto">
		<div id="chartContainer1"  style="width:75%; float: left;"></div>
		<div id="chartContainer2"  style="width:25%; float: right;"></div>
		</div>
		</div>
		<%}
		else{
		%>
		<div id="reportDiv"></div>
		<div id="chartContainer"></div>
		<%} %>
	</html:form>
</body>
</html>
</logic:equal>
<logic:equal property="ajaxMode" name="commonSummaryReportForm" value="getList">
<html><head/>
<body>
<%String funForFyers="remeoveData('"+request.getAttribute("type")+"')" ;%>
	<html:select property="financialYearId" styleId="finYrId"
		style="width:150px;" name="commonSummaryReportForm" onchange="<%=funForFyers%>">
		<html:option value="0">--Select--</html:option>
		<logic:notEmpty name="financialYearsList">
			<html:optionsCollection 
				name="financialYearsList" />
		</logic:notEmpty>
	</html:select>
	</body>
	</html>
</logic:equal>
<logic:equal value="getReport" property="ajaxMode" name="commonSummaryReportForm">
	<html>
		<head>
				 <script type="text/javascript">
                           function renderChart()
                           {
                               <%if(Float.parseFloat(request.getAttribute("total").toString())==0){
                               }else{
							   ArrayList result = (ArrayList) request.getAttribute("graphData");
								ArrayList accountNames = (ArrayList) request.getAttribute("accountNames");
								String title=request.getAttribute("title").toString();
								int size =result.size();
								float[] data = new float[size];
								String[] names=new String[size];
								for (int i = 0; i <size; i++) {
										data[i]=Float.parseFloat(result.get(i).toString());
										names[i]=accountNames.get(i).toString();
								}
							  %>
                               var myChart = new FusionCharts('<%=basePath %>js/fusionCharts/Pie3D.swf', 'myChartId', '700', '250', '0', '1');
							<% 
								 tempCategories = " '<chart caption=\""+title+"\" borderThickness=\"0\" showBorder=\"0\" legendallowdrag=\"1\"  showLegend=\"1\" legendPosition=\"RIGHT\" showLabels=\"0\" showPercentageInLabel=\"1\" logoPosition =\"TL\"   logoLink=\"JavaScript:void(0)\" logoURL=\""+request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+ "/images/new1.gif\" >";
								 for(int i=0;i<size;i++)
								 {
								 	tempCategories+="<set label=\""+names[i]+"\" value=\""+data[i]+"\"/>";
								 }
								 tempCategories+="</chart>'";/* enableRotation=\"1\" */
							%>	
							myChart.setXMLData(<%=tempCategories%>);
                               myChart.render("chartContainer");
                           <%}%>
                           
                           }
                           	<%if(request.getAttribute("type")!=null && !request.getAttribute("type").equals("") && (request.getAttribute("type").equals("financialStatus") || request.getAttribute("type").equals("finStatus"))){ %>
                            function renderChart1()
                           {
                               <%if(Float.parseFloat(request.getAttribute("total").toString())==0){
                               }else{
							   ArrayList result = (ArrayList) request.getAttribute("graphData");
								ArrayList accountNames = (ArrayList) request.getAttribute("accountNames");
								int size =result.size();
								float[] data = new float[size];
								String[] names=new String[size];
								for (int i = 0; i <size; i++) {
										data[i]=Float.parseFloat(result.get(i).toString());
										names[i]=accountNames.get(i).toString();
								}
							  %>
                               var myChart = new FusionCharts('<%=basePath %>js/fusionCharts/Pie3D.swf', 'myChartId', '600', '200', '0', '1');
							<% 
								 tempCategories1 = " '<chart caption=\"Liabilities\" borderThickness=\"0\" showBorder=\"0\" legendallowdrag=\"1\"  showLegend=\"1\" legendPosition=\"RIGHT\" showLabels=\"0\" showPercentageInLabel=\"1\" logoPosition =\"TL\"   logoLink=\"JavaScript:void(0)\" logoURL=\""+request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+ "/images/new1.gif\" >";
								 for(int i=0;i<size;i++)
								 {
								 	tempCategories1+="<set label=\""+names[i]+"\" value=\""+data[i]+"\"/>";
								 }
								 tempCategories1+="</chart>'";/* enableRotation=\"1\" */
							%>
							myChart.setXMLData(<%=tempCategories1%>);
                               myChart.render("chartContainer1");
                           <%}%>
                           
                           }
                           function renderChart2()
                           {
                               <%if(Float.parseFloat(request.getAttribute("total1").toString())==0){
                               }else{
							   ArrayList result = (ArrayList) request.getAttribute("graphData1");
								ArrayList accountNames = (ArrayList) request.getAttribute("accountNames1");
								int size =result.size();
								float[] data = new float[size];
								String[] names=new String[size];
								for (int i = 0; i <size; i++) {
										data[i]=Float.parseFloat(result.get(i).toString());
										names[i]=accountNames.get(i).toString();
								}
							  %>
                               var myChart = new FusionCharts('<%=basePath %>js/fusionCharts/Pie3D.swf', 'myChartId', '500', '200', '0', '1');
							<% 
								 tempCategories2 = " '<chart caption=\"Assets\" borderThickness=\"0\" showBorder=\"0\" legendallowdrag=\"1\"  showLegend=\"1\" legendPosition=\"RIGHT\" showLabels=\"0\" showPercentageInLabel=\"1\"  logoPosition =\"TL\"   logoLink=\"JavaScript:void(0)\" logoURL=\""+request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+ "/images/new1.gif\" >";
								 for(int i=0;i<size;i++)
								 {
								 	tempCategories2+="<set label=\""+names[i]+"\" value=\""+data[i]+"\"/>";
								 }
								 tempCategories2+="</chart>'";/* enableRotation=\"1\" */
							%>	
							myChart.setXMLData(<%=tempCategories2%>);
                               myChart.render("chartContainer2");
                           <%}%>
                           
                           }
                           <%}%>
                          </script>
			</head>
	<body>
		<logic:notEmpty name="reportData">
				<table cellpadding="2" cellspacing="1" border="0" width="100%"
					align="center" bgcolor="#FFFFFF" id="one">
					<% 
						if(request.getAttribute("type")!=null && !request.getAttribute("type").equals("") && request.getAttribute("type").equals("finStatus")){%>
						<tr><td colspan="2"><b>Liabilities as on <%=request.getAttribute("asOnDate")%></b></td>
						</tr>
						<%}%>
					<tr>
					<% 
						if(request.getAttribute("type")!=null && !request.getAttribute("type").equals("") && request.getAttribute("type").equals("finStatus")){%><%}else{
					%>
						<td class="tdLabel">Account Code</td>
						<%} %>
						<td class="tdLabel">Particulars</td>
						<td class="tdLabel">Amount(Rs. in Lakhs)</td>
					</tr>
					<logic:iterate id="outer" name="reportData" indexId="i">
						<tr>
							<logic:iterate id="inner" name="outer" indexId="j">
								<td class="tdField">${inner}</td>
							</logic:iterate>
						</tr>
					</logic:iterate>
				</table>
			 </logic:notEmpty>
			 <logic:notEmpty name="reportData1">
				<table cellpadding="2" cellspacing="1" border="0" width="100%"
					align="center" bgcolor="#FFFFFF" id="two">
					<% 
						if(request.getAttribute("type")!=null && !request.getAttribute("type").equals("") && request.getAttribute("type").equals("finStatus")){%>
						<tr><td colspan="2"><b>Assets as on <%=request.getAttribute("asOnDate")%></b></td>
						</tr>
						<%}%>
					<tr>
						<td class="tdLabel">Particulars</td>
						<td class="tdLabel">Amount(Rs. in Lakhs)</td>
					</tr>
					<logic:iterate id="outer" name="reportData1" indexId="i">
						<tr>
							<logic:iterate id="inner" name="outer" indexId="j">
								<td class="tdField">${inner}</td>
							</logic:iterate>
						</tr>
					</logic:iterate>
				</table>
			 </logic:notEmpty>
			 <%if(request.getAttribute("type")!=null && !request.getAttribute("type").equals("") && request.getAttribute("type").equals("finStatus")){ %>
		<script>renderChart1();renderChart2();</script>
		<%} %>
	</body>
	</html>
</logic:equal>
