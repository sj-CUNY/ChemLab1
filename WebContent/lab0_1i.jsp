<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab0_1Checks" %>
<%@ page import="Labs.GradeLogistics" %>
<%@ page import="Labs.Helper" %>
<%@ page import="blackboard.platform.context.Context" %>
<%@ page import="blackboard.platform.context.ContextManager" %>
<%@ page import="blackboard.platform.context.ContextManagerFactory" %>
<%@ page import="blackboard.data.user.User" %>
<%@ page import="blackboard.data.course.*" %>
<%@ page import="blackboard.persist.course.*" %>
<%@ page import="blackboard.platform.persistence.PersistenceService" %>
<%@ page import="blackboard.platform.persistence.PersistenceServiceFactory" %>
<%@ page import="blackboard.persist.BbPersistenceManager"%>
 <%@ page import="blackboard.persist.*"%>
 
<%@ page import="blackboard.data.gradebook.Lineitem" %>
<%@ page import="blackboard.persist.gradebook.LineitemDbPersister" %>
 
 <%@ taglib uri="/bbUI" prefix="bbUI" %> 
 <%@ taglib uri="/bbData" prefix="bbData"%> 
 <%@ taglib uri="/bbNG" prefix="bbNG"%>
 <bbNG:learningSystemPage 
	title="LAB 1"
	ctxId="ctx">

	<bbNG:pageHeader>
		<bbNG:breadcrumbBar environment="COURSE"
			navItem="ycdb-chem109-nav-LabDebug" >
				<bbNG:breadcrumb title="Home" href="lab0_1i.jsp?course_id=@X@course.pk_string@X@&user_id=@X@user.pk_string@X@" />
			<bbNG:breadcrumb> Lab 1 </bbNG:breadcrumb>
		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar>
			Welcome to Chem 109 Lab 1
		</bbNG:pageTitleBar>
	</bbNG:pageHeader>


<!DOCTYPE html>

 <%
	 int dataX = 12;
 	 int dataY = 3;
  	User u = ctx.getUser();
 	String userid = "";
	lab0_1Checks checks;
  	String courseid = request.getParameter("course_id");
  	String button = null;
	
  	CourseMembership crsMembership = null;
	CourseMembershipDbLoader crsMembershipLoader = null;
	PersistenceService bbPm = PersistenceServiceFactory.getInstance() ;
    BbPersistenceManager bpManager = bbPm.getDbPersistenceManager();
 
	String errMsg = null;
	crsMembershipLoader = (CourseMembershipDbLoader)bpManager.getLoader(CourseMembershipDbLoader.TYPE);
	
	try {
		crsMembership = crsMembershipLoader.loadByCourseAndUserId(ctx.getCourse().getId(), u.getId());
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
 		String cid = request.getParameter("courseMembershipId");
 		Helper h = new Helper();
 		userid = h.getUserIdFromCourseMembershipId(ctx, cid);	 	
	}
	else
	{
		userid = u.getId().toExternalString();
    }
 	
	checks = new lab0_1Checks(ctx, dataX, dataY, "ycdb_chemistrylab1",  userid, courseid);
	
	checks.check();
	
	button = request.getParameter("button");
	
 	if (button == null)
    {
        button = "";
	    //set types
         
         
        checks.setType(0, 0, "String");
        checks.setType(1, 0, "String");
        
        for (int i = 2; i < dataX; i++)
        {
            for (int j = 0; j < dataY; j++)
            {
                if (j == 0)
                {
                    checks.setType(i, j, "Double");
                }
                else if (j == 1)
                {
                    checks.setType(i, j, "Unit");
                }
                else 
                {
                    checks.setType(i, j, "Integer");
                }
            }
        }
     }
     
     else
    {
    	if(button.equals("Save") || button.equals("Check") || button.equals("Submit"))
    	{
    		for (int i = 0; i < dataX; i++)
            {
                for (int j = 0; j < dataY; j++)
                {  
                    checks.setData(i, j, request.getParameter("" + i + j));
                 }
            }
    		
    	}
        if (button.equals("Clear"))
        {  
            checks.clear();
        }
        else if (button.equals("Save"))
        {
              
            //perform save
            checks.save("ycdb_chemistrylab1",userid,courseid);
        }
        else if (button.equals("Check"))
        {
              
            //perform checks
            checks.check();
        }
        else if (button.equals("Submit"))
        {
              
            //perform save
            checks.save("ycdb_chemistrylab1",userid,courseid);
            
            //perform submit
            checks.submit(ctx,"ycdb_chemistrylab1","lab0_1.jsp");
        }
		else if (button.equals("ClearAttempt"))
        {
         	if (crsMembershipRole == CourseMembership.Role.INSTRUCTOR)
         	{
    			GradeLogistics gl = new GradeLogistics();

        		checks.clearAttempt(ctx, userid,"ycdb_chemistrylab1");
         	}
        }
        else
        {
            button = "";
        }
        button="";
    }
 
 %>
 
<html>
    <head>
    	<title>
            Lab 1: Weighing Measurements: The Balance
    	</title>
    	<link rel="stylesheet" href="labs_css.css">
    <datalist id="units" >
            <option value="g" >g</option>	
            <option value="mg" >mg</option>
            <option value="kg" >kg</option>
            <option value="L" >L</option>
            <option value="mL" >mL</option>
            <option value="cm" >cm</option>
            <option value="m" >m</option>
            <option value="km" >km</option>
            <option value="lb" >lb</option>
            <option value="oz" >oz</option>
            <option value="cm3" >cm3</option>
            <option value="s" >s</option>
            <option value="in" >in</option>
            <option value="ft" >ft</option>
        </datalist>	
        <script>
     	if (crsMembershipRole == CourseMembership.Role.INSTRUCTOR) 
     		{
     			var d = document.getElementById("btns");
     			var b = document.createElement("BUTTON")
      		    var t = document.createTextNode("ClearAttempt");
     		    b.appendChild(t);
				d.appendChild(b);
     		}
        </script>
    </head>
    <body>
    <p>User Information</p>  
  	<p style="margin-left:10px">
   			Student Id: <%= userid%> <br />   
   	</p>  

    
    	<fieldset class="fieldset-auto-width">
            <legend>Lab 1: Weighing Measurements: The Balance</legend>
            <form method="POST"> 
        
            <fieldset>
                <legend>Basic info</legend>
                <table>
                    <tr>
                        <th>
                            Unknown number of metal rod:
                        </th>
                        <th>
                            <input readonly type="number" name="00" <% if (checks.getData(0,0) != null){out.print("value=\"" + checks.getData(0,0) + "\"");}%> />
                        </th>
                    </tr>
                    <tr>
                        <th>
                        </th>
                        <td>
                            <div style="color: red" >
                                <% if (checks.getError(0,0) != null){out.print(checks.getError(0, 0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(0,0) != null){out.print(checks.getIsCorrect(0, 0));} %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Unknown number of metal wire:
                        </th>
                        <th>
                            <input readonly type="number" name="10" <% if (checks.getData(1,0) != null){out.print("value=\"" + checks.getData(1,0) + "\"");}%> />
                        </th>
                    </tr>
                    <tr>
                        <th>
                        </th>
                        <td>
                            <div style="color: red" >
                                <% if (checks.getError(1,0) != null){out.print(checks.getError(1, 0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(1,0) != null){out.print(checks.getIsCorrect(1, 0));} %>
                            </div>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br>
            <fieldset>
                <legend>I. DATA</legend>
		<table>
                    <tr>
                        <th>
                        </th>
                        <th>
                            Weight
                        </th>
                        <th>
                            Unit
                        </th>
                        <th>
                            Num of Sig Fig
                        </th>
                    </tr>
                    <tr>
                        <td>
                        <b>Quadruple beam balance</b>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Metal rod
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="20" <% if (checks.getData(2,0) != null){out.print("value=\"" + checks.getData(2,0) + "\"");}%> />
                        </td>
                        <td>
                            <input readonly list="units" name="21" <% if (checks.getData(2,1) != null){out.print("value=\"" + checks.getData(2,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="22" <% if (checks.getData(2,2) != null){out.print("value=\"" + checks.getData(2,2) + "\"");}%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(2,0) != null){out.print(checks.getError(2,0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(2,0) != null){out.print(checks.getIsCorrect(2, 0));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(2,1) != null){out.print(checks.getError(2,1));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(2,1) != null){out.print(checks.getIsCorrect(2, 1));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(2,2) != null){out.print(checks.getError(2,2));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(2,2) != null){out.print(checks.getIsCorrect(2, 2));} %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Vial + Sodium chloride
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="30" <% if (checks.getData(3,0) != null){out.print("value=\"" + checks.getData(3,0) + "\"");}%> />
                        </td>
                        <td>
                            <input readonly list="units" name="31" <% if (checks.getData(3,1) != null){out.print("value=\"" + checks.getData(3,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="32" <% if (checks.getData(3,2) != null){out.print("value=\"" + checks.getData(3,2) + "\"");}%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(3,0) != null){out.print(checks.getError(3,0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(3,0) != null){out.print(checks.getIsCorrect(3, 0));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(3,1) != null){out.print(checks.getError(3,1));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(3,1) != null){out.print(checks.getIsCorrect(3, 1));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(3,2) != null){out.print(checks.getError(3,2));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(3,2) != null){out.print(checks.getIsCorrect(3, 2));} %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Analytical balance</b>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Metal rod
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="40" <% if (checks.getData(4,0) != null){out.print("value=\"" + checks.getData(4,0) + "\"");}%> />
                        </td>
                        <td>
                            <input readonly list="units" name="41" <% if (checks.getData(4,1) != null){out.print("value=\"" + checks.getData(4,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="42" <% if (checks.getData(4,2) != null){out.print("value=\"" + checks.getData(4,2) + "\"");}%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(4,0) != null){out.print(checks.getError(4,0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(4,0) != null){out.print(checks.getIsCorrect(4, 0));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(4,1) != null){out.print(checks.getError(4,1));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(4,1) != null){out.print(checks.getIsCorrect(4, 1));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(4,2) != null){out.print(checks.getError(4,2));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(4,2) != null){out.print(checks.getIsCorrect(4, 2));} %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Metal wire - Trial 1
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="50" <% if (checks.getData(5,0) != null){out.print("value=\"" + checks.getData(5,0) + "\"");}%> required />
                        </td>
                        <td>
                            <input readonly list="units" name="51" <% if (checks.getData(5,1) != null){out.print("value=\"" + checks.getData(5,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="52" <% if (checks.getData(5,2) != null){out.print("value=\"" + checks.getData(5,2) + "\"");}%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(5,0) != null){out.print(checks.getError(5,0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(5,0) != null){out.print(checks.getIsCorrect(5, 0));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(5,1) != null){out.print(checks.getError(5,1));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(5,1) != null){out.print(checks.getIsCorrect(5, 1));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(5,2) != null){out.print(checks.getError(5,2));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(5,2) != null){out.print(checks.getIsCorrect(5, 2));} %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Trial 2
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="60" <% if (checks.getData(6,0) != null){out.print("value=\"" + checks.getData(6,0) + "\"");}%> required />
                        </td>
                        <td>
                            <input readonly list="units" name="61" <% if (checks.getData(6,1) != null){out.print("value=\"" + checks.getData(6,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="62" <% if (checks.getData(6,2) != null){out.print("value=\"" + checks.getData(6,2) + "\"");}%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(6,0) != null){out.print(checks.getError(6,0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(6,0) != null){out.print(checks.getIsCorrect(6, 0));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(6,1) != null){out.print(checks.getError(6,1));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(6,1) != null){out.print(checks.getIsCorrect(6, 1));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(6,2) != null){out.print(checks.getError(6,2));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(6,2) != null){out.print(checks.getIsCorrect(6, 2));} %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Trial 3
			</td>
			<td>
                            <input readonly type="number" step="any" name="70" <% if (checks.getData(7,0) != null){out.print("value=\"" + checks.getData(7,0) + "\"");}%> required />
                        </td>
                        <td>
                            <input readonly list="units" name="71" <% if (checks.getData(7,1) != null){out.print("value=\"" + checks.getData(7,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="72" <% if (checks.getData(7,2) != null){out.print("value=\"" + checks.getData(7,2) + "\"");}%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(7,0) != null){out.print(checks.getError(7,0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(7,0) != null){out.print(checks.getIsCorrect(7, 0));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(7,1) != null){out.print(checks.getError(7,1));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(7,1) != null){out.print(checks.getIsCorrect(7, 1));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(7,2) != null){out.print(checks.getError(7,2));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(7,2) != null){out.print(checks.getIsCorrect(7, 2));} %>
                            </div>
                        </td>
                    </tr>
                    <tr>
			<td>
                            Weighing paper and sodium chloride
			</td>
			<td>
                            <input readonly type="number" step="any" name="80" <% if (checks.getData(8,0) != null){out.print("value=\"" + checks.getData(8,0) + "\"");}%> required />
                        </td>
                        <td>
                            <input readonly list="units" name="81" <% if (checks.getData(8,1) != null){out.print("value=\"" + checks.getData(8,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="82" <% if (checks.getData(8,2) != null){out.print("value=\"" + checks.getData(8,2) + "\"");}%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(8,0) != null){out.print(checks.getError(8,0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(8,0) != null){out.print(checks.getIsCorrect(8, 0));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(8,1) != null){out.print(checks.getError(8,1));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(8,1) != null){out.print(checks.getIsCorrect(8, 1));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(8,2) != null){out.print(checks.getError(8,2));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(8,2) != null){out.print(checks.getIsCorrect(8, 2));} %>
                            </div>
                        </td>
                    </tr>
                    <tr>
			<td>
                            Weighing paper
			</td>
			<td>
                            <input readonly type="number" step="any" name="90" <% if (checks.getData(9,0) != null){out.print("value=\"" + checks.getData(9,0) + "\"");}%> required />
                        </td>
                        <td>
                            <input readonly list="units" name="91" <% if (checks.getData(9,1) != null){out.print("value=\"" + checks.getData(9,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="92" <% if (checks.getData(9,2) != null){out.print("value=\"" + checks.getData(9,2) + "\"");}%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(9,0) != null){out.print(checks.getError(9,0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(9,0) != null){out.print(checks.getIsCorrect(9, 0));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(9,1) != null){out.print(checks.getError(9,1));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(9,1) != null){out.print(checks.getIsCorrect(9, 1));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(9,2) != null){out.print(checks.getError(9,2));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(9,2) != null){out.print(checks.getIsCorrect(9, 2));} %>
                            </div>
                        </td>
                    </tr>
                    
		</table>
            </fieldset>
            <br>
            <fieldset>
                <legend>II. RESULTS</legend>
                <table>
                    <tr>
                        <th>
                        </th>
                        <th>
                            Weight
                        </th>
                        <th>
                            Unit
                        </th>
                        <th>
                            Num of Sig Fig
                        </th>
                    	</tr>
                        <tr>
                        <td>
                            Average weight of metal wire
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="100" <% if (checks.getData(10,0) != null){out.print("value=\"" + checks.getData(10,0) + "\"");}%> />
                        </td>
                        <td>
                            <input readonly list="units" name="101" <% if (checks.getData(10,1) != null){out.print("value=\"" + checks.getData(10,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="102" <% if (checks.getData(10,2) != null){out.print("value=\"" + checks.getData(10,2) + "\"");}%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(10,0) != null){out.print(checks.getError(10,0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(10,0) != null){out.print(checks.getIsCorrect(10, 0));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(10,1) != null){out.print(checks.getError(10,1));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(10,1) != null){out.print(checks.getIsCorrect(10, 1));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(10,2) != null){out.print(checks.getError(10,2));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(10,2) != null){out.print(checks.getIsCorrect(10, 2));} %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Weight of sodium chloride sample 
                            <br>
                            removed from vial 
                        </td>
			<td>
                            <input readonly type="number" step="any" name="110" <% if (checks.getData(11,0) != null){out.print("value=\"" + checks.getData(11,0) + "\"");}%> />
                        </td>
                        <td>
                            <input readonly list="units" name="111" <% if (checks.getData(11,1) != null){out.print("value=\"" + checks.getData(11,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input readonly type="number" step="any" name="112" <% if (checks.getData(11,2) != null){out.print("value=\"" + checks.getData(11,2) + "\"");}%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(11,0) != null){out.print(checks.getError(11,0));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(11,0) != null){out.print(checks.getIsCorrect(11, 0));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(11,1) != null){out.print(checks.getError(11,1));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(11,1) != null){out.print(checks.getIsCorrect(11, 1));} %>
                            </div>
                        </td>
                        <td>
                            <div style="color: red">
                                <% if (checks.getError(11,2) != null){out.print(checks.getError(11,2));} %>
                            </div>
                            <div style="color: green" >
                                <% if (checks.getIsCorrect(11,2) != null){out.print(checks.getIsCorrect(11, 2));} %>
                            </div>
                        </td>
                    </tr>
 		</table>
            </fieldset>
            <br>
            <table>
	            <tr>
	            	<td></td>
		            <td style="width:50%">
		            	<div style="text-align: center" id="btns">
                			<input type="submit" name="button" value="ClearAttempt" id="CA"/>
                			<p>Instructor View [Test Page]</p>
            			</div>
		            </td>
		            <td></td>
	            </tr>     
            </table>
            <br>
            </form>
        </fieldset>
    <br>
    </body>
</html>
</bbNG:learningSystemPage>