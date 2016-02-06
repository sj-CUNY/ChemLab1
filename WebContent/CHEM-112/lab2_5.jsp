<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab2_5Checks" %>
<!DOCTYPE html>
<!--
This is compatible with any jsp additions. 
-->
<%!
    int dataX = 22;
    int dataY = 5;
    String button = "";
    boolean initial = true;
    lab2_5Checks checks = new lab2_5Checks(dataX, dataY, "yccs_chemistrylab2_5");
   
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
                checks.setType(i, j,"double");
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
        <title>Lab 5: Chemical Kinetics: An Iodine Clock Reaction</title>
    </head>
    <body>
        <fieldset>
            <legend>Lab 5: Chemical Kinetics: An Iodine Clock Reaction</legend>
            <form method="POST" action=""><!--add destination in action field-->

                <fieldset>
                    <legend>DATA: Chemical Kinetics: Iodine Clock Reaction</legend>
                    <table>
                        <tr>
                            <td colspan="2">
                                A. Determination of Effect of [S<sub>2</sub>O<sub>8</sub><sup>2-</sup>] on rate
                            </td>
                            <td>
                            </td>
                            <td colspan="2">
                                B. Determination of effect of [I<sup>-</sup>] on rate
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Run
                            </th>
                            <th>
                                Time
                            </th>
                            <th>
                            </th>
                            <th>
                                Run
                            </th>
                            <th>
                                Time
                            </th>
                        </tr>
                        <tr>
                            <td>
                                1 A (1st trial)
                            </td>
                            <td>
                                <input type="text" name="00" <% if (checks.getData(0,0) != null){out.print("value=\"" + checks.getData(0,0) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                1 B (1st trial)
                            </td>
                            <td>
                                <input type="text" name="01" <% if (checks.getData(0,1) != null){out.print("value=\"" + checks.getData(0,1) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(0,1) != null){out.print(checks.getError(0, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                1 A (2nd trial)
                            </td>
                            <td>
                                <input type="text" name="10" <% if (checks.getData(1,0) != null){out.print("value=\"" + checks.getData(1,0) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                1 B (2nd trial)
                            </td>
                            <td>
                                <input type="text" name="11" <% if (checks.getData(1,1) != null){out.print("value=\"" + checks.getData(1,1) + "\"");}%> />
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
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(1,1) != null){out.print(checks.getError(1, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                1 A (3rd trial *)
                            </td>
                            <td>
                                <input type="text" name="20" <% if (checks.getData(2,0) != null){out.print("value=\"" + checks.getData(2,0) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                1 B (3rd trial *)
                            </td>
                            <td>
                                <input type="text" name="21" <% if (checks.getData(2,1) != null){out.print("value=\"" + checks.getData(2,1) + "\"");}%> />
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
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(2,1) != null){out.print(checks.getError(2, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                2 A (1st trial)
                            </td>
                            <td>
                                <input type="text" name="30" <% if (checks.getData(3,0) != null){out.print("value=\"" + checks.getData(3,0) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                2 B (1st trial)
                            </td>
                            <td>
                                <input type="text" name="31" <% if (checks.getData(3,1) != null){out.print("value=\"" + checks.getData(3,1) + "\"");}%> />
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
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(3,1) != null){out.print(checks.getError(3, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                2 A (2nd trial)
                            </td>
                            <td>
                                <input type="text" name="40" <% if (checks.getData(4,0) != null){out.print("value=\"" + checks.getData(4,0) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                2 B (2nd trial)
                            </td>
                            <td>
                                <input type="text" name="41" <% if (checks.getData(4,1) != null){out.print("value=\"" + checks.getData(4,1) + "\"");}%> />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(4,1) != null){out.print(checks.getError(4, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                2 A (3rd trial *)
                            </td>
                            <td>
                                <input type="text" name="50" <% if (checks.getData(5,0) != null){out.print("value=\"" + checks.getData(5,0) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                2 B (3rd trial *)
                            </td>
                            <td>
                                <input type="text" name="51" <% if (checks.getData(5,1) != null){out.print("value=\"" + checks.getData(5,1) + "\"");}%> />
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(5,1) != null){out.print(checks.getError(5, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3 A (1st trial)
                            </td>
                            <td>
                                <input type="text" name="60" <% if (checks.getData(6,0) != null){out.print("value=\"" + checks.getData(6,0) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                3 B (1st trial)
                            </td>
                            <td>
                                <input type="text" name="61" <% if (checks.getData(6,1) != null){out.print("value=\"" + checks.getData(6,1) + "\"");}%> />
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(6,1) != null){out.print(checks.getError(6, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3 A (2nd trial)
                            </td>
                            <td>
                                <input type="text" name="70" <% if (checks.getData(7,0) != null){out.print("value=\"" + checks.getData(7,0) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                3 B (2nd trial)
                            </td>
                            <td>
                                <input type="text" name="71" <% if (checks.getData(7,1) != null){out.print("value=\"" + checks.getData(7,1) + "\"");}%> />
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(7,1) != null){out.print(checks.getError(7, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3 A (3rd trial *)
                            </td>
                            <td>
                                <input type="text" name="80" <% if (checks.getData(8,0) != null){out.print("value=\"" + checks.getData(8,0) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                3 B (3rd trial *)
                            </td>
                            <td>
                                <input type="text" name="81" <% if (checks.getData(8,1) != null){out.print("value=\"" + checks.getData(8,1) + "\"");}%> />
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(8,1) != null){out.print(checks.getError(8, 1));} %>
                                </div>
                            </td>
                        </tr>
                    </table>
                    * A third trial is only conducted when the first two trials do not agree to within 5%<br>
                </fieldset>
                <br>
                <fieldset>
                    <legend>RESULTS</legend>
                    Calculations:<br>
                    I. Calculating the reaction rate (see steps 14- 18 above)<br>
                    <table>
                        <tr>
                            <td colspan="6">
                                A. Determination of effect of [S<sub>2</sub>O<sub>8</sub><sup>2-</sup>] on rate
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Run
                            </th>
                            <th>
                                Initial [I<sup>-</sup>]
                            </th>
                            <th>
                                Initial [S<sub>2</sub>O<sub>8</sub><sup>2-</sup>]
                            </th>
                            <th>
                                &Delta;[S<sub>2</sub>O<sub>8</sub><sup>2-</sup>]
                            </th>
                            <th>
                                AVERAGE  reaction time
                            </th>
                            <th>
                                Reaction Rate (M/s)
                            </th>
                        </tr>
                        <tr>
                            <td>
                                1A
                            </td>
                            <td>
                                <input type="text" name="90" <% if (checks.getData(9,0) != null){out.print("value=\"" + checks.getData(9,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="91" <% if (checks.getData(9,1) != null){out.print("value=\"" + checks.getData(9,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="92" <% if (checks.getData(9,2) != null){out.print("value=\"" + checks.getData(9,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="93" <% if (checks.getData(9,3) != null){out.print("value=\"" + checks.getData(9,3) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="94" <% if (checks.getData(9,4) != null){out.print("value=\"" + checks.getData(9,4) + "\"");}%> />
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
                                <div style="color: red" >
                                <% if (checks.getError(9,1) != null){out.print(checks.getError(9, 1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(9,2) != null){out.print(checks.getError(9, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(9,3) != null){out.print(checks.getError(9, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(9,4) != null){out.print(checks.getError(9, 4));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                2A
                            </td>
                            <td>
                                <input type="text" name="100" <% if (checks.getData(10,0) != null){out.print("value=\"" + checks.getData(10,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="101" <% if (checks.getData(10,1) != null){out.print("value=\"" + checks.getData(10,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="102" <% if (checks.getData(10,2) != null){out.print("value=\"" + checks.getData(10,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="103" <% if (checks.getData(10,3) != null){out.print("value=\"" + checks.getData(10,3) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="104" <% if (checks.getData(10,4) != null){out.print("value=\"" + checks.getData(10,4) + "\"");}%> />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(10,1) != null){out.print(checks.getError(10, 1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(10,2) != null){out.print(checks.getError(10, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(10,3) != null){out.print(checks.getError(10, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(10,4) != null){out.print(checks.getError(10, 4));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3A
                            </td>
                            <td>
                                <input type="text" name="110" <% if (checks.getData(11,0) != null){out.print("value=\"" + checks.getData(11,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="111" <% if (checks.getData(11,1) != null){out.print("value=\"" + checks.getData(11,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="112" <% if (checks.getData(11,2) != null){out.print("value=\"" + checks.getData(11,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="113" <% if (checks.getData(11,3) != null){out.print("value=\"" + checks.getData(11,3) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="114" <% if (checks.getData(11,4) != null){out.print("value=\"" + checks.getData(11,4) + "\"");}%> />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(11,1) != null){out.print(checks.getError(11, 1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(11,2) != null){out.print(checks.getError(11, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(11,3) != null){out.print(checks.getError(11, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(11,4) != null){out.print(checks.getError(11, 4));} %>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table>
                        <tr>
                            <td colspan="6">
                                B. Determination of effect of [I<sup>-</sup>] on rate
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Run
                            </th>
                            <th>
                                Initial [I<sup>-</sup>]
                            </th>
                            <th>
                                Initial [S<sub>2</sub>O<sub>8</sub><sup>2-</sup>]
                            </th>
                            <th>
                                &Delta;[S<sub>2</sub>O<sub>8</sub><sup>2-</sup>]
                            </th>
                            <th>
                                AVERAGE  reaction time
                            </th>
                            <th>
                                Reaction Rate (M/s)
                            </th>
                        </tr>
                        <tr>
                            <td>
                                1B
                            </td>
                            <td>
                                <input type="text" name="120" <% if (checks.getData(12,0) != null){out.print("value=\"" + checks.getData(12,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="121" <% if (checks.getData(12,1) != null){out.print("value=\"" + checks.getData(12,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="122" <% if (checks.getData(12,2) != null){out.print("value=\"" + checks.getData(12,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="123" <% if (checks.getData(12,3) != null){out.print("value=\"" + checks.getData(12,3) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="124" <% if (checks.getData(12,4) != null){out.print("value=\"" + checks.getData(12,4) + "\"");}%> />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(12,2) != null){out.print(checks.getError(12, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(12,3) != null){out.print(checks.getError(12, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(12,4) != null){out.print(checks.getError(12, 4));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                2B
                            </td>
                            <td>
                                <input type="text" name="130" <% if (checks.getData(13,0) != null){out.print("value=\"" + checks.getData(13,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="131" <% if (checks.getData(13,1) != null){out.print("value=\"" + checks.getData(13,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="132" <% if (checks.getData(13,2) != null){out.print("value=\"" + checks.getData(13,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="133" <% if (checks.getData(13,3) != null){out.print("value=\"" + checks.getData(13,3) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="134" <% if (checks.getData(13,4) != null){out.print("value=\"" + checks.getData(13,4) + "\"");}%> />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(13,2) != null){out.print(checks.getError(13, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(13,3) != null){out.print(checks.getError(13, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(13,4) != null){out.print(checks.getError(13, 4));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3B
                            </td>
                            <td>
                                <input type="text" name="140" <% if (checks.getData(14,0) != null){out.print("value=\"" + checks.getData(14,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="141" <% if (checks.getData(14,1) != null){out.print("value=\"" + checks.getData(14,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="142" <% if (checks.getData(14,2) != null){out.print("value=\"" + checks.getData(14,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="143" <% if (checks.getData(14,3) != null){out.print("value=\"" + checks.getData(14,3) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="144" <% if (checks.getData(14,4) != null){out.print("value=\"" + checks.getData(14,4) + "\"");}%> />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(14,2) != null){out.print(checks.getError(14, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(14,3) != null){out.print(checks.getError(14, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(14,4) != null){out.print(checks.getError(14, 4));} %>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table>
                        <tr>
                            <td colspan="2">
                                III. Calculating the rate constant: (see step 21)
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Run
                            </th>
                            <th>
                                Rate Constant, k
                            </th>
                        </tr>
                        <tr>
                            <td>
                                1A
                            </td>
                            <td>
                                <input type="text" name="150" <% if (checks.getData(15,0) != null){out.print("value=\"" + checks.getData(15,0) + "\"");}%> />
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
                        </tr>
                        <tr>
                            <td>
                                2A
                            </td>
                            <td>
                                <input type="text" name="160" <% if (checks.getData(16,0) != null){out.print("value=\"" + checks.getData(16,0) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(16,0) != null){out.print(checks.getError(16, 0));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3A
                            </td>
                            <td>
                                <input type="text" name="170" <% if (checks.getData(17,0) != null){out.print("value=\"" + checks.getData(17,0) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(17,0) != null){out.print(checks.getError(17, 0));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                1B
                            </td>
                            <td>
                                <input type="text" name="180" <% if (checks.getData(18,0) != null){out.print("value=\"" + checks.getData(18,0) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(18,0) != null){out.print(checks.getError(18, 0));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                2B
                            </td>
                            <td>
                                <input type="text" name="190" <% if (checks.getData(19,0) != null){out.print("value=\"" + checks.getData(19,0) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(19,0) != null){out.print(checks.getError(19, 0));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3B
                            </td>
                            <td>
                                <input type="text" name="200" <% if (checks.getData(20,0) != null){out.print("value=\"" + checks.getData(20,0) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(20,0) != null){out.print(checks.getError(20, 0));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Average Value of k <br>(including units):
                            </td>
                            <td>
                                <input type="text" name="210" <% if (checks.getData(21,0) != null){out.print("value=\"" + checks.getData(21,0) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(21,0) != null){out.print(checks.getError(21, 0));} %>
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
