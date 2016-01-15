<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab0_4Checks" %>

<!DOCTYPE html>
<%!
    int dataX = 4;
    int dataY = 3;
    String button = "";
    boolean initial = true;
    
    lab0_4Checks checks = new lab0_4Checks(dataX, dataY);
    
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
        <title>Lab 4: Ionic and Covalent Compounds</title>
        <link rel="stylesheet" href="labs_css.css">
        <datalist id="color" >
            <option value="clear" >clear</option>	
            <option value="blue" >blue</option>
            <option value="red" >red</option>
            <option value="green" >green</option>
            <option value="opaque" >opaque</option>
            <option value="white" >white</option>
            <option value="black" >black</option>
        </datalist>
        <datalist id="light" >
            <option value="light" >light</option>	
            <option value="no light" >no light</option>
            <option value="dim light" >dim light</option>
        </datalist>
        <datalist id="iorc" >
            <option value="ionic" >ionic</option>	
            <option value="covalent" >covalent</option>
        </datalist>
    </head>
    <body>
        <fieldset class="fieldset-auto-width">
            <legend>Lab 4: Ionic and Covalent Compounds</legend>
            <form method="POST" action="lab0_4.jsp">
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
                                <input list="color" name="00" <% if (checks.getData(0,0) != null){out.print("value=\"" + checks.getData(0,0) + "\"");}%> size="10"/>
                            </td>
                            <td>
                                <input list="light" name="01" <% if (checks.getData(0,1) != null){out.print("value=\"" + checks.getData(0,1) + "\"");}%> size="10"/>
                            </td>
                            <td>
                                <input list="iorc" name="02" <% if (checks.getData(0,2) != null){out.print("value=\"" + checks.getData(0,2) + "\"");}%> size="10"/>
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
                                <div style="color: red" >
                                    <% if (checks.getError(0,1) != null){out.print(checks.getError(0, 1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                    <% if (checks.getError(0,2) != null){out.print(checks.getError(0, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Solution B:
                            </td>
                            <td>
                                <input list="color" name="10" <% if (checks.getData(1,0) != null){out.print("value=\"" + checks.getData(1,0) + "\"");}%> size="10"/>
                            </td>
                            <td>
                                <input list="light" name="11" <% if (checks.getData(1,1) != null){out.print("value=\"" + checks.getData(1,1) + "\"");}%> size="10"/>
                            </td>
                            <td>
                                <input list="iorc" name="12" <% if (checks.getData(1,2) != null){out.print("value=\"" + checks.getData(1,2) + "\"");}%> size="10"/>
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
                                <input list="color" name="20" <% if (checks.getData(2,0) != null){out.print("value=\"" + checks.getData(2,0) + "\"");}%> size="10"/>
                            </td>
                            <td>
                                <input list="light" name="21" <% if (checks.getData(2,1) != null){out.print("value=\"" + checks.getData(2,1) + "\"");}%> size="10"/>
                            </td>
                            <td>
                                <input list="iorc" name="22" <% if (checks.getData(2,2) != null){out.print("value=\"" + checks.getData(2,2) + "\"");}%> size="10"/>
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
                                <input list="color" name="30" <% if (checks.getData(3,0) != null){out.print("value=\"" + checks.getData(3,0) + "\"");}%> size="10"/>
                            </td>
                            <td>
                                <input list="light" name="31" <% if (checks.getData(3,1) != null){out.print("value=\"" + checks.getData(3,1) + "\"");}%> size="10"/>
                            </td>
                            <td>
                                <input list="iorc" name="32" <% if (checks.getData(3,2) != null){out.print("value=\"" + checks.getData(3,2) + "\"");}%> size="10"/>
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
