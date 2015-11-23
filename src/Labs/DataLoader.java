package Labs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import blackboard.db.ConnectionManager;
import blackboard.db.BbDatabase;
import blackboard.db.ConnectionNotAvailableException;

public class DataLoader {
    private static final Logger LOGGER = LoggerFactory.getLogger(DataLoader.class.getName());
	
	public String loadData() {
		Labs lab = new Labs();
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
			queryString.append("yccs_chemistrylab1 ");
			queryString.append("WHERE UserId = ?");
			LOGGER.info(queryString.toString());
			selectQuery = conn.prepareStatement(queryString.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
			
			selectQuery.setString(1, userid);
 

			ResultSet rSet = selectQuery.executeQuery();
 			
			ResultSetMetaData rsMetaData = rSet.getMetaData();
			int columnCount = rsMetaData.getColumnCount();
			//LOGGER.info( "column count is: " + rsMetaData.getColumnCount());

			if (rSet.next() && userid.equals(rSet.getString(2))){
				//LOGGER.info("user id is " + userid + " rSet string at 1 is: " + rSet.getString(1));
				for (int i=2; i <= columnCount; i++){
					//LOGGER.info("user id is " + userid + " rSet string at " + " i" +  "is: " + rSet.getString(1));

					if(rSet.getString(i) != "NULL" && rSet.getString(i) != "" && rSet.getString(i) != "null"
							&& rSet.getString(i) != " "){
						sb.append(rSet.getString(i));
						//LOGGER.info("sb looks like: " + sb.toString());
						if (i < columnCount){
							sb.append(", ");
						}
					}
					else if (i < columnCount){
						sb.append(", ,");
					}
				}
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
		
		String returndata = sb.toString();
		return returndata;
	}
	
	public String loadGrades() {
		Labs lab = new Labs();
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
			queryString.append("yccs_chemistrylab1 ");
			queryString.append("WHERE UserId = ?");
			selectQuery = conn.prepareStatement(queryString.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
			selectQuery.setString(2, userid);
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