package in.gov.cgg.struts.Application.Action;


import in.gov.cgg.struts.Application.Form.CommonApplicationForm;
import in.gov.cgg.struts.utils.BasicDataBaseUtils;
import in.gov.cgg.struts.utils.DataBasePlugin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class WorkLogAction extends DispatchAction {
	
	public ActionForward unspecified(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	{
		CommonApplicationForm formBean = (CommonApplicationForm)form;
		saveToken(request);
			
		formBean.setProperty("displayTable", "show");
		
		getDetails(mapping, formBean, request, response);
		
		return mapping.findForward("showWorkLog");
	}
	
	public ActionForward getDetails(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session =request.getSession();
		CommonApplicationForm formBean = (CommonApplicationForm)form;
		saveToken(request);
		Statement optionsStatement=null;
		/*String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";*/
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
			
			queryString="select id, project_id,task_category_id, work_type_id, task_status_id," +
					" to_char(work_date,'dd/mm/yyyy') as work_date," +
					" (select project_name from projects where project_id=dw.project_id) as project_name," +
					" (select category_name from task_category where category_id=dw.task_category_id) as task_category," +
					" (select work_name from work_categories where work_id=dw.work_type_id) as work_type," +
					" coalesce(dw.work_done,'-') as work_done," +
					" (select status_name from task_status where status_id=dw.task_status_id) as task_status, coalesce(description,'-') as description" +
					" from daily_works dw" +
					" where user_id=" +session.getAttribute("user_id")+
					" and delete_flag is null" +
					" and (dw.work_date = current_date-1 or dw.work_date = current_date)"+	// Show only Today and Previous days Work log
					" order by to_char(work_date,'dd/mm/yyyy')" ;
			
			ArrayList<HashMap<String, Object>> list = BasicDataBaseUtils.getListMap(queryString, con, null);
			
			for(int i=0; i< list.size(); i++)
			{
				HashMap<String, Object> worksMap = (HashMap<String, Object>)list.get(i); 
				
				worksMap.put("action","<input type='button' value='Modify Work Log' class='buttonsubmit' style='width:120px' onclick='JavaScript:editDetails(\""+worksMap.get("id")+"#"+worksMap.get("work_date")+"#"+worksMap.get("project_id")+"#"+worksMap.get("task_category_id")+"#"+worksMap.get("work_type_id")+"#"+worksMap.get("work_done")+"#"+worksMap.get("task_status_id")+"#"+worksMap.get("description")+"\",\"update\")'/>" +
						"&nbsp;<input type='button' value='Delete Work Log' class='buttonsubmit' style='width:120px' onclick='JavaScript:editDetails(\""+worksMap.get("id")+"#"+worksMap.get("work_date")+"#"+worksMap.get("project_id")+"#"+worksMap.get("task_category_id")+"#"+worksMap.get("work_type_id")+"#"+worksMap.get("work_done")+"#"+worksMap.get("task_status_id")+"#"+worksMap.get("description")+"\",\"delete\")'/> ");
			}
			
			formBean.setProperty("workLogList", list);
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
		
		return mapping.findForward("showWorkLog");
	}
	
	public ActionForward submitting(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session =request.getSession();
		CommonApplicationForm formBean = (CommonApplicationForm)form;
		Statement st=null;
		PreparedStatement pst = null;
		
		String queryString="";
		
		Connection con =null;
		
		if(isTokenValid(request, true))
		{
			try
			{
				con=DataBasePlugin.getConnection();
				con.setAutoCommit(false);
				st=con.createStatement();
				
				if("save".equals(formBean.getProperty("actionToPerform").toString()))
				{
					queryString="INSERT INTO daily_works(id, work_date, project_id, task_category_id, work_type_id, work_done, task_status_id, user_id, description, entered_date) " +
							"    VALUES(nextval('daily_works_id_seq'), to_date(?, 'dd/mm/yyyy'), ?, ?,?,?,?, ?, ?,now())";
					
					pst=con.prepareStatement(queryString);
					
					pst.setString(1, formBean.getProperty("work_date").toString());
					pst.setInt(2, Integer.parseInt(formBean.getProperty("projectId").toString()));
					pst.setInt(3, Integer.parseInt(formBean.getProperty("taskCategoryId").toString()));
					pst.setInt(4, Integer.parseInt(formBean.getProperty("workTypeId").toString()));
					pst.setString(5, formBean.getProperty("workDone").toString());
					pst.setInt(6, Integer.parseInt(formBean.getProperty("taskStatusId").toString()));
					pst.setInt(7, Integer.parseInt(session.getAttribute("user_id").toString()));
					pst.setObject(8, formBean.getProperty("desc").toString());
					
					int result = pst.executeUpdate();
					if (result>0)
					{
						formBean.setProperty("msg","Record Inserted Successfully");
						con.commit();
					}
					else
					{
						formBean.setProperty("msg","Problem in Insertion");
						con.rollback();
						con.setAutoCommit(true);
					}
				}
				else if("update".equals(formBean.getProperty("actionToPerform").toString()))
				{
					queryString="update daily_works set " +
							" work_date = to_date('"+formBean.getProperty("work_date").toString()+"','dd/mm/yyyy'), " +
							" project_id = "+formBean.getProperty("projectId")+", " +
							" task_category_id= "+formBean.getProperty("taskCategoryId")+", " +
							" work_type_id= "+formBean.getProperty("workTypeId")+", " +
							" work_done = '"+formBean.getProperty("workDone")+"', " +
							" task_status_id= "+formBean.getProperty("taskStatusId")+", " +
							" user_id = "+session.getAttribute("user_id")+", " +
							" description = '"+formBean.getProperty("desc")+"', " +
							" entered_date = now()" +
							" where id = "+ formBean.getProperty("workLogId");
					
					int result = st.executeUpdate(queryString);
					if (result>0)
					{
						formBean.setProperty("msg","Record Updated Successfully");
						con.commit();
					}
					else
					{
						formBean.setProperty("msg","Problem in Insertion");
						con.rollback();
						con.setAutoCommit(true);
					}
				}
				else if("delete".equals(formBean.getProperty("actionToPerform").toString()))
				{
					int result = st.executeUpdate("update daily_works set delete_flag= 'T', deleted_date= now() where id = " +formBean.getProperty("workLogId"));
					if(result>0)
					{	
						formBean.setProperty("msg","Record Deleted Successfully");
						request.setAttribute("msg", "Record Deleted Successfully");
						con.commit();
					}
					else
					{
						formBean.setProperty("msg","Problem in Insertion");
						con.rollback();
					}
				}
				
				formBean.setProperty("displayMode", "displayAddPage");
			}	
			catch (Exception e) 
			{
				e.printStackTrace();
				formBean.setProperty("msg","Problem in Insertion");
				try
				{
					con.rollback();
					con.setAutoCommit(false);
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
			finally
			{
				DataBasePlugin.closeStatement(st);
				DataBasePlugin.closeStatement(pst);
				DataBasePlugin.closeConnection(con);
				
				getDetails(mapping, formBean, request, response);
			}  
		}
				
		return mapping.findForward("showWorkLog");
	}
	
}
