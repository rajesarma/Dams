//Created by MyEclipse Struts
// XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_4.1.1/xslt/JavaClass.xsl

package in.gov.cgg.struts.Authentication.Action;

import in.gov.cgg.common.beans.DynaForm;
import in.gov.cgg.struts.utils.database.DataBasePlugin;

import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
public class SessionExpiredAction extends Action {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session=request.getSession(true);
		Connection con=null;
		Statement st=null;
		try
		{
			con=DataBasePlugin.getConnection();
			st=con.createStatement();
			
			if (session!=null && session.getAttribute("userName")!=null && session.getAttribute("seqId")!=null )
				st.executeUpdate("update logtable set logout_time=now() where USERNAME='"+session.getAttribute("userName").toString()+"' and id="+session.getAttribute("seqId").toString());
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			DataBasePlugin.closeStatement(st);
			DataBasePlugin.closeConnection(con);
		}
		session.removeAttribute("userName");
		session.removeAttribute("roleName");
		session.removeAttribute("ulbId");
		session.removeAttribute("functionCodeLength");
		session.removeAttribute("listOfGlCodes");
		session.removeAttribute("services");
		session.removeAttribute("labels");
		session.removeAttribute("servicesTarget");
		session.removeAttribute("languageType");
		session.removeAttribute("lastlogin");
		session.removeAttribute("blist");
		session.removeAttribute("recoveryExistedBills");
		session.removeAttribute("workDetailsList");
		session.removeAttribute("fundid");
		session.removeAttribute("transactionMode");
		session.removeAttribute("collectionMode");
		session.removeAttribute("roleid");
		session.removeAttribute("existedVoucherNumber");
		session.removeAttribute("seqId");
		session.removeAttribute("count");
		session.invalidate();
		session=null;
		return mapping.findForward("success");
	}
}