package Labs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import blackboard.db.ConnectionManager;
import blackboard.db.BbDatabase;
import blackboard.db.ConnectionNotAvailableException;

public class DataLoader {
    private static final Logger LOGGER = LoggerFactory.getLogger(DataLoader.class.getName());
	String labname = null;
    public DataLoader(String labname)
    {
    	this.labname = labname;
    	
    }
	public String loadData(String labname) {
		Labs lab = new Labs(labname);
		StringBuilder sb = new StringBuilder();
		StringBuffer queryString = new StringBuffer("");
		String userid = lab.getUserId();
		ConnectionManager cManager = null;
		Connection conn = null;
		PreparedStatement selectQuery = null;
		
		try {
			cManager = BbDatabase.getDefaultInstance().getConnectionManager();
			conn = cManager.getConnection();
			
			queryString.append("SELECT * ");
			queryString.append("FROM ");
			queryString.append(labname);
			queryString.append(" WHERE UserId = ? AND CourseId = ?");
			LOGGER.info(queryString.toString());
			selectQuery = conn.prepareStatement(queryString.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
			
			selectQuery.setString(1, userid);
			selectQuery.setString(2, lab.getCourseId());
			  

			ResultSet rSet = selectQuery.executeQuery();
 			
			ResultSetMetaData rsMetaData = rSet.getMetaData();
 			//LOGGER.info( "column count is: " + rsMetaData.getColumnCount());

			if (rSet.next() && userid.equals(rSet.getString(2))){
				//LOGGER.info("user id is " + userid + " rSet string at 1 is: " + rSet.getString(1));
				sb = labSpecificFix(rSet, rsMetaData,labname);
			}
			//LOGGER.info("user id is " + userid + " selectQuery is: " + selectQuery.toString());
			
			rSet.close();
			selectQuery.close();
		} catch (java.sql.SQLException sE) {
			
			LOGGER.error("MARKER 1: " + sE.getMessage());
			sE.printStackTrace();
		} catch (ConnectionNotAvailableException cE) {
			
			LOGGER.error("MARKER 2" + cE.getMessage());
		}finally {
			if (conn != null){
				cManager.releaseConnection(conn);
			}
		}
		
		String returnData = sb.toString();
		
		return returnData;
	}
	
	private StringBuilder labSpecificFix(ResultSet rSet,
		ResultSetMetaData rsMetaData, String labname) throws SQLException {
		StringBuilder s = new StringBuilder();
		if(labname.contains("yccs_chemistrylab1"))
		{
			s = lab1Fix(rSet, rsMetaData, labname);
		}
		return s;
	}
	private StringBuilder lab1Fix(ResultSet rSet, ResultSetMetaData rsMeta,   String labname) throws SQLException {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		int columnCount = rsMeta.getColumnCount();
		int count = 0;
		for (int j=4; j <= columnCount; j++)
		{
			
			while (count == 1 || count == 2 || count == 4 || count == 5)
			{
				sb.append("null,");
				++count;
 			}
		
			while(rsMeta.getColumnName(j).contains("GRADE"))
				++j;
			
			sb.append(rSet.getString(j).trim());
			//LOGGER.info("sb looks like: " + sb.toString());
			++count;
			if (count < 36)
			sb.append(", ");
			 

			++j;
		}
		LOGGER.info("loadData returns this " + sb.toString());
		return sb;
	}
	public String loadGrades() {
		Labs lab = new Labs(labname);
		StringBuilder sb = new StringBuilder();
		StringBuffer queryString = new StringBuffer("");
		String userid = lab.getUserId();
		ConnectionManager cManager = null;
		Connection conn = null;
		PreparedStatement selectQuery = null;
		String grades = lab.getGrades();
		grades = grades.replaceAll("(", "");
		grades = grades.replaceAll(")", "");
		
		try {
			cManager = BbDatabase.getDefaultInstance().getConnectionManager();
			conn = cManager.getConnection();
			
			queryString.append("SELECT ");
			queryString.append(grades);
			queryString.append(" FROM ");
			queryString.append(labname);
			queryString.append(" WHERE UserId = ? AND CourseId = ?");
			selectQuery = conn.prepareStatement(queryString.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
			selectQuery.setString(1, userid);
			selectQuery.setString(2, lab.getCourseId());
			LOGGER.info(queryString.toString());

			ResultSet rSet = selectQuery.executeQuery();
			ResultSetMetaData rsMetaData = rSet.getMetaData();
			int columnCount = rsMetaData.getColumnCount();
			
			if (rSet.next() && userid.equals(rSet.getString(2))){
				for (int i=3; i <= columnCount; i++){
					sb.append(rSet.getString(i));
					LOGGER.info(rSet.getString(columnCount));

					if (i <  columnCount){
						sb.append(", ");
					}
				}
			}
			rSet.close();
			selectQuery.close();
		} catch (java.sql.SQLException sE) {
			
			LOGGER.error(sE.getMessage());
			sE.printStackTrace();
		} catch (ConnectionNotAvailableException cE) {
			
			LOGGER.error(cE.getMessage());
			cE.printStackTrace();
		}finally {
			if (conn != null){
				cManager.releaseConnection(conn);
			}
		}
		String returndata = sb.toString();
		return returndata;		
	}
}