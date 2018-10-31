/*
 * Created on Jul 16, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package in.gov.cgg.struts.utils.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;

public class DataBasePlugin implements PlugIn {
	public static BasicDataSource datasource = null;
	// public static BasicDataSource datasourcePAYROLL;
	static Connection con;
	static Connection conn = null;
	static ResultSet rs = null;
	static Statement st = null;
	static ServletContext context = null;

	public DataBasePlugin() {
		// initializing datasource
	}

	public void destroy() {
		try {
			if (con != null && !con.isClosed()) {
				con.close();
				con = null;
			} else
				con = null;
			
			if (datasource!=null)
			{
				datasource.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void init(ActionServlet actionServlet, ModuleConfig modConfig)
			throws ServletException {
		try {
			datasource = (BasicDataSource) actionServlet.getServletContext()
					.getAttribute("database");
			// datasourcePAYROLL=(BasicDataSource)actionServlet.getServletContext().getAttribute("databasePAYROLL");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		try {
			do {
				con = datasource.getConnection();
				// ////////System.out.println("Active Connections "+((BasicDataSource)datasource).getNumActive()+"..Max Active.."+((BasicDataSource)datasource).getMaxActive()+"..Idle Connections "+((BasicDataSource)datasource).getNumIdle()+"...Opened Prepared Statements..."+((BasicDataSource)datasource).getMaxOpenPreparedStatements());
			} while (con == null || con.isClosed());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static int getRowCount(ResultSet rs) {
		int rowCount = 0;
		try {
			while (rs.next()) {
				rowCount++;
			}
			rs.first();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowCount;
	}

	public synchronized static ResultSet selectQueryRS(String sql) {
		try {
			con = DataBasePlugin.getConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			DataBasePlugin.closeConnection(con);
		}
		return rs;
	}

	public static void closeConnection(Connection _con) {
		try {
			if (_con != null) {
				if (!_con.isClosed()) {
					_con.close();
					_con = null;
				} else
					_con = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void closeStatement(Statement _stmt) {
		try
		{
			if(_stmt!=null) {
				_stmt.close();
				_stmt=null;
			}
			else
				_stmt=null;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}

	public static void closeResultSet(ResultSet rs)
	{
		try
		{
			if(rs!=null) {
				rs.close();
				rs=null;
			}
			else
				rs=null;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}
}