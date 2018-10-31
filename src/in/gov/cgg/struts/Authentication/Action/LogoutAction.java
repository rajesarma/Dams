package in.gov.cgg.struts.Authentication.Action;


import in.gov.cgg.struts.utils.database.DataBasePlugin;

import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class LogoutAction extends DispatchAction 
{
	public ActionForward unspecified(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response)
	{

		HttpSession session=request.getSession();
		Connection con=null;
		Statement st=null;
		try
		{
			con=DataBasePlugin.getConnection();
			st=con.createStatement();
			
			if (session!=null && session.getAttribute("userName")!=null && session.getAttribute("seqId")!=null )
				st.executeUpdate("update logtable set logout_time=now() where USERNAME='"+session.getAttribute("userName").toString()+"' and id="+session.getAttribute("seqId"));
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			try
			{
			if (st!=null)
				st.close();
			}
			catch(Exception ex)
			{
				
			}
			DataBasePlugin.closeConnection(con);
			session.removeAttribute("real_name");
			session.removeAttribute("userName");
			session.removeAttribute("roleName");
			session.removeAttribute("ulbId");
			session.removeAttribute("services");
			session.removeAttribute("labels");
			session.removeAttribute("servicesTarget");
			session.removeAttribute("languageType");
			session.removeAttribute("roleid");
			session.removeAttribute("seqId");
			session.removeAttribute("count");
			session.invalidate();
			session=null;
		}
		
		
		request.setAttribute("msg", "Logged out successfully!");
		return mapping.findForward("success");
	}
}