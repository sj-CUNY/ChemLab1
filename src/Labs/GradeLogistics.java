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
import blackboard.data.course.CourseMembership;
import blackboard.data.gradebook.Lineitem;
import blackboard.data.gradebook.Lineitem.AssessmentLocation;
import blackboard.data.gradebook.Score;
import blackboard.data.gradebook.impl.Attempt;
import blackboard.data.gradebook.impl.Outcome;
import blackboard.persist.gradebook.ext.AttemptDbPersister;
import blackboard.persist.gradebook.impl.AttemptDbLoader;
import blackboard.db.BbDatabase;
import blackboard.db.ConnectionManager;
import blackboard.db.ConnectionNotAvailableException;
import blackboard.persist.BbPersistenceManager;
import blackboard.persist.Id;
import blackboard.persist.KeyNotFoundException;
import blackboard.persist.PersistenceException;
import blackboard.persist.gradebook.LineitemDbLoader;
import blackboard.persist.gradebook.LineitemDbPersister;
import blackboard.persist.gradebook.ScoreDbLoader;
import blackboard.persist.gradebook.ScoreDbPersister;
import blackboard.platform.context.Context;
import blackboard.platform.persistence.PersistenceService;
import blackboard.platform.persistence.PersistenceServiceFactory;
import blackboard.platform.plugin.PlugInUtil;

/**
 * @author SJ
 *
 */
 public class GradeLogistics {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(GradeLogistics.class.getName());

	/*
	 * public GradeLogistics() {
	 * 
	 * contextManager = ContextManagerFactory.getInstance(); ctx =
	 * contextManager.getContext() ;
	 * 
	 * currentUser = ctx.getUser() ;
	 * 
	 * currUserId = currentUser.getId().toExternalString(); courseid =
	 * ctx.getCourse().getId().toExternalString(); LOGGER.info("init - Userid "
	 * + currUserId); LOGGER.info("init - Courseid " + courseid);
	 * 
	 * }
	 */

	public GradeLogistics() {

	}

	// Use this function only if you know what you are doing
	public void delete(String labname) {
		ConnectionManager cManager = null;
		Connection conn = null;

		try {
			cManager = BbDatabase.getDefaultInstance().getConnectionManager();
			conn = cManager.getConnection();
			StringBuffer queryString = new StringBuffer("");
			queryString.append("DROP TABLE " + labname + " PURGE");

			PreparedStatement deleteQuery = conn.prepareStatement(queryString
					.toString());
			deleteQuery.executeUpdate();
			PreparedStatement deleteSeq = conn
					.prepareStatement("DROP SEQUENCE " + labname + "_seq");
			deleteSeq.executeUpdate();

			LOGGER.info("dropped all tables");
		} catch (java.sql.SQLException sE) {

			LOGGER.error(sE.getMessage());
			sE.printStackTrace();

		} catch (ConnectionNotAvailableException cE) {

			LOGGER.error(cE.getMessage());
			cE.printStackTrace();

		} finally {
			if (conn != null) {
				cManager.releaseConnection(conn);
			}
		}
	}

	public void createTrigger(String labname) {
		ConnectionManager cManager = null;
		Connection conn = null;

		try {
			cManager = BbDatabase.getDefaultInstance().getConnectionManager();
			conn = cManager.getConnection();
			StringBuffer queryString = new StringBuffer("");
			/*
			 * queryString.append("CREATE OR REPLACE TRIGGER  " + labname +
			 * "_trig BEFORE INSERT ON " + labname +
			 * " FOR EACH ROW WHEN (new.pk1 IS NULL) ");
			 * queryString.append("BEGIN SELECT " + labname +
			 * "_seq.NEXTVAL INTO :new.pk1 FROM dual; END;" +
			 * "	 / ALTER TRIGGER " + labname + "_trig ENABLE" );
			 */
			queryString.append("CREATE OR REPLACE TRIGGER  " + labname
					+ "_trig BEFORE INSERT ON " + labname + " FOR EACH ROW ");
			queryString.append("BEGIN :new.pk1 := " + labname
					+ "_seq.nextval;  END;" + "	 / ALTER TRIGGER " + labname
					+ "_trig ENABLE");

			LOGGER.info(queryString.toString());
			Statement trigQuery = conn.createStatement();
			trigQuery.executeQuery(queryString.toString());
			LOGGER.info("make trigger " + labname);

		} catch (java.sql.SQLException sE) {

			LOGGER.error(sE.getMessage());
			sE.printStackTrace();

		} catch (ConnectionNotAvailableException cE) {

			LOGGER.error(cE.getMessage());
			cE.printStackTrace();

		} finally {
			if (conn != null) {
				cManager.releaseConnection(conn);
			}
		}
	}

	public void initGradeLogistics(Context ctx, String tablename) {
		Helper h = new Helper();
		loadCourseMembership(ctx, h.fetchRoster(ctx), tablename);
	}


	private void loadCourseMembership(Context ctx,
			List<CourseMembership> roster, String labname) {
		ConnectionManager cManager = null;
		Connection conn = null;

		StringBuilder q = new StringBuilder();
		String columns;
		try {
			cManager = BbDatabase.getDefaultInstance().getConnectionManager();
			conn = cManager.getConnection();
			ResultSet rSet = null;
			ResultSetMetaData rsMeta = null;
			int columnCount = 0;
			Helper h = new Helper();

			for (int i = 0; i < roster.size(); ++i) {
				String uid = "";
				uid = roster.get(i).getUserId().toExternalString();
				StringBuffer queryString = new StringBuffer("");
				rSet = h.exists(conn, uid, ctx.getCourse().getId()
						.toExternalString(), labname);
				rsMeta = rSet.getMetaData();

				if (!(rSet.next())) {
					LOGGER.info("Did not find userid " + uid);
					int pk1 = h.nextVal(labname);
					queryString.append("INSERT INTO " + labname + " ( ");
					columns = h.buildColumnString(rsMeta).toString();

					queryString.append(columns + " ) " + "VALUES ( ");
					// String pk = labname.trim()+"_seq.nextval";
					// queryString.append(pk);

					columnCount = rsMeta.getColumnCount();
					q = h.qMarks(columnCount, 0);// Start from 0 or 1
					queryString.append(q);
					LOGGER.info("INSERT string " + queryString.toString());
					PreparedStatement insertQuery = conn.prepareStatement(
							queryString.toString(),
							PreparedStatement.RETURN_GENERATED_KEYS);
					insertQuery.setInt(1, pk1);
					insertQuery.setString(2, uid);
					insertQuery.setString(3, ctx.getCourse().getId()
							.toExternalString());
					String temp = "0";
					for (int j = 4; j <= columnCount; j++) {
						insertQuery.setString(j, temp);
					}

					insertQuery.executeUpdate();
					insertQuery.close();

				} else {
					StringBuilder debug = new StringBuilder();
					for (int j = 1; j < rsMeta.getColumnCount(); ++j)
						debug.append(rSet.getString(j) + ",");

					// LOGGER.info("membership " + debug.toString());
				}

			}

		} catch (java.sql.SQLException sE) {

			LOGGER.error(sE.getMessage());
			sE.printStackTrace();

		} catch (ConnectionNotAvailableException cE) {

			LOGGER.error(cE.getMessage());
			cE.printStackTrace();

		} finally {
			if (conn != null) {
				cManager.releaseConnection(conn);
			}
		}
	}

	public Id makeLineItem(String labname, String jspname,  int pointsPossible,
			Context ctx) throws KeyNotFoundException, PersistenceException {
		Lineitem assignment = null;
		try {
			String url = PlugInUtil.getUri("ycdb", "LabDebug", jspname); 
			assignment = getLineItem(labname, ctx.getCourseId());

			if (assignment == null) {
				LOGGER.info("No matching lineitem, create a new one url " + url);
				assignment = new Lineitem();
				assignment.setCourseId(ctx.getCourseId());
				assignment.setName(labname);
				assignment.setPointsPossible(pointsPossible);
				assignment.setType(labname);
				assignment.setIsAvailable(true);
				assignment.setDateAdded();
				assignment.setAssessmentId(labname, AssessmentLocation.EXTERNAL);
				assignment.setAttemptHandlerUrl(url);
				LineitemDbPersister linePersister = LineitemDbPersister.Default
						.getInstance();
				linePersister.persist(assignment);
				 LOGGER.info("LineItem id is " + assignment.getId());

			} else {
 				LOGGER.info("Found lineItem " + assignment.getName());

			}
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
			e.printStackTrace();

		}
		if (assignment != null)
			return assignment.getId();
		else
			return null;
	}
 
	public void deleteLineItem(String labname, Id courseId)
	{
		Lineitem l = getLineItem(labname, courseId);
		if (l == null)
		{
			LOGGER.info("Cannot find line item");
			return;
		}
			
		try {
			LineitemDbPersister linePersister = LineitemDbPersister.Default.getInstance(); 
			LOGGER.info("Deleting lineitem="+l.getId());
			linePersister.deleteById(l.getId());

		} catch (PersistenceException e) {
 			e.printStackTrace();
		}
		return;
	}
	
	public Lineitem getLineItem(String labname, Id courseId) {
		PersistenceService bpService = PersistenceServiceFactory.getInstance();
 		BbPersistenceManager bpManager = bpService.getDbPersistenceManager();
		LineitemDbLoader loader = null;
		try {
			loader = (LineitemDbLoader) bpManager
					.getLoader(LineitemDbLoader.TYPE);
		} catch (PersistenceException e) {
 			e.printStackTrace();
		}
		
		List<Lineitem> lItems = null;
		try {
			lItems = loader.loadByCourseId(courseId);
		} catch (PersistenceException e) {
 			e.printStackTrace();
		}
 		ListIterator<Lineitem> listIterator = lItems.listIterator();
		Lineitem l = null;
		while (listIterator.hasNext()) {
			l = listIterator.next();
	    //LOGGER.info("lineitem id " + l.getId() );
	    //LOGGER.info("lineitem assessment id " + l.getAssessmentId());
		//LOGGER.info("labname " + labname);
			if (l != null && l.getAssessmentId() != null
					&& l.getAssessmentId().toString().equals(labname))
			{
				return l;
			}
		}
		return null;
	}

	/*
	 * private void addStudentAttempts2(Context ctx, String labname, Id id)
	 * throws PersistenceException, ValidationException { PersistenceService
	 * bpService = null; BbPersistenceManager bpManager = null;
	 * List<CourseMembership> crsMembership ;
	 * 
	 * bpService = PersistenceServiceFactory.getInstance() ;
	 * 
	 * bpManager = bpService.getDbPersistenceManager(); crsMembership =
	 * fetchRoster(ctx); Score s = null; ListIterator<CourseMembership> cList =
	 * crsMembership.listIterator(); while(cList.hasNext()) { CourseMembership
	 * cm = cList.next(); if
	 * (cm.getUserId().toExternalString().equals(ctx.getUserId
	 * ().toExternalString()))// && cm.getRole() ==
	 * CourseMembership.Role.STUDENT) { Attempt attempt = new Attempt();
	 * FormattedText fText = new FormattedText(
	 * "/blackboard/webapps/YCDB-Lab%20Debug-BBLEARN/index.jsp?course_id="
	 * +cm.getCourseId
	 * ().toExternalString()+"&user_id="+cm.getUserId().toExternalString
	 * (),FormattedText.Type.HTML); attempt.setStudentSubmission(fText);
	 * attempt.setOutcomeId(); AttemptDbPersister adb = (AttemptDbPersister)
	 * bpManager.getPersister( AttemptDbPersister.TYPE ); adb.persist(attempt);
	 * } } return; }
	 */

	private CourseMembership getCourseMembership(Context ctx, Id userId) {
		// TODO Auto-generated method stub
		return getCourseMembership(ctx,userId.toExternalString());
	}

	private CourseMembership getCourseMembership(Context ctx, String uid)
   {
	   List<CourseMembership> crsMembership; 
	   Helper h = new Helper();
	   crsMembership = h.fetchRoster(ctx);
	   ListIterator<CourseMembership> cList = crsMembership.listIterator();
	   CourseMembership cm = null;
	   while (cList.hasNext()) 
	   {

		   cm = cList.next();
		   if (cm.getUserId().toExternalString()
					.equals(uid))// &&
																// cm.getRole()
																// ==
																// CourseMembership.Role.STUDENT)
			{
			  break;
			}
	   }
	   return cm;
   }
   protected void clearAttempt(Context ctx, String uid, 	
                Lineitem lineitem) throws KeyNotFoundException,
            	PersistenceException, ValidationException 
   {
	   Score s = null;
 	   CourseMembership cm = getCourseMembership(ctx, uid);
 	   LOGGER.info("clearStudentAttempt for " + cm.getId().toExternalString() + " lineitem " + lineitem.getId().toExternalString());
 	   s = ScoreDbLoader.Default.getInstance().loadByCourseMembershipIdAndLineitemId(cm.getId(), lineitem.getId());
 	  if (s == null)
	   {	
 		 LOGGER.info("clearStudentAttempt - NO score to clear");
	   }
 	  else
 	  {
 		/* Outcome outcome = s.getOutcome(); 
 		 Attempt attempt = AttemptDbLoader.Default.getInstance().loadById(
					outcome.getLastAttemptId());
    	  AttemptDbPersister.Default.getInstance().deleteById(attempt.getId());
*/
 		 ScoreDbPersister.Default.getInstance().deleteById(s.getId());
  		 LOGGER.info("clearedStudentAttempt - success");

 	  }
	   
   }
	protected void addStudentAttempts(Context ctx, String labname, String jspname,
			Lineitem lineitem) throws KeyNotFoundException,
			PersistenceException, ValidationException 
	{
 		Score s = null;
  		CourseMembership cm = getCourseMembership(ctx, ctx.getUserId());
		 	
		String url = PlugInUtil.getUri("ycdb", "LabDebug",
						jspname+"?course_id=" + cm.getCourseId().toExternalString() + "&user_id="
								+ cm.getUserId().toExternalString());
	   LOGGER.info("addStudentAttempt " + labname + " " + url);
	   s = ScoreDbLoader.Default.getInstance().loadByCourseMembershipIdAndLineitemId(cm.getId(), lineitem.getId());
	   if (s == null)
	   {	
		  s = new Score();
		  s.setDateAdded();
		}

		Outcome outcome = s.getOutcome();
		Attempt attempt;

		if (outcome.getAttemptCount() == 0) 
		{
		    lineitem.setAttemptHandlerUrl(url);
			lineitem.setAssessmentId("user_id="
			      			+ ctx.getUser().getId().toExternalString(), Lineitem.AssessmentLocation.EXTERNAL);

			s.setLineitemId(lineitem.getId());
			// LOGGER.info("Course is " + cm.getCourseId());
					 
			s.setCourseMembershipId(cm.getId());

			attempt = outcome.createAttempt();
			if (attempt == null) 
			{
				throw new IllegalStateException(
								"could not create attempt");
			}
			attempt.setOutcomeId(outcome.getId());

			attempt.setStatus(Attempt.Status.NEEDS_GRADING);
			attempt.setAttemptedDate(Calendar.getInstance());
			AttemptDbPersister.Default.getInstance().persist(attempt);
			s.setAttemptId(attempt.getId(), Score.AttemptLocation.EXTERNAL);
 			ScoreDbPersister.Default.getInstance().persist(s);
			LOGGER.info("New attempt created");


		} 
		else 
		{
			attempt = AttemptDbLoader.Default.getInstance().loadById(
							outcome.getLastAttemptId());//highest score etc.
			LOGGER.info("Cannot create duplicate attempts");
					
		}

		return;
	}


  }
