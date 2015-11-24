/**
 * 
 */
package Labs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import blackboard.data.course.Course;
import blackboard.data.course.CourseMembership;
import blackboard.data.gradebook.Lineitem;
import blackboard.data.gradebook.Lineitem.AssessmentLocation;
import blackboard.data.user.User;
import blackboard.db.BbDatabase;
import blackboard.db.ConnectionManager;
import blackboard.db.ConnectionNotAvailableException;
import blackboard.persist.BbPersistenceManager;
import blackboard.persist.DbLoaderFactory;
import blackboard.persist.Id;
import blackboard.persist.KeyNotFoundException;
import blackboard.persist.PersistenceException;
import blackboard.persist.course.CourseMembershipDbLoader;
import blackboard.persist.gradebook.LineitemDbLoader;
import blackboard.persist.gradebook.LineitemDbPersister;
import blackboard.platform.context.Context;
import blackboard.platform.context.ContextManager;
import blackboard.platform.context.ContextManagerFactory;
import blackboard.platform.persistence.PersistenceService;
import blackboard.platform.persistence.PersistenceServiceFactory;
 


/**
 * @author SJ
 *
 */
public class GradeLogistics {

	private static final Logger LOGGER = LoggerFactory.getLogger(GradeLogistics.class.getName());
	private ContextManager contextManager = null;
	private Context ctx  = null;
	private User currentUser = null;
	private String currUserId = "";
	private String courseid = "";
 	
	   public GradeLogistics()
	   {
		   
		   contextManager = ContextManagerFactory.getInstance();
	   	   ctx = contextManager.getContext() ;
	   	
	   	   currentUser = ctx.getUser() ;
	   	
	       currUserId = currentUser.getId().toExternalString();
	       courseid = ctx.getCourse().getId().toExternalString();
 	       LOGGER.info("init - Userid " + currUserId);
	       LOGGER.info("init - Courseid " + courseid);
 	   	    
	   }

	   
		public void initGradeLogistics(String tablename)
		{
		    loadCourseMembership(fetchRoster(ctx), tablename);				
		}

	   private List<CourseMembership> fetchRoster(Context ctx)
	   {
			    PersistenceService bpService = PersistenceServiceFactory.getInstance() ;
			    BbPersistenceManager bpManager = bpService.getDbPersistenceManager();
				Course courseIdentity = ctx.getCourse();
				  
				// get the course id from the course object
				Id courseId = courseIdentity.getId();
				
				// get the name of the course
				String courseName = courseIdentity.getBatchUid();
 				// get the membership data to determine the User's Role
				List<CourseMembership> crsMembership = null;
				CourseMembershipDbLoader crsMembershipLoader = null;
				String errMsg = null;
				LOGGER.info("Course name : " + courseName);
				try {
					crsMembershipLoader = (CourseMembershipDbLoader)bpManager.getLoader(CourseMembershipDbLoader.TYPE);
					crsMembership = crsMembershipLoader.loadByCourseId(courseId);
				} catch (KeyNotFoundException e) {
				// There is no membership record.
				errMsg = "There is no membership record. Better check this out:" + e;
				LOGGER.error(errMsg);
				} catch (PersistenceException pe) {
				// There is no membership record.
				errMsg = "An error occured while loading the User. Better check this out:" + pe;
				LOGGER.error(errMsg);
				}
				 
				return crsMembership;

	   }


		private void loadCourseMembership(List<CourseMembership> roster, String tablename) {
	 		ConnectionManager cManager = null;
			Connection conn = null;

			StringBuilder q = new StringBuilder();
			String columns ;
			try {
	            cManager = BbDatabase.getDefaultInstance().getConnectionManager();
	            conn = cManager.getConnection();
	            ResultSet rSet = null; 
				ResultSetMetaData rsMeta = null; 
				int columnCount = 0;  
	            Helper h = new Helper();
	            
	            for (int i=0; i < roster.size(); ++i)
	            {
	            	String uid = "";
	            	uid = roster.get(i).getUserId().toExternalString();
	        		StringBuffer queryString = new StringBuffer("");
	             	rSet = h.exists(conn, uid, courseid);
	            	rsMeta = rSet.getMetaData();
	            	
	            	if (!(rSet.next()))
	                {
	            		   LOGGER.info("Did not find userid " + uid);	      
	                	   queryString.append("INSERT INTO " + tablename + " ( ");
	                	   columns = h.buildColumnString(rsMeta).toString();
	         	           
	 
		                    queryString.append(columns + " ) " + "VALUES ( ");
		                    columnCount = rsMeta.getColumnCount();
		                    q = h.qMarks(columnCount) ;
		                    queryString.append(q);
		                    LOGGER.info(queryString.toString());
		
		                    PreparedStatement insertQuery = conn.prepareStatement(queryString.toString(), new String[]{"PK1"});
		                    insertQuery.setString(1, Integer.toString(i+1000));
			                    
		                    insertQuery.setString(2, uid);
		                    insertQuery.setString(3, courseid);
		                    String temp = "0";
		                    for (int j=4; j <= columnCount; j++) 
		                    {
		                    	insertQuery.setString(j,  temp);
		                    }          
		 
		                    insertQuery.executeUpdate();
		                    insertQuery.close();
		           	
	            	}
	            	else
	            	{
	            		StringBuilder debug = new StringBuilder();
	            		for (int j = 1; j<rsMeta.getColumnCount(); ++j) 
	            			debug.append(rSet.getString(j) + ",");
	            
	            		LOGGER.info("membership " + debug.toString());
	            	}	
	            	

	            }
			
			} catch (java.sql.SQLException sE){
	        	
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
			
		}

		public void makeLineItem(String labname, int pointsPossible, Context ctx)
		{
			
			try
			{
					if (!checkLineItem(labname, ctx.getCourseId()))
					{
			     	    Lineitem assignment = new Lineitem();
			     	    assignment.setCourseId(ctx.getCourseId());
			    	    assignment.setName(labname);
			    	    assignment.setPointsPossible(pointsPossible);
			    	    assignment.setType(labname);
			    	    assignment.setIsAvailable(true);
			    	    assignment.setDateAdded();
			    	    assignment.setAssessmentId(labname, AssessmentLocation.EXTERNAL);
			    	    assignment.setAttemptHandlerUrl ("index.jsp");
			    	    LineitemDbPersister linePersister = LineitemDbPersister.Default.getInstance();
			    	    linePersister.persist(assignment);
			    	    LOGGER.info("LineItem id is " + assignment.getId());
			    	    
					} 
            }
        	  catch (Exception e) {
        	    LOGGER.info( e.getMessage());
         	    e.printStackTrace();

        	  }

			
		}


		private boolean checkLineItem(String labname, Id courseId) throws KeyNotFoundException, PersistenceException {
			PersistenceService bpService = PersistenceServiceFactory.getInstance() ;
			// TODO Auto-generated method stub
		    BbPersistenceManager bpManager = bpService.getDbPersistenceManager();

			LineitemDbLoader loader = (LineitemDbLoader)bpManager;
			List<Lineitem> lItems =  loader.loadByCourseId(courseId); 
			for (int i=0; i<lItems.size(); ++i)
			{
				if (lItems.get(i).getAssessmentId().equals(labname))
					return true;
			}
			return false;
		}

}
