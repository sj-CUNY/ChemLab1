<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab1Checks" %>

 <%@ taglib uri="/bbUI" prefix="bbUI" %> 
 <%@ taglib uri="/bbData" prefix="bbData"%> 
 <%@ taglib uri="/bbNG" prefix="bbNG"%>
 
 <bbNG:learningSystemPage 
	title="LAB 2"
	ctxId="ctx">

	<bbNG:pageHeader>
		<bbNG:breadcrumbBar environment="COURSE"
			navItem="course_plugin_manage" >
				<bbNG:breadcrumb title="Home" href="index.jsp?course_id=@X@course.id@X@&user_id=@X@user.pk_string@X@" />
			<bbNG:breadcrumb> Lab 1 </bbNG:breadcrumb>
		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar>
			Welcome to to Chem 109 Lab 1
		</bbNG:pageTitleBar>
	</bbNG:pageHeader>
<!DOCTYPE html>
<!--
For Deven: this is compatible for your jsp additions. 
-->
<%!
    int dataX = 16;
    int dataY = 2;
    String button = "";
    boolean initial = true;
    
    lab1Checks checks = new lab1Checks(dataX, dataY, "yccs_chemistrylab2");
    
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
    button = request.getParameter("button");
    
    if (initial)
    {
        button = "";
            
        //set type
        for (int i = 0; i < dataX; i++)
        {
            for (int j = 0; j < dataY; j++)
            {
                if (j == 1)
                {
                    checks.setType(i,j,"unit");
                }
                else
                {
                    checks.setType(i, j,"double");
                }
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
        <title>Lab 2: Volume Measurements and the Determination of Density</title>
    </head>
    <body>
        <fieldset>
            <legend>Lab 2: Volume Measurements and the Determination of Density</legend>
            <form method="POST" action=""><!--add destination in action field-->
                <fieldset>
                    <legend>I. DATA</legend>
                    <fieldset>
                        <legend>A. Determination of the Density of an Unknown Metal</legend>
                        <table>
                            <tr>
                                <td>
                                    Unknown Number:
                                </td>
                                <td>
                                    <input type="text" name="00" <% if (checks.getData(0,0) != null){out.print("value=\"" + checks.getData(0,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(0,0) != null){out.print(checks.getError(0, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Weight of unknown metal:
                                </td>
                                <td>
                                    <input type="text" name="10" <% if (checks.getData(1,0) != null){out.print("value=\"" + checks.getData(1,0) + "\"");}%> /><!-- 4 decimal places -->
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
                            </tr>
                            <tr>
                                <td>
                                    Initial graduate cylinder reading <br>(without unknown metal):
                                </td>
                                <td>
                                    <input type="text" name="20" <% if (checks.getData(2,0) != null){out.print("value=\"" + checks.getData(2,0) + "\"");}%> /><!-- 1 decimal places -->
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
                            </tr>
                            <tr>
                                <td>
                                    Final graduate cylinder reading <br>(with unknown metal):
                                </td>
                                <td>
                                    <input type="text" name="30" <% if (checks.getData(3,0) != null){out.print("value=\"" + checks.getData(3,0) + "\"");}%> /><!-- 1 decimal places -->
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
                            </tr>
                        </table>
                    </fieldset>  
                    <fieldset>
                        <legend>B. Determination of the Density of an Unknown Liquid</legend>
                        <table>
                            <tr>
                                <td>
                                    Unknown Number:
                                </td>
                                <td>
                                    <input type="text" name="40" <% if (checks.getData(4,0) != null){out.print("value=\"" + checks.getData(4,0) + "\"");}%> />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(4,0) != null){out.print(checks.getError(4, 0));} %>
                                    </div>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Initial buret reading:
                                </td>
                                <td>
                                    <input type="text" name="50" <% if (checks.getData(5,0) != null){out.print("value=\"" + checks.getData(5,0) + "\"");}%> /><!-- 2 decimal places -->
                                </td>
                                <td>
                                    Weight of beaker:
                                </td>
                                <td>
                                    <input type="text" name="51" <% if (checks.getData(5,1) != null){out.print("value=\"" + checks.getData(5,1) + "\"");}%> /><!-- 4 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(5,0) != null){out.print(checks.getError(5, 0));} %>
                                    </div>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(5,1) != null){out.print(checks.getError(5, 1));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Buret reading after 1st liquid sample removed:
                                </td>
                                <td>
                                    <input type="text" name="60" <% if (checks.getData(6,0) != null){out.print("value=\"" + checks.getData(6,0) + "\"");}%> /><!-- 2 decimal places -->
                                </td>
                                <td>
                                    Weight of beaker + liquid after 1st sample added:
                                </td>
                                <td>
                                    <input type="text" name="61" <% if (checks.getData(6,1) != null){out.print("value=\"" + checks.getData(6,1) + "\"");}%> /><!-- 4 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(6,0) != null){out.print(checks.getError(6, 0));} %>
                                    </div>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(6,1) != null){out.print(checks.getError(6, 1));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Buret reading after 2nd liquid sample removed:
                                </td>
                                <td>
                                    <input type="text" name="70" <% if (checks.getData(7,0) != null){out.print("value=\"" + checks.getData(7,0) + "\"");}%> /><!-- 2 decimal places -->
                                </td>
                                <td>
                                    Weight of beaker + liquid after 2nd sample added:
                                </td>
                                <td>
                                    <input type="text" name="71" <% if (checks.getData(7,1) != null){out.print("value=\"" + checks.getData(7,1) + "\"");}%> /><!-- 4 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(7,0) != null){out.print(checks.getError(7, 0));} %>
                                    </div>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(7,1) != null){out.print(checks.getError(7, 1));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Buret reading after 3rd liquid sample removed:
                                </td>
                                <td>
                                    <input type="text" name="80" <% if (checks.getData(8,0) != null){out.print("value=\"" + checks.getData(8,0) + "\"");}%> /><!-- 2 decimal places -->
                                </td>
                                <td>
                                    Weight of beaker + liquid after 3rd sample added:
                                </td>
                                <td>
                                    <input type="text" name="81" <% if (checks.getData(8,1) != null){out.print("value=\"" + checks.getData(8,1) + "\"");}%> /><!-- 4 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(8,0) != null){out.print(checks.getError(8, 0));} %>
                                    </div>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(8,1) != null){out.print(checks.getError(8, 1));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Buret reading after 4th liquid sample removed:
                                </td>
                                <td>
                                    <input type="text" name="90" <% if (checks.getData(9,0) != null){out.print("value=\"" + checks.getData(9,0) + "\"");}%> /><!-- 2 decimal places -->
                                </td>
                                <td>
                                    Weight of beaker + liquid:
                                </td>
                                <td>
                                    <input type="text" name="91" <% if (checks.getData(9,1) != null){out.print("value=\"" + checks.getData(9,1) + "\"");}%> /><!-- 4 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(9,0) != null){out.print(checks.getError(9, 0));} %>
                                    </div>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(9,1) != null){out.print(checks.getError(9, 1));} %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </fieldset>
                <fieldset>
                    <legend>II. RESULTS</legend>
                    <fieldset>
                        <legend>A. Determination of the Density of an Unknown Metal</legend>
                        <table>
                            <tr>
                                <td>
                                    Volume of metal:
                                </td>
                                <td>
                                    <input type="text" name="100" <% if (checks.getData(10,0) != null){out.print("value=\"" + checks.getData(10,0) + "\"");}%> /><!-- 1 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(10,0) != null){out.print(checks.getError(10, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Density of metal:
                                </td>
                                <td>
                                    <input type="text" name="110" <% if (checks.getData(11,0) != null){out.print("value=\"" + checks.getData(11,0) + "\"");}%> /><!-- 3 significant figures, 2 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(11,0) != null){out.print(checks.getError(11, 0));} %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset>
                        <legend>B. Determination of the Density of an Unknown Liquid</legend>
                        <table>
                            <tr>
                                <th>
                                </th>
                                <th>
                                    Total Volume of Liquid in Beaker
                                </th>
                                <th>
                                    Total Weight of Liquid in Beaker
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    After 1st sample added to beaker:
                                </td>
                                <td>
                                    <input type="text" name="120" <% if (checks.getData(12,0) != null){out.print("value=\"" + checks.getData(12,0) + "\"");}%> /><!-- 2 decimal places -->
                                </td>
                                <td>
                                    <input type="text" name="121" <% if (checks.getData(12,1) != null){out.print("value=\"" + checks.getData(12,1) + "\"");}%> /><!-- 4 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(12,0) != null){out.print(checks.getError(12, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(12,1) != null){out.print(checks.getError(12, 1));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    After 2nd sample added to beaker:
                                </td>
                                <td>
                                    <input type="text" name="130" <% if (checks.getData(13,0) != null){out.print("value=\"" + checks.getData(13,0) + "\"");}%> /><!-- 2 decimal places -->
                                </td>
                                <td>
                                    <input type="text" name="131" <% if (checks.getData(13,1) != null){out.print("value=\"" + checks.getData(13,1) + "\"");}%> /><!-- 4 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(13,0) != null){out.print(checks.getError(13, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(13,1) != null){out.print(checks.getError(13, 1));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    After 3rd sample added to beaker:
                                </td>
                                <td>
                                    <input type="text" name="140" <% if (checks.getData(14,0) != null){out.print("value=\"" + checks.getData(14,0) + "\"");}%> /><!-- 2 decimal places -->
                                </td>
                                <td>
                                    <input type="text" name="141" <% if (checks.getData(14,1) != null){out.print("value=\"" + checks.getData(14,1) + "\"");}%> /><!-- 4 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(14,0) != null){out.print(checks.getError(14, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(14,1) != null){out.print(checks.getError(14, 1));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    After 4th sample added to beaker:
                                </td>
                                <td>
                                    <input type="text" name="150" <% if (checks.getData(15,0) != null){out.print("value=\"" + checks.getData(15,0) + "\"");}%> /><!-- 2 decimal places -->
                                </td>
                                <td>
                                    <input type="text" name="151" <% if (checks.getData(15,1) != null){out.print("value=\"" + checks.getData(15,1) + "\"");}%> /><!-- 4 decimal places -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(15,0) != null){out.print(checks.getError(15, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                        <% if (checks.getError(15,1) != null){out.print(checks.getError(15, 1));} %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <div>
                        Density of unknown liquid (slope of the line resulting from the plot of M versus V):
                        <!-- add jsp tag -->
                    </div>
                    <div>
                        Show calculation of density (slope):
                        <!-- add jsp tag -->
                    </div>
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
        <br>
    </body>
</html>
</bbNG:learningSystemPage>