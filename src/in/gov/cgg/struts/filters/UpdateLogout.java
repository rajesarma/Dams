package in.gov.cgg.struts.filters;

import in.gov.cgg.struts.utils.database.DataBasePlugin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UpdateLogout implements Filter 
{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		Connection con= null;
		Statement st = null;
		int result=0;
		try
		{
			con=DataBasePlugin.getConnection();
			con.setAutoCommit(false);
			st=con.createStatement();
			
			String path =((HttpServletRequest)request).getRequestURI();
			HttpSession session=((HttpServletRequest)request).getSession();
			int p= path.lastIndexOf("/");
			String action = path.substring(p+1,path.length());
			
			//String isRefresh = request.getParameter("isRefresh");
			//String navigation = request.getParameter("navigation");
			//System.out.println(navigation);
			
			System.out.println("Here");
			
			//if(isRefresh.equals("Close"))
			if(session!=null && action.equals("updateSession"))
			{
				//result = st.executeUpdate("update logtable set logout_time=now() where USERNAME='"+session.getAttribute("userName").toString()+"' and session_id='"+session.getId()+"'");
				result = st.executeUpdate("update logtable set logout_time=now() where USERNAME='"+session.getAttribute("userName").toString()+"' and id='"+session.getAttribute("seqId")+"'");
			}
			
			if(result>0)
			{
				con.commit();
			}
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			DataBasePlugin.closeStatement(st);
			DataBasePlugin.closeConnection(con);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
