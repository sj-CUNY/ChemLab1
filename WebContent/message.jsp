<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%> 
  
 <%@ taglib uri="/bbUI" prefix="bbUI" %> 
 <%@ taglib uri="/bbData" prefix="bbData"%> 
 <%@ taglib uri="/bbNG" prefix="bbNG"%>
 <%@ taglib prefix="ng" uri="/bbNG" %>
  
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
			Permission Denied
		</bbNG:pageTitleBar>
	</bbNG:pageHeader>
  
<html>
	<head>
  	</head>
<br>
<br>
<br>
		<body>
		<p > This tool is available only to York College Chemistry lab courses. </p>
	</body>	
 </html>

</bbNG:learningSystemPage>