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
 <%@ page import="Labs.Labs" %>
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
			<bbNG:breadcrumb> Welcome Page </bbNG:breadcrumb>
		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar>
			Welcome to to Chem 109 Choose one of the labs below.
		</bbNG:pageTitleBar>
	</bbNG:pageHeader>
  

  
<html>
	<head>
    	<script>
     	
    	function callLab1 () {
		window.open("index.jsp") 		
		}		
	

        function callLab2 () {
		window.open("lab2.jsp")
		}	
	

         function callLab3 () {
		window.open("lab3.jsp")
		}	
	
		
         function callLab4 () {
		window.open("lab4.jsp")
		}	

	     function callLab5 () {
		window.open("lab5.jsp")
		}	

          function callLab6 () {
		window.open("lab6.jsp")
		}	
	
          function callLab7 () {
		window.open("lab7.jsp")
		}
	
         function callLab8 () {
		window.open("lab8.jsp")
		}
	
         function callLab9 () {
		window.open("lab9.jsp")
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
<br>
<br>
<br>
	 <form method="post" action="lab0_3.jsp?course_id=${ctx.courseId.externalString}&user_id=${ctx.userId.externalString}"> 
        <input type="submit" id="lab3" value="lab 3"/>
    </form>
    
		
<br>
<br>
<br>
		
     	<input type="submit" name="button" id="Lab4" value="lab 4" disabled onclick="callLab4()"/>
		
<br>
<br>
<br>
		
	 	<input type="submit" name="button" id="Lab5" value="lab 5" disabled onclick="callLab5()"/>
		
<br>
<br>
<br>
		
	 	<input type="submit" name="button" id="Lab6" value="lab 6" disabled onclick="callLab6()"/>
		
<br>
<br>
<br>
		
     	<input type="submit" name="button" id="Lab7" value="lab 7" disabled onclick="callLab7()"/>
		
<br>
<br>
<br>
		
	 	<input type="submit" name="button" id="Lab8" value="lab 8" disabled onclick="callLab8()"/>
		
<br>
<br>
<br>
		
	 	<input type="submit" name="button" id="Lab9" value="lab 9" disabled onclick="callLab9()"/>
		</body>
<br>
<br>
<br>
	</html>

</bbNG:learningSystemPage>



