package in.gov.cgg.struts.chat;

import in.gov.cgg.common.beans.DynaForm;
import in.gov.cgg.struts.utils.JSON.JSONArray;
import in.gov.cgg.struts.utils.database.BasicDataBaseUtils;
import in.gov.cgg.struts.utils.database.DataBasePlugin;

import java.sql.Connection;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class MessageAction extends DispatchAction
{
	Integer chat_users_list_size =0;
	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public static String getLoggedInUsers(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
	{
		DynaForm formBean=(DynaForm) form;
		Connection con=null;
		Statement st = null;
		int count =0;
		
		String query = "";
		String result="";
		try
		{
			con=DataBasePlugin.getConnection();
			st = con.createStatement();
			
			synchronized (st) 
			{
				query = "select distinct username, real_name, '"+formBean.getProperty("fromUser")+"' as login_user " +
						" from logtable " +
						" where accessdate is not null " +
						" and logout_time is null " +
						//" and accessdate > now() - interval '1 day' " +
						" and username != '"+formBean.getProperty("fromUser")+"' " +
						" order by username";
				
				List chat_users_list=BasicDataBaseUtils.getSelectMap(query, con);
				
				if(BasicDataBaseUtils.recordExists("select count(users_count) as users_count from chat_users_count", st))
				{	
					count =  Integer.parseInt(BasicDataBaseUtils.getDBObject("select case when users_count =0 then 0 when users_count =1 then (select users_count from chat_users_count) end as users_count from ( select count(users_count) as users_count from chat_users_count )t group by users_count", con, null).toString());
					
					st.executeUpdate("update chat_users_count set users_count="+chat_users_list.size()+" where id=1 ");
					
					if( Integer.parseInt(BasicDataBaseUtils.getDBObject("select count(users_count) as users_count from chat_users_count", con, null).toString()) == count)
					{
						result="{ \"users_count\":\"same\" , \"chat_users_list\":"+(new JSONArray(chat_users_list))+" }";
					}
					else
						result="{ \"users_count\":\"not_same\" , \"chat_users_list\":"+(new JSONArray(chat_users_list))+" }";
				}
				else
				{
					st.executeUpdate("insert into chat_users_count values(1,"+chat_users_list.size()+")");
					
					result="{ \"users_count\":\"not_same\" , \"chat_users_list\":"+(new JSONArray(chat_users_list))+" }";
				}
			}
			
			response.getWriter().println(result);
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//Log.logger.error(e);
		}
		finally
		{
			//DataBasePlugin.closeStatement(st);
			DataBasePlugin.closeConnection(con);
		}
		
		return null;
	}
	
	@SuppressWarnings({ "rawtypes"})
	public static String setMessage(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
	{
		DynaForm formBean=(DynaForm) form;
		Connection con=null;
		Statement st = null;
		
		StringBuffer str= new StringBuffer();
		String query = "";
		String tempString = "";
		try
		{
			con=DataBasePlugin.getConnection();
			st = con.createStatement();
			
			query =  "insert into chattable(from_username, to_username, message, sent_time, sent_ipaddress, sent_hostname) " +
			" values('"+formBean.getProperty("fromUser")+"', '"+formBean.getProperty("toUser")+"', '"+formBean.getProperty("msg")+"', now(), '"+(request.getRemoteAddr().trim())+"', '"+request.getServerName()+"')";
			
			int records = st.executeUpdate(query );
			
			/*query = "select from_username || ' (' || to_char(sent_time,'HH:MI:SS AM') || ') > ' || message as \"chat\" " +
					" from chattable where sent_time > now() - interval '1 hour' and from_username = '"+formBean.getProperty("fromUser")+"'";*/
			
			
			/*select 
			from_username || ' (' || to_char(sent_time,'HH:MI:SS AM') || ') > ' || message as from_user
			from
			(
			select 
			//from_username, to_username, message, sent_time
			from_username || ' (' || to_char(sent_time,'HH:MI:SS AM') || ') > ' || message as from_user
			from chattable
			where sent_time > now() - interval '10 mins' 
			and from_username in ('admin', 'rajesh')
			order by sent_time
			)t
			order by sent_time*/
			
			/*query = "select from_username || ' (' || to_char(sent_time,'HH:MI:SS AM') || ') > ' || message as \"chat\"" +
					" from chattable" +
					" where from_username in ('"+formBean.getProperty("fromUser")+"', '"+formBean.getProperty("toUser")+"')" +
					//" and sent_time > now() - interval '10 mins' " +
					" order by sent_time";
			
			List chatListMap=BasicDataBaseUtils.getListMap(query, con, null);
			
			for(Object chatList:chatListMap)
			{
				HashMap chatMap=(HashMap) chatList;
				tempString+=chatMap.get("chat")+"<br>";
			}
			
			str.append("{ \"chatList\":\""+tempString+"\" }");*/
			
			//response.getWriter().println(str.toString());
			
			if(records>0)
				str.append("{ \"insert_status\":\"success\" }");
			else
				str.append("{ \"insert_status\":\"failure\" }");
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//Log.logger.error(e);
		}
		finally
		{
			//DataBasePlugin.closeStatement(st);
			DataBasePlugin.closeConnection(con);
		}
		
		return null;
	}
	
	@SuppressWarnings({ "rawtypes"})
	public static String getMessages(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
	{
		DynaForm formBean=(DynaForm) form;
		Connection con=null;
		Statement st = null;
		
		StringBuffer str= new StringBuffer();
		String query = "";
		String tempString = "";
		try
		{
			/*query = "select from_username || ' (' || to_char(sent_time,'HH:MI:SS AM') || ') > ' || message as \"chat\"" +
					" from chattable" +
					" where sent_time > now() - interval '10 mins' " +
					" and from_username in ('"+formBean.getProperty("fromUser")+"', '"+formBean.getProperty("toUser")+"')" +
					" order by sent_time";*/
			
			synchronized (formBean.getProperty("fromUser")) 
			{
				con=DataBasePlugin.getConnection();
				st = con.createStatement();
				
				query = "select from_username || ' (' || to_char(sent_time,'HH:MI:SS AM') || ') > ' || message as \"chat\"" +
						" from chattable" +
						//" where from_username in ('"+formBean.getProperty("fromUser")+"', '"+formBean.getProperty("toUser")+"')" +
						" where from_username|| '_' || to_username in ('"+formBean.getProperty("fromUser")+"_"+formBean.getProperty("toUser")+"' , '"+formBean.getProperty("toUser")+"_"+formBean.getProperty("fromUser")+"')" +
						
						//" and sent_time > now() - interval '10 mins' " +
						" order by sent_time";
				
				List chatListMap=BasicDataBaseUtils.getListMap(query, con, null);
				
				for(Object chatList:chatListMap)
				{
					HashMap chatMap=(HashMap) chatList;
					tempString+=chatMap.get("chat")+"<br>";
				}
				
				str.append("{ \"chatList\":\""+tempString+"\" }");
			}
			
			response.getWriter().println(str.toString());
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//Log.logger.error(e);
		}
		finally
		{
			//DataBasePlugin.closeStatement(st);
			DataBasePlugin.closeConnection(con);
		}
		
		return null;
	}

}
