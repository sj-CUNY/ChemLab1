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
	
				<bbNG:breadcrumb title="Home" href="welcome_s.jsp?course_id=@X@course.pk_string@X@&user_id=@X@user.pk_string@X@"/>
			<bbNG:breadcrumb> Home Page </bbNG:breadcrumb>
		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar>
			Welcome to YC Chem Labs
		</bbNG:pageTitleBar>
	</bbNG:pageHeader>
<html>
	<head>
    	<script>
     	
    	function callLab1 () {
		window.open("lab0_1.jsp") 		
		}		
    	
        function callLab2 () {
		window.open("lab0_2.jsp")
		}	    	
    	</script>
	</head>
	 <br>
	 <br>
	 <br>
	<body>
	<div style="text-align: left">
    <form method="post" action="lab0_1.jsp?course_id=${ctx.courseId.externalString}&user_id=${ctx.userId.externalString}"> 
    	<input type="submit" id="lab1" value="lab 1"/>
    </form>
    </div>
	 <br>
	 <br>
	 <br>
    <div style="text-align: left">
    <form method="post" action="lab0_2.jsp?course_id=${ctx.courseId.externalString}&user_id=${ctx.userId.externalString}"> 
    	<input type="submit" id="lab2" value="lab 2"/>
    </form>
	</div>	    
	</body>
</html>
</bbNG:learningSystemPage>
