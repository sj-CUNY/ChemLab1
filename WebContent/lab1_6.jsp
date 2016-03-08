<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab1_6Checks" %>
<!DOCTYPE html>
<!--
This is compatible with any jsp additions. 
-->
<%!
    int dataX = 23;
    int dataY = 5;
    String button = "";
    boolean initial = true;
    lab1_6Checks checks = new lab1_6Checks(dataX, dataY);
   
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
        <title>Lab 6:  Determination of an Equilibrium Constant</title>
    </head>
    <body>
        <fieldset>
            <legend>Lab 6:  Determination of an Equilibrium Constant</legend>
            <form method="POST" action=""><!--add destination in action field-->
                <table>
                    <tr>
                        <td>
                            Partner's Name:
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
                <br>
                <fieldset>
                    <legend>DATA</legend>
                    <table>
                        <tr>
                            <th>
                                Test Tube
                            </th>
                            <th>
                                Absorbance
                            </th>
                            <th>
                                [FeSCN<sup>2+</sup>] <br>at equilibrium
                            </th>
                        </tr>
                        <tr>
                            <td>
                                1
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
                                2
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
                                3
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
                                4
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
                                5
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
                    </table>
                    <table>
                        <tr>
                            <td>
                                Test Tube 6 (standard, 1 x 10<sup>-4</sup> M). Absorbance 
                            </td>
                            <td>
                                <input type="text" name="60" <% if (checks.getData(6,0) != null){out.print("value=\"" + checks.getData(6,0) + "\"");}%> />
                            </td>
                            <td>
                                &epsilon;l
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
                                <div style="color: red" >
                                <% if (checks.getError(6,1) != null){out.print(checks.getError(6, 1));} %>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br>
                <fieldset>
                    <legend>RESULTS</legend>
                    <table>
                        <tr>
                            <th>
                            </th>
                            <th colspan="2">
                                Initial Moles
                            </th>
                            <th>
                            </th>
                            <th colspan="3">
                                Moles at Equilibrium
                            </th>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Fe<sup>3+</sup>
                            </td>
                            <td>
                                SCN<sup>-</sup>
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td>
                                Fe(SCN)<sup>2+</sup>
                            </td>
                            <td>
                                Fe<sup>3+</sup>
                            </td>
                            <td>
                                SCN<sup>-</sup>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                1
                            </td>
                            <td>
                                <input type="text" name="70" <% if (checks.getData(7,0) != null){out.print("value=\"" + checks.getData(7,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="71" <% if (checks.getData(7,1) != null){out.print("value=\"" + checks.getData(7,1) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                <input type="text" name="72" <% if (checks.getData(7,2) != null){out.print("value=\"" + checks.getData(7,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="73" <% if (checks.getData(7,3) != null){out.print("value=\"" + checks.getData(7,3) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="74" <% if (checks.getData(7,4) != null){out.print("value=\"" + checks.getData(7,4) + "\"");}%> />
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(7,2) != null){out.print(checks.getError(7, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(7,3) != null){out.print(checks.getError(7, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(7,4) != null){out.print(checks.getError(7, 4));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                2
                            </td>
                            <td>
                                <input type="text" name="80" <% if (checks.getData(8,0) != null){out.print("value=\"" + checks.getData(8,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="81" <% if (checks.getData(8,1) != null){out.print("value=\"" + checks.getData(8,1) + "\"");}%> />
                            </td>
                            <td>
                            </td>
                            <td>
                                <input type="text" name="82" <% if (checks.getData(8,2) != null){out.print("value=\"" + checks.getData(8,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="83" <% if (checks.getData(8,3) != null){out.print("value=\"" + checks.getData(8,3) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="84" <% if (checks.getData(8,4) != null){out.print("value=\"" + checks.getData(8,4) + "\"");}%> />
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(8,2) != null){out.print(checks.getError(8, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(8,3) != null){out.print(checks.getError(8, 3));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(8,4) != null){out.print(checks.getError(8, 4));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3
                            </td>
                            <td>
                                <input type="text" name="90" <% if (checks.getData(9,0) != null){out.print("value=\"" + checks.getData(9,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="91" <% if (checks.getData(9,1) != null){out.print("value=\"" + checks.getData(9,1) + "\"");}%> />
                            </td>
                            <td>
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
                                4
                            </td>
                            <td>
                                <input type="text" name="100" <% if (checks.getData(10,0) != null){out.print("value=\"" + checks.getData(10,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="101" <% if (checks.getData(10,1) != null){out.print("value=\"" + checks.getData(10,1) + "\"");}%> />
                            </td>
                            <td>
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
                                5
                            </td>
                            <td>
                                <input type="text" name="110" <% if (checks.getData(11,0) != null){out.print("value=\"" + checks.getData(11,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="111" <% if (checks.getData(11,1) != null){out.print("value=\"" + checks.getData(11,1) + "\"");}%> />
                            </td>
                            <td>
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
                            <th>
                            </th>
                            <th colspan="4">
                                Equilibrium Molar Concentrations
                            </th>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Fe<sup>3+</sup>
                            </td>
                            <td>
                                SCN<sup>-</sup>
                            </td>
                            <td>
                                FeSCN<sup>2+</sup>
                            </td>
                            <td>
                                K<sub>c</sub>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                1
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
                        </tr>
                        <tr>
                            <td>
                                2
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
                        </tr>
                        <tr>
                            <td>
                                3
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
                        </tr>
                        <tr>
                            <td>
                                4
                            </td>
                            <td>
                                <input type="text" name="150" <% if (checks.getData(15,0) != null){out.print("value=\"" + checks.getData(15,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="151" <% if (checks.getData(15,1) != null){out.print("value=\"" + checks.getData(15,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="152" <% if (checks.getData(15,2) != null){out.print("value=\"" + checks.getData(15,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="153" <% if (checks.getData(15,3) != null){out.print("value=\"" + checks.getData(15,3) + "\"");}%> />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(15,2) != null){out.print(checks.getError(15, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(15,3) != null){out.print(checks.getError(15, 3));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                5
                            </td>
                            <td>
                                <input type="text" name="160" <% if (checks.getData(16,0) != null){out.print("value=\"" + checks.getData(16,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="161" <% if (checks.getData(16,1) != null){out.print("value=\"" + checks.getData(16,1) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="162" <% if (checks.getData(16,2) != null){out.print("value=\"" + checks.getData(16,2) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="163" <% if (checks.getData(16,3) != null){out.print("value=\"" + checks.getData(16,3) + "\"");}%> />
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
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(16,1) != null){out.print(checks.getError(16, 1));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(16,2) != null){out.print(checks.getError(16, 2));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(16,3) != null){out.print(checks.getError(16, 3));} %>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                Average value of K<sub>c</sub> =
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
                    </table>
                    <br>
                    <b>Show calculation demonstrating how you determined:</b> 
                    <table>
                        <tr>
                            <td>
                                (1) Initial number of moles Fe<sup>3+</sup>
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
                                (2) Equilibrium concentration (MOLAR or mol/L) of FeSCN<sup>2+</sup>
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
                                (3) Moles of Fe<sup>3+</sup> and Fe(SCN)<sup>2+</sup> at equilibrium      
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
                                (4) Equilibrium concentration (MOLAR or mol/L) of Fe<sup>3+</sup>
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
                        <tr>
                            <td>
                                (5) The equilibrium constant K<sub>c</sub>
                            </td>
                            <td>
                                <input type="text" name="220" <% if (checks.getData(22,0) != null){out.print("value=\"" + checks.getData(22,0) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(22,0) != null){out.print(checks.getError(22, 0));} %>
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
