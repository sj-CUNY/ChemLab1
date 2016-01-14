<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab2_7Checks" %>
<!DOCTYPE html>
<!--
This is compatible with any jsp additions. 
-->
<%!
    int dataX = 9;
    int dataY = 5;
    String button = "";
    boolean initial = true;
    lab2_7Checks checks = new lab2_7Checks(dataX, dataY, "yccs_chemistrylab2_7");
   
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
        <title>Lab 7: Paper and Ion Exchange Chromatography</title>
    </head>
    <body>
        <fieldset>
            <legend>Lab 7: Paper and Ion Exchange Chromatography</legend>
            <form method="POST" action=""><!--add destination in action field-->
                <table>
                    <tr>
                        <td>
                            Partner's Name(s):
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
                    <tr>
                        <td>
                            Unknown Number:
                        </td>
                        <td>
                            <input type="text" name="10"  />
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
                </table>
                <br>
                <fieldset>
                    <legend>Technique #1: Paper Chromatography</legend>
                    <table>
                        <tr>
                            <th>
                            </th>
                            <th>
                                Distance Solvent <br>Traveled
                            </th>
                            <th>
                                Distance Sample <br>Traveled
                            </th>
                            <th>
                                R<sub>r</sub>
                            </th>
                            <th>
                                Color
                            </th>
                            <th>
                                Indictator(s) Present <br>In Unknown
                            </th>
                        </tr>
                        <tr>
                            <td>
                                Bromthymol blue
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
                            <td>
                                <input type="text" name="23"  />
                            </td>
                            <td>
                                <input type="text" name="24"  />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(2,3) != null){out.print(checks.getError(2, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(2,4) != null){out.print(checks.getError(2, 4));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Alizarin yellow
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
                            <td>
                                <input type="text" name="33"  />
                            </td>
                            <td>
                                <input type="text" name="34"  />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(3,3) != null){out.print(checks.getError(3, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(3,4) != null){out.print(checks.getError(3, 4));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phenol red
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
                            <td>
                                <input type="text" name="43"  />
                            </td>
                            <td>
                                <input type="text" name="44"  />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(4,3) != null){out.print(checks.getError(4, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(4,4) != null){out.print(checks.getError(4, 4));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Unknown
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
                            <td>
                                <input type="text" name="53"  />
                            </td>
                            <td>
                                <input type="text" name="54"  />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(5,3) != null){out.print(checks.getError(5, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(5,4) != null){out.print(checks.getError(5, 4));} %>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br>
                <fieldset>
                    <legend>Technique #2: Ion Exchange Chromatography </legend>
                    Complete the following Table by describing the results observed when the following tests were conducted. 
                    Indicated whether Ni<sup>2+</sup> or SO<sub>4</sub><sup>2-</sup> ions were present in each solution
                    <table>
                        <tr>
                            <th>
                            </th>
                            <th>
                                H<sub>2</sub>O Eluant- <br>Beaker 1
                            </th>
                            <th>
                                H<sub>2</sub>O Eluant- <br>Beaker 2
                            </th>
                            <th>
                                HCl Eluant- <br>Beaker 3
                            </th>
                        </tr>
                        <tr>
                            <td>
                                Test for Ni<sup>2+</sup>
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
                                Test for SO<sub>4</sub><sup>2-</sup>
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
                                Ion(s) Present
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
