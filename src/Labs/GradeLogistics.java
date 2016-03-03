/**
 * 
 */
package Labs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Calendar;
import java.util.List;
import java.util.ListIterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import blackboard.data.ValidationException;
import blackboard.data.course.Course;
import blackboard.data.course.CourseMembership;
import blackboard.data.gradebook.Lineitem;
import blackboard.data.gradebook.Lineitem.AssessmentLocation;
import blackboard.data.gradebook.Score;
import blackboard.data.gradebook.impl.Attempt;
import blackboard.data.gradebook.impl.Outcome;
import blackboard.persist.gradebook.ext.AttemptDbPersister;
import blackboard.persist.gradebook.ext.OutcomeDbPersister;
import blackboard.persist.gradebook.impl.AttemptDbLoader;
import blackboard.data.user.User;
import blackboard.db.BbDatabase;
import blackboard.db.ConnectionManager;
import blackboard.db.ConnectionNotAvailableException;
import blackboard.persist.BbPersistenceManager;
import blackboard.persist.Id;
import blackboard.persist.KeyNotFoundException;
import blackboard.persist.PersistenceException;
import blackboard.persist.course.CourseMembershipDbLoader;
import blackboard.persist.gradebook.LineitemDbLoader;
import blackboard.persist.gradebook.LineitemDbPersister;
import blackboard.persist.gradebook.ScoreDbPersister;
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

	   public GradeLogistics(Context ctx)
	   {
		   this.ctx = ctx; 
	   	   currentUser = ctx.getUser() ;
	   	
	       currUserId = currentUser.getId().toExternalString();
	       courseid = ctx.getCourse().getId().toExternalString();
 	       LOGGER.info("init - Userid " + currUserId);
	       LOGGER.info("init - Courseid " + courseid);
 	   	    
	   }
	   
	   //Use this function only if you know what you are doing
	   public void delete(String labname)
	   {
		   ConnectionManager cManager = null;
			Connection conn = null;

			StringBuilder q = new StringBuilder();
			 try {
	            cManager = BbDatabase.getDefaultInstance().getConnectionManager();
	            conn = cManager.getConnection();
	            StringBuffer queryString = new StringBuffer("");
         	    queryString.append("DROP TABLE " + labname + " PURGE");

               PreparedStatement deleteQuery = conn.prepareStatement(queryString.toString());
               deleteQuery.executeUpdate();
               PreparedStatement deleteSeq = conn.prepareStatement("DROP SEQUENCE "+labname+"_seq");
               deleteSeq.executeUpdate();
               
               LOGGER.info("dropped all tables");
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
			
	   }
	   
	   public void createTrigger(String labname)
	   {
		   ConnectionManager cManager = null;
			Connection conn = null;

			StringBuilder q = new StringBuilder();
			 try {
	            cManager = BbDatabase.getDefaultInstance().getConnectionManager();
	            conn = cManager.getConnection();
	            StringBuffer queryString = new StringBuffer("");
        	   /* queryString.append("CREATE OR REPLACE TRIGGER  " + labname + 
        	    		"_trig BEFORE INSERT ON " + labname + " FOR EACH ROW WHEN (new.pk1 IS NULL) ");
        	    queryString.append("BEGIN SELECT " + labname + "_seq.NEXTVAL INTO :new.pk1 FROM dual; END;"
        	    		+ "	 / ALTER TRIGGER " + labname + "_trig ENABLE" );
        	    */
	            queryString.append("CREATE OR REPLACE TRIGGER  " + labname + 
        	    		"_trig BEFORE INSERT ON " + labname + " FOR EACH ROW ");
        	    queryString.append("BEGIN :new.pk1 := " + labname + "_seq.nextval;  END;"
        	    		+ "	 / ALTER TRIGGER " + labname + "_trig ENABLE" );
        	   
        	    LOGGER.info(queryString.toString());
              Statement trigQuery = conn.createStatement();
              trigQuery.executeQuery(queryString.toString());
               LOGGER.info("make trigger " + labname);
                 
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
		   
	   }
	   		public void initGradeLogistics(String tablename)
		{
		    loadCourseMembership(fetchRoster(ctx), tablename);				
		}

	   
		public Context getContext()
		{
			return this.ctx;
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
			//	LOGGER.info("Course name : " + courseName);
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


		private void loadCourseMembership(List<CourseMembership> roster, String labname) {
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
	             	rSet = h.exists(conn, uid, courseid, labname);
	            	rsMeta = rSet.getMetaData();
	            	
	            	if (!(rSet.next()))
	                {
	            		   LOGGER.info("Did not find userid " + uid);	      
	            		   int pk1 = h.nextVal(labname);
	                	   queryString.append("INSERT INTO " + labname + " ( ");
	                	   columns = h.buildColumnString(rsMeta).toString();
	         	           
	 
		                    queryString.append(columns + " ) " + "VALUES ( ");
		                 //   String pk = labname.trim()+"_seq.nextval";
		                   // queryString.append(pk);
		                    
		                    columnCount = rsMeta.getColumnCount();
		                    q = h.qMarks(columnCount, 0) ;//Start from 0 or 1
		                    queryString.append(q);
		                    LOGGER.info("INSERT string " + queryString.toString());
 		                    PreparedStatement insertQuery = conn.prepareStatement(queryString.toString(), PreparedStatement.RETURN_GENERATED_KEYS);
		                    insertQuery.setInt(1,pk1);
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
	            
	            		//LOGGER.info("membership " + debug.toString());
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

		public Id makeLineItem(String labname, int pointsPossible, Context ctx) throws KeyNotFoundException, PersistenceException
		{
			Lineitem assignment = null;
 			try
			{
	    		 String url = "/webapps/YCDB-Lab 20Debug-BBLEARN/index.jsp?course_id="+ctx.getCourseId()+"&"+ctx.getUser().getId();

					if (!checkLineItem(labname, ctx.getCourseId()))
					{
						//LOGGER.info("No matching lineitem, create a new one");
			     	    assignment = new Lineitem();
			     	    assignment.setCourseId(ctx.getCourseId());
			    	    assignment.setName(labname);
			    	    assignment.setPointsPossible(pointsPossible);
			    	    assignment.setType(labname);
			    	    assignment.setIsAvailable(true);
			    	    assignment.setDateAdded();
			    	    assignment.setAssessmentId(labname, AssessmentLocation.EXTERNAL);
			    	    assignment.setAttemptHandlerUrl(url);
			    	    LineitemDbPersister linePersister = LineitemDbPersister.Default.getInstance();
			    	    linePersister.persist(assignment);
			    	    //LOGGER.info("LineItem id is " + assignment.getId());
			    	    
					} 
					else
					{
						assignment = getLineItem(labname, ctx.getCourseId());
						  		
					}
            }
        	  catch (Exception e) {
        	    LOGGER.info( e.getMessage());
         	    e.printStackTrace();

        	  }
			  if (assignment != null) 
				  return assignment.getId();
			  else
				  return null;
		}


		private boolean checkLineItem(String labname, Id courseId) throws KeyNotFoundException, PersistenceException {
 		
			// check if a lineitem exists return true if lineitem exists else return false 
			Lineitem l = getLineItem(labname, courseId);
			if ( l != null)
			{
				//LOGGER.info("Found a matching linitem " + l.getId().toExternalString());
				return true;
			}
			//LOGGER.info("No matching linitem found ");
			return false;
		}

		public Lineitem getLineItem(String labname, Id courseId)
		{
			PersistenceService bpService = PersistenceServiceFactory.getInstance() ;
		
			// TODO Auto-generated met
		    BbPersistenceManager bpManager = bpService.getDbPersistenceManager();
		    LineitemDbLoader loader = null;
			try {
				loader = (LineitemDbLoader)bpManager.getLoader(LineitemDbLoader.TYPE);
			} catch (PersistenceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			};
			List<Lineitem> lItems = null;
			try {
				lItems = loader.loadByCourseId(courseId);
			} catch (PersistenceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//LOGGER.info("Number of line items " + lItems.size());
			ListIterator<Lineitem> listIterator = lItems.listIterator();
			Lineitem l = null;
			while(listIterator.hasNext())
			{
				l = listIterator.next(); 
			//	LOGGER.info("lineitem id " + l.getId() );
			//	LOGGER.info("lineitem assessment id " + l.getAssessmentId());
			//	LOGGER.info("labname " + labname);
				if(l!=null && l.getAssessmentId() != null && l.getAssessmentId().toString().equals(labname))
				 	break; 
			}
		 
			return l;
		}
		
		public void addStudentAttempts(String labname, Lineitem lineitem) throws PersistenceException, ValidationException
		{
			addStudentAttempts(ctx, labname, lineitem);
			//addStudentAttempts2(ctx, labname, currentUser.getId());
		}
		/*
		private void addStudentAttempts2(Context ctx, String labname, Id id) throws PersistenceException, ValidationException
		{
			PersistenceService bpService = null;
			BbPersistenceManager bpManager = null;
 			List<CourseMembership> crsMembership ; 
			    
			 
			bpService = PersistenceServiceFactory.getInstance() ;
			
			bpManager = bpService.getDbPersistenceManager();
			crsMembership = fetchRoster(ctx);
		    Score s = null;
		    ListIterator<CourseMembership> cList = crsMembership.listIterator();
		    while(cList.hasNext())
		    {
		    	CourseMembership cm = cList.next();
 		    	if (cm.getUserId().toExternalString().equals(ctx.getUserId().toExternalString()))// && cm.getRole() == CourseMembership.Role.STUDENT)
		    	{
 		    		Attempt attempt = new Attempt();
 		    		FormattedText fText = new FormattedText("/blackboard/webapps/YCDB-Lab%20Debug-BBLEARN/index.jsp?course_id="+cm.getCourseId().toExternalString()+"&user_id="+cm.getUserId().toExternalString(),FormattedText.Type.HTML);
  		    		attempt.setStudentSubmission(fText);
  		    		attempt.setOutcomeId();
   		    		AttemptDbPersister adb = (AttemptDbPersister) bpManager.getPersister( AttemptDbPersister.TYPE );
  		    		adb.persist(attempt);
		    	}
		    }
		    return;
		}*/
		private void addStudentAttempts(Context ctx, String labname, Lineitem lineitem) throws KeyNotFoundException, PersistenceException, ValidationException
		{
			/*
    	    String url = "/webapps/YCDB-Lab 20Debug-BBLEARN/index.jsp?course_id="+ctx.getCourseId()+"&"+ctx.getUser().getId();
     	    
    	    l.setAttemptHandlerUrl (url);
    	    */
			PersistenceService bpService = null;
			BbPersistenceManager bpManager = null;
			ScoreDbPersister sdb = null;
			List<CourseMembership> crsMembership ; 
			    
			 
			bpService = PersistenceServiceFactory.getInstance() ;
			
			bpManager = bpService.getDbPersistenceManager();
		    LOGGER.info("addStudentAttept " + labname + " " +  ctx.getRequestUrl());
		    try
		    {
		    	sdb = (ScoreDbPersister) bpManager.getPersister( ScoreDbPersister.TYPE );
		    }
		    catch(PersistenceException pE)
		    {
		    	LOGGER.info(pE.getMessage());
		    	pE.printStackTrace();
		    }
		    
		    crsMembership = fetchRoster(ctx);
		    Score s = null;
		    ListIterator<CourseMembership> cList = crsMembership.listIterator();
		    while(cList.hasNext())
		    {
		    	CourseMembership cm = cList.next();
		    	/*if (cm != null)
		    		LOGGER.info("cm addStudentAttept userid " + cm.getUserId().toExternalString());
			    if(ctx != null)
			    	if (ctx.getUser() != null)
			    		LOGGER.info("ctx addStudentAttept userid " + ctx.getUserId().toExternalString());
	    		LOGGER.info("Membership size " + crsMembership.size());
		    	*/
		    	if (cm.getUserId().toExternalString().equals(ctx.getUserId().toExternalString()))// && cm.getRole() == CourseMembership.Role.STUDENT)
		    	{
		    		s = new Score();
		    		s.setDateAdded();
		    		lineitem.setAttemptHandlerUrl("https://cunytd.blackboard.com/blackboard/webapps/YCDB-Lab%20Debug-BBLEARN/index.jsp?course_id="+cm.getCourseId().toExternalString()+"&user_id="+cm.getUserId().toExternalString());
		    		s.setLineitemId(lineitem.getId());
		    	//LOGGER.info("Course is " + cm.getCourseId());
 		       	 // 	s.setAttemptId(ctx.getRequestUrl(), Score.AttemptLocation.EXTERNAL );
 		    	 	s.setCourseMembershipId(cm.getId());
 		    	 	ScoreDbPersister.Default.getInstance().persist(s);

 		    	 	Outcome outcome = s.getOutcome();
 		    		Attempt attempt ;
 
 		    	 	if (outcome.getAttemptCount() == 0) {
 		    	 		attempt = outcome.createAttempt();
 		    	 	    if (attempt == null) {
 		    	 	        throw new IllegalStateException("could not create attempt");
 		    	 	    }
 		    	 	    attempt.setOutcomeId(outcome.getId());
 		    	 	} else {
 		    	 	    attempt = AttemptDbLoader.Default.getInstance().loadById(outcome.getLastAttemptId());
 		    	 	} 

 		    	 //	String str = "<%@ taglib uri=\"/bbUI\" prefix=\"bbUI\" %><html><head><title>Submitted Text</head><body><c:url value=\"/blackboard/webapps/YCDB-Lab%20Debug-BBLEARN/index.jsp?course_id="+cm.getCourseId().toExternalString()+"&user_id="+cm.getUserId().toExternalString()+"/></body></html>";
 		    	 //	FormattedText fText = new FormattedText(str,FormattedText.Type.HTML);
   		    		
 		    	 	attempt.setStatus(Attempt.Status.NEEDS_GRADING);
 		    	 	attempt.setAttemptedDate(Calendar.getInstance());
 		    	 	AttemptDbPersister.Default.getInstance().persist(attempt);
 		    	 	
 		    	 	break;
		    	}
		    }
		    /*
		    try 
		    {
		    	if (s != null)
		    	{
		    		sdb.persist(s);
		    		LOGGER.info("Storing score " + s.getAttemptId());
		    	}
		    }
		    catch(PersistenceException pE)
		    {
		    	LOGGER.info(pE.getMessage());
		    	pE.printStackTrace();
		    }
		    catch(ValidationException vE)
		    {
		    	LOGGER.info(vE.getMessage());
		    	vE.printStackTrace();
		    }*/
    	    return ;
		}
		
string createLab = " CREATE TABLE chemlab.lab (				//table called lab in the chemlab schema
         labPK      	VARCHAR(20) PRIMARY KEY,
         LabName      	VARCHAR2(20),
         Meta-Data      VARCHAR2(20))
   TABLESPACE ;//specify a space to store the table 
   STORAGE ( INITIAL 50K);"  //specify an amount of storage for the table, if desired.  otherwise, delete this line
   
string createLabData = "CREATE TABLE chemlab.lab_data(
	labDataPK	VARCHAR(20) PRIMARY KEY,
	lab_pk		VARCHAR2(20) CONSTRAINT fk_lab  FOREIGN KEY labPK,
	user_pk		VARCHAR2(20) CONSTRAINT fk_username  FOREIGN KEY userPK,	//"userPK" is a placeholder for the actual key
	course_pk	VARCHAR2(20) CONSTRAINT fk_course  FOREIGN KEY coursePK,	//same as previous
	dataset1	CLOB,
	dataset2	CLOB,
	status		NUMBER(1) DEFAULT 0)
	TABLESPACE ;//specify a space to store the table 
   	STORAGE ( INITIAL 50K);"  //specify an amount of storage for the table, if desired.  otherwise, delete this line
   

	     
}
