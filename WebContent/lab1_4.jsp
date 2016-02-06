<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD:WebContent/lab4.jsp
<%@ page import="Labs.lab1Checks" %>
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
	title="LAB 4"
	ctxId="ctx">

	<bbNG:pageHeader>
		<bbNG:breadcrumbBar environment="COURSE"
			navItem="course_plugin_manage" >
				<bbNG:breadcrumb title="Home" href="lab4.jsp?course_id=@X@course.id@X@&user_id=@X@user.pk_string@X@" />
			<bbNG:breadcrumb> Lab 4 </bbNG:breadcrumb>
		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar>
			Welcome to to Chem 109 Lab 4
		</bbNG:pageTitleBar>
	</bbNG:pageHeader>

=======
<%@ page import="Labs.lab1_4Checks" %>
>>>>>>> mhasan4-master:WebContent/lab1_4.jsp
<!DOCTYPE html>
<!--
This is compatible with any jsp additions. 
-->
<%!
    int dataX = 4;
    int dataY = 3;
    String button = "";
    boolean initial = true;
<<<<<<< HEAD:WebContent/lab4.jsp
    
    lab1Checks checks = new lab1Checks(dataX, dataY, "ycdb_chemistrylab4");
    
=======
    lab1_4Checks checks = new lab1_4Checks(dataX, dataY, "yccs_chemistrylab1_4");
   
>>>>>>> mhasan4-master:WebContent/lab1_4.jsp
    public void getData(HttpServletRequest request)
    {
        for (int i = 0; i < dataX; i++)
        {
            for (int j = 0; j < dataY; j++)
            {                
                checks.setData(i, j, request.getParameter("" + i + j));
            }
        }
    }
 %>
 <%
	User u = ctx.getUser();
	Course c = ctx.getCourse();

    button = request.getParameter("button");
 
    if (initial)
    {
        button = "";
            
        //set type
        for (int i = 0; i < dataX; i++)
        {
            for (int j = 0; j < dataY; j++)
            {
                checks.setType(i, j,"text");
            }
        }     
        initial = false;
    }
    
    if (button != null)
    {
        if (button.equals("Clear"))
        { 
            checks.clear();
        }
        else if (button.equals("Save"))
        {
            //get data from form
            getData(request);
             
            //perform save
            checks.save();
        }
        else if (button.equals("Check"))
        {
            //get data from form
            getData(request);
             
            //perform checks
            checks.check();
        }
        else if (button.equals("Submit"))
        {
            //get data from form
            getData(request);
             
            //perform save
            checks.save();
            
            //perform submit
            checks.submit(ctx);
        }
        else
        {
            button = "";
        }
    }
 %>
<html>
    <head>
        <title>Lab 4: Ionic and Covalent Compounds</title>
    </head>
    <body>
        <fieldset>
            <legend>Lab 4: Ionic and Covalent Compounds</legend>
            <form method="POST" action=""><!--add destination in action field-->
                <fieldset>
                    <legend>I. DATA and RESULTS</legend>
                    <table>
                        <tr>
                            <th>
                            </th>
                            <th>
                                Color of Solution 
                            </th>
                            <th>
                                Result of Conductivity Test
                            </th>
                            <th>
                                Type of Compound: <br>Ionic or Covalent
                            </th>
                        </tr>
                        <tr>
                            <td>
                                Solution A:
                            </td>
                            <td>
                                <input type="text" name="00" <% if (checks.getData(0,1) != null){out.print("value=\"" + checks.getData(0,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="01" <% if (checks.getData(0,2) != null){out.print("value=\"" + checks.getData(0,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="02" <% if (checks.getData(0,3) != null){out.print("value=\"" + checks.getData(0,3) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(0,1) != null){out.print(checks.getError(0, 1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(0,2) != null){out.print(checks.getError(0, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(0,3) != null){out.print(checks.getError(0, 3));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Solution B:
                            </td>
                            <td>
                                <input type="text" name="10" <% if (checks.getData(1,0) != null){out.print("value=\"" + checks.getData(1,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="11" <% if (checks.getData(1,1) != null){out.print("value=\"" + checks.getData(1,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="12"  <% if (checks.getData(1,2) != null){out.print("value=\"" + checks.getData(1,2) + "\"");}%>/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(1,0) != null){out.print(checks.getError(1, 0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(1,1) != null){out.print(checks.getError(1, 1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(1,2) != null){out.print(checks.getError(1, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Solution C:
                            </td>
                            <td>
                                <input type="text" name="20" <% if (checks.getData(2,0) != null){out.print("value=\"" + checks.getData(2,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="21" <% if (checks.getData(2,1) != null){out.print("value=\"" + checks.getData(2,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="22" <% if (checks.getData(2,2) != null){out.print("value=\"" + checks.getData(2,2) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(2,0) != null){out.print(checks.getError(2, 0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(2,1) != null){out.print(checks.getError(2, 1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(2,2) != null){out.print(checks.getError(2, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Solution D:
                            </td>
                            <td>
                                <input type="text" name="30" <% if (checks.getData(3,0) != null){out.print("value=\"" + checks.getData(3,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="31" <% if (checks.getData(3,1) != null){out.print("value=\"" + checks.getData(3,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="32" <% if (checks.getData(3,2) != null){out.print("value=\"" + checks.getData(3,2) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(3,0) != null){out.print(checks.getError(3, 0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(3,1) != null){out.print(checks.getError(3, 1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(3,2) != null){out.print(checks.getError(3, 2));} %>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <div style="text-align: center">
                    <input type="submit" name="button" value="Check" />
                    <input type="submit" name="button" value="Clear" />
                    <input type="submit" name="button" value="Save" />
                    <input type="submit" name="button" value="Submit" />
                </div>
                <br>
            </form>
        </fieldset>
    </body>
</html>
</bbNG:learningSystemPage>
