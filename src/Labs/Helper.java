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

import blackboard.db.BbDatabase;
import blackboard.db.ConnectionManager;
import blackboard.db.ConnectionNotAvailableException;

/**
 * @author SJ
 *
 */
public class Helper {


	private static final Logger LOGGER = LoggerFactory.getLogger(Helper.class.getName() );
    
	public Helper()
	{
		
		
	}
	

	public ResultSet exists(Connection conn, String userid, String courseid, String labname)
	    {
			StringBuffer queryString = new StringBuffer("");
			PreparedStatement selectQuery = null;
			ResultSet rSet = null;
	 		
			 
			queryString.append("SELECT * ");
			queryString.append("FROM ");
			queryString.append(labname);
			queryString.append(" WHERE USERID = ? and COURSEID = ?");
			//LOGGER.info(queryString.toString());
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


		public StringBuilder qMarks(int length, int start)
		{
			StringBuilder q = new StringBuilder();
			for(int i = start; i < length; i++) {
	             if (i == length-1 )  q.append("? )");
	            else  q.append(" ?, ");
	        }
			return q;
		}

		public StringBuilder buildColumnString(ResultSetMetaData rsMeta, String except) throws SQLException {
			// TODO Auto-generated method stub
			 StringBuilder columns = new StringBuilder();

			int columnCount = rsMeta.getColumnCount();
			
			for (int i=1; i <= columnCount ; i++)
	         {
				if(!rsMeta.getColumnName(i).contains(except))
				{
					columns.append(rsMeta.getColumnName(i));
					 if (i != columnCount)
						 columns.append(",");
				}
	         }
			return columns;
		}

//Use this for insert -- 
		public Object buildColumnString(ResultSetMetaData rsMeta) throws SQLException {
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
 

		public String[] removeNull(String indata) 
		{
			// TODO Auto-generated method stub
			String[] token = indata.split(",");
			int count = 0;
			for(int i=0; i< token.length; ++i)
			{
				if (!token[i].contains("null"))
						count++;
			}
			LOGGER.info("token valid count is " + count);
			String[] token_out = new String[count];
			int j = 0;
			for(int i=0; i < count; ++i)
			{
				while (token[j].contains("null"))
					++j;
				
				token_out[i] = token[j];
				++j;
				
			}
			return token_out;
		}


		   public int nextVal(String labname)
		   {
			   ConnectionManager cManager = null;
				Connection conn = null;
				int value = 101;
				StringBuilder q = new StringBuilder();
				 try {
		            cManager = BbDatabase.getDefaultInstance().getConnectionManager();
		            conn = cManager.getConnection();
		            StringBuffer queryString = new StringBuffer("");
	        	    queryString.append("Select " + labname + "_seq.nextval FROM dual");

	              PreparedStatement query = conn.prepareStatement(queryString.toString());
	              ResultSet rs = query.executeQuery();
	              if(rs.next())
	            	  value = rs.getInt(1);
	              LOGGER.info("query executed value is " + value);
				 }
				catch (java.sql.SQLException sE){
		        	
		        	LOGGER.error( sE.getMessage());
		        	sE.printStackTrace();
		        		
				} catch (ConnectionNotAvailableException cE){
		                	
		        	LOGGER.error( cE.getMessage() );
		        	cE.printStackTrace();
		           
		        } finally {
		            if(conn != null){
		                cManager.releaseConnection(conn);
		            }
		        }
			   
			   return value;
		   }

	
}
