package in.gov.cgg.struts.filters;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionChecking implements Filter{

	public void init(FilterConfig arg0) throws ServletException {
		
	}
	@SuppressWarnings({ "rawtypes" })
	public void doFilter(ServletRequest servletrequest, ServletResponse servletresponse, FilterChain filterChain) throws IOException, ServletException {
		
		//boolean sessionFlag=false;
		String path =((HttpServletRequest)servletrequest).getRequestURI();
		HttpSession session=((HttpServletRequest)servletrequest).getSession();
		int p= path.lastIndexOf("/");
		String action = path.substring(p+1,path.length()-3);
		
		if(action!=null && ((action.equalsIgnoreCase("Login") || action.equalsIgnoreCase("Welcome"))  || action.equalsIgnoreCase("workshop")|| action.equalsIgnoreCase("demo") || ( session.getAttribute("servicesTarget")!=null && ((ArrayList)session.getAttribute("servicesTarget")).contains(action+".do")) || action.equalsIgnoreCase("messageService"))  ) 
			{
				filterChain.doFilter(servletrequest, servletresponse);
			}
		else if (action.equalsIgnoreCase("dashBoard") || ( session.getAttribute("servicesTarget")!=null && ((ArrayList)session.getAttribute("servicesTarget")).contains(action+".do")))
		{
			filterChain.doFilter(servletrequest, servletresponse);
		}
			else {
				if((session!=null && session.getAttribute("userName")==null)) 
				{
					RequestDispatcher rd=((HttpServletRequest)servletrequest).getRequestDispatcher("sessionExpired.do");
					rd.forward(((HttpServletRequest)servletrequest),((HttpServletResponse)servletresponse));
		
				}
				else if ((!action.equals("receiptsnew") && session.getAttribute("servicesTarget")!=null && !((ArrayList)session.getAttribute("servicesTarget")).contains(action+".do")))
				{
					RequestDispatcher rd=((HttpServletRequest)servletrequest).getRequestDispatcher("sessionExpired.do");
					rd.forward(((HttpServletRequest)servletrequest),((HttpServletResponse)servletresponse));
				}
				else { 
					filterChain.doFilter(servletrequest, servletresponse);
				}	
			}
		//}
		/*else if (sessionFlag==false)
		{
			RequestDispatcher rd=((HttpServletRequest)servletrequest).getRequestDispatcher("sessionExpired.do");
			rd.forward(((HttpServletRequest)servletrequest),((HttpServletResponse)servletresponse));
		}*/
			
	}
	public void destroy() {
		
	}
}
