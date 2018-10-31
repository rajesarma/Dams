package in.gov.cgg.common.beans;

import java.util.HashMap;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class DynaForm extends ActionForm
{
	private String mode;
	
	private HashMap<String, Object> properties=new HashMap<String, Object>();
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
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

}
