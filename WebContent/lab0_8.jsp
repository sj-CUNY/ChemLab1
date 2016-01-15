<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab0_8Checks" %>

<!DOCTYPE html>
<%!
    int dataX = 10;
    int dataY = 3;
    String button = "";
    boolean initial = true;
    lab0_8Checks checks = new lab0_8Checks(dataX, dataY);
   
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
	//User u = ctx.getUser();
	//Course c = ctx.getCourse();

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
            //checks.submit(ctx);
        }
        else
        {
            button = "";
        }
    }
 %>
<html>
    <head>
        <title>Lab 8: Determination of Molecular Weight by Gas Density Measurements</title>
        <link rel="stylesheet" href="labs_css.css">
    </head>
    <body>
        <fieldset>
            <legend>Lab 8: Determination of Molecular Weight by Gas Density Measurements</legend>
            <form method="POST" action=""><!--add destination in action field-->
                <table>
                    <tr>
                        <td>
                            Unknown number:
                        </td>
                        <td>
                            <input type="text" name="00"  />
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
                            <th>
                            </th>
                            <th>
                                Sample 1
                            </th>
                            <th>
                                Sample 2
                            </th>
                            <th>
                                Sample 3
                            </th>
                        </tr>
                        <tr>
                            <td>
                                Weight of flask + wire + stopper
                            </td>
                            <td>
                                <input type="text" name="10"  />
                            </td>
                            <td>
                                <input type="text" name="11"  />
                            </td>
                            <td>
                                <input type="text" name="12"  />
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
                                Weight of flask + wire + stopper + condensed vapor
                            </td>
                            <td>
                                <input type="text" name="20"  />
                            </td>
                            <td>
                                <input type="text" name="21"  />
                            </td>
                            <td>
                                <input type="text" name="22"  />
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
                                Temperature of boiling water
                            </td>
                            <td>
                                <input type="text" name="30"  />
                            </td>
                            <td>
                                <input type="text" name="31"  />
                            </td>
                            <td>
                                <input type="text" name="32"  />
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
                        <tr>
                            <td>
                                Atmospheric pressure (mmHg)
                            </td>
                            <td>
                                <input type="text" name="40"  />
                            </td>
                            <td>
                                <input type="text" name="41"  />
                            </td>
                            <td>
                                <input type="text" name="42"  />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(4,2) != null){out.print(checks.getError(4, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Volume of flask
                            </td>
                            <td>
                                <input type="text" name="50"  />
                            </td>
                            <td>
                                <input type="text" name="51"  />
                            </td>
                            <td>
                                <input type="text" name="52"  />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(5,2) != null){out.print(checks.getError(5, 2));} %>
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
                                Weight of condensed vapor
                            </td>
                            <td>
                                <input type="text" name="60"  />
                            </td>
                            <td>
                                <input type="text" name="61"  />
                            </td>
                            <td>
                                <input type="text" name="62"  />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(6,2) != null){out.print(checks.getError(6, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Moles of vapor present
                            </td>
                            <td>
                                <input type="text" name="70"  />
                            </td>
                            <td>
                                <input type="text" name="71"  />
                            </td>
                            <td>
                                <input type="text" name="72"  />
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
                                <div style="color: red" >
                                <% if (checks.getError(7,1) != null){out.print(checks.getError(7, 1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(7,2) != null){out.print(checks.getError(7, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Molecular weight
                            </td>
                            <td>
                                <input type="text" name="80"  />
                            </td>
                            <td>
                                <input type="text" name="81"  />
                            </td>
                            <td>
                                <input type="text" name="82"  />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(8,2) != null){out.print(checks.getError(8, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Average molecular weight
                            </td>
                            <td>
                                <input type="text" name="90"  />
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
                                <% if (checks.getError(9,0) != null){out.print(checks.getError(9, 0));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
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