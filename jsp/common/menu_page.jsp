<%@ page language="java" import="java.util.*"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

 	<%-- <%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		String is_change_req = "";
		
		if(session!=null)
		{
			is_change_req = (String)session.getAttribute("is_change_req");
		
	%>
	<script src="js/menu.js" type="text/javascript"></script>
	<%
		 	if(is_change_req !=null && (is_change_req.equalsIgnoreCase("f") || is_change_req.equalsIgnoreCase("false"))) 
		 	{ 
	 %>
	
		<logic:notEmpty name="services1" scope="session">
			<div class="navbg">
			    <nav id="main-nav" role="navigation"> <!-- Sample menu definition -->
			        <div class="container">
			            <div class="row">
			                <div class="col-sm-9" id="menu1" ></div>
			                <div class="col-sm-3" >
				                <div  style="float:right; font-size:13px; padding:10px;">
									<font face='monospace, Arial' color='#FFF'>&nbsp;&nbsp;<b>Welcome! ${dept_name}</b> </font>
								</div>
							</div>
			            </div>
			        </div>
			    </nav>
			    
			</div>
			<% 
            	if(session.getAttribute("state_admin")!=null && !session.getAttribute("state_admin").equals("Y"))
            	{
            %>
			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" >
	           	<marquee>
	           		<font color="red"><b>For any feedback, suggestion or complaints related to application, please use Post Query service in Post Queries section</b></font>
	           	</marquee>
			</div>
			
			<% 
            	}
            %>
			<div  style="float:right; font-size:13px; padding:10px;">
            
				<font face='monospace, Arial' color='#2E609F'>&nbsp;&nbsp;<b>Welcome! ${dept_name}</b> </font>
			</div>
			
			<script type="text/javascript">
				buildMenu('menu1',eval('${services1}'));
				    $(function() {
				        $('#main-menu').smartmenus({
				            subMenusSubOffsetX: 1,
				            subMenusSubOffsetY: -8
				        });
				    });
			</script>
		</logic:notEmpty>
	<% 
			}
 		}
 	%> --%>
 	