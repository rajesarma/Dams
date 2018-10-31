package in.gov.cgg.struts.Authentication.Action;


import in.gov.cgg.struts.Authentication.Form.AuthenticationForm;
import in.gov.cgg.struts.utils.BasicDataBaseUtils;
import in.gov.cgg.struts.utils.DataBasePlugin;
import in.gov.cgg.struts.utils.JSON.JSONArray;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class AuthenticationAction extends DispatchAction {
	
	public ActionForward unspecified(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	{
		AuthenticationForm formBean = (AuthenticationForm)form;
		saveToken(request);
		Statement optionsStatement=null;
		String queryString="";
		
		Connection con =null;
		
		try
		{
			con=DataBasePlugin.getConnection();
			optionsStatement=con.createStatement();
		
			queryString="select designation_id, designation from designations order by designation";
			formBean.setProperty("designationList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
		
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
			
		return mapping.findForward("success");
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionForward loginCheck( ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) 
	{
		AuthenticationForm formBean = (AuthenticationForm)form;
		HttpSession session= session=request.getSession(true); 
		
		Connection con =null;
		Statement st=null;
		Statement stmt=null;
		Statement optionsStatement=null;
		ResultSet rs=null;
		
		String msg="";
		String target="";
		
		String queryString="";
		boolean result=false;
		
		try
		{
			con=DataBasePlugin.getConnection();
			st=con.createStatement();
			stmt=con.createStatement();
			optionsStatement=con.createStatement();
			
			queryString="select designation_id, designation from designations order by designation";
			formBean.setProperty("designationList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
				
				if (BasicDataBaseUtils.recordExists("select count(*) from users where username = '"+formBean.getProperty("userName")+"' and delete_flag is null", st))
				 {	 
					 if (BasicDataBaseUtils.recordExists("select count(*) from users where username = '"+formBean.getProperty("userName")+"' and password='"+formBean.getProperty("password")+"' and delete_flag is null", st))
					 { 
						 
						 String query="select user_id,username,(select role_name from roles where role_id=u.role_id), role_id, real_name from users u where username='"+formBean.getProperty("userName")+"'";
						 rs=st.executeQuery(query);
						 if(rs.next())
						 {
							 
							 session.setAttribute("user_id", rs.getString("user_id"));
							 session.setAttribute("userName", rs.getString("username"));
							 session.setAttribute("real_name", rs.getString("real_name"));
							
							 result=true;
							 
							 session.setAttribute("roleName",rs.getString("role_name"));
							 session.setAttribute("roleId",rs.getString("role_id"));
							 
							 /*Map<String,Object> selectedFYList=(Map<String,Object>) BasicDataBaseUtils.getMap("select id,to_char(startingdate,'dd/mm/yyyy') as startingdate,to_char(endingdate,'dd/mm/yyyy') as endingdate,financialyear,isactive,isclosed," +
					            		" (select id from financialyear where ulbid=fy.ulbid and startingdate=fy.endingdate+'1 day'::interval) as nextid,to_char(current_date,'dd/mm/yyyy') as current_date,to_char((case when current_date<endingdate then current_date else endingdate end),'dd/mm/yyyy') as max_date " +
					            		" from financialyear fy where ulbid=? and financialyear=?", con, new Object[]{rs.getInt("ULBID"),welcomeForm.getFinancialYear()});
					         */   
							 
							 List menu=getServices(con,session);
						     session.setAttribute("services",new JSONArray(menu));
						     
						     //if(!BasicDataBaseUtils.recordExists("select count(*) from logtable where username='"+session.getAttribute("userName")+"' and logout_time is null", optionsStatement))
						     //if( ((Long)BasicDataBaseUtils.getDBObject("select count(id) from logtable where username=? and session_id =? and logout_time is null", con, new Object[]{session.getAttribute("userName"),session.getId()} ) )==0)
						     
						     //if( ((Long)BasicDataBaseUtils.getDBObject("select count(id) from logtable where username=? and logout_time is null ", con, new Object[]{session.getAttribute("userName") } ) )==0)
						     {	 
						    	 stmt.executeUpdate("update logtable set logout_time = now()-'2 seconds':: interval where username='"+session.getAttribute("real_name")+"' and logout_time is null");
						    	 
						    	 session.setAttribute("seqId",BasicDataBaseUtils.getNextVoucherId(con, "logtable_seq"));
							     stmt.executeUpdate("INSERT INTO logtable(username, real_name, ipaddress, accessdate, hostname,id, session_id) " +
							     		" VALUES('"+session.getAttribute("userName")+"', '"+session.getAttribute("real_name")+"','"+(request.getRemoteAddr().trim())+"',now(), '"+request.getServerName()+"',"+session.getAttribute("seqId").toString()+", '"+session.getId()+"')");
						     }
						     
						     session.setAttribute("chatUsers", BasicDataBaseUtils.getListMap("select distinct username, real_name from logtable where accessdate is not null and logout_time is null " +
						     		" and accessdate > now() - interval '1 hour'" +
						     		" and username != '"+session.getAttribute("userName")+"'" +
						     		" order by username", con, null));
						 }
						 else
						 {
							result=false;
							msg="Problem in Server.";
						 }
					}
					else
					{
						result=false;
						msg="Password does not match";
					}	
				}
				else 
				{	
					result=false;
					msg="User Name does not exist in the Database";
				}
			
			if(result==true)
				target="showMainPage";
			else
			{
				target="failure";
				formBean.setProperty("msg", msg);
				formBean.setProperty("userName", "");
				formBean.setProperty("password", "");
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			DataBasePlugin.closeStatement(st);
			DataBasePlugin.closeStatement(stmt);
			DataBasePlugin.closeConnection(con);
		}
		return mapping.findForward(target);
	}
	
	public ActionForward Registration( ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) 
	{
		AuthenticationForm formBean = (AuthenticationForm)form;
		
		Connection con =null;
		Statement st=null;
		Statement optionsStatement=null;
		PreparedStatement preparedStatement=null;
		
		String msg="";
		String target="";
		boolean result=false;
		String queryString="";
		try
		{
			con=DataBasePlugin.getConnection();
			st=con.createStatement();
			optionsStatement=con.createStatement();
			
			queryString="select designation_id, designation from designations order by designation";
			formBean.setProperty("designationList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			 if (!BasicDataBaseUtils.recordExists("select count(*) from users where username = '"+formBean.getProperty("regUserName")+"'", st))
			 {	 
				queryString=" INSERT INTO users(username, password, real_name, real_password, user_id, created_date) " +
							"    VALUES(?,?,?,?,?, now())";	
				
				int userId=Integer.parseInt(BasicDataBaseUtils.getNextVoucherId(con, "user_id_seq"));
				preparedStatement=con.prepareStatement(queryString);
					
				preparedStatement.setString(1, formBean.getProperty("regUserName").toString());
				preparedStatement.setString(2, formBean.getProperty("regPassword").toString());
				preparedStatement.setString(3, formBean.getProperty("regName").toString());
				preparedStatement.setString(4, formBean.getProperty("regRealPassword").toString());
				preparedStatement.setInt(5, userId);
				preparedStatement.execute();	
				
				queryString=" INSERT INTO employee_details(employee_id, employee_name, employee_designation, email,mobile, address, user_id,created_date) " +
						"    VALUES(nextval('employee_details_id_seq'),?,?,?,?,now())";	
			 
				preparedStatement=con.prepareStatement(queryString);
					
				preparedStatement.setString(1, formBean.getProperty("regName").toString());
				preparedStatement.setInt(2, Integer.parseInt(formBean.getProperty("regDesignation").toString()));
				preparedStatement.setString(3, formBean.getProperty("regEMail").toString());
				preparedStatement.setString(4, formBean.getProperty("regMobile").toString());
				preparedStatement.setString(5, formBean.getProperty("regAddress").toString());
				preparedStatement.setInt(6, userId);
				preparedStatement.execute();	
				 
				msg="User Name created with "+formBean.getProperty("regUserName").toString();
				result=true;
			}
			else 
			{	
				msg="User Name already exists in the Database. please choose other username.";
				result=false;
			}
			 
			 if(result==true)
				 target="success";
			 else
				 target="failure"; 
			 
				formBean.setProperty("msg", msg);
				formBean.setProperty("regName", "");
				formBean.setProperty("regUserName", "");
				formBean.setProperty("regPassword", "");
				formBean.setProperty("regConfirmPassword", "");
				formBean.setProperty("regDesignation", "0");
				formBean.setProperty("regEMail", "");
				formBean.setProperty("regAddress", "");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			DataBasePlugin.closeConnection(con);
				try {
					if(st!=null)
					st.close();
					con.close();
				} catch (SQLException e) {}
			
		}
		return mapping.findForward(target);
	}
	
	public ActionForward recoverId( ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) 
	{
		AuthenticationForm formBean = (AuthenticationForm)form;
		
		Connection con =null;
		Statement st=null;
		Statement optionsStatement=null;
		ResultSet rs=null;
		
		String msg="";
		String target="";
		
		String queryString="";
		boolean result=false;
		
		try
		{
			con=DataBasePlugin.getConnection();
			st=con.createStatement();
			optionsStatement=con.createStatement();
			
			queryString="select designation_id, designation from designations order by designation";
			formBean.setProperty("designationList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			 if (BasicDataBaseUtils.recordExists("select count(*) from employee_details where email = '"+formBean.getProperty("recoverMail")+"' and delete_flag is null", st))
			 {	 
				 if (BasicDataBaseUtils.recordExists("select count(*) from employee_details  where  mobile= '"+formBean.getProperty("recoverMobile")+"' and delete_flag is null", st))
				 { 
						 String query="select username from users where user_id in " +
					 		" (select user_id from employee_details where mobile='"+formBean.getProperty("recoverMobile")+"' and email='"+formBean.getProperty("recoverMail")+"') ";
					 
						 rs=st.executeQuery(query);
						 if(rs.next())
						 {
							 msg="Your User Name is : "+ rs.getString("username");
							 result=true;
						 }
						 else
						 {
							result=false;
							msg="Email and Mobile does not belongs to the same user..";
						 }
				}
				else
				{
					result=false;
					msg="Mobile No. does not exists in the Database";
				}	
			}
			else 
			{	
				result=false;
				msg="Email does not exist in the Database";
			}
			 
			if(result==true)
				target="success";
			else
				target="failure";

			formBean.setProperty("msg", msg);
			formBean.setProperty("recoverMail", "");
			formBean.setProperty("recoverMobile", "");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			DataBasePlugin.closeConnection(con);
				try {
					if(st!=null)
					st.close();
					if(optionsStatement!=null)
						optionsStatement.close();
					con.close();
				} catch (SQLException e) {}
			
		}
		return mapping.findForward(target);
	}
	
	public ActionForward changePassword( ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) 
	{
		AuthenticationForm formBean = (AuthenticationForm)form;
		
		Connection con =null;
		Statement st=null;
		Statement optionsStatement=null;
		
		String msg="";
		String target="";
		
		String queryString="";
		boolean result=false;
		
		try
		{
			con=DataBasePlugin.getConnection();
			st=con.createStatement();
			optionsStatement=con.createStatement();
			
			queryString="select designation_id, designation from designations order by designation";
			formBean.setProperty("designationList",BasicDataBaseUtils.getOptionsList(queryString,  2,optionsStatement));
			
			 if (BasicDataBaseUtils.recordExists("select count(*) from users where username = '"+formBean.getProperty("chageUsername")+"' and delete_flag is null", st))
			 {	 
				 if (BasicDataBaseUtils.recordExists("select count(*) from users where username = '"+formBean.getProperty("chageUsername")+"' and password=md5('"+formBean.getProperty("chageOldPassword")+"') and delete_flag is null", st))
				 { 
					 
					 String query="update users set password='"+formBean.getProperty("chageNewPassword")+"', real_password='"+formBean.getProperty("changeNewRealPassword")+"',old_password='"+formBean.getProperty("chageOldPassword")+"', modified_date=now() where username='"+formBean.getProperty("chageUsername")+"' and delete_flag is null";
					 st.executeUpdate(query);
					 
					 result=true;
					 msg="Password updated";
				}
				else
				{
					result=false;
					msg="Password does not match";
				}	
			}
			else 
			{	
				result=false;
				msg="User Name does not exist in the Database";
			}
			 
			 if(result==true)
				 target="success";
			 else
				 target="failure"; 
			 
				formBean.setProperty("msg", msg);
				formBean.setProperty("chageUsername", "");
				formBean.setProperty("chageOldPassword", "");
				formBean.setProperty("chageNewPassword", "");
				formBean.setProperty("chageConfirmPassword", "");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			DataBasePlugin.closeConnection(con);
				try {
					if(st!=null)
					st.close();
					if(optionsStatement!=null)
						optionsStatement.close();
					con.close();
				} catch (SQLException e) {}
			
		}
		return mapping.findForward(target);
	}
	
	@SuppressWarnings({ "unchecked", "unused", "rawtypes" })
	public static ArrayList<HashMap<String, Object>> getServices( Connection conn,HttpSession session) 
	{
		Statement stmt = null;
		//PreparedStatement pstmt = null;
		//ResultSet rs = null;
		HashMap<String, String> serviceMap = null;
		ArrayList<HashMap<String, Object>> services = null;
		//String key = "";
		ResultSet servicesRS = null;
		String servicedesc[]=null;
		ArrayList servicesTarget=new ArrayList();
		try {
			stmt = conn.createStatement();

			String serviceSql="select s.SERVICE_ID,s.SERVICE_NAME,s.target,s.PARENT_ID,s.DISPLAY,s.DESCRIPTION " +
					" from SERVICES s " +
					" inner join ROLE_SERVICES rs on (s.service_id=rs.service_id and s.DELETE_FLAG='F' " +
					//	" and (s.FLAG=9 or s.FLAG="+flag+") " +
					//	" and rs.USERID="+session.getAttribute("userId").toString()+"
					" )" +
					" inner join roles r on (rs.roleid=r.ROLE_ID and " +
					//	" rs.ULBID=r.ULBID and " +
					//" r.ROLE_NAME='"+session.getAttribute("roleName")+"' " +
					" r.role_id="+session.getAttribute("roleId")+" " +
					//	" and r.USERID="+session.getAttribute("userId").toString()+" " +
					" ) " +
					" order by s.PARENT_ID,s.display";
			
			//System.out.println("query: "+serviceSql);
			//String sql="select s.service_id,s.service_name,s.url,s.parent_id,s.display_order from roles_services rs join services_mst s on s.service_id=rs.service_id where rs.role_id="+roleId+" order by s.display_order";
			services=(ArrayList<HashMap<String, Object>>) BasicDataBaseUtils.getListMap(serviceSql, conn,null);

			servicesRS = stmt.executeQuery(serviceSql);
			while (servicesRS.next())
			{
				servicedesc=new String[6];
				servicedesc[0]=servicesRS.getString(1);
				servicedesc[1]=servicesRS.getString(2);
				servicedesc[2]=servicesRS.getString(3);
				servicedesc[3]=servicesRS.getString(4);
				servicedesc[4]=servicesRS.getString(5);
				servicedesc[5]=servicesRS.getString(6);

				servicesTarget.add(servicesRS.getString(3));

			}
			session.setAttribute("servicesTarget", servicesTarget);

		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally {
		}

		return services;
	}
}
