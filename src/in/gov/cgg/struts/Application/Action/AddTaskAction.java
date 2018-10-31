package in.gov.cgg.struts.Application.Action;


import in.gov.cgg.struts.Application.Form.CommonApplicationForm;
import in.gov.cgg.struts.utils.BasicDataBaseUtils;
import in.gov.cgg.struts.utils.DataBasePlugin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class AddTaskAction extends DispatchAction {
	
	public ActionForward unspecified(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		CommonApplicationForm formBean = (CommonApplicationForm)form;
		saveToken(request);
		Statement optionsStatement=null;
		String queryString="";
		
		Connection con =null;
		
		try
		{
			con=DataBasePlugin.getConnection();
			optionsStatement=con.createStatement();
			
			queryString="select project_id,project_name from projects where delete_flag is null order by project_id";
			formBean.setProperty("projectList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select category_id,category_name from task_category where delete_flag is null order by category_id";
			formBean.setProperty("taskCategoriesList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select work_id,work_name from work_categories where delete_flag is null order by work_id";
			formBean.setProperty("workTypeList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select status_id,status_name from task_status where delete_flag is null order by status_id";
			formBean.setProperty("taskStatusList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
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
			con.close();
		}
		catch(Exception ex)
		{
		}
		
		DataBasePlugin.closeConnection(con);
	}
		return mapping.findForward("showAddTask");
	}
	
	public ActionForward submitting(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session =request.getSession();
		CommonApplicationForm formBean = (CommonApplicationForm)form;
		Statement optionsStatement=null;
		PreparedStatement preparedStatement = null;
		
		String queryString="";
		
		Connection con =null;
		
		if(isTokenValid(request, true))
		{
		
		try
		{
			con=DataBasePlugin.getConnection();
			con.setAutoCommit(false);
			optionsStatement=con.createStatement();
			
			queryString="select project_id,project_name from projects where delete_flag is null order by project_id";
			formBean.setProperty("projectList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select category_id,category_name from task_category where delete_flag is null order by category_id";
			formBean.setProperty("taskCategoriesList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select work_id,work_name from work_categories where delete_flag is null order by work_id";
			formBean.setProperty("workTypeList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			queryString="select status_id,status_name from task_status where delete_flag is null order by status_id";
				
			int tasksCount=Integer.parseInt(formBean.getProperty("noOfRows").toString());
			
			queryString="INSERT INTO daily_works(id, work_date, project_id, task_category_id, work_type_id, work_done, task_status_id, user_id,entered_date) " +
					"    VALUES(nextval('daily_works_id_seq'), to_date(?, 'dd/mm/yyyy'), ?, ?,?,?,?, ?,now())";
			
			preparedStatement=con.prepareStatement(queryString);
			
			preparedStatement.setString(1, formBean.getProperty("date").toString());
			
			for(int initValue=1;initValue <=tasksCount; initValue++)
			{	
				preparedStatement.setInt(2, Integer.parseInt(formBean.getProperty("projectId"+initValue).toString()));
				preparedStatement.setInt(3, Integer.parseInt(formBean.getProperty("taskCategoryId"+initValue).toString()));
				preparedStatement.setInt(4, Integer.parseInt(formBean.getProperty("workTypeId"+initValue).toString()));
				preparedStatement.setString(5, formBean.getProperty("workDone"+initValue).toString());
				preparedStatement.setInt(6, Integer.parseInt(formBean.getProperty("taskStatusId"+initValue).toString()));
				preparedStatement.setInt(7, Integer.parseInt(session.getAttribute("user_id").toString()));
				
				preparedStatement.addBatch();
			}
			preparedStatement.executeBatch();
				
			formBean.setProperty("msg","Record Inserted Successfully");
			request.setAttribute("msg", "Record Inserted Successfully");
			
			con.commit();
			
			formBean.setProperty("displayMode", "displayAddPage");
					
			}	
			catch (Exception e) 
			{
				e.printStackTrace();
				//formBean.setProperty("msg","Problem in Insertion");
				try
				{
					con.rollback();
					con.setAutoCommit(false);
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
				request.setAttribute("msg", "Failure in records insertion");
				formBean.setProperty("displayMode", "displayAddPage");
			}
			finally
			{
				try
				{	
					if (optionsStatement!=null)
						optionsStatement.close();
					if (preparedStatement!=null)
						preparedStatement.close();
					con.close();
				}
				catch(Exception ex){ }
					DataBasePlugin.closeConnection(con);
			}  // Finally
		}
				
		return mapping.findForward("showAddTask");
	}
	
}
