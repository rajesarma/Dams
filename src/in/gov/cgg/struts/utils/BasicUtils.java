package in.gov.cgg.struts.utils;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.StringTokenizer;

import org.apache.struts.upload.FormFile;
import org.apache.struts.util.LabelValueBean;

public class BasicUtils 
{
	public static String getMonthInWords(int month) {
		String monthName=null;
		switch(month) {
		case 0:
			monthName="January";
			break;
		case 1:
			monthName="February";
			break;
		case 2:
			monthName="March";
			break;
		case 3:
			monthName="April";
			break;
		case 4:
			monthName="May";
			break;
		case 5:
			monthName="June";
			break;
		case 6:
			monthName="July";
			break;
		case 7:
			monthName="August";
			break;
		case 8:
			monthName="September";
			break;
		case 9:
			monthName="October";
			break;
		case 10:
			monthName="November";
			break;
		case 11:
			monthName="December";
			break;
			
		}
		return monthName;
	}
	@SuppressWarnings("unchecked")
	public static ArrayList getMonths() {
		ArrayList<LabelValueBean> months=new ArrayList<LabelValueBean>();
		months.add(new LabelValueBean("January","1"));
		months.add(new LabelValueBean("February","2"));
		months.add(new LabelValueBean("March","3"));
		months.add(new LabelValueBean("April","4"));
		months.add(new LabelValueBean("May","5"));
		months.add(new LabelValueBean("June","6"));
		months.add(new LabelValueBean("July","7"));
		months.add(new LabelValueBean("August","8"));
		months.add(new LabelValueBean("September","9"));
		months.add(new LabelValueBean("October","10"));
		months.add(new LabelValueBean("November","11"));
		months.add(new LabelValueBean("December","12"));
		
		return months;
	}
	
	public static ArrayList<LabelValueBean> getYears() {
		ArrayList<LabelValueBean> years=new ArrayList<LabelValueBean>();
		Calendar cal=Calendar.getInstance();
		
		for(int i=2000;i<=cal.get(Calendar.YEAR)+10;i++) {
			years.add(new LabelValueBean(Integer.toString(i),Integer.toString(i)));
		}
		return years;
	}
	
	public static String getCurrentMonth() {
		String month=null;
		Calendar cal=Calendar.getInstance();
			month=Integer.toString(cal.get(Calendar.MONTH)+1);
		return month;
	}

	public static String getCurrentYear() {
		String year=null;
		Calendar cal=Calendar.getInstance();
			year=Integer.toString(cal.get(Calendar.YEAR));
		return year;
	}

	/*public static boolean getBatchResutsStatus(int[] results) {
		boolean status=false;
		int ctr=0;
			for(int i=0;results!=null && i<results.length;i++) {
				if (results[i]==1) 
					ctr++;
				 
			}
			if(ctr==results.length)
				status=true;
			
		return status;
	}*/
	
	public static String convertToDisplayDate(String date) 
	{
		String displayDate="";
		if(date!=null)
			displayDate=date.substring(8)+"-"+date.substring(5,7)+"-"+date.substring(0,4);
		return displayDate;
	
	}
	public static String convertToDBFormatDate(String date) {
		String displayDate="";
		if(date!=null)
			displayDate=date.substring(6,10)+"-"+date.substring(3,5)+"-"+date.substring(0,2);
		return displayDate;
	}
	//@SuppressWarnings("unchecked")
	//@SuppressWarnings("unchecked")
	/*public static ArrayList ArrayOfStringsToArrayList(String[][] headings) {
		
			ArrayList<ArrayList<String>> Headers = new ArrayList<ArrayList<String>>();
			ArrayList<String> row = null;
			
			for(int i=0; headings!=null && i < headings.length; i++)
	        {
				row = new ArrayList<String>();
				for(int j=0; j < headings[i].length; j++)
	            {
				         row.add(headings[i][j]);
	            }
	                Headers.add(row);
	  	    }  
			return Headers;
		
	}*/

	@SuppressWarnings("unchecked")
	public  static double[] convertToDoubleArray(ArrayList chartData) {
		double[] data = null;
		if(chartData!=null) {
			data=new double[chartData.size()];
			for(int i=0;chartData!=null && i<chartData.size();i++) {
				data[i]=Double.parseDouble((String)chartData.get(i));
			}
		}
		return data;
	}
	
	//@SuppressWarnings("unchecked")
	/*public  static String[] convertToStringArray(ArrayList chartLabels) {
		String[] data = null;
		if(chartLabels!=null)
		//data= (String[]) chartLabels.toArray(new String[chartLabels.size()]);
			data=new String[chartLabels.size()];
		
		for(int i=0;i<chartLabels.size();i++) {
			//data[i]=insertDelimiter((String)chartLabels.get(i));
			data[i]=(String)chartLabels.get(i);
		}
		return data;
	}*/

	//@SuppressWarnings("unchecked")
	public static String insertDelimiter(String text) {
		StringTokenizer st = new StringTokenizer(text," ");
		ArrayList<String> tokens = new ArrayList<String>();
		String element=null,temp=null;
		while(st!=null && st.hasMoreTokens()) {
			temp=st.nextToken();
			if(temp!=null)
				tokens.add(temp);
		}
		int count=tokens.size();
		if(count<=6) 
			count=count/2;
		else 
			count=(count/2)-1;
		
		for (int j=0;j<count;j++) {
			if(element==null)
				element=(String) tokens.get(j);
			else
				element=element+" "+(String) tokens.get(j);
		}
		if(element!=null)
			element=element+"\n";
		for (int j=count;j<tokens.size();j++) {
			if(element==null)
				element=(String) tokens.get(j);
			else
				element=element+" "+(String) tokens.get(j);
		}	
		
		return element;
	}

	//@SuppressWarnings("unchecked")
	@SuppressWarnings("unchecked")
	public static ArrayList getYears(String year) {
		ArrayList<LabelValueBean> years=new ArrayList<LabelValueBean>();
		Calendar cal=Calendar.getInstance();
		
		for(int i=Integer.parseInt(year);i<=cal.get(Calendar.YEAR);i++) {
			years.add(new LabelValueBean(Integer.toString(i),Integer.toString(i)));
		}
		return years;
	}
	
	
	public static boolean uoloadingFiles(FormFile file,String uploadPath)
	{
		boolean flag = false;

		try{
			if ((file.getFileName().length() > 0))
			{
				InputStream stream = null;
				OutputStream bos = null;
				int bytesRead = 0;
				int fileSize = 0;
				byte[] buffer = null;
				
				stream = file.getInputStream();
				bos = new FileOutputStream(uploadPath);
				
				fileSize = file.getFileSize();
				
				bytesRead = 0;
				buffer = new byte[fileSize];
				while ((bytesRead = stream.read(buffer, 0, fileSize)) != -1) {
					bos.write(buffer, 0, bytesRead);
				}
				
				bos.close();
				stream.close();
				
				flag = true;
			}
			
		}
		catch(Exception e)
		{
			flag = false;
			e.printStackTrace();
		}

		return flag;
	}

	
	 /**Added By Abdulla, It Starts Here */
	 public static String getCurrentDate() {
		
		Calendar c = Calendar.getInstance();
		int month=c.get(Calendar.MONTH)+1;
		String currentMonth="",currentDate1="";
		if(month<10)
			currentMonth="0"+Integer.toString(month);
		else
			currentMonth=Integer.toString(month);
		
		int date=c.get(Calendar.DAY_OF_MONTH);
		if(date<10)
			currentDate1="0"+Integer.toString(date);
		else 
			currentDate1=Integer.toString(date);
		String currentDate=currentDate1+"-"+currentMonth+"-"+c.get(Calendar.YEAR);
		
		return currentDate;
	}
	 /**Added By Abdulla, It Ends Here */
	 
	 public static String returnNumberToWord(long num) {
			String result="";
			
			if (num <= 0)
				return "Enter numbers greater than 0";
			else {
				result+=convert((num / 1000000000), " Hundred");
				result+=convert((num / 10000000) % 100, " Crore");
				result+=convert(((num / 100000) % 100), " Lakh");
				result+=convert(((num / 1000) % 100), " Thousand");
				result+=convert(((num / 100) % 10), " Hundred");
				result+=convert((num % 100), "");
			}
			return result;
		}
		
		public static String convert(long num, String ch) {
			long tenValue=10;
			String res="";
			String one[] = { " ", " One", " Two", " Three", " Four", " Five",
					" Six", " Seven", " Eight", " Nine", " Ten", " Eleven",
					" Twelve", " Thirteen", " Fourteen", "Fifteen", " Sixteen",
					" Seventeen", " Eighteen", " Nineteen" };
			
			String ten[] = { " ", " ", " Twenty", " Thirty", " Forty", " Fifty",
					" Sixty", "Seventy", " Eighty", " Ninety" };
			
			if (num > 19) 
			{
				res+=(ten[(int)(num / 10)] + " " + one[(int) (num % 10)]);
			} 
			else 
			{
				res+= (one[(int) num]);
			}
			
			if ((int)num > 0)
				res+= (ch);
			
			return res;
		} 
	 
}
