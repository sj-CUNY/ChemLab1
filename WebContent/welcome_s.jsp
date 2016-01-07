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
		<bbNG:breadcrumbBar environment="COURSE"
			navItem="course_plugin_manage" >
				<bbNG:breadcrumb title="Home" href="welcome.jsp?course_id=${ctx.courseId.externalString}" />
			<bbNG:breadcrumb> Welcome Page </bbNG:breadcrumb>
		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar>
			Welcome to to Chem 109 Choose one of the labs below.
		</bbNG:pageTitleBar>
	</bbNG:pageHeader>
  

<%
	String button = "";


	User u = ctx.getUser();
	Course c = ctx.getCourse();
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
 
	if (crsMembershipRole == CourseMembership.Role.STUDENT)
	{
		roleInstructor = false;

	}
	 
%>
<%
    button = request.getParameter("button");
 if (button != null && roleInstructor==true)
    {
		GradeLogistics gl = new GradeLogistics();

        if (button.equals("ActivateLab1"))
        {
   		gl.initGradeLogistics("ycdb_chemistrylab1");
		gl.makeLineItem("ycdb_chemistrylab1", 100, gl.getContext());
 
	 	}
        else if (button.equals("ActivateLab2"))
        {
   		gl.initGradeLogistics("ycdb_chemistrylab2");
		gl.makeLineItem("ycdb_chemistrylab2", 100, gl.getContext());
 
        }
        else if (button.equals("ActivateLab3"))
        {
           	gl.initGradeLogistics("ycdb_chemistrylab3");
		gl.makeLineItem("ycdb_chemistrylab3", 100, gl.getContext());
 
        }
        else if (button.equals("ActivateLab4"))
        {
             	gl.initGradeLogistics("ycdb_chemistrylab4");
		gl.makeLineItem("ycdb_chemistrylab4", 100, gl.getContext());
 
        }
        else if (button.equals("ActivateLab5"))
        {

 		gl.initGradeLogistics("ycdb_chemistrylab5");
		gl.makeLineItem("ycdb_chemistrylab5", 100, gl.getContext());
 
        }
        else if (button.equals("ActivateLab6"))
        {
            	gl.initGradeLogistics("ycdb_chemistrylab6");
		gl.makeLineItem("ycdb_chemistrylab6", 100, gl.getContext());
 
        }
        else if (button.equals("ActivateLab7"))
        {
            	gl.initGradeLogistics("ycdb_chemistrylab7");
		gl.makeLineItem("ycdb_chemistrylab7", 100, gl.getContext());
 
        }
        else if (button.equals("deletelab1"))
        {
	   		/*gl.delete("ycdb_chemistrylab1");
		 	gl.delete("ycdb_chemistrylab2");
		 	 
	   		gl.delete("ycdb_chemistrylab3");
	   		gl.delete("ycdb_chem109_logistics");
			*/
			//int val = gl.nextVal("ycdb_chemistrylab1");
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
		
     <form method="post" action="index.jsp?course_id=${ctx.courseId.externalString}&user_id=${ctx.userId.externalString}"> 
        <input type="submit" id="lab1" value="lab 1"/>
    </form>
    
    	 </div>
<br>
<br>
<br>
    <div style="text-align: left">

    <form method="post" action="lab2.jsp?course_id=${ctx.courseId.externalString}&user_id=${ctx.userId.externalString}"> 
        <input type="submit" id="lab2" value="lab 2"/>
    </form>
    
	</div>	
<br>
<br>
<br>
	 <form method="post" action="lab3.jsp?course_id=${ctx.courseId.externalString}&user_id=${ctx.userId.externalString}"> 
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



