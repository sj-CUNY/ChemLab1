<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab0_1Checks" %>

<!DOCTYPE html>
<%!
    int dataX = 12;
    int dataY = 3;
    String button = "";
    boolean initial = true;
    
    lab0_1Checks checks = new lab0_1Checks(dataX, dataY);
   
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
            checks.submit();
        }
        else
        {
            button = "";
        }
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
            <option value="cm3" >cm<sup>3</sup></option>
            <option value="s" >s</option>
            <option value="in" >in</option>
            <option value="ft" >ft</option>
        </datalist>	
    </head>
    <body>
    	<fieldset class="fieldset-auto-width">
            <legend>Lab 1: Weighing Measurements: The Balance</legend>
            <form method="POST" action="lab0_1.jsp?course_id=${ctx.courseId.externalString}&user_id=${ctx.userId.externalString}">
            <fieldset>
                <legend>Basic info</legend>
                <table>
                    <tr>
                        <th>
                            Unknown number of metal rod:
                        </th>
                        <th>
                            <input type="text" name="00" <% if (checks.getData(0,0) != null){out.print("value=\"" + checks.getData(0,0) + "\"");}%> />
                        </th>
                    </tr>
                    <tr>
                        <th>
                        </th>
                        <th>
                            <div style="color: red" >
                                <% if (checks.getError(0,0) != null){out.print(checks.getError(0, 0));} %>
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            Unknown number of metal wire:
                        </th>
                        <th>
                            <input type="text" name="10" <% if (checks.getData(1,0) != null){out.print("value=\"" + checks.getData(1,0) + "\"");}%> />
                        </th>
                    </tr>
                    <tr>
                        <th>
                        </th>
                        <th>
                            <div style="color: red" >
                                <% if (checks.getError(1,0) != null){out.print(checks.getError(1, 0));} %>
                            </div>
                        </th>
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
                            <input type="text" name="20" <% if (checks.getData(2,0) != null){out.print("value=\"" + checks.getData(2,0) + "\"");}%> />
                        </td>
                        <td>
                            <input list="units" name="21" <% if (checks.getData(2,1) != null){out.print("value=\"" + checks.getData(2,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input type="text" name="22" <% if (checks.getData(2,2) != null){out.print("value=\"" + checks.getData(2,2) + "\"");}%> />
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
                    </tr>
                    <tr>
                        <td>
                            Vial + Sodium chloride
                        </td>
                        <td>
                            <input type="text" name="30" <% if (checks.getData(3,0) != null){out.print("value=\"" + checks.getData(3,0) + "\"");}%> />
                        </td>
                        <td>
                            <input list="units" name="31" <% if (checks.getData(3,1) != null){out.print("value=\"" + checks.getData(3,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input type="text" name="32" <% if (checks.getData(3,2) != null){out.print("value=\"" + checks.getData(3,2) + "\"");}%> />
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
                            <input type="text" name="40" <% if (checks.getData(4,0) != null){out.print("value=\"" + checks.getData(4,0) + "\"");}%> />
                        </td>
                        <td>
                            <input list="units" name="41" <% if (checks.getData(4,1) != null){out.print("value=\"" + checks.getData(4,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input type="text" name="42" <% if (checks.getData(4,2) != null){out.print("value=\"" + checks.getData(4,2) + "\"");}%> />
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
                    </tr>
                    <tr>
                        <td>
                            Metal wire - Trial 1
                        </td>
                        <td>
                            <input type="text" name="50" <% if (checks.getData(5,0) != null){out.print("value=\"" + checks.getData(5,0) + "\"");}%> />
                        </td>
                        <td>
                            <input list="units" name="51" <% if (checks.getData(5,1) != null){out.print("value=\"" + checks.getData(5,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input type="text" name="52" <% if (checks.getData(5,2) != null){out.print("value=\"" + checks.getData(5,2) + "\"");}%> />
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
                    </tr>
                    <tr>
                        <td>
                            Trial 2
                        </td>
                        <td>
                            <input type="text" name="60" <% if (checks.getData(6,0) != null){out.print("value=\"" + checks.getData(6,0) + "\"");}%> />
                        </td>
                        <td>
                            <input list="units" name="61" <% if (checks.getData(6,1) != null){out.print("value=\"" + checks.getData(6,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input type="text" name="62" <% if (checks.getData(6,2) != null){out.print("value=\"" + checks.getData(6,2) + "\"");}%> />
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
                    </tr>
                    <tr>
                        <td>
                            Trial 3
			</td>
			<td>
                            <input type="text" name="70" <% if (checks.getData(7,0) != null){out.print("value=\"" + checks.getData(7,0) + "\"");}%> />
                        </td>
                        <td>
                            <input list="units" name="71" <% if (checks.getData(7,1) != null){out.print("value=\"" + checks.getData(7,1) + "\"");}%> size="3" />
                        </td>
                        <td>
                            <input type="text" name="72" <% if (checks.getData(7,2) != null){out.print("value=\"" + checks.getData(7,2) + "\"");}%> />
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
                    </tr>
                    <tr>
			<td>
                            Weighing paper
			</td>
			<td>
                            <input type="text" name="80" <% if (checks.getData(8,0) != null){out.print("value=\"" + checks.getData(8,0) + "\"");}%> />
                        </td>
                        <td>
                            <input list="units" name="81" <% if (checks.getData(8,1) != null){out.print("value=\"" + checks.getData(8,1) + "\"");}%> size="3" />
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
                            Weighing paper and sodium chloride
			</td>
			<td>
                            <input type="text" name="90" <% if (checks.getData(9,0) != null){out.print("value=\"" + checks.getData(9,0) + "\"");}%> />
                        </td>
                        <td>
                            <input list="units" name="91" <% if (checks.getData(9,1) != null){out.print("value=\"" + checks.getData(9,1) + "\"");}%> size="3" />
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
                            <input type="text" name="100" <% if (checks.getData(10,0) != null){out.print("value=\"" + checks.getData(10,0) + "\"");}%> />
                        </td>
                        <td>
                            <input list="units" name="101" <% if (checks.getData(10,1) != null){out.print("value=\"" + checks.getData(10,1) + "\"");}%> size="3" />
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
                            Weight of sodium chloride sample 
                            <br>
                            removed from vial 
                        </td>
			<td>
                            <input type="text" name="110" <% if (checks.getData(11,0) != null){out.print("value=\"" + checks.getData(11,0) + "\"");}%> />
                        </td>
                        <td>
                            <input list="units" name="111" <% if (checks.getData(11,1) != null){out.print("value=\"" + checks.getData(11,1) + "\"");}%> size="3" />
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
 		</table>
            </fieldset>
            <br>
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