package in.gov.cgg.struts.chat;

public class Message
{
	private String chatterName = null;
	private String message = null;
	private long timeStamp;
	
	public Message(String name, String message, long timeStamp)
	{
		this.chatterName = name;
		this.message= message;
		this.timeStamp = timeStamp;
	}
	
	public String getChatterName()
	{
		return chatterName;
	}
	
	public String getMessage()
	{
		return message;
	}
	
	public long getTimeStamp()
	{
		return timeStamp;
	}
	
	private String from_username=null;
	private String to_username=null;
	private long sent_time;
	private long received_time;
	private String sent_ipaddress=null;
	private String sent_hostname=null;

	public String getFrom_username() {
		return from_username;
	}

	public void setFrom_username(String from_username) {
		this.from_username = from_username;
	}

	public String getTo_username() {
		return to_username;
	}

	public void setTo_username(String to_username) {
		this.to_username = to_username;
	}

	public long getSent_time() {
		return sent_time;
	}

	public void setSent_time(long sent_time) {
		this.sent_time = sent_time;
	}

	public long getReceived_time() {
		return received_time;
	}

	public void setReceived_time(long received_time) {
		this.received_time = received_time;
	}

	public String getSent_ipaddress() {
		return sent_ipaddress;
	}

	public void setSent_ipaddress(String sent_ipaddress) {
		this.sent_ipaddress = sent_ipaddress;
	}

	public String getSent_hostname() {
		return sent_hostname;
	}

	public void setSent_hostname(String sent_hostname) {
		this.sent_hostname = sent_hostname;
	}

	public void setChatterName(String chatterName) {
		this.chatterName = chatterName;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setTimeStamp(long timeStamp) {
		this.timeStamp = timeStamp;
	}
	
	
}