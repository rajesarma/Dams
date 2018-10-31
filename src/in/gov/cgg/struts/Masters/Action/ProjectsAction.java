
package in.gov.cgg.struts.Masters.Action;

import in.gov.cgg.struts.Masters.Form.CommonMasterForm;
import in.gov.cgg.struts.utils.BasicDataBaseUtils;
import in.gov.cgg.struts.utils.DataBasePlugin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;


public class ProjectsAction extends DispatchAction 
{
	public ActionForward unspecified(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	{
		CommonMasterForm formBean = (CommonMasterForm)form;
		saveToken(request);
		
		/*String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()+ ":" + request.getServerPort() + path + "/";*/
		
		//String query="select row_number() OVER() as sno, project_id, project_name, coalesce(project_desc,'-') as project_desc from projects where delete_flag is null";
		//formBean.setProperty("projectsList", BasicDataBaseUtils.getSelectMap(query, con));
		
		getDetails(mapping, formBean, request, response);
		return mapping.findForward("showProjects");
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionForward getDetails(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	{
		CommonMasterForm formBean = (CommonMasterForm)form;
		saveToken(request);
		Connection con =null;
		Statement st=null;
		
		try
		{
			con=DataBasePlugin.getConnection();
			st=con.createStatement();
			
			String query="select row_number() OVER() as sno, project_id, project_name, coalesce(project_desc,'-') as project_desc from projects where delete_flag is null";
			//formBean.setProperty("projectsList", BasicDataBaseUtils.getSelectMap(query, con));
			
			ResultSet rs = st.executeQuery(query);
			ArrayList list = new ArrayList();
			while (rs != null && rs.next()) 
			{
				HashMap map = new HashMap();
				map.put("sno", rs.getString("sno"));
				map.put("project_id", rs.getString("project_id"));
				map.put("project_name", rs.getString("project_name"));
				map.put("project_desc", rs.getString("project_desc"));

				/*map.put("action","<input type='button' value='Modify Project' class='buttonsubmit' style='width:100px' onclick='JavaScript:editDetails(\""
								+ basePath
								+ "projects.do?mode=projectDetails&actionToPerform=edit"
								+ "&project_name="+ rs.getString("project_name")
								+ "&project_desc="+ rs.getString("project_desc")
								+ "&project_id="+ rs.getString("project_id") + "\")'/>");*/
				map.put("action","<input type='button' value='Modify Project' class='buttonsubmit' style='width:150px' onclick='JavaScript:editDetails(\""+rs.getString("project_id")+"#"+rs.getString("project_name")+"#"+rs.getString("project_desc")+"\",\"update\")'/>" +
						"&nbsp;<input type='button' value='Delete Project' class='buttonsubmit' style='width:150px' onclick='JavaScript:editDetails(\""+rs.getString("project_id")+"#"+rs.getString("project_name")+"#"+rs.getString("project_desc")+"\",\"delete\")'/> ");
				list.add(map);
			}
			
			formBean.setProperty("projectsList", list);
			
			formBean.setProperty("showMode","displayPage");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			DataBasePlugin.closeStatement(st);
			DataBasePlugin.closeConnection(con);
		}
		return mapping.findForward("showProjects");
	}
	
	public ActionForward submitting(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	{
		CommonMasterForm formBean = (CommonMasterForm)form;
		Connection con =null;
		Statement st=null;
		String queryString="";
		
		if(isTokenValid(request, true))
		{
			try
			{
				con=DataBasePlugin.getConnection();
				con.setAutoCommit(false);
				st=con.createStatement();
				
				if("save".equals(formBean.getProperty("actionToPerform").toString()))
				{
					if (BasicDataBaseUtils.recordExists("select count(*) from projects where trim(lower(project_name))='"+ formBean.getProperty("projectName").toString().toLowerCase()+"' ", st)) 
						formBean.setProperty("msg","Project already exists with this Name");
					else 
					{
						queryString="insert into projects (project_name, project_desc) " +
								"VALUES( '"+formBean.getProperty("projectName").toString()+"' , '"+formBean.getProperty("projectDesc").toString()+"' )";
						
						int result = st.executeUpdate(queryString);
						if(result>0)
						{	
							formBean.setProperty("msg","Record Inserted Successfully");
							request.setAttribute("msg", "Record Inserted Successfully");
							con.commit();
						}
						else
						{
							formBean.setProperty("msg","Problem in Insertion");
							con.rollback();
						}
					}
				}
				else if("update".equals(formBean.getProperty("actionToPerform").toString()))
				{
					if (BasicDataBaseUtils.recordExists("select count(*) from projects where trim(lower(project_name))='"+ formBean.getProperty("projectName").toString().toLowerCase()+"' ", st)) 
						formBean.setProperty("msg","Project already exists with this Name");
					else 
					{
						queryString="update projects set project_name= '"+formBean.getProperty("projectName").toString()+"', project_desc = '"+formBean.getProperty("projectDesc").toString()+"' " +
								" where project_id = " +formBean.getProperty("projectId");
						
						int result = st.executeUpdate(queryString);
						if(result>0)
						{	
							formBean.setProperty("msg","Record Updated Successfully");
							request.setAttribute("msg", "Record Updated Successfully");
							con.commit();
						}
						else
						{
							formBean.setProperty("msg","Problem in Updation");
							con.rollback();
						}
					}
				}
				else if("delete".equals(formBean.getProperty("actionToPerform").toString()))
				{
					int result = st.executeUpdate("update projects set delete_flag= 'T' where project_id = " +formBean.getProperty("projectId"));
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
				request.setAttribute("msg", "Failure in records insertion");
				formBean.setProperty("displayMode", "displayAddPage");
			}
			finally
			{
				DataBasePlugin.closeStatement(st);
				DataBasePlugin.closeConnection(con);
					
				getDetails(mapping, formBean, request, response);
			}
		}
		else
		{				
			return mapping.findForward("notGenuine");
		}
				
		return mapping.findForward("showProjects");
	}
}