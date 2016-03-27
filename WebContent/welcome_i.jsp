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
blackboard.persist.course.*,
blackboard.data.gradebook.Lineitem.*,
blackboard.persist.gradebook.LineitemDbPersister"
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
		<bbNG:breadcrumbBar environment="COURSE" navItem="ycdb-chem109-nav-LabDebug" >
				<bbNG:breadcrumb title="Home" href="welcome_i.jsp?course_id=@X@course.pk_string@X@&user_id=@X@user.pk_string@X@"/>
 		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar>
			Welcome to Chem 109 - Choose one of the labs below.
		</bbNG:pageTitleBar>
	</bbNG:pageHeader>
<%
	String button = "";

	User u = ctx.getUser();
	Course c = ctx.getCourse();
	String courseName = c.getCourseId();

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
	String crsMembershipRoleStr = crsMembershipRole.toString();
	boolean roleInstructor = false;
 
	if (crsMembershipRole == CourseMembership.Role.INSTRUCTOR)
	{
		roleInstructor = true;
	}	 
%>
<%
    button = request.getParameter("button");
 if (button != null && roleInstructor==true)
    {
		GradeLogistics gl = new GradeLogistics();

        if (button.equals("ActivateLab1"))
        {
   		gl.initGradeLogistics(ctx, "ycdb_chemistrylab1");
		gl.makeLineItem("ycdb_chemistrylab1", "lab0_1.jsp", 100, ctx);
 
	 	}
        else if (button.equals("ActivateLab2"))
        {
   		gl.initGradeLogistics(ctx, "ycdb_chemistrylab2");
		gl.makeLineItem("ycdb_chemistrylab2", "lab0_2.jsp", 100, ctx);
 
        }
        else if (button.equals("deletelab1"))
        {
	   		gl.delete("ycdb_chemistrylab1");
		 	gl.delete("ycdb_chemistrylab2");
		 	gl.delete("ycdb_chemistrylab3");
	   		gl.delete("ycdb_chemlab_logistics");
 			
			//int val = gl.nextVal("ycdb_chemistrylab1");
        }
        else if (button.equals("deletelines"))
        {
        	gl.deleteLineItem("ycdb_chemistrylab1", c.getId() ); 
		 	gl.deleteLineItem("ycdb_chemistrylab2", c.getId() ); 
	   		
        }
        else
        {
            button = "";
        }
    }
%>
<html>
	<head>
    	<script>
        function ActivateLab1() {
        document.getElementById("Lab1").disabled = false;
        out.println("<p> test try")
		}
   		
   		function ActivateLab2() {
   		document.getElementById("Lab2").disabled = false;
		}
		
    	function callLab1 () {
		window.open("lab0_5.jsp"); 		
		}		
	
        function callLab2 () {
		window.open("lab2.jsp")
		}	    			
    	</script>
	</head>
	<body>
	<p>User Information</p>  
  	<p style="margin-left:10px">
  		Name: <%= u.getUserName()%> <br />   
  		Student Id: <%= u.getId().toExternalString()%> <br />   
  		Batch UID: <%= u.getBatchUid()%> <br /> 			  
 		Course Role: <%= crsMembershipRoleStr%> <br />
 	</p>  
		
	<div style="text-align: left">
		
    <form method="post" action="welcome_i.jsp?course_id=${ctx.courseId.externalString}"> 
    	<input type="submit" name="button" id="ActivateLab1" value="ActivateLab1"   />
    	</form>
    <form method="post" action="lab0_1i.jsp?course_id=${ctx.courseId.externalString}&user_id=${ctx.userId.externalString}"> 
        <input type="submit" id="lab1" value="Lab1"/>
    </form>
     <form method="post" action="welcome_i.jsp?course_id=${ctx.courseId.externalString}"> 
    	<input type="submit" name="button" id="deletelab1" value="deletelab1"   />
    	</form>
     <form method="post" action="welcome_i.jsp?course_id=${ctx.courseId.externalString}"> 
    	<input type="submit" name="button" id="deletelines" value="deletelines"   />
    	</form>
    	 </div>
<br>
<br>
<br>
    <div style="text-align: left">

    <form method="post" action="welcome_i.jsp?course_id=${ctx.courseId.externalString}"> 
		<input type="submit" name="button" id="ActivateLab2" value="ActivateLab2" />
	</form>
    <form method="post" action="lab0_2.jsp?course_id=${ctx.courseId.externalString}&user_id=${ctx.userId.externalString}"> 
        <input type="submit" id="lab2" value="lab 2"/>
    </form>
    
	</div>	
	<br>	
	</body>
</html>
</bbNG:learningSystemPage>
