<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab1_5Checks" %>
<!DOCTYPE html>
<!--
This is compatible with any jsp additions. 
-->
<%!
    int dataX = 12;
    int dataY = 2;
    String button = "";
    boolean initial = true;
    lab1_5Checks checks = new lab1_5Checks(dataX, dataY, "yccs_chemistrylab1_5");
   
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
        <title>Lab 5: Determination of the Percent by Weight of Lead</title>
    </head>
    <body>
        <fieldset>
            <legend>Lab 5: Determination of the Percent by Weight of Lead</legend>
            <form method="POST" action=""><!--add destination in action field-->
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
                </table>
                <fieldset>
                    <legend>DATA</legend>
                    <table>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Sample 1
                            </td>
                            <td>
                                Sample 2
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Weight of weighing paper + unknown
                            </td>
                            <td>
                                <input type="text" name="10" <% if (checks.getData(1,0) != null){out.print("value=\"" + checks.getData(1,0) + "\"");}%> />
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
                                <div style="color: red" >
                                    <% if (checks.getError(1,1) != null){out.print(checks.getError(1, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Weight of weighing paper
                            </td>
                            <td>
                                <input type="text" name="20" <% if (checks.getData(2,0) != null){out.print("value=\"" + checks.getData(2,0) + "\"");}%> />
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
                                <div style="color: red" >
                                    <% if (checks.getError(2,1) != null){out.print(checks.getError(2, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Weight of sample
                            </td>
                            <td>
                                <input type="text" name="30" <% if (checks.getData(3,0) != null){out.print("value=\"" + checks.getData(3,0) + "\"");}%> />
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
                                <div style="color: red" >
                                    <% if (checks.getError(3,1) != null){out.print(checks.getError(3, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Weight of filter paper + PbCrO<sub>4</sub> after drying
                            </td>
                            <td>
                                <input type="text" name="40" <% if (checks.getData(4,0) != null){out.print("value=\"" + checks.getData(4,0) + "\"");}%> />
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
                                <div style="color: red" >
                                    <% if (checks.getError(4,1) != null){out.print(checks.getError(4, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Weight of filter paper
                            </td>
                            <td>
                                <input type="text" name="50" <% if (checks.getData(5,0) != null){out.print("value=\"" + checks.getData(5,0) + "\"");}%> />
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
                                <div style="color: red" >
                                    <% if (checks.getError(5,1) != null){out.print(checks.getError(5, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Weight of PbCrO<sub>4</sub>
                            </td>
                            <td>
                                <input type="text" name="60" <% if (checks.getData(6,0) != null){out.print("value=\"" + checks.getData(6,0) + "\"");}%> />
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
                                <div style="color: red" >
                                    <% if (checks.getError(6,1) != null){out.print(checks.getError(6, 1));} %>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>                    
                <fieldset>
                    <legend>RESULTS</legend>
                    <table>
                        <tr>
                            <td>
                                % Pb in PbCrO<sub>4</sub>
                            </td>
                            <td>
                                <input type="text" name="70" <% if (checks.getData(7,0) != null){out.print("value=\"" + checks.getData(7,0) + "\"");}%> />
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
                        </tr>
                    </table>
                    <div>
                        <textarea rows="4" cols="50">Sample Calculation
                        </textarea>
                    </div>
                    <table>
                        <tr>
                            <td>
                                Weight of Pb in PbCrO<sub>4</sub> precipitate 
                            </td>
                            <td>
                                <input type="text" name="80" <% if (checks.getData(8,0) != null){out.print("value=\"" + checks.getData(8,0) + "\"");}%> />
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
                                <div style="color: red" >
                                    <% if (checks.getError(8,1) != null){out.print(checks.getError(8, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Weight of original sample
                            </td>
                            <td>
                                <input type="text" name="90" <% if (checks.getData(9,0) != null){out.print("value=\"" + checks.getData(9,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="91" <% if (checks.getData(9,1) != null){out.print("value=\"" + checks.getData(9,1) + "\"");}%> />
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
                        </tr>
                        <tr>
                            <td>
                                % Pb in unknown sample
                            </td>
                            <td>
                                <input type="text" name="100" <% if (checks.getData(10,0) != null){out.print("value=\"" + checks.getData(10,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="101" <% if (checks.getData(10,1) != null){out.print("value=\"" + checks.getData(10,1) + "\"");}%> />
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
                        </tr>
                        <tr>
                            <td>
                                Average % Pb
                            </td>
                            <td>
                                <input type="text" name="110" <% if (checks.getData(11,0) != null){out.print("value=\"" + checks.getData(11,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="111" <% if (checks.getData(11,1) != null){out.print("value=\"" + checks.getData(11,1) + "\"");}%> />
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
                        </tr>
                    </table>
                    <div>
                        <textarea rows="4" cols="50">Sample Calculation
                        </textarea>
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
