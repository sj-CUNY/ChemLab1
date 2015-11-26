package Labs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
 

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import blackboard.db.ConnectionManager;
import blackboard.data.course.Course;
import blackboard.data.user.User;
import blackboard.db.BbDatabase;
import blackboard.db.ConnectionNotAvailableException;
import blackboard.platform.context.Context;
import blackboard.platform.context.ContextManager;
import blackboard.platform.context.ContextManagerFactory;


public class Labs {
    /**
	 * 
	 */ 
	private Context ctx ;
 	private String columns;
	private String weights;
	private String grades;
	private String userId;
	private String courseId;
	private static final Logger LOGGER = LoggerFactory.getLogger(Labs.class.getName());
	
	public void setColumns(String columns) {
		this.columns = columns;
	}
	
	public void setWeights(String weights) {
		this.weights = weights;
	}
	
	public void setGrades(String grades) {
		this.grades = grades;
	}
	
	public void setUserId(String id) {
		this.userId = id;
	}
	public void setCourseId(String id) {
		this.courseId = id;
	}
	public String getColumns() {
		return columns;
	}
	
	public String getWeights() {
		return weights;
	}
	

	public String getGrades() {
		return grades;
	}
	public String getCourseId() {
		return courseId;
	}
	public String getUserId() {
		return userId;
	}
 
	public Labs()
	{
		ContextManager contextManager = ContextManagerFactory.getInstance();
    	ctx = contextManager.getContext() ;
    	
    	this.init(ctx);
	}
 
	public Labs(Context ctx)
	{
		this.init(ctx);
	}
	
	private void init(Context ctx)
	{
	    String c,g,w,u;
		StringBuilder cb = new StringBuilder();
		StringBuilder gb = new StringBuilder();
		StringBuilder wb = new StringBuilder();
		StringBuffer queryString = new StringBuffer("");
		ConnectionManager cManager = null;
		Connection conn = null;
		PreparedStatement selectQuery = null;
		User user = ctx.getUser();
		Course course = ctx.getCourse();
		
		if (user != null)
		{	
			setUserId(user.getId().toExternalString());
			LOGGER.info("Context user id: " + getUserId());
		}
		if (course != null)
		{
			setCourseId(course.getId().toExternalString());
			LOGGER.info("Context course id: " + getCourseId());
		}
		try {
		
			cManager = BbDatabase.getDefaultInstance().getConnectionManager();
			conn = cManager.getConnection();
			
			queryString.append("(SELECT * ");
			queryString.append("FROM ");
			queryString.append("yccs_chemistrylab1)");
			selectQuery = conn.prepareStatement(queryString.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
			ResultSet rSet = selectQuery.executeQuery();
			ResultSetMetaData rsMeta = rSet.getMetaData();
			int columnCount = rsMeta.getColumnCount();
			//LOGGER.info(queryString.toString());
			//LOGGER.info(Integer.toString(columnCount));
	 
				for (int i=1; i <= columnCount; i++){
								  
					cb.append(rsMeta.getColumnName(i));
					if (i != columnCount) cb.append(", ");
					
			//		LOGGER.info("Column name: " + rsMeta.getColumnName(i));
					if (rsMeta.getColumnName(i).contains("GRADE")){
						gb.append(rsMeta.getColumnName(i));
						if (i != columnCount) 
							gb.append(", ");
					}
					else if (rsMeta.getColumnName(i).contains("WEIGHT")){
						wb.append(rsMeta.getColumnName(i));
						if (i !=columnCount) wb.append(", ");
						
					}
			}
			LOGGER.info("cb string " + cb.toString());
			LOGGER.info("gb string " + gb.toString());
			LOGGER.info("wb string " + wb.toString());	
			selectQuery.close();
			rSet.close();
		} catch (java.sql.SQLException sE){
			
			LOGGER.error(sE.getMessage());
			
		} catch (ConnectionNotAvailableException cE){
			LOGGER.error(cE.getMessage());
		} finally {
			if (conn != null){
				cManager.releaseConnection(conn);
			}
		}
		
		c = cb.toString();
		g = gb.toString();
		w = wb.toString();
		u = user.getId().toExternalString();
	
		this.columns = c;
		this.grades = g;
		this.weights = w;
		this.userId = u;
		
		
	}

}