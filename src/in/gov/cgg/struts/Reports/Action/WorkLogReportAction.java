package in.gov.cgg.struts.Reports.Action;


import in.gov.cgg.struts.Reports.Form.CommonReportsForm;
import in.gov.cgg.struts.utils.BasicDataBaseUtils;
import in.gov.cgg.struts.utils.database.DataBasePlugin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class WorkLogReportAction extends DispatchAction {
	
	public ActionForward unspecified(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	{
		CommonReportsForm formBean = (CommonReportsForm)form;
		saveToken(request);
		
		Connection con =null;
		Statement optionsStatement=null;
		try
		{
			con=DataBasePlugin.getConnection();
			optionsStatement=con.createStatement();
			
			String sql="select project_id,project_name from projects where delete_flag is null order by project_id";
			formBean.setProperty("projectList",BasicDataBaseUtils.getOptionsList(sql,  2,optionsStatement));
			
			formBean.setProperty("displayTable", "show");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			DataBasePlugin.closeStatement(optionsStatement);
			DataBasePlugin.closeConnection(con);
		}
		return mapping.findForward("showWorkLogReport");
	}
	
	@SuppressWarnings({"unused", "rawtypes", "unchecked" })
	public ActionForward getDetails(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session =request.getSession();
		CommonReportsForm formBean = (CommonReportsForm)form;
		String filePath = getServlet().getServletContext().getRealPath("/") +"downloads";
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		saveToken(request);
		
		String sql="";
		
		Connection con =null;
		Statement optionsStatement=null;
		Statement statement=null;
		String sqlPart="";
		try
		{
			con=DataBasePlugin.getConnection();
			optionsStatement=con.createStatement();
			statement=con.createStatement();
			
			sql="select project_id,project_name from projects where delete_flag is null order by project_id";
			formBean.setProperty("projectList",BasicDataBaseUtils.getOptionsList(sql,  2,optionsStatement));
			
			sql="select row_number() OVER() as sno, id, " +
					" to_char(work_date,'dd/mm/yyyy') as work_date," +
					" (select project_name from projects where project_id=dw.project_id) as project_name," +
					" (select category_name from task_category where category_id=dw.task_category_id) as task_category," +
					" (select work_name from work_categories where work_id=dw.work_type_id) as work_type," +
					" coalesce(dw.work_done,'-') as work_done," +
					" (select status_name from task_status where status_id=dw.task_status_id) as task_status, coalesce(description,'-') as description" +
					" from daily_works dw" +
					" where user_id=" +session.getAttribute("user_id")+
					" and dw.work_date >= to_date('"+formBean.getProperty("fromDate")+"','dd/mm/yyyy') and dw.work_date <= to_date('"+formBean.getProperty("toDate")+"','dd/mm/yyyy')" +
					" " + ("0".equals((String)formBean.getProperty("projectId")) ? " " : " and dw.project_id = "+formBean.getProperty("projectId") )+
					" order by to_char(work_date,'dd/mm/yyyy')";
			
			//ArrayList<HashMap<String, Object>> list = BasicDataBaseUtils.getListMap(sql, con, null);
			
			ArrayList<HashMap<String,Object>> workLogList = new ArrayList<HashMap<String,Object>>();
			HashMap<String, Object> taskMap = new HashMap<String, Object>();
			ArrayList reportData= new ArrayList();
			ArrayList reportDataSubList=null;
			
			int sNo=0;
			ResultSet rs=statement.executeQuery(sql);
			while(rs!=null && rs.next())
			{
				reportDataSubList= new ArrayList();
				//reportDataSubList.add(rs.getString("sno"));
				reportDataSubList.add((++sNo));
				reportDataSubList.add(rs.getString("work_date"));
				reportDataSubList.add(rs.getString("project_name"));
				reportDataSubList.add(rs.getString("task_category"));
				reportDataSubList.add(rs.getString("work_type"));
				reportDataSubList.add(rs.getString("work_done"));
				reportDataSubList.add(rs.getString("task_status"));
				reportDataSubList.add(rs.getString("description"));
				reportData.add(reportDataSubList);
				
				taskMap = new HashMap<String, Object>();
				taskMap.put("work_date", rs.getString("work_date"));
				taskMap.put("project_name", rs.getString("project_name"));
				taskMap.put("task_category", rs.getString("task_category"));
				taskMap.put("work_type", rs.getString("work_type"));
				taskMap.put("work_done", rs.getString("work_done"));
				taskMap.put("task_status", rs.getString("task_status"));
				taskMap.put("description", rs.getString("description"));
				workLogList.add(taskMap);
			}
			
			formBean.setProperty("workLogList", workLogList);
			
			// PDF, Excel Generation
			ArrayList mainHeading=new ArrayList();
			ArrayList subHeading=new ArrayList();
			ArrayList headingsTemp=null;
		
			String headings[]={"S. No.", "Work Date", "Project Name", "Category", "Work Type", "Work Done", "Task Status", "Description"};
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
			
			request.setAttribute("reportTitle", "Task Report");
			
			request.setAttribute("pdfFileName", basePath+"downloads/"+"TaskReport.pdf");
			request.setAttribute("excelFileName", basePath+"downloads/"+"TaskReport.xls");
			BasicDataBaseUtils.getPdf(mainHeading, subHeading, reportData, filePath, "TaskReport.pdf", "Task Report", columns);
			BasicDataBaseUtils.getExcel(mainHeading, subHeading, reportData, filePath,"TaskReport.xls", "Task Report", columns);
		
			formBean.setProperty("displayTable", "show");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			DataBasePlugin.closeStatement(optionsStatement);
			DataBasePlugin.closeStatement(statement);
			DataBasePlugin.closeConnection(con);
		}
		return mapping.findForward("showWorkLogReport");
	}
	
	
}
