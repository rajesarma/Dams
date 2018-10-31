
package in.gov.cgg.struts.Authentication.Form;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class AuthenticationForm extends ActionForm {

	private String mode;
	
	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}
	private HashMap<String, Object> properties;
	
	public HashMap<String, Object> getProperties() {
		return properties;
	}

	public void setProperties(HashMap<String, Object> properties) {
		this.properties = properties;
	}
	
	public void setProperty(String key,Object value)
	{
		properties.put(key, value);
	}
	public Object getProperty(String key)
	{
		return properties.get(key);
	}
	public void setPropertyArray(String key,Object[] value)
	{
		properties.put(key, value);
	}
	public Object[] getPropertyArray(String key)
	{
		return (Object[]) properties.get(key);
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) 
	{
		mode="";
		properties=new HashMap<String, Object>();
	}
}

