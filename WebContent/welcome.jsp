<%@ page import="java.io.*,java.util.*" %>
  
<%@ page language="java" contentType="text/html; charset=UTF-8"
 import="java.util.*, 
blackboard.platform.session.*, 
blackboard.data.user.*, 
blackboard.persist.*,
blackboard.persist.BbPersistenceManager,
blackboard.platform.persistence.PersistenceService,
blackboard.platform.persistence.PersistenceServiceFactory,
blackboard.persist.user.*,
blackboard.data.course.*,
blackboard.persist.course.*"
 pageEncoding="UTF-8"%> 
  <%@ page import="Labs.GradeLogistics" %>
 
 <%@ taglib uri="/bbUI" prefix="bbUI" %> 
 <%@ taglib uri="/bbData" prefix="bbData"%> 
 <%@ taglib uri="/bbNG" prefix="bbNG"%>
 <%@ taglib prefix="ng" uri="/bbNG" %>
 
<%@ page import="blackboard.data.gradebook.Lineitem" %>
<%@ page import="blackboard.persist.gradebook.LineitemDbPersister" %>

 <%@ taglib uri="/bbUI" prefix="bbUI" %> 
 <%@ taglib uri="/bbData" prefix="bbData"%> 
 <%@ taglib uri="/bbNG" prefix="bbNG"%>
 <bbNG:learningSystemPage 
	title="Welcome To Blackboard Building Block Development - Course Information"
	ctxId="ctx">

	<bbNG:pageHeader>
		<bbNG:breadcrumbBar environment="COURSE" >
				<bbNG:breadcrumb title="Home" href="welcome.jsp?course_id=${ctx.courseId.externalString}" />
 		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar>
			Welcome to to Chem 109 Choose one of the labs below.
		</bbNG:pageTitleBar>
	</bbNG:pageHeader>
  
<% 

	User u = ctx.getUser();;
	Course c = ctx.getCourse();
	
	//get the course name string
	//check course name string contains YRK01_CHEM
	String courseName = c.getCourseId();
	//If not, redirect to message.jsp
	
  if(!courseName.contains("YRK01_CHEM"))
  {	  
   	String site = new String("message.jsp?course_id="+c.getId().getExternalString());
   	response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY );
   	response.setHeader("Location", site); 
  }
  else
  {	  
	
	// get the membership data to determine the User's Role
	CourseMembership crsMembership = null;
	CourseMembershipDbLoader crsMembershipLoader = null;
	PersistenceService bbPm = PersistenceServiceFactory.getInstance() ;
    BbPersistenceManager bpManager = bbPm.getDbPersistenceManager();
 
	String errMsg = null;
	crsMembershipLoader = (CourseMembershipDbLoader)bpManager.getLoader(CourseMembershipDbLoader.TYPE);
	
	try {
		crsMembership = crsMembershipLoader.loadByCourseAndUserId(c.getId(), u.getId());
	} catch (KeyNotFoundException e) {
			// There is no membership record.
			errMsg = "There is no membership record. Better check this out:" + e;
	} catch (PersistenceException pe) {
			// There is no membership record.
			errMsg = "An error occured while loading the User. Better check this out:" + pe;
	}
	CourseMembership.Role crsMembershipRole = crsMembership.getRole();
	 
 	if (crsMembershipRole == CourseMembership.Role.INSTRUCTOR)
	{
		
	 	   String site = new String("welcome_i.jsp?course_id="+c.getId().getExternalString());
		   response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY );
		   response.setHeader("Location", site); 
	}
	 			
	
 	else if (crsMembershipRole == CourseMembership.Role.STUDENT)
	{
	 	   String site = new String("welcome_s.jsp?course_id="+c.getId().getExternalString());
		   response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		   response.setHeader("Location", site); 
 
	}
  }
%>
</bbNG:learningSystemPage>
