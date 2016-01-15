<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab0_7Checks" %>

<!DOCTYPE html>
<%!
    int dataX = 13;
    int dataY = 4;
    String button = "";
    boolean initial = true;
    lab0_7Checks checks = new lab0_7Checks(dataX, dataY);
   
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
                if (j == 3)
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
        <title>Lab 7: Volumetric Determination of an Unknown Chloride</title>
    </head>
    <body>
        <fieldset>
            <legend>Lab 7: Volumetric Determination of an Unknown Chloride</legend>
            <form method="POST" action=""><!--add destination in action field-->
                <div>
                    Unknown number:<input type="text" name="00" <% if (checks.getData(0,0) != null){out.print("value=\"" + checks.getData(0,0) + "\"");}%> /><br>
                    <div style="color: red" >
                        <% if (checks.getError(0,0) != null){out.print(checks.getError(0, 0));} %>
                    </div>
                </div>

                <fieldset>
                    <legend>I. DATA</legend>
                    <table>
                        <tr>
                            <th>
                            </th>
                            <th>
                                Sample #1
                            </th>
                            <th>
                                Sample #2
                            </th>
                            <th>
                                Sample #3
                            </th>
                            <th>
                                Unit
                            </th>
                        </tr>
                        <tr>
                            <td>
                                Weight of weighing papter + sample
                            </td>
                            <td>
                                <input type="text" name="10" <% if (checks.getData(1,0) != null){out.print("value=\"" + checks.getData(1,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="11" <% if (checks.getData(1,1) != null){out.print("value=\"" + checks.getData(1,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="12" <% if (checks.getData(1,2) != null){out.print("value=\"" + checks.getData(1,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="13" <% if (checks.getData(1,3) != null){out.print("value=\"" + checks.getData(1,3) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(1,0) != null){out.print(checks.getError(1,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(1,1) != null){out.print(checks.getError(1,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(1,2) != null){out.print(checks.getError(1,2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(1,3) != null){out.print(checks.getError(1,3));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                weight of weighing paper
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
                            <td>
                                <input type="text" name="23" <% if (checks.getData(2,3) != null){out.print("value=\"" + checks.getData(2,3) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(2,0) != null){out.print(checks.getError(2,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(2,1) != null){out.print(checks.getError(2,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(2,2) != null){out.print(checks.getError(2,2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(2,3) != null){out.print(checks.getError(2,3));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                weight of sample to be titrated
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
                            <td>
                                <input type="text" name="33" <% if (checks.getData(3,3) != null){out.print("value=\"" + checks.getData(3,3) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(3,0) != null){out.print(checks.getError(3,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(3,1) != null){out.print(checks.getError(3,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(3,2) != null){out.print(checks.getError(3,2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(3,3) != null){out.print(checks.getError(3,3));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Final buret reading
                            </td>
                            <td>
                                <input type="text" name="40" <% if (checks.getData(4,0) != null){out.print("value=\"" + checks.getData(4,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="41" <% if (checks.getData(4,1) != null){out.print("value=\"" + checks.getData(4,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="42" <% if (checks.getData(4,2) != null){out.print("value=\"" + checks.getData(4,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="43" <% if (checks.getData(4,3) != null){out.print("value=\"" + checks.getData(4,3) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(4,0) != null){out.print(checks.getError(4,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(4,1) != null){out.print(checks.getError(4,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(4,2) != null){out.print(checks.getError(4,2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(4,3) != null){out.print(checks.getError(4,3));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Initial buret reading
                            </td>
                            <td>
                                <input type="text" name="50" <% if (checks.getData(5,0) != null){out.print("value=\"" + checks.getData(5,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="51" <% if (checks.getData(5,1) != null){out.print("value=\"" + checks.getData(5,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="52" <% if (checks.getData(5,2) != null){out.print("value=\"" + checks.getData(5,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="53" <% if (checks.getData(5,3) != null){out.print("value=\"" + checks.getData(5,3) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(5,0) != null){out.print(checks.getError(5,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(5,1) != null){out.print(checks.getError(5,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(5,2) != null){out.print(checks.getError(5,2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(5,3) != null){out.print(checks.getError(5,3));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Volume of AgNO3 used
                            </td>
                            <td>
                                <input type="text" name="60" <% if (checks.getData(6,0) != null){out.print("value=\"" + checks.getData(6,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="61" <% if (checks.getData(6,1) != null){out.print("value=\"" + checks.getData(6,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="62" <% if (checks.getData(6,2) != null){out.print("value=\"" + checks.getData(6,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="63" <% if (checks.getData(6,3) != null){out.print("value=\"" + checks.getData(6,3) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(6,0) != null){out.print(checks.getError(6,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(6,1) != null){out.print(checks.getError(6,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(6,2) != null){out.print(checks.getError(6,2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(6,3) != null){out.print(checks.getError(6,3));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Molarity of AgNO<sub>3</sub>
                            </td>
                            <td>
                                <input type="text" name="70" <% if (checks.getData(7,0) != null){out.print("value=\"" + checks.getData(7,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="71" <% if (checks.getData(7,1) != null){out.print("value=\"" + checks.getData(7,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="72" <% if (checks.getData(7,2) != null){out.print("value=\"" + checks.getData(7,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="73" <% if (checks.getData(7,3) != null){out.print("value=\"" + checks.getData(7,3) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(7,0) != null){out.print(checks.getError(7,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(7,1) != null){out.print(checks.getError(7,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(7,2) != null){out.print(checks.getError(7,2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(7,3) != null){out.print(checks.getError(7,3));} %>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset>
                    <legend>II. RESULTS</legend>
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
                                moles of AgNO<sub>3</sub> used
                            </td>
                            <td>
                                <input type="text" name="80" <% if (checks.getData(8,0) != null){out.print("value=\"" + checks.getData(8,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="81" <% if (checks.getData(8,1) != null){out.print("value=\"" + checks.getData(8,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="82" <% if (checks.getData(8,2) != null){out.print("value=\"" + checks.getData(8,2) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(8,0) != null){out.print(checks.getError(8,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(8,1) != null){out.print(checks.getError(8,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(8,2) != null){out.print(checks.getError(8,2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                moles of Cl<sup>-</sup> titrated
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
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(9,0) != null){out.print(checks.getError(9,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(9,1) != null){out.print(checks.getError(9,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(9,2) != null){out.print(checks.getError(9,2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                grams of Cl<sup>-</sup> titrated
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
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(10,0) != null){out.print(checks.getError(10,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(10,1) != null){out.print(checks.getError(10,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(10,2) != null){out.print(checks.getError(10,2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                %Cl<sup>-</sup> in unknown
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
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(11,0) != null){out.print(checks.getError(11,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(11,1) != null){out.print(checks.getError(11,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(11,2) != null){out.print(checks.getError(11,2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                average %Cl<sup>-</sup>
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
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(12,0) != null){out.print(checks.getError(12,0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(12,1) != null){out.print(checks.getError(12,1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red">
                                    <% if (checks.getError(12,2) != null){out.print(checks.getError(12,2));} %>
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
