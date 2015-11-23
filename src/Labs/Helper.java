/**
 * 
 */
package Labs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author SJ
 *
 */
public class Helper {


	private static final Logger LOGGER = LoggerFactory.getLogger(Helper.class.getName() );
    
	public Helper()
	{
		
		
	}
	

	public ResultSet exists(Connection conn, String userid, String courseid)
	    {
			StringBuffer queryString = new StringBuffer("");
			PreparedStatement selectQuery = null;
			ResultSet rSet = null;
	 		
			 
			queryString.append("SELECT * ");
			queryString.append("FROM ");
			queryString.append("yccs_chemistrylab1 ");
			queryString.append("WHERE USERID = ? and COURSEID = ?");
			LOGGER.info(queryString.toString());
			try
			{
				selectQuery = conn.prepareStatement(queryString.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);			
				selectQuery.setString(1, userid);
				selectQuery.setString(2, courseid);
				rSet = selectQuery.executeQuery();
				
		 	}
			catch(java.sql.SQLException sE)
			{
				LOGGER.info(sE.getMessage());
				sE.printStackTrace();
			}
	    	
	    	return rSet;
	    }


		public StringBuilder qMarks(int length)
		{
			StringBuilder q = new StringBuilder();
			for(int i = 0; i < length; i++) {
	             if (i == length -1)  q.append("? )");
	            else  q.append(" ?, ");
	        }
			return q;
		}
		
		public StringBuilder buildColumnString(ResultSetMetaData rsMeta) throws SQLException {
			// TODO Auto-generated method stub
			 StringBuilder columns = new StringBuilder();

			int columnCount = rsMeta.getColumnCount();
			
			for (int i=1; i <= columnCount ; i++)
	         {
					columns.append(rsMeta.getColumnName(i));
					 if (i != columnCount)
						 columns.append(",");
	         }
			return columns;
		}

	
}
