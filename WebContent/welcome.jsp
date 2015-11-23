<%@ page language="java" contentType="text/html; charset=UTF-8"
 import="java.util.*, 
blackboard.platform.session.*, 
blackboard.data.user.*, 
blackboard.persist.*,
blackboard.persist.user.*,
blackboard.data.course.*,
blackboard.persist.course.*,
blackboard.data.gradebook.Lineitem.*,
blackboard.persist.gradebook.LineitemDbPersister"
 pageEncoding="UTF-8"%> 
 <%@ page import="Labs.Labs" %>
 
 <%@ taglib uri="/bbUI" prefix="bbUI" %> 
 <%@ taglib uri="/bbData" prefix="bbData"%> 
 <%@ taglib uri="/bbNG" prefix="bbNG"%>
 <%@ taglib prefix="ng" uri="/bbNG" %>
 
<%@ page import="blackboard.data.gradebook.Lineitem" %>
<%@ page import="blackboard.persist.gradebook.LineitemDbPersister" %>

 <%@ taglib uri="/bbUI" prefix="bbUI" %> 
 <%@ taglib uri="/bbData" prefix="bbData"%> 
 <%@ taglib uri="/bbNG" prefix="bbNG"%>
 <% 



 %> 
 
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
  
<%---


try {
    Lineitem assignment = new Lineitem();
	out.println("<p> test try");
    assignment.setCourseId(ctx.getCourseId());
    assignment.setName("Lab 1");
    assignment.setPointsPossible(100);
    assignment.setType("Lab 1");
    assignment.setIsAvailable(true);
    assignment.setDateAdded();

    LineitemDbPersister linePersister = LineitemDbPersister.Default.getInstance();
    linePersister.persist(assignment);
    out.println("<p>check the gradecenter");
	} 
  
  catch (Exception e) {
    out.println("<p>" + e.getClass().getSimpleName() + ": " + e.getMessage());
    out.println("<p>check the tomcat logfiles");
    e.printStackTrace();

  }


--%>


     <script>
        function enableButton2() {
        	document.getElementById("button2").disabled = false;

        	out.println("<p> test try")

        	
        }
    </script>

<script>
		function callLab1 () {
			window.open("index.jsp") 
		//	window.open("create.jsp")
		
		}
	

</script>
 
 <form method="post" action="${pageContext.request.contextPath}/Labs" > 
    <input type="submit" id="button1" value="Activate" onclick=enableButton2() />  
 </form>
<form method="post" action="index.jsp?course_id=${ctx.courseId.externalString}&user_id=${ctx.userId.externalString}"> 
    <input type="submit" id="button2" value="lab 1"/>
</form>

<br>
		<form action="welcome" method="post">
		<input type="submit" value="Lab 2">
		</form>
<br>
		<form action="welcome" method="post">	
			<input type="submit" value="Lab 3">
		</form>
<br>
<br>
<br>
		<form action="welcome" method="post">
			<input type="submit" value="Lab n">
		</form>

	</html>

</bbNG:learningSystemPage>
