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
    public DataLoader()
    {
     
    	
    }
	public String loadData(String labname, String userid, String courseid) {
 		StringBuilder sb = new StringBuilder();
		StringBuffer queryString = new StringBuffer("");
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
			selectQuery.setString(2, courseid);
			  

			ResultSet rSet = selectQuery.executeQuery();
 			
			ResultSetMetaData rsMetaData = rSet.getMetaData();
 			LOGGER.info( "column count is: " + rsMetaData.getColumnCount());

			if (rSet.next() && userid.equals(rSet.getString(2))){
				LOGGER.info("user id is " + userid + " rSet string at 1 is: " + rSet.getString(1));
				sb = labSpecificFix(rSet, rsMetaData,labname);
			}
			LOGGER.info("user id is " + userid + " selectQuery is: " + selectQuery.toString());
			
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
		LOGGER.info("returnData " + returnData);
		return returnData;
	}
	
	private StringBuilder labSpecificFix(ResultSet rSet,
		ResultSetMetaData rsMetaData, String labname) throws SQLException {
		StringBuilder s = new StringBuilder();
		if(labname.contains("ycdb_chemistrylab1"))
		{
			s = lab1Fix(rSet, rsMetaData, labname);
		}
		else if(labname.contains("ycdb_chemistrylab2"))
		{
			s = lab2Fix(rSet, rsMetaData, labname);
		}
		return s;		
	}
	private StringBuilder lab1Fix(ResultSet rSet, ResultSetMetaData rsMeta,   String labname) throws SQLException {
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
			if(rSet!=null && rSet.getString(j)!=null)
			{
				sb.append(rSet.getString(j).trim());
			
				LOGGER.info("sb looks like: " + sb.toString());
				++count;
			}
			if (count < 36)
				sb.append(",");
			else
				break;

			++j;
		}
		LOGGER.info("loadData returns this " + sb.toString());
		return sb;
	}
	//- Input is 1,null,1,null,1,null,1,null,1,null,1,1,1,1,1,1,1,1,1,1,1,null,1,null,1,1,1,1,1,1,0,1,1,null
	private StringBuilder lab2Fix(ResultSet rSet, ResultSetMetaData rsMeta,   String labname) throws SQLException {
 		StringBuilder sb = new StringBuilder();
		int columnCount = rsMeta.getColumnCount();
		int count = 0;
		for (int j=4; j <= columnCount; j++)
		{
			
			while ((count <= 9 && count % 2 == 1)|| count == 21 || count == 23)
			{
				sb.append("null,");
				++count;
 			}
		
			while(rsMeta.getColumnName(j).contains("GRADE"))
				++j;
			if(rSet!=null && rSet.getString(j)!=null)
			{
				sb.append(rSet.getString(j).trim());
			
				LOGGER.info("sb looks like: " + sb.toString());
				++count;
			}
			if (count < 33)
				sb.append(",");
			else if(count == 33)
			{
				sb.append(",null");
				break;
			}
 
			++j;
		}
		LOGGER.info("loadData returns this " + sb.toString());
		return sb;
	}

}