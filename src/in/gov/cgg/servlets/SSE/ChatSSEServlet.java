package in.gov.cgg.servlets.SSE;

import in.gov.cgg.struts.utils.JSON.JSONArray;
import in.gov.cgg.struts.utils.database.BasicDataBaseUtils;
import in.gov.cgg.struts.utils.database.DataBasePlugin;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ChatSSEServlet  extends HttpServlet 
{
	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con=null;
		
		StringBuffer str= new StringBuffer();
		String query = "";
		String tempString = "";
		try
		{
			String fromUser = "admin";
			String toUser = "rajesh";
			fromUser = request.getParameter("loginUserName");
			toUser = request.getParameter("userName");
			String boxId = request.getParameter("boxId");
			
			response.setContentType("text/event-stream");
			response.setCharacterEncoding("UTF-8");
			
			synchronized (fromUser+"_"+boxId) 
			{
				
				con=DataBasePlugin.getConnection();
				
				/*query = "select from_username || ' (' || to_char(sent_time,'HH:MI:SS AM') || ') > ' || message as \"chat\"" +
						" from chattable" +
						//" where from_username in ('"+formBean.getProperty("fromUser")+"', '"+formBean.getProperty("toUser")+"')" +
						" where from_username|| '_' || to_username in ('"+fromUser+"_"+toUser+"' , '"+toUser+"_"+fromUser+"')" +
						//" and sent_time > now() - interval '10 mins' " +
						" order by sent_time";*/
				
				//System.out.println(query);
				/*List chatListMap=BasicDataBaseUtils.getListMap(query, con, null);
				
				for(Object chatList:chatListMap)
				{
					HashMap chatMap=(HashMap) chatList;
					tempString+=chatMap.get("chat")+"<br>";
					//response.getWriter().write("event: chat_data\n");
					//response.getWriter().write("data :"+chatMap.get("chat") + "\n");
				}
				//String retrivedData = request.getParameter("loginUserName")+"#"+request.getParameter("boxId")+"#"+tempString;
				//String retrivedData = request.getParameter("loginUserName")+"__"+request.getParameter("boxId")+"__"+tempString;
				//System.out.println(retrivedData);
				*/
				
				/*query = "select from_username || '##' || to_char(sent_time,'HH:MI:SS AM') || '##' || message as \"chat\"" +
				" from chattable" +
				//" where from_username in ('"+formBean.getProperty("fromUser")+"', '"+formBean.getProperty("toUser")+"')" +
				" where from_username|| '_' || to_username in ('"+fromUser+"_"+toUser+"' , '"+toUser+"_"+fromUser+"')" +
				//" and sent_time > now() - interval '10 mins' " +
				" order by sent_time";*/
				
				query = "select from_username, to_char(sent_time,'HH:MI:SS AM') as sent_time, message " +
						" from chattable" +
						" where from_username|| '_' || to_username in ('"+fromUser+"_"+toUser+"' , '"+toUser+"_"+fromUser+"')" +
						//" and sent_time > now() - interval '10 mins' " +
						//" order by sent_time"
						" order by id";
				
				//System.out.println(query);
				
				List chatListMap=BasicDataBaseUtils.getSelectMap(query, con);
				
				String retrivedData="{\"boxId\": \""+request.getParameter("boxId")+"\", \"loginUserName\": \""+request.getParameter("loginUserName")+"\", \"chat_list\":"+(new JSONArray(chatListMap))+"  }";
				
				response.getWriter().write("event: chat_data\n");
				response.getWriter().write("data: "+ retrivedData +"\n\n");
				
				response.getWriter().flush();
				
				Thread.sleep(5000);
				
				//response.getWriter().println(tempString);
			}
		}
		catch (InterruptedException e) 
		{
			//e.printStackTrace();
		}
		catch(Exception e)
		{
			//e.printStackTrace();
		}
		finally
		{
			DataBasePlugin.closeConnection(con);
		}
	}
}