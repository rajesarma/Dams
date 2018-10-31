package in.gov.cgg.struts.utils.database;

import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.write.Alignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.struts.util.LabelValueBean;

import com.lowagie.text.Cell;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.HeaderFooter;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfTemplate;
import com.lowagie.text.pdf.PdfWriter;

/**
 * @author UDIS TEAM
 */
public class BasicDataBaseUtils {

	public static String autoGenColumn1(Statement st, String tableName,
			String field) throws SQLException {
		ResultSet rs = null;
		int genCode = 0;
		String sql = null;
		sql = "select max(int4(" + field + ")+1) from " + tableName;
		try {
			rs = st.executeQuery(sql);
			if (rs != null && rs.next()) {
				if (rs.getString(1) == null)
					genCode = 1;
				else
					genCode = rs.getInt(1);
			} else
				genCode = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (st != null)
				st.close();
		}
		return Integer.toString(genCode);
	}

	public static String getAttributeName(String sql, Connection con) {
		// //System.out.println("query "+sql);
		Statement st = null;
		ResultSet rs = null;
		String attributeName = "";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if (rs != null && rs.next()) {
				if (rs.getString(1) != null)
					attributeName = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return attributeName;
	}

	@SuppressWarnings({ "rawtypes" })
	public static ArrayList getOptionsList(String sql, int noOfParameters,
			Statement st) {
		ArrayList<LabelValueBean> reportData = new ArrayList<LabelValueBean>();
		ResultSet rs = null;
		try {
			rs = st.executeQuery(sql);
			while (rs != null && rs.next()) {
				if (noOfParameters == 3)
					reportData.add(new LabelValueBean(rs.getString(2) + " -- "
							+ rs.getString(3) + " -- " + rs.getString(4), rs
							.getString(1)));
				else if (noOfParameters == 1)
					reportData.add(new LabelValueBean(rs.getString(1) + "-"
							+ rs.getString(2), rs.getString(3)));
				else
					reportData.add(new LabelValueBean(rs.getString(2), rs
							.getString(1)));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reportData;
	}

	@SuppressWarnings("rawtypes")
	public static ArrayList getOptionsList1(String sql, Connection con,
			int noOfParameters) {
		// //System.out.println("Financial Years Sql : "+sql);
		ArrayList<LabelValueBean> reportData = new ArrayList<LabelValueBean>();
		ResultSet rs = null;
		Statement st = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs != null && rs.next()) {
				if (noOfParameters == 3)
					reportData.add(new LabelValueBean(rs.getString(2) + " -- "
							+ rs.getString(3) + " -- " + rs.getString(4), rs
							.getString(1)));
				else if (noOfParameters == 1)
					reportData.add(new LabelValueBean(rs.getString(1) + "-"
							+ rs.getString(2), rs.getString(3)));
				else
					reportData.add(new LabelValueBean(rs.getString(2), rs
							.getString(1)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				st.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return reportData;
	}

	public static boolean recordExists(String query, Statement st) {
		boolean flag = false;
		ResultSet rs = null;
		// //System.out.println("query "+query);
		try {
			rs = st.executeQuery(query);
			if (rs != null && rs.next()) {
				if (rs.getString(1).equals("0"))
					flag = false;
				else
					flag = true;
			} else
				flag = false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return flag;
	}

	public static String excuteInsertOrUpdate(String sql, Statement st) {
		String msg = null;
		try {
			st.executeUpdate(sql);
			msg = "Record(s) Updated Successfully";
		} catch (Exception e) {
			msg = "Record(s) are not Updated";
			e.printStackTrace();
		}
		return msg;
	}

	/*
	 * public static String returnString(ArrayList reportData,String selectBox)
	 * { String jsToDistMap = ""; for (int i = 0; i < reportData.size(); i++) {
	 * ArrayList papers = (ArrayList)reportData.get(i); jsToDistMap +=
	 * selectBox+"[\"" + (String)papers.get(0) + "\"] = \"" +
	 * (String)papers.get(1) + "\";"; } return jsToDistMap; }
	 */
	@SuppressWarnings({ "rawtypes" })
	public static ArrayList returnArrayList(String query, Connection con,
			String addSerialNo) {
		ArrayList<ArrayList<String>> reportData = new ArrayList<ArrayList<String>>();
		ArrayList<String> reportSubList = null;
		Statement st = null;
		ResultSet rs = null;
		int rowCount = 0, serialNo = 1;
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while (rs != null && rs.next()) {
				reportSubList = new ArrayList<String>();
				if (addSerialNo.equalsIgnoreCase("yes")) {
					reportSubList.add(Integer.toString(serialNo));
				}
				for (rowCount = 1; rowCount <= ((ResultSetMetaData) rs
						.getMetaData()).getColumnCount(); rowCount++) {
					if (rs.getString(rowCount) == null)
						reportSubList.add("-");
					else
						reportSubList.add(rs.getString(rowCount).trim());
				}
				reportData.add(reportSubList);
				serialNo++;
			}
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reportData;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static ArrayList returnSingleArrayList(String query, Connection con) {
		ArrayList reportData = new ArrayList();
		Statement st = null;
		ResultSet rs = null;
		int rowCount = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while (rs != null && rs.next()) {
				for (rowCount = 1; rowCount <= ((ResultSetMetaData) rs
						.getMetaData()).getColumnCount(); rowCount++) {
					if (rs.getString(rowCount) == null)
						reportData.add("-");
					else
						reportData.add(rs.getString(rowCount).trim());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				st.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return reportData;
	}

	public static String getAttributeName(String sql, Connection con,
			Statement attributeSt) {
		ResultSet rs = null;
		String attributeName = "";
		try {
			rs = attributeSt.executeQuery(sql);
			while (rs != null && rs.next()) {
				attributeName = rs.getString(1);
			}
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return attributeName;
	}

	@SuppressWarnings({ "rawtypes" })
	public static ArrayList getYears() {
		ArrayList<LabelValueBean> years = new ArrayList<LabelValueBean>();
		Calendar cal = Calendar.getInstance();

		for (int i = cal.get(Calendar.YEAR) - 20; i <= cal.get(Calendar.YEAR) + 20; i++) {
			years.add(new LabelValueBean(Integer.toString(i), Integer
					.toString(i)));
		}
		return years;
	}

	@SuppressWarnings({ "rawtypes" })
	public static ArrayList returnArrayListForHyphon(String query,
			Connection con, String addSerialNo) {
		ArrayList<ArrayList<String>> reportData = new ArrayList<ArrayList<String>>();
		ArrayList<String> reportSubList = null;
		Statement st = null;
		ResultSet rs = null;
		int rowCount = 0, serialNo = 1;
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while (rs != null && rs.next()) {
				reportSubList = new ArrayList<String>();
				if (addSerialNo.equalsIgnoreCase("yes")) {
					reportSubList.add(Integer.toString(serialNo));
				}
				for (rowCount = 1; rowCount <= ((ResultSetMetaData) rs
						.getMetaData()).getColumnCount(); rowCount++) {
					if (rs.getString(rowCount) == null)
						reportSubList.add("");
					else
						reportSubList.add(rs.getString(rowCount));
				}
				reportData.add(reportSubList);
				serialNo++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				st.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return reportData;
	}

	public static String getMaxBillId(Connection con) {
		String billId = null;
		try {
			Statement st = con.createStatement();
			String sql = "SELECT NEXTVAL('seqbillregister')";
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			billId = rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return billId;
	}

	public static String getNextVoucherId(Connection con, String seqName) {
		String voucherDetailId = null;
		try {
			Statement st = con.createStatement();
			// String sql="SELECT "+seqName+".NEXTVAL from DUAL";

			String sql = "SELECT NEXTVAL('" + seqName.toLowerCase() + "')";
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			voucherDetailId = rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return voucherDetailId;
	}

	@SuppressWarnings("rawtypes")
	public static ArrayList getYearsList(int year) {
		ArrayList<LabelValueBean> reportData = new ArrayList<LabelValueBean>();
		try {
			for (int i = 0; i < 5; i++) {
				reportData.add(new LabelValueBean(Integer.toString(year - i),
						Integer.toString(year - i)));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return reportData;
	}

	public static String getFormattedNumber(String number, String formatType) {
		// //////System.out.println("number  "+number);
		NumberFormat formatter = new DecimalFormat(
				"####################################.##");
		int indexValue = 0;
		int tempLength = 0;
		String temp = "";
		StringBuffer calculatedValue = null;
		String minusPart = "";
		number = formatter.format(Double.parseDouble(number));
		if (!formatType.equalsIgnoreCase("WithOutCommas")) {
			if (number.indexOf("E") != -1) {
				if (number.indexOf("-") != -1) {
					minusPart = "-";
					temp = number.substring(0, number.indexOf("E")).replace(
							".", "");
				} else {
					temp = number.substring(0, number.indexOf("E")).replace(
							".", "");
				}

				tempLength = temp.length();
				indexValue = (Integer.parseInt(number.substring(number
						.indexOf("E") + 1)) + 1);

				if (tempLength < indexValue) {
					for (int rowcount = 0; rowcount < indexValue - tempLength; rowcount++) {
						temp = temp.concat("0");
					}
				}

				calculatedValue = new StringBuffer(temp).insert(Math
						.abs(Integer.parseInt(number.substring(number
								.indexOf("E") + 1)) + 1), ".");
				if (calculatedValue.substring(calculatedValue.length() - 1)
						.equals("."))
					calculatedValue = new StringBuffer(
							calculatedValue.substring(0,
									calculatedValue.length() - 1));
				number = new String(calculatedValue);
				if (!minusPart.equals(""))
					number = minusPart.concat(number);
			}
			String formattedNumber = "";
			String decimalPart = "";
			temp = "";
			boolean isNegative = false;
			// int addZeros=0;

			if (number.indexOf(".") != -1 && number.indexOf("-") == 0) {
				decimalPart = number.substring(number.indexOf(".") + 1);
				temp = number.substring(1, number.indexOf("."));
				isNegative = true;

			} else {
				if (number.indexOf(".") != -1) {
					decimalPart = number.substring(number.indexOf(".") + 1);
					// ////////System.out.println("decimalPart "+decimalPart);
					temp = number.substring(0, number.indexOf("."));
					// ////////////////////////System.out.println("in only .");
				} else {

					if (Long.parseLong(number) < 0) {
						temp = number.substring(1, number.length());

						isNegative = true;
						// addZeros=1;
					} else {
						temp = Long.toString(Long.parseLong(number));
						// temp=number;
						// addZeros=1;
					}
				}

			}

			String temp1 = "";
			for (int i = temp.length() - 1; i >= 0; i--) {
				temp1 = temp1.concat("" + temp.charAt(i));

			}
			if (number.indexOf(".") != -1) {
				decimalPart = number.substring(number.indexOf(".") + 1);
			}
			String newNo = "";
			for (int i = 0; i < temp1.length(); i++) {
				if (i == 3) {
					newNo = newNo + "," + temp1.charAt(i);

				} else {
					if (i != 3
							&& newNo.lastIndexOf(",") != -1
							&& newNo.substring(newNo.lastIndexOf(",") + 1)
									.length() == 2) {
						newNo = newNo + "," + temp1.charAt(i);

					} else if (i != 3) {
						newNo = newNo.concat("" + temp1.charAt(i));

					}
				}
			}
			for (int i = newNo.length() - 1; i >= 0; i--) {
				formattedNumber = formattedNumber.concat("" + newNo.charAt(i));
			}
			if (!decimalPart.equals("")) {
				if (decimalPart.length() == 2)
					formattedNumber = formattedNumber.concat("."
							.concat(decimalPart));
				else if (decimalPart.length() == 1)
					formattedNumber = formattedNumber.concat("."
							.concat(decimalPart)) + "0";
				else if (decimalPart.length() > 2) {
					decimalPart = "0.".concat(decimalPart);
					decimalPart = formatter.format(Double
							.parseDouble(decimalPart));
					decimalPart = decimalPart.substring(decimalPart
							.indexOf(".") + 1);
					formattedNumber = formattedNumber.concat("."
							.concat(formatter.format(Double
									.parseDouble(decimalPart))));
				}
			}
			if (isNegative)
				formattedNumber = "-".concat(formattedNumber);

			/*
			 * if(addZeros==1) formattedNumber =
			 * formattedNumber.concat(".".concat(decimalPart.concat("00")));
			 */
			if (formattedNumber.equals(".00"))
				formattedNumber = "0";
			return formattedNumber;

		} else {
			return "" + formatter.format((Double.parseDouble(number)));
		}

	}

	public static boolean recordsExistsOnMasters(Connection con, String ulbId,
			String[] tablesList, String[] fieldName, String fieldId,
			boolean checkUlb) throws Exception {
		boolean recordsExists = false;
		String query = "";
		Statement st = con.createStatement();
		ResultSet rs = null;
		String tempQuery = "";
		try {
			if (checkUlb)
				tempQuery = " and ULBID=" + ulbId;

			for (int rowCount = 0; rowCount < tablesList.length; rowCount++) {
				query = "select count(*) as count from " + tablesList[rowCount]
						+ "  where " + fieldName[rowCount] + "=" + fieldId
						+ tempQuery;
				rs = st.executeQuery(query);
				if (rs.next())
					if (rs.getInt("count") != 0)
						recordsExists = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
			} catch (Exception stClose) {
				stClose.printStackTrace();
			}
		}
		return recordsExists;
	}

	public static boolean getValidCharsNumbers(String input) {
		Pattern p = Pattern.compile("[^a-zA-z0-9\\r\\n\\ \\.\\,\\-\\/\\(\\)\\#]+");
		// Pattern p = Pattern.compile("[^a-zA-z0-9\\ \\.\\-\\(\\)]+");
		Matcher m = p.matcher(input);
		if (m.find()) {
			return false;
		} else {
			return true;
		}
	}

	public static boolean getValidEmail(String input) {
		Pattern p = Pattern.compile("^\\.|^\\@");
		Matcher m = p.matcher(input);
		if (m.find()) {
			return false;
		} else {
			p = Pattern.compile("^www\\.");
			m = p.matcher(input);
			if (m.find()) {
				return false;
			} else {
				p = Pattern.compile("[^A-Za-z0-9\\.\\@_\\-~#]+");
				m = p.matcher(input);
				StringBuffer sb = new StringBuffer();
				boolean result = m.find();
				boolean deletedIllegalChars = false;

				while (result) {
					deletedIllegalChars = true;
					m.appendReplacement(sb, "");
					result = m.find();
				}

				// Add the last segment of input to the new String
				m.appendTail(sb);

				// input = sb.toString();

				if (deletedIllegalChars) {
					return false;
				} else {
					return true;
				}
			}
		}

	}

	public static boolean getValidCharsNumbersSymbols(String input) {
		Pattern p = Pattern.compile("[^a-zA-z0-9\\+\\=\\ \\.\\-\\/\\(\\)]+");
		Matcher m = p.matcher(input);
		if (m.find()) {
			return false;
		} else {
			return true;
		}

	}

	@SuppressWarnings({ "rawtypes" })
	public static void getPdf(ArrayList mainHeadingList,
			ArrayList subHeadingList, ArrayList dataReport, String filePath,
			String fileName, String heading, int totalColumns) {
		/*************************************************************************************************************************
		 * About arguments: * * mainHeadingList: is a double arraylist and sub
		 * arraylist should be in the form of < heading name,colspan size > * *
		 * subHeadingList: is same like mainHeadingList * * heading: which is
		 * diaplying in the top of pdf * *
		 *************************************************************************************************************************/
		try {
			/*
			 * dataReport.remove(0); dataReport.remove(0);
			 */
			File fileToCreate = new File(filePath, fileName);
			if (!fileToCreate.exists()) {
				fileToCreate.createNewFile();
			}
			if (fileToCreate.exists()) {

				Document document = new Document(PageSize.A3, 25, 25, 25, 25);
				PdfWriter writer = null;
				writer = PdfWriter.getInstance(document, new FileOutputStream(
						fileToCreate));
				document.open();

				/* Page Numbers code start added by ashwin on 08-12-2011 */

				HeaderFooter footer = new HeaderFooter(new Phrase("Page "),
						true);
				footer.setBorder(Rectangle.NO_BORDER);
				footer.setAlignment(Element.ALIGN_RIGHT);
				document.setFooter(footer);
				PdfContentByte cb = writer.getDirectContent();
				cb.saveState();
				// write the headertable
				PdfPTable table = new PdfPTable(2);
				PdfTemplate tpl = writer.getDirectContent().createTemplate(100,
						100);
				BaseFont helv = BaseFont.createFont("Helvetica",
						BaseFont.WINANSI, false);
				table.setTotalWidth(document.right() - document.left());
				table.writeSelectedRows(0, -1, document.left(), document
						.getPageSize().height() - 50, cb);
				// compose the footer
				String text = "Page " + writer.getPageNumber();
				float textSize = helv.getWidthPoint(text, 12);
				float textBase = document.bottom() - 20;
				cb.beginText();
				cb.setFontAndSize(helv, 12);
				float adjust = helv.getWidthPoint("0", 12);
				cb.setTextMatrix(document.right() - textSize - adjust, textBase);
				cb.showText(text);
				cb.endText();

				cb.addTemplate(tpl, document.right() - adjust, textBase);
				cb.saveState();
				/* Page Numbers code end added by ashwin on 08-12-2011 */

				Cell c1 = null;

				/****************************************************************************
				 * Adding report heading *
				 ****************************************************************************/

				Table headingTable1 = new Table(1, 1); // Creation of Table for
														// report heading
				headingTable1.setBorderColor(new Color(219, 234, 245)); // Setting
																		// Border
																		// Color
				headingTable1.setPadding(2); // Set Padding
				headingTable1.setSpacing(2); // Set Spacing
				headingTable1.setBorderWidth(0); // Set borderwidth
				headingTable1.setAlignment(3);
				headingTable1.setWidth(100);

				c1 = new Cell(new Chunk(heading, FontFactory.getFont(
						FontFactory.HELVETICA, 12, Font.BOLD,
						new Color(0, 0, 0))));
				c1.setHorizontalAlignment(3);
				c1.setVerticalAlignment(1);
				c1.setWidth("100%");

				headingTable1.addCell(c1);

				document.add(headingTable1);

				/**********************************************************************************
				 * Adding report headers (Ex; glcode, account name, funds....) *
				 **********************************************************************************/

				ArrayList temp = null;

				PdfPTable detailsTable = new PdfPTable(totalColumns);
				PdfPCell pdfcell = null;

				if (mainHeadingList.size() > 0) {
					detailsTable.getDefaultCell().setBorder(1);
					detailsTable.getDefaultCell().setBorderWidthTop(0);
					detailsTable.getDefaultCell().setBorderWidthBottom(0);
					detailsTable.setWidthPercentage(100);
					detailsTable.setHeaderRows(1);

					/*********************************
					 * Adding main headings *
					 *********************************/

					for (int mh = 0; mh < mainHeadingList.size(); mh++) {
						temp = (ArrayList) mainHeadingList.get(mh);

						pdfcell = new PdfPCell(new Phrase(temp.get(0)
								.toString(), FontFactory.getFont(
								FontFactory.HELVETICA, 10, Font.BOLD,
								new Color(0, 0, 0))));
						pdfcell.setMinimumHeight(20f);
						pdfcell.setHorizontalAlignment(Element.ALIGN_CENTER);
						pdfcell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						pdfcell.setColspan(Integer.parseInt(temp.get(1)
								.toString()));
						detailsTable.addCell(pdfcell);

					}

					/**********************************
					 * Adding sub headings *
					 **********************************/

					for (int sh = 0; sh < subHeadingList.size(); sh++) {
						temp = (ArrayList) subHeadingList.get(sh);

						pdfcell = new PdfPCell(new Phrase(temp.get(0)
								.toString(), FontFactory.getFont(
								FontFactory.HELVETICA, 10, Font.BOLD,
								new Color(0, 0, 0))));
						pdfcell.setMinimumHeight(20f);
						pdfcell.setHorizontalAlignment(Element.ALIGN_CENTER);
						pdfcell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						pdfcell.setColspan(Integer.parseInt(temp.get(1)
								.toString()));
						detailsTable.addCell(pdfcell);

					}
				}
				/*****************************************************************************
				 * Adding report data *
				 *****************************************************************************/

				if (dataReport.size() > 0) {
					for (int dr = 0; dr < dataReport.size(); dr++) {
						temp = (ArrayList) dataReport.get(dr);

						for (int t = 0; t < temp.size(); t++) {
							pdfcell = new PdfPCell(new Phrase(temp.get(t)
									.toString(), FontFactory.getFont(
									FontFactory.HELVETICA, 9, Font.NORMAL,
									new Color(0, 0, 0))));
							pdfcell.setMinimumHeight(20f);
							pdfcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							pdfcell.setVerticalAlignment(Element.ALIGN_RIGHT);
							detailsTable.addCell(pdfcell);
						}
					}
				}

				document.add(detailsTable);

				headingTable1 = new Table(1, 1); // Creation of Table for report
													// heading
				headingTable1.setBorderColor(new Color(219, 234, 245)); // Setting
																		// Border
																		// Color
				headingTable1.setPadding(2); // Set Padding
				headingTable1.setSpacing(2); // Set Spacing
				headingTable1.setBorderWidth(0); // Set borderwidth
				headingTable1.setAlignment(3);
				headingTable1.setWidth(100);
				c1 = new Cell(new Chunk("Report Generated Date & Time "
						+ new java.util.Date().toString(), FontFactory.getFont(
						FontFactory.HELVETICA, 10, Font.BOLD,
						new Color(0, 0, 0))));
				c1.setHorizontalAlignment(3);
				c1.setVerticalAlignment(1);
				c1.setWidth("100%");

				headingTable1.addCell(c1);
				document.add(headingTable1);

				document.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@SuppressWarnings({ "rawtypes" })
	public static void getPdfWithSpecificColumns(ArrayList mainHeadingList,
			ArrayList subHeadingList, ArrayList dataReport, String filePath,
			String fileName, String heading, int totalColumns,int specificColumns) 
	{
		/*************************************************************************************************************************
		 * About arguments: * * mainHeadingList: is a double arraylist and sub
		 * arraylist should be in the form of < heading name,colspan size > * *
		 * subHeadingList: is same like mainHeadingList * * heading: which is
		 * diaplying in the top of pdf * *
		 *************************************************************************************************************************/
		try {
			/*
			 * dataReport.remove(0); dataReport.remove(0);
			 */
			File fileToCreate = new File(filePath, fileName);
			if (!fileToCreate.exists()) {
				fileToCreate.createNewFile();
			}
			if (fileToCreate.exists()) {

				//Document document = new Document(PageSize.A3, 25, 25, 25, 25);
				Document document = new Document(PageSize.A3.rotate(), 25, 25, 25, 25);
				PdfWriter writer = null;
				writer = PdfWriter.getInstance(document, new FileOutputStream(
						fileToCreate));
				document.open();

				/* Page Numbers code start added by ashwin on 08-12-2011 */

				HeaderFooter footer = new HeaderFooter(new Phrase("Page "),
						true);
				footer.setBorder(Rectangle.NO_BORDER);
				footer.setAlignment(Element.ALIGN_RIGHT);
				document.setFooter(footer);
				PdfContentByte cb = writer.getDirectContent();
				cb.saveState();
				// write the headertable
				PdfPTable table = new PdfPTable(2);
				PdfTemplate tpl = writer.getDirectContent().createTemplate(100,
						100);
				BaseFont helv = BaseFont.createFont("Helvetica",
						BaseFont.WINANSI, false);
				table.setTotalWidth(document.right() - document.left());
				table.writeSelectedRows(0, -1, document.left(), document
						.getPageSize().height() - 50, cb);
				// compose the footer
				String text = "Page " + writer.getPageNumber();
				float textSize = helv.getWidthPoint(text, 12);
				float textBase = document.bottom() - 20;
				cb.beginText();
				cb.setFontAndSize(helv, 12);
				float adjust = helv.getWidthPoint("0", 12);
				cb.setTextMatrix(document.right() - textSize - adjust, textBase);
				cb.showText(text);
				cb.endText();

				cb.addTemplate(tpl, document.right() - adjust, textBase);
				cb.saveState();
				/* Page Numbers code end added by ashwin on 08-12-2011 */

				Cell c1 = null;

				/****************************************************************************
				 * Adding report heading *
				 ****************************************************************************/

				Table headingTable1 = new Table(1, 1); // Creation of Table for
														// report heading
				headingTable1.setBorderColor(new Color(219, 234, 245)); // Setting
																		// Border
																		// Color
				headingTable1.setPadding(2); // Set Padding
				headingTable1.setSpacing(2); // Set Spacing
				headingTable1.setBorderWidth(0); // Set borderwidth
				headingTable1.setAlignment(3);
				headingTable1.setWidth(100);

				c1 = new Cell(new Chunk(heading, FontFactory.getFont(
						FontFactory.HELVETICA, 12, Font.BOLD,
						new Color(0, 0, 0))));
				c1.setHorizontalAlignment(3);
				c1.setVerticalAlignment(1);
				c1.setWidth("100%");

				headingTable1.addCell(c1);

				document.add(headingTable1);

				/**********************************************************************************
				 * Adding report headers (Ex; glcode, account name, funds....) *
				 **********************************************************************************/

				ArrayList temp = null;

				PdfPTable detailsTable = new PdfPTable(totalColumns);
				PdfPCell pdfcell = null;

				if (mainHeadingList.size() > 0) {
					detailsTable.getDefaultCell().setBorder(1);
					detailsTable.getDefaultCell().setBorderWidthTop(0);
					detailsTable.getDefaultCell().setBorderWidthBottom(0);
					detailsTable.setWidthPercentage(100);
					detailsTable.setHeaderRows(1);

					/*********************************
					 * Adding main headings *
					 *********************************/

					for (int mh = 0; mh < mainHeadingList.size(); mh++) {
						temp = (ArrayList) mainHeadingList.get(mh);

						pdfcell = new PdfPCell(new Phrase(temp.get(0)
								.toString(), FontFactory.getFont(
								FontFactory.HELVETICA, 10, Font.BOLD,
								new Color(0, 0, 0))));
						pdfcell.setMinimumHeight(20f);
						pdfcell.setHorizontalAlignment(Element.ALIGN_CENTER);
						pdfcell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						pdfcell.setColspan(Integer.parseInt(temp.get(1)
								.toString()));
						detailsTable.addCell(pdfcell);

					}

					/**********************************
					 * Adding sub headings *
					 **********************************/

					for (int sh = 0; sh < subHeadingList.size(); sh++) {
						temp = (ArrayList) subHeadingList.get(sh);

						pdfcell = new PdfPCell(new Phrase(temp.get(0)
								.toString(), FontFactory.getFont(
								FontFactory.HELVETICA, 10, Font.BOLD,
								new Color(0, 0, 0))));
						pdfcell.setMinimumHeight(20f);
						pdfcell.setHorizontalAlignment(Element.ALIGN_CENTER);
						pdfcell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						pdfcell.setColspan(Integer.parseInt(temp.get(1)
								.toString()));
						detailsTable.addCell(pdfcell);

					}
				}
				/*****************************************************************************
				 * Adding report data *
				 *****************************************************************************/

				if (dataReport.size() > 0) {
					for (int dr = 0; dr < dataReport.size(); dr++) 
					{
						temp = (ArrayList) dataReport.get(dr);

						for (int t = 0; t < temp.size(); t++) 
						{
							if (t<specificColumns)
							{
								pdfcell = new PdfPCell(new Phrase(temp.get(t)
										.toString(), FontFactory.getFont(
										FontFactory.HELVETICA, 9, Font.NORMAL,
										new Color(0, 0, 0))));
								pdfcell.setMinimumHeight(20f);
								pdfcell.setHorizontalAlignment(Element.ALIGN_LEFT);
								pdfcell.setVerticalAlignment(Element.ALIGN_LEFT);
								detailsTable.addCell(pdfcell);
							}
							else
							{
								pdfcell = new PdfPCell(new Phrase(temp.get(t)
										.toString(), FontFactory.getFont(
										FontFactory.HELVETICA, 9, Font.NORMAL,
										new Color(0, 0, 0))));
								pdfcell.setMinimumHeight(20f);
								pdfcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
								pdfcell.setVerticalAlignment(Element.ALIGN_RIGHT);
								detailsTable.addCell(pdfcell);
							}
							
						}
					}
				}

				document.add(detailsTable);

				headingTable1 = new Table(1, 1); // Creation of Table for report
													// heading
				headingTable1.setBorderColor(new Color(219, 234, 245)); // Setting
																		// Border
																		// Color
				headingTable1.setPadding(2); // Set Padding
				headingTable1.setSpacing(2); // Set Spacing
				headingTable1.setBorderWidth(0); // Set borderwidth
				headingTable1.setAlignment(3);
				headingTable1.setWidth(100);
				c1 = new Cell(new Chunk("Report Generated Date & Time "
						+ new java.util.Date().toString(), FontFactory.getFont(
						FontFactory.HELVETICA, 10, Font.BOLD,
						new Color(0, 0, 0))));
				c1.setHorizontalAlignment(3);
				c1.setVerticalAlignment(1);
				c1.setWidth("100%");

				headingTable1.addCell(c1);
				document.add(headingTable1);

				document.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@SuppressWarnings({ "rawtypes" })
	public static void getPdfWithImages(ArrayList mainHeadingList,
			ArrayList subHeadingList, ArrayList dataReport, String filePath,
			String fileName, String heading, int totalColumns,
			HttpServletRequest request, int photoColumn, String removeBasePath) {
		/*************************************************************************************************************************
		 * About arguments: * * mainHeadingList: is a double arraylist and sub
		 * arraylist should be in the form of < heading name,colspan size > * *
		 * subHeadingList: is same like mainHeadingList * * heading: which is
		 * diaplying in the top of pdf * *
		 *************************************************************************************************************************/
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		Image image1 = null;
		InputStream input = null;
		try {
			/*
			 * dataReport.remove(0); dataReport.remove(0);
			 */
			File fileToCreate = new File(filePath, fileName);
			if (!fileToCreate.exists()) {
				fileToCreate.createNewFile();
			}
			if (fileToCreate.exists()) {

				Document document = new Document(PageSize.A3, 25, 25, 25, 25);
				PdfWriter writer = null;
				writer = PdfWriter.getInstance(document, new FileOutputStream(
						fileToCreate));
				document.open();

				/* Page Numbers code start added by ashwin on 08-12-2011 */

				HeaderFooter footer = new HeaderFooter(new Phrase("Page "),
						true);
				footer.setBorder(Rectangle.NO_BORDER);
				footer.setAlignment(Element.ALIGN_RIGHT);
				document.setFooter(footer);
				PdfContentByte cb = writer.getDirectContent();
				cb.saveState();
				// write the headertable
				PdfPTable table = new PdfPTable(2);
				PdfTemplate tpl = writer.getDirectContent().createTemplate(100,
						100);
				BaseFont helv = BaseFont.createFont("Helvetica",
						BaseFont.WINANSI, false);
				table.setTotalWidth(document.right() - document.left());
				table.writeSelectedRows(0, -1, document.left(), document
						.getPageSize().height() - 50, cb);
				// compose the footer
				String text = "Page " + writer.getPageNumber();
				float textSize = helv.getWidthPoint(text, 12);
				float textBase = document.bottom() - 20;
				cb.beginText();
				cb.setFontAndSize(helv, 12);
				float adjust = helv.getWidthPoint("0", 12);
				cb.setTextMatrix(document.right() - textSize - adjust, textBase);
				cb.showText(text);
				cb.endText();

				cb.addTemplate(tpl, document.right() - adjust, textBase);
				cb.saveState();
				/* Page Numbers code end added by ashwin on 08-12-2011 */

				Cell c1 = null;

				/****************************************************************************
				 * Adding report heading *
				 ****************************************************************************/

				Table headingTable1 = new Table(1, 1); // Creation of Table for
														// report heading
				headingTable1.setBorderColor(new Color(219, 234, 245)); // Setting
																		// Border
																		// Color
				headingTable1.setPadding(2); // Set Padding
				headingTable1.setSpacing(2); // Set Spacing
				headingTable1.setBorderWidth(0); // Set borderwidth
				headingTable1.setAlignment(3);
				headingTable1.setWidth(100);

				c1 = new Cell(new Chunk(heading, FontFactory.getFont(
						FontFactory.HELVETICA, 12, Font.BOLD,
						new Color(0, 0, 0))));
				c1.setHorizontalAlignment(3);
				c1.setVerticalAlignment(1);
				c1.setWidth("100%");

				headingTable1.addCell(c1);

				document.add(headingTable1);

				/**********************************************************************************
				 * Adding report headers (Ex; glcode, account name, funds....) *
				 **********************************************************************************/

				ArrayList temp = null;

				PdfPTable detailsTable = new PdfPTable(totalColumns);
				PdfPCell pdfcell = null;

				if (mainHeadingList.size() > 0) {
					detailsTable.getDefaultCell().setBorder(1);
					detailsTable.getDefaultCell().setBorderWidthTop(0);
					detailsTable.getDefaultCell().setBorderWidthBottom(0);
					detailsTable.setWidthPercentage(100);
					detailsTable.setHeaderRows(1);

					/*********************************
					 * Adding main headings *
					 *********************************/

					for (int mh = 0; mh < mainHeadingList.size(); mh++) {
						temp = (ArrayList) mainHeadingList.get(mh);

						pdfcell = new PdfPCell(new Phrase(temp.get(0)
								.toString(), FontFactory.getFont(
								FontFactory.HELVETICA, 10, Font.BOLD,
								new Color(0, 0, 0))));
						pdfcell.setMinimumHeight(20f);
						pdfcell.setHorizontalAlignment(Element.ALIGN_CENTER);
						pdfcell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						pdfcell.setColspan(Integer.parseInt(temp.get(1)
								.toString()));
						detailsTable.addCell(pdfcell);

					}

					/**********************************
					 * Adding sub headings *
					 **********************************/

					for (int sh = 0; sh < subHeadingList.size(); sh++) {
						temp = (ArrayList) subHeadingList.get(sh);

						pdfcell = new PdfPCell(new Phrase(temp.get(0)
								.toString(), FontFactory.getFont(
								FontFactory.HELVETICA, 10, Font.BOLD,
								new Color(0, 0, 0))));
						pdfcell.setMinimumHeight(20f);
						pdfcell.setHorizontalAlignment(Element.ALIGN_CENTER);
						pdfcell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						pdfcell.setColspan(Integer.parseInt(temp.get(1)
								.toString()));
						detailsTable.addCell(pdfcell);

					}
				}
				/*****************************************************************************
				 * Adding report data *
				 *****************************************************************************/

				if (dataReport.size() > 0) {
					for (int dr = 0; dr < dataReport.size(); dr++) {
						temp = (ArrayList) dataReport.get(dr);

						for (int t = 0; t < temp.size(); t++) {
							if (t < photoColumn) {
								pdfcell = new PdfPCell(new Phrase(temp.get(t)
										.toString(), FontFactory.getFont(
										FontFactory.HELVETICA, 9, Font.NORMAL,
										new Color(0, 0, 0))));
								pdfcell.setMinimumHeight(20f);
								pdfcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
								pdfcell.setVerticalAlignment(Element.ALIGN_RIGHT);
								detailsTable.addCell(pdfcell);
							} else {
								try {

									if (removeBasePath.trim().equals("yes")) {
										input = (new URL(temp.get(t).toString()))
												.openStream();
										image1 = Image.getInstance(temp.get(t)
												.toString());
									} else {
										input = (new URL(basePath
												+ temp.get(t).toString()))
												.openStream();
										image1 = Image.getInstance(basePath
												+ temp.get(t).toString());
									}

									image1.scaleAbsoluteHeight(70);
									image1.scaleAbsoluteWidth(70);

									pdfcell = new PdfPCell(image1);
									pdfcell.setMinimumHeight(20f);
									pdfcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
									pdfcell.setVerticalAlignment(Element.ALIGN_RIGHT);
									detailsTable.addCell(pdfcell);
								} catch (IOException ex) {
									pdfcell = new PdfPCell(new Phrase(
											"File Not Found",
											FontFactory.getFont(
													FontFactory.HELVETICA, 9,
													Font.NORMAL, new Color(0,
															0, 0))));
									pdfcell.setMinimumHeight(20f);
									pdfcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
									pdfcell.setVerticalAlignment(Element.ALIGN_RIGHT);
									detailsTable.addCell(pdfcell);
								}
								/*
								 * //System.out.println(basePath+temp.get(t).toString
								 * ()); //File f = new
								 * File(basePath+temp.get(t).toString());
								 * InputStream input = (new
								 * URL(basePath+temp.get
								 * (t).toString())).openStream();
								 * //System.out.println("after "); if (new
								 * URL(basePath
								 * +temp.get(t).toString()).openStream
								 * ().available()>0) { image1 =
								 * Image.getInstance
								 * (basePath+temp.get(t).toString());
								 * image1.scaleAbsoluteHeight(70);
								 * image1.scaleAbsoluteWidth(70);
								 * 
								 * pdfcell = new PdfPCell(image1);
								 * pdfcell.setMinimumHeight(20f);
								 * pdfcell.setHorizontalAlignment
								 * (Element.ALIGN_RIGHT);
								 * pdfcell.setVerticalAlignment
								 * (Element.ALIGN_RIGHT);
								 * detailsTable.addCell(pdfcell); } else {
								 * pdfcell = new PdfPCell(new
								 * Phrase("File Not Found"
								 * ,FontFactory.getFont(FontFactory
								 * .HELVETICA,9,Font.NORMAL,new Color(0,0,0))));
								 * pdfcell.setMinimumHeight(20f);
								 * pdfcell.setHorizontalAlignment
								 * (Element.ALIGN_RIGHT);
								 * pdfcell.setVerticalAlignment
								 * (Element.ALIGN_RIGHT);
								 * detailsTable.addCell(pdfcell); }
								 */
							}
						}
					}
				}

				document.add(detailsTable);

				headingTable1 = new Table(1, 1); // Creation of Table for report
													// heading
				headingTable1.setBorderColor(new Color(219, 234, 245)); // Setting
																		// Border
																		// Color
				headingTable1.setPadding(2); // Set Padding
				headingTable1.setSpacing(2); // Set Spacing
				headingTable1.setBorderWidth(0); // Set borderwidth
				headingTable1.setAlignment(3);
				headingTable1.setWidth(100);
				document.add(headingTable1);

				document.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "rawtypes" })
	public static void getExcel(ArrayList mainHeadingList,
			ArrayList subHeadingList, ArrayList dataReport, String filePath,
			String fileName, String heading, int totalColumns) {

		/*************************************************************************************************************************
		 * About arguments: * * mainHeadingList: is a double arraylist and sub
		 * arraylist should be in the form of < heading name,colspan size > * *
		 * subHeadingList: is same like mainHeadingList * * heading: which is
		 * diaplying in the top of Excel sheet * *
		 *************************************************************************************************************************/
		try {
			// File fileToCreate = new File(filePath, fileName);
			ArrayList temp = null;
			int rowCounter = 0;
			WorkbookSettings ws = new WorkbookSettings();
			ws.setLocale(new Locale("en", "EN"));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(
					filePath + "/" + fileName), ws);
			WritableSheet writablesheet = workbook.createSheet("Sheet1", 1);

			/* Format the Font */

			WritableFont wf = new WritableFont(WritableFont.ARIAL, 12,
					WritableFont.BOLD), wf1 = null;
			WritableCellFormat cf = new WritableCellFormat(wf), cf1 = null;
			cf.setWrap(false);
			cf.setAlignment(jxl.format.Alignment.RIGHT);

			wf1 = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
			cf1 = new WritableCellFormat(wf1);
			cf1.setWrap(false);

			/****************************************************************************
			 * Adding report heading *
			 ****************************************************************************/

			Label l = new Label(0, rowCounter, heading, cf);

			writablesheet.addCell(l);
			l = null;

			writablesheet.mergeCells(0, 0, totalColumns, 0); // (first
																// cell<col,row>,
																// last
																// cell<col,row>)

			/**********************************************************************************
			 * Adding report headers (Ex: glcode, account name, funds....) *
			 **********************************************************************************/

			rowCounter++;

			int colCount = 0;
			int colCount1 = 0;

			/*********************************
			 * Adding main headings *
			 *********************************/

			for (int mh = 0; mh < mainHeadingList.size(); mh++) {
				temp = ((ArrayList) mainHeadingList.get(mh));

				if (Integer.parseInt(temp.get(1).toString()) > 1)// if there is
																	// a need of
																	// merging
																	// cells
				{
					l = new Label(colCount, rowCounter, temp.get(0).toString(),
							cf);

					writablesheet.addCell(l);
					l = null;

					colCount1 = colCount;

					colCount = colCount
							+ Integer.parseInt(temp.get(1).toString()) - 1;

					writablesheet.mergeCells(colCount1, rowCounter, colCount,
							rowCounter); // (first cell<col,row>, last
											// cell<col,row>)
				} else {
					l = new Label(colCount, rowCounter, temp.get(0).toString(),
							cf);

					writablesheet.addCell(l);
					l = null;
				}
				colCount++;
			}

			rowCounter++;

			colCount = 0;
			colCount1 = 0;

			/**********************************
			 * Adding sub headings *
			 **********************************/

			for (int sh = 0; sh < subHeadingList.size(); sh++) {
				temp = ((ArrayList) subHeadingList.get(sh));

				if (Integer.parseInt(temp.get(1).toString()) > 1)// if there is
																	// a need of
																	// merging
																	// cells
				{
					l = new Label(colCount, rowCounter, temp.get(0).toString(),
							cf);

					writablesheet.addCell(l);
					l = null;

					colCount1 = colCount;

					colCount = colCount
							+ Integer.parseInt(temp.get(1).toString()) - 1;

					writablesheet.mergeCells(colCount1, rowCounter, colCount,
							rowCounter); // (first cell<col,row>, last
											// cell<col,row>)
				} else {
					l = new Label(colCount, rowCounter, temp.get(0).toString(),
							cf);

					writablesheet.addCell(l);
					l = null;
				}

				colCount++;
			}

			/*****************************************************************************
			 * Adding report data *
			 *****************************************************************************/

			if (dataReport.size() > 0) {
				for (int dr = 0; dr < dataReport.size(); dr++) {
					rowCounter++;

					temp = (ArrayList) dataReport.get(dr);

					for (int t = 0; t < temp.size(); t++) {
						l = new Label(t, rowCounter, temp.get(t).toString(),
								cf1);

						writablesheet.addCell(l);
						l = null;
					}

				}
			}
			workbook.write();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static boolean is_Number(String str) {
		String validChars = "1234567890";
		str = str.toLowerCase(); // case desense!
		for (int i = 0; i < str.length(); i++) {
			char c = str.charAt(i);
			if (validChars.indexOf(c) == -1) {
				return false;
			}
		}
		return true;
	}

	public static List<Map<String, Object>> getSelectMap(String sql,
			Connection con) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		try {
			// //////System.out.println("sql=="+sql);
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			result = processResultSet(rs);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return result;
	}

	private static List<Map<String, Object>> processResultSet(ResultSet rs)
			throws SQLException {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		ResultSetMetaData rm = rs.getMetaData();
		int cols = rm.getColumnCount();
		if (rs.next()) {
			result = new ArrayList<Map<String, Object>>();
			do {
				Map<String, Object> row = new java.util.HashMap<String, Object>(
						cols);
				for (int i = 1; i <= cols; i++) {
					String columnName = rm.getColumnName(i);
					Object columnValue = rs.getObject(i);
					row.put(columnName.trim(), columnValue);
				}
				result.add(row);
				row = null;
			} while (rs.next());
		}
		return result;
	}

	public static Map<String, Object> getMapData(String sql, Connection con) {
		Map<String, Object> reportData = new HashMap<String, Object>();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			reportData = getMapData(rs);
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return reportData;
	}

	public static Map<String, Object> getMapData(ResultSet rs) {
		ResultSetMetaData rm = null;
		Map<String, Object> reportData = new HashMap<String, Object>();
		int noOfCols = 0;
		try {
			rm = rs.getMetaData();
			noOfCols = rm.getColumnCount();
			if (rs.next()) {
				reportData = new HashMap<String, Object>(noOfCols);
				for (int i = 1; i <= noOfCols; i++) {
					reportData.put(rm.getColumnName(i),
							((rs.getObject(i) != null && !rs.getObject(i)
									.equals("")) ? rs.getObject(i) : ""));
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException se) {
				// TODO: handle exception
				se.printStackTrace();
			}
		}

		return reportData;
	}
	@SuppressWarnings({ "rawtypes" })
	public static void getExcelWithAmtsRightAlign(ArrayList mainHeadingList,
			ArrayList subHeadingList, ArrayList dataReport, String filePath,
			String fileName, String heading, int totalColumns) {

		/*************************************************************************************************************************
		 * About arguments: * * mainHeadingList: is a double arraylist and sub
		 * arraylist should be in the form of < heading name,colspan size > * *
		 * subHeadingList: is same like mainHeadingList * * heading: which is
		 * diaplying in the top of Excel sheet * *
		 *************************************************************************************************************************/
		try {
			// File fileToCreate = new File(filePath, fileName);
			ArrayList temp = null;
			int rowCounter = 0;
			WorkbookSettings ws = new WorkbookSettings();
			ws.setLocale(new Locale("en", "EN"));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(
					filePath + "/" + fileName), ws);
			WritableSheet writablesheet = workbook.createSheet("Sheet1", 1);
		
			/* Format the Font */

			WritableFont wf = new WritableFont(WritableFont.ARIAL, 12,
					WritableFont.BOLD), wf1 = null;
			WritableCellFormat cf = new WritableCellFormat(wf), cf1 = null;
			cf.setWrap(false);

			wf1 = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
			cf1 = new WritableCellFormat(wf1);
			cf1.setWrap(false);

			/****************************************************************************
			 * Adding report heading *
			 ****************************************************************************/

			Label l = new Label(0, rowCounter, heading, cf);

			writablesheet.addCell(l);
			l = null;

			writablesheet.mergeCells(0, 0, totalColumns-1, 0); // (first
																// cell<col,row>,
																// last
																// cell<col,row>)

			/**********************************************************************************
			 * Adding report headers (Ex: glcode, account name, funds....) *
			 **********************************************************************************/

			rowCounter++;

			int colCount = 0;
			int colCount1 = 0;

			/*********************************
			 * Adding main headings *
			 *********************************/

			for (int mh = 0; mh < mainHeadingList.size(); mh++) {
				temp = ((ArrayList) mainHeadingList.get(mh));

				if (Integer.parseInt(temp.get(1).toString()) > 1)// if there is
																	// a need of
																	// merging
																	// cells
				{
					l = new Label(colCount, rowCounter, temp.get(0).toString(),
							cf);

					writablesheet.addCell(l);
					l = null;

					colCount1 = colCount;

					colCount = colCount
							+ Integer.parseInt(temp.get(1).toString()) - 1;

					writablesheet.mergeCells(colCount1, rowCounter, colCount,
							rowCounter); // (first cell<col,row>, last
											// cell<col,row>)
				} else {
					l = new Label(colCount, rowCounter, temp.get(0).toString(),
							cf);

					writablesheet.addCell(l);
					l = null;
				}
				colCount++;
			}

			rowCounter++;

			colCount = 0;
			colCount1 = 0;

			/**********************************
			 * Adding sub headings *
			 **********************************/

			for (int sh = 0; sh < subHeadingList.size(); sh++) {
				temp = ((ArrayList) subHeadingList.get(sh));

				if (Integer.parseInt(temp.get(1).toString()) > 1)// if there is
																	// a need of
																	// merging
																	// cells
				{
					l = new Label(colCount, rowCounter, temp.get(0).toString(),
							cf);

					writablesheet.addCell(l);
					l = null;

					colCount1 = colCount;

					colCount = colCount
							+ Integer.parseInt(temp.get(1).toString()) - 1;

					writablesheet.mergeCells(colCount1, rowCounter, colCount,
							rowCounter); // (first cell<col,row>, last
											// cell<col,row>)
				} else {
					l = new Label(colCount, rowCounter, temp.get(0).toString(),
							cf);

					writablesheet.addCell(l);
					l = null;
				}

				colCount++;
			}

			/*****************************************************************************
			 * Adding report data *
			 *****************************************************************************/

			if (dataReport.size() > 0) {
				for (int dr = 0; dr < dataReport.size(); dr++) {
					rowCounter++;

					temp = (ArrayList) dataReport.get(dr);

					for (int t = 0; t < temp.size(); t++) 
					{
						l = new Label(t, rowCounter, temp.get(t).toString(),
								cf1);
						WritableCellFormat cf2= new WritableCellFormat();
						//WritableCellFormat cf3= new WritableCellFormat();
						boolean var;
						try
						{
							Double.parseDouble(temp.get(t).toString().replaceAll("," ,""));
							var=true;
						}
						catch (Exception e) 
						{
							var=false;
						}
							if(var)
							{
								cf2.setAlignment(Alignment.RIGHT);
								jxl.write.Number l1= new jxl.write.Number(t, rowCounter, Double.parseDouble(temp.get(t).toString().replaceAll("," ,"")));//numberFormat);
								writablesheet.addCell(l1);
								//l.setCellFormat(cf2);
							}
							else
							{
							cf2.setAlignment(Alignment.LEFT);
							//l.setCellFormat(cf2);
							
							writablesheet.addCell(l);
							}
							
							
						
						l = null;
					}

				}
			}
			workbook.write();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static boolean getValidNumbers(String input) {
		Pattern p = Pattern.compile("[^0-9\\r\\n\\ \\.\\,\\-\\/\\(\\)]+");
		// Pattern p = Pattern.compile("[^a-zA-z0-9\\ \\.\\-\\(\\)]+");
		Matcher m = p.matcher(input);
		if (m.find()) {
			return false;
		} else {
			return true;
		}
	}
	
	/*@SuppressWarnings({ "rawtypes" })
	public static HashMap returnArrayListWithTotals(String query, Connection con,String addSerialNo) 
	{
		HashMap<String, Object> reportMap = new HashMap<String, Object>();
		ArrayList<ArrayList<String>> reportData = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<String>> reportTotal = new ArrayList<ArrayList<String>>();
		ArrayList<String> reportSubList = null;
		Statement st = null;
		ResultSet rs = null;
		int rowCount = 0, serialNo = 1;
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while (rs != null && rs.next()) 
			{
				reportSubList = new ArrayList<String>();
				if (addSerialNo.equalsIgnoreCase("yes")) 
				{
					reportSubList.add(Integer.toString(serialNo));
				}
				for (rowCount = 1; rowCount <= ((ResultSetMetaData) rs.getMetaData()).getColumnCount(); rowCount++) 
				{
					if (rs.getString(rowCount) == null)
						reportSubList.add("-");
					else
						reportSubList.add(rs.getString(rowCount).trim());
				}
				reportData.add(reportSubList);
				serialNo++;
			}
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return reportData;
		
		for(int iterator=0;iterator<reportData.size();iterator++)
		{
			for (rowCount = 1; rowCount <= reportData.get(iterator).size(); rowCount++) 
			{
				if (addSerialNo.equalsIgnoreCase("yes"))
					reportSubList.add("");
				
				if (reportData.get(iterator).toString().matches("^[0-9]*$"))
				{
					
					reportSubList.add(reportData.get(iterator).toString());
					
				}
				else
					reportSubList.add(reportData.get(iterator));
			}
			
			
		}
		
		reportMap.put("reportData", reportData);
		reportMap.put("reportTotals", reportTotal);
		
		return reportMap;
		
	}*/
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static HashMap returnMapWithTotals(String query, Connection con, String addSerialNo,int TotalsColumnNo) 
	{
		ArrayList<ArrayList<String>> reportData = new ArrayList<ArrayList<String>>();
		ArrayList<String> reportSubList = null;
		ArrayList<String> temp = new ArrayList();
		ArrayList<String> reportTotals = new ArrayList();
		HashMap reportMap = new HashMap();
		Statement st = null;
		ResultSet rs = null;
		int rowCount = 0, serialNo = 1;
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while (rs != null && rs.next()) {
				reportSubList = new ArrayList<String>();
				if (addSerialNo.equalsIgnoreCase("yes")) {
					reportSubList.add(Integer.toString(serialNo));
				}
				for (rowCount = 1; rowCount <= ((ResultSetMetaData) rs
						.getMetaData()).getColumnCount(); rowCount++) {
					if (rs.getString(rowCount) == null)
						reportSubList.add("-");
					else
						reportSubList.add(rs.getString(rowCount).trim());
				}
				reportData.add(reportSubList);
				serialNo++;
			}
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return reportData;
		for(int i=0;i<reportData.size();i++)
		{
			if(temp.size()==0)	// for first time
			{
				for (int ii = 0; ii < reportData.get(i).size(); ii++) {
				   temp.add("0");	//adding 0 data to tempList
				}
			}
			else
			{
				temp = reportTotals;
				reportTotals = new ArrayList();
			}
			for(int j=0;j<reportData.get(i).size();j++)
			{
				if(reportData.get(i).get(j).matches("\\d+") && temp.get(j).matches("\\d+"))
					reportTotals.add(Integer.parseInt(reportData.get(i).get(j))+Integer.parseInt(temp.get(j))+"");
				else
					reportTotals.add("");
			}
		}
		if (addSerialNo.equalsIgnoreCase("yes"))			// Check to see if serial number to be added 
			reportTotals.set(0, "");						// If S.No. is added then column zero not to be added  
		
			reportTotals.set(TotalsColumnNo, "Total");		// Add label Total to specified column
			
		reportMap.put("reportData",reportData);
		reportMap.put("reportTotals",reportTotals);
		return reportMap;
	}

		public static ArrayList<HashMap<String,Object>> getListMap(String sql,Connection con,Object[] columnvalues) throws SQLException
		{       
			ArrayList<HashMap<String,Object>> records=new ArrayList<HashMap<String,Object>>();
			PreparedStatement ps = con.prepareStatement(sql);
			if(columnvalues!=null)
			{
				for(int ci=0;ci<columnvalues.length;ci++)
				{
					ps.setObject(ci+1, columnvalues[ci]);
				}
			}
			ResultSet rs=ps.executeQuery();
			ResultSetMetaData rm = rs.getMetaData();
			int cols = rm.getColumnCount();
			if (rs.next()) 
			{
				 do {
					 HashMap<String, Object> row = new java.util.HashMap<String, Object>(cols);
					 for (int i=1; i<=cols; i++) {
						 String columnName = rm.getColumnName(i);
						 Object columnValue = rs.getObject(i);
						 row.put(columnName.trim(), columnValue);
					 } 
					 records.add(row);
					 row = null;
				 } 
				 while (rs.next());
			 }
			DataBasePlugin.closeResultSet(rs);
			DataBasePlugin.closeStatement(ps);
			return records;
		}
		
		public static Object getDBObject(String sql,Connection con,Object[] columnvalues) throws Exception
        {
			Object val = new Object();
			PreparedStatement ps = null;
			ResultSet rs = null;
			ps = con.prepareStatement(sql);
			if (columnvalues != null) 
			{
				for (int ci = 0; ci < columnvalues.length; ci++) 
				{
					ps.setObject(ci + 1, columnvalues[ci]);
	
				}
			}
			rs = ps.executeQuery();
	
			if (rs.next()) 
			{
				val = rs.getObject(1);
			}
			DataBasePlugin.closeResultSet(rs);
			DataBasePlugin.closeStatement(ps);
			return val;
        }
}