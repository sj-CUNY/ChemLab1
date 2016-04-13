package Labs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import blackboard.data.ValidationException;
import blackboard.data.course.CourseMembership;
import blackboard.data.gradebook.Lineitem;
import blackboard.data.user.User;
import blackboard.db.BbDatabase;
import blackboard.db.ConnectionManager;
import blackboard.db.ConnectionNotAvailableException;
import blackboard.persist.PersistenceException;
import blackboard.platform.context.Context;
import blackboard.platform.context.ContextManager;
import blackboard.platform.context.ContextManagerFactory;

public class DataPersister {
   
	private static final Logger LOGGER = LoggerFactory.getLogger(DataPersister.class.getName() );
    
	ContextManager contextManager ;
	Context ctx ;
	User user ;
	StringBuilder sb;
    String userid ;
    String courseid;
    
	StringBuffer queryString;
    String labname = null;
	Labs labs;
	
   public DataPersister(String labname)
    {
    	contextManager = ContextManagerFactory.getInstance();
    	ctx = contextManager.getContext() ;
    	user = ctx.getUser() ;
    	labs = new Labs(ctx, labname);
        userid = user.getId().toExternalString();
        courseid = ctx.getCourseId().toExternalString();
    	queryString = new StringBuffer("");
        //LOGGER.info("init - Userid " + userid);
        //LOGGER.info("init - Courseid " + courseid);
    	sb = new StringBuilder();
    	this.labname = labname;
//Temporary code for debug
    // 	GradeLogistics gl = new GradeLogistics(ctx);
     //	gl.initGradeLogistics(labname);

    }
	 
   public DataPersister(Context ctx , String labname)
   {
    this.ctx = ctx ;
   	user = ctx.getUser() ;
   	labs = new Labs(ctx, labname);
       userid = user.getId().toExternalString();
       courseid = ctx.getCourseId().toExternalString();
   	queryString = new StringBuffer("");
       //LOGGER.info("init - Userid " + userid);
       //LOGGER.info("init - Courseid " + courseid);
   	sb = new StringBuilder();
   	this.labname = labname;
//Temporary code for debug
    	GradeLogistics gl = new GradeLogistics(ctx);
    	gl.initGradeLogistics(labname);

   }
   
	public boolean saveData (String courseID, String userID, String labName, String dataset, int type) {
        boolean saveResult = true;
		//StringBuilder columns = new StringBuilder();
 		StringBuffer queryString = new StringBuffer("");
        ConnectionManager cManager = null;
        Connection conn = null;
        StringBuffer debugString = new StringBuffer("");
        //LOGGER.info("Input is " + indata);
        try {
        	Helper h = new Helper();
            cManager = BbDatabase.getDefaultInstance().getConnectionManager();
            conn = cManager.getConnection();
            ResultSet rSet = h.exists(conn, userID, courseID, labName);
			ResultSetMetaData rsMeta = rSet.getMetaData();
			//int columnCount = rsMeta.getColumnCount();
			String[] tokens = h.removeNull(indata);
			
            if (!(rSet.next()))
            {
              int pk1 =  h.nextVal(labname);
               	
            	//We should never hae to insert because the roster should be already uploaded. 
	            queryString.append("INSERT INTO " +  labname  + " ( ");
	            //columns = h.buildColumnString(rsMeta, "GRADES");
	           //Insert blank for PK1
	           // queryString.append(columns.toString() + " ) VALUES ( ");      
	            //String qmarks = h.qMarks(columnCount,0).toString() ; 
	            
	  //          LOGGER.info(qmarks);
	    			
	            
	
 	            queryString.append(qmarks);
	            
	//            LOGGER.info(queryString.toString());
	            
				
	            PreparedStatement insertQuery = conn.prepareStatement(queryString.toString());
	          //need to change this to unique key
  	            insertQuery.setInt(1, pk1);
	            insertQuery.setString(2, userid);
	            insertQuery.setString(3, courseid);
	            
		            
	            for (int i=0; i < tokens.length; i++) {
	                insertQuery.setString((i + 4), tokens[i]);
//	                LOGGER.info(tokens[i]);
	            }          
	            LOGGER.info(insertQuery.toString());
	            int insertResult = insertQuery.executeUpdate();
	            
	            if(insertResult != 1){
	            	
	            	saveResult = false ;
	            	
	            }
	            
	            insertQuery.close();
            }
            else
            {

            	queryString.append("UPDATE chemlab.lab_data SET ");
            	if(type==0){
            		queryString.append("dataset0 = dataset, status = 1");
            	}
            	else if(type==1){
            		queryString.append("dataset1 = dataset, status = 2");
            	}
            	else if(type==2){
            		queryString.append("dataset2 = dataset");
            	}
            	else if(type==3){
            		queryString.append("dataset3 = dataset");
            	}
            	queryString.append("WHERE userID==user_pk && labName==labDataPK && courseID==course_pk")
            	/*int count = 0; 
            	String nextColumn = "";
            	LOGGER.info("token size is " + tokens.length);
    			
            	for (int j= 4; j <= rsMeta.getColumnCount(); ++j)
                {	 
                	 nextColumn = rsMeta.getColumnName(j);
                	 if (nextColumn.contains("GRADE"))
                	 {
                		 continue;
                			 
                	 }
                     queryString.append(nextColumn + "= ? ");
                     
                     if ( count < tokens.length-1)
                     {
                    	  queryString.append(",");
                	 }
            		else
            		{
            	//		LOGGER.info("query is " + queryString.toString());
            			break;
            		}
            		++count;
                */     
                }
            	
                 //insert where PK1 matches. 
 	            //queryString.append(" WHERE " + rsMeta.getColumnName(1) + " = " + rSet.getString(1));

//                 queryString.append(" WHERE " + rsMeta.getColumnName(2) + "= ? AND " + rsMeta.getColumnName(3) + "= ? ");
	        //    LOGGER.info(queryString.toString());
	
				
	            PreparedStatement updateQuery = conn.prepareStatement(queryString.toString());
 	        /*    LOGGER.info("Input string: " + indata);
	            LOGGER.info("Num columns: " + rsMeta.getColumnCount());
	            LOGGER.info("Num data: " + tokens.length);
	            LOGGER.info("Userid: " + userid);
	            LOGGER.info("Courseid: " + courseid);
 	         */
	          for (int i=0; i < tokens.length; i++) 
	           {
	         //       LOGGER.info("index at " + (i+1) + " token " + tokens[i]);   
	                updateQuery.setString((i + 1), tokens[i].trim());

	            }          
	            /*updateQuery.setString(tokens.length+1, userid);
	            debugString.append(userid+",");
	            
	            updateQuery.setString(tokens.length+2, courseid);
	            debugString.append(courseid);
	            */
	            //LOGGER.info(debugString.toString());
	            int updateResult = updateQuery.executeUpdate();
	            
	            if(updateResult != 1){
	            	
	            	saveResult = false ;
	            	
	            }
	            
	            updateQuery.close();
            	
            }
        } catch (java.sql.SQLException sE){
        	
        	saveResult = false ;

           	LOGGER.error( sE.getMessage());
           	LOGGER.error( debugString.toString());
            
           	sE.printStackTrace();

        } catch (ConnectionNotAvailableException cE){
        	
        	saveResult = false ;
        	
        	LOGGER.error( cE.getMessage() );
            cE.printStackTrace();
        } finally {
            if(conn != null){
                cManager.releaseConnection(conn);
            }
        }
        
        return saveResult;
	}
	


	public boolean submitGrades (String indata) {
        boolean saveResult = true;
/*		StringBuffer queryString = new StringBuffer("");
		String[] tokens = indata.split(",");
        ConnectionManager cManager = null;
        Connection conn = null;
        String columns = labs.getColumns();
        StringBuilder q = new StringBuilder();
        
        q = qMarks(columns.length()-1);
        
        String qmarks = q.toString();
		LOGGER.info(qmarks);

        try {
            cManager = BbDatabase.getDefaultInstance().getConnectionManager();
            conn = cManager.getConnection();

            queryString.append("INSERT INTO " + labname + " (");
            columns = columns.substring(rsMeta.getColumnName(1).length(), columns.length() );
            queryString.append(columns + " )");

            queryString.append(" VALUES ");
            queryString.append(qmarks);
			LOGGER.info(queryString.toString());

            PreparedStatement insertQuery = conn.prepareStatement(queryString.toString());
            
            for (int i=0; i < tokens.length; i++) {
                insertQuery.setString((i + 1), tokens[i]);
            }          

            int insertResult = insertQuery.executeUpdate();
            
            if(insertResult != 1){
                
            	saveResult = false ;
            	
            }
            
            insertQuery.close();

        } catch (java.sql.SQLException sE){
        	
        	saveResult = false ;
        	
        	LOGGER.error( sE.getMessage());
        	sE.printStackTrace();
        } catch (ConnectionNotAvailableException cE){
        	
        	saveResult = false ;
        	
        	LOGGER.error( cE.getMessage() );
        	cE.printStackTrace();
           
        } finally {
            if(conn != null){
                cManager.releaseConnection(conn);
            }
        }
  */      
		return saveResult;
	}


	public void saveGrade(String theString) {
		// TODO Auto-generated method stub
		
	}


	public void submitted( Context ctx) {
		// TODO Auto-generated method stub
		
		GradeLogistics gl = new GradeLogistics(ctx);
		Lineitem l = gl.getLineItem("yccs_chemistrylab1", ctx.getCourseId());
		if (l != null)
			try {
				gl.addStudentAttempts("yccs_chemistrylab1", l);
			} catch (PersistenceException | ValidationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		else
			LOGGER.error("This should not happen: cant find lineitem for this assignment");
	 
		 
	}
}
