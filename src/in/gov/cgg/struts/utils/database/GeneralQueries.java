package in.gov.cgg.struts.utils.database;


public class GeneralQueries 
{
public static String getZonesQuery(String ulbId)
{
	return "select ZONE_ID,ZONE_NAME from zones order by zone_id";
}
public static String getBanksQuery(String ulbId)
{
	return "select b.id,b.NAME || '-' || bb.BRANCHNAME from BANK b,BANKBRANCH bb where b.ID=bb.BANKID and b.ulbid="+ulbId+" and b.ISACTIVE=1";
}
public static String getDistricts()
{
	return "select district_id,district_name from districts  where ISACTIVE='Y' and DISTRICT_ID>10 order by district_name";
}
public static String getUlbs()
{
	return "select town_city_id,town_city_name from towns_cities where display_city_in_ghmc='Y' order by town_city_name";
}
public static String getAllUserNames()
{
	return "select username,username from users where city_id in (select town_city_id from towns_cities where display_city_in_ghmc='Y') order by username";
	
}
}