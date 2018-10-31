package in.gov.cgg.struts.Reports.Action;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import in.gov.cgg.struts.Reports.Form.CommonReportsForm;
import in.gov.cgg.struts.utils.BasicDataBaseUtils;

public class TaskReportAction extends DispatchAction {
	
	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	public ActionForward unspecified(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session =request.getSession();
		CommonReportsForm formBean = (CommonReportsForm)form;
		String filePath = getServlet().getServletContext().getRealPath("/") +"tempFiles";
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		saveToken(request);
		
		String queryString="";
		
		String psqlDBString = "jdbc:postgresql://localhost:5432/dailytasks";
		String psqlDriver = "org.postgresql.Driver";
		
		Connection con =null;
		Statement optionsStatement=null;
		Statement statement=null;
		ArrayList reportData=new ArrayList();
		
		try
		{
			Class.forName(psqlDriver);
			con=DriverManager.getConnection(psqlDBString, "dailytasks","dailytasks");
			//conn=DataBasePlugin.getConnection();
			optionsStatement=con.createStatement();
			statement=con.createStatement();
			
			queryString="select project_id,project_name from projects where delete_flag is null order by project_id";
			formBean.setProperty("projectList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select category_id,category_name from task_category where delete_flag is null order by category_id";
			formBean.setProperty("taskCategoriesList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select work_id,work_name from work_categories where delete_flag is null order by work_id";
			formBean.setProperty("workTypeList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select status_id,status_name from task_status where delete_flag is null order by status_id";
			formBean.setProperty("taskStatusList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select status_id,status_name from task_status where delete_flag is null order by status_id";
			formBean.setProperty("taskStatusList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select to_char(work_date,'dd/mm/yyyy') as work_date," +
					" (select project_name from projects where project_id=dw.project_id) as project_name," +
					" (select category_name from task_category where category_id=dw.task_category_id) as category_name," +
					" (select work_name from work_categories where work_id=dw.work_type_id) as work_name," +
					" work_done," +
					" (select status_name from task_status where status_id=dw.task_status_id) as status_name" +
					" from daily_works dw where user_id = "+Integer.parseInt(session.getAttribute("user_id").toString())+" order by work_date";
			
			//formBean.setProperty("TasksList", BasicDataBaseUtils.getSelectMap(queryString, con));
			
			int slNo = 1;
			
			ArrayList reportDataSubList=null;
			ResultSet rs=statement.executeQuery(queryString);
			while(rs!=null && rs.next())
			{
				reportDataSubList= new ArrayList();
				reportDataSubList.add(Integer.toString(slNo++));
				reportDataSubList.add(rs.getString("work_date"));
				reportDataSubList.add(rs.getString("project_name"));
				reportDataSubList.add(rs.getString("category_name"));
				reportDataSubList.add(rs.getString("work_name"));
				reportDataSubList.add(rs.getString("work_done"));
				reportDataSubList.add(rs.getString("status_name"));
				
				/*HashMap<String, Object> taskMap = new HashMap<String, Object>();
				taskMap.put("work_date", rs.getString("work_date"));
				taskMap.put("project_name", rs.getString("project_name"));
				taskMap.put("category_name", rs.getString("category_name"));
				taskMap.put("work_name", rs.getString("work_name"));
				taskMap.put("work_done", rs.getString("work_done"));
				taskMap.put("status_name", rs.getString("status_name"));*/
				reportData.add(reportDataSubList);
			}
			
			formBean.setProperty("taskData",reportData);
			
			ArrayList mainHeading=new ArrayList();
			ArrayList subHeading=new ArrayList();
			ArrayList headingsTemp=null;
		
			String headings[]={"S. No.","Work Date","Project Name","Category","Work","Work Done","Status"};
			List<String> headingsList = Arrays.asList(headings);	// Converting Headings Array to Array List 
			formBean.setProperty("headings", headingsList);			// Sending this to JSP
			
			int columns=headings.length;	// columns for PDF or EXCEL
			
			// adding main headings	
			for(int h=0;h<headings.length;h++)
			{
				headingsTemp=new ArrayList();							
				headingsTemp.add(headings[h]); // name
				headingsTemp.add("1"); // col span							
				mainHeading.add(headingsTemp);
			}

			// adding sub headings
			for(int h=0;h<headings.length;h++)
			{
				headingsTemp=new ArrayList();							
				headingsTemp.add(" "); // name
				headingsTemp.add("1"); // col span							
				subHeading.add(headingsTemp);
			}
			
			request.setAttribute("Excelfilename",basePath+"tempFiles/"+"TaskReport.xls");
			request.setAttribute("PDFfilename", basePath+"tempFiles/"+"TaskReport.pdf");
			
			System.out.println("filePath: "+filePath);
			
			request.setAttribute("reportTitle", "Task Report");
			
			BasicDataBaseUtils.getPdf(mainHeading, subHeading, reportData, filePath, "TaskReport.pdf", "Task Report",  columns);
			BasicDataBaseUtils.getExcel(mainHeading, subHeading, reportData, filePath, "TaskReport.xls","Task Report", columns);
			
		formBean.setProperty("DisplayTable","showTaskReport");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		try
		{
			if (optionsStatement!=null)
				optionsStatement.close();
			if (statement!=null)
				statement.close();
			
			con.close();
		}
		catch(Exception ex)
		{
		}
		
		//DataBasePlugin.closeConnection(conn);
	}
		return mapping.findForward("showTaskReport");
	}
}
