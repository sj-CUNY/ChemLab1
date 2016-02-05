<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab1_9Checks" %>
<!DOCTYPE html>
<!--
This is compatible with any jsp additions. 
-->
<%!
    int dataX = 30;
    int dataY = 3;
    String button = "";
    boolean initial = true;
    lab1_9Checks checks = new lab1_9Checks(dataX, dataY);
   
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
        <title>Lab 9: Acid- Base Titrations II: Potentiometric and Indicator Titrations</title>
    </head>
    <body>
        <fieldset>
            <legend>Lab 9: Acid- Base Titrations II: Potentiometric and Indicator Titrations</legend>
            <form method="POST" action=""><!--add destination in action field-->
                <table>
                    <tr>
                        <td>
                            Partner's Name(s):
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
                    <legend><b>DATA</b></legend>
                    <br>
                    <b>Hydrochloric acid</b>
                    <table>
                        <tr>
                            <th>
                                mL NaOH
                            </th>
                            <th>
                                pH
                            </th>
                            <th>
                                mL NaOH
                            </th>
                            <th>
                                pH
                            </th>
                            <th>
                                mL NaOH
                            </th>
                            <th>
                                pH
                            </th>
                        </tr>
                        <tr>
                            <td>
                                0
                            </td>
                            <td>
                                <input type="text" name="10" <% if (checks.getData(1,0) != null){out.print("value=\"" + checks.getData(1,0) + "\"");}%> />
                            </td>
                            <td>
                                23
                            </td>
                            <td>
                                <input type="text" name="11" <% if (checks.getData(1,1) != null){out.print("value=\"" + checks.getData(1,1) + "\"");}%> />
                            </td>
                            <td>
                                30
                            </td>
                            <td>
                                <input type="text" name="12" <% if (checks.getData(1,2) != null){out.print("value=\"" + checks.getData(1,2) + "\"");}%> />
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
                                <div style="color: red" >
                                <% if (checks.getError(1,1) != null){out.print(checks.getError(1, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(1,2) != null){out.print(checks.getError(1, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                5
                            </td>
                            <td>
                                <input type="text" name="20" <% if (checks.getData(2,0) != null){out.print("value=\"" + checks.getData(2,0) + "\"");}%> />
                            </td>
                            <td>
                                24
                            </td>
                            <td>
                                <input type="text" name="21" <% if (checks.getData(2,1) != null){out.print("value=\"" + checks.getData(2,1) + "\"");}%> />
                            </td>
                            <td>
                                35
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(2,1) != null){out.print(checks.getError(2, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(2,2) != null){out.print(checks.getError(2, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                10
                            </td>
                            <td>
                                <input type="text" name="30" <% if (checks.getData(3,0) != null){out.print("value=\"" + checks.getData(3,0) + "\"");}%> />
                            </td>
                            <td>
                                25
                            </td>
                            <td>
                                <input type="text" name="31" <% if (checks.getData(3,1) != null){out.print("value=\"" + checks.getData(3,1) + "\"");}%> />
                            </td>
                            <td>
                                40
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(3,1) != null){out.print(checks.getError(3, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(3,2) != null){out.print(checks.getError(3, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                15
                            </td>
                            <td>
                                <input type="text" name="40" <% if (checks.getData(4,0) != null){out.print("value=\"" + checks.getData(4,0) + "\"");}%> />
                            </td>
                            <td>
                                26
                            </td>
                            <td>
                                <input type="text" name="41" <% if (checks.getData(4,1) != null){out.print("value=\"" + checks.getData(4,1) + "\"");}%> />
                            </td>
                            <td>
                                45
                            </td>
                            <td>
                                <input type="text" name="42" <% if (checks.getData(4,2) != null){out.print("value=\"" + checks.getData(4,2) + "\"");}%> />
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
                                <div style="color: red" >
                                <% if (checks.getError(4,1) != null){out.print(checks.getError(4, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(4,2) != null){out.print(checks.getError(4, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                20
                            </td>
                            <td>
                                <input type="text" name="50" <% if (checks.getData(5,0) != null){out.print("value=\"" + checks.getData(5,0) + "\"");}%> />
                            </td>
                            <td>
                                27
                            </td>
                            <td>
                                <input type="text" name="51" <% if (checks.getData(5,1) != null){out.print("value=\"" + checks.getData(5,1) + "\"");}%> />
                            </td>
                            <td>
                                50
                            </td>
                            <td>
                                <input type="text" name="52" <% if (checks.getData(5,2) != null){out.print("value=\"" + checks.getData(5,2) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(5,2) != null){out.print(checks.getError(5, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                22
                            </td>
                            <td>
                                <input type="text" name="60" <% if (checks.getData(6,0) != null){out.print("value=\"" + checks.getData(6,0) + "\"");}%> />
                            </td>
                            <td>
                                28
                            </td>
                            <td>
                                <input type="text" name="61" <% if (checks.getData(6,1) != null){out.print("value=\"" + checks.getData(6,1) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <b>Acetic acid</b>
                    <table>
                        <tr>
                            <th>
                                mL NaOH
                            </th>
                            <th>
                                pH
                            </th>
                            <th>
                                mL NaOH
                            </th>
                            <th>
                                pH
                            </th>
                            <th>
                                mL NaOH
                            </th>
                            <th>
                                pH
                            </th>
                        </tr>
                        <tr>
                            <td>
                                0
                            </td>
                            <td>
                                <input type="text" name="70" <% if (checks.getData(7,0) != null){out.print("value=\"" + checks.getData(7,0) + "\"");}%> />
                            </td>
                            <td>
                                24
                            </td>
                            <td>
                                <input type="text" name="71" <% if (checks.getData(7,1) != null){out.print("value=\"" + checks.getData(7,1) + "\"");}%> />
                            </td>
                            <td>
                                32
                            </td>
                            <td>
                                <input type="text" name="72" <% if (checks.getData(7,2) != null){out.print("value=\"" + checks.getData(7,2) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(7,2) != null){out.print(checks.getError(7, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                5
                            </td>
                            <td>
                                <input type="text" name="80" <% if (checks.getData(8,0) != null){out.print("value=\"" + checks.getData(8,0) + "\"");}%> />
                            </td>
                            <td>
                                25
                            </td>
                            <td>
                                <input type="text" name="81" <% if (checks.getData(8,1) != null){out.print("value=\"" + checks.getData(8,1) + "\"");}%> />
                            </td>
                            <td>
                                33
                            </td>
                            <td>
                                <input type="text" name="82" <% if (checks.getData(8,2) != null){out.print("value=\"" + checks.getData(8,2) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(8,2) != null){out.print(checks.getError(8, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                10
                            </td>
                            <td>
                                <input type="text" name="90" <% if (checks.getData(9,0) != null){out.print("value=\"" + checks.getData(9,0) + "\"");}%> />
                            </td>
                            <td>
                                26
                            </td>
                            <td>
                                <input type="text" name="91" <% if (checks.getData(9,1) != null){out.print("value=\"" + checks.getData(9,1) + "\"");}%> />
                            </td>
                            <td>
                                34
                            </td>
                            <td>
                                <input type="text" name="92" <% if (checks.getData(9,2) != null){out.print("value=\"" + checks.getData(9,2) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(9,2) != null){out.print(checks.getError(9, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                15
                            </td>
                            <td>
                                <input type="text" name="100" <% if (checks.getData(10,0) != null){out.print("value=\"" + checks.getData(10,0) + "\"");}%> />
                            </td>
                            <td>
                                27
                            </td>
                            <td>
                                <input type="text" name="101" <% if (checks.getData(10,1) != null){out.print("value=\"" + checks.getData(10,1) + "\"");}%> />
                            </td>
                            <td>
                                35
                            </td>
                            <td>
                                <input type="text" name="102" <% if (checks.getData(10,2) != null){out.print("value=\"" + checks.getData(10,2) + "\"");}%> />
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
                        </tr>
                        <tr>
                            <td>
                                20
                            </td>
                            <td>
                                <input type="text" name="110" <% if (checks.getData(11,0) != null){out.print("value=\"" + checks.getData(11,0) + "\"");}%> />
                            </td>
                            <td>
                                28
                            </td>
                            <td>
                                <input type="text" name="111" <% if (checks.getData(11,1) != null){out.print("value=\"" + checks.getData(11,1) + "\"");}%> />
                            </td>
                            <td>
                                40
                            </td>
                            <td>
                                <input type="text" name="112" <% if (checks.getData(11,2) != null){out.print("value=\"" + checks.getData(11,2) + "\"");}%> />
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
                        </tr>
                        <tr>
                            <td>
                                21
                            </td>
                            <td>
                                <input type="text" name="120" <% if (checks.getData(12,0) != null){out.print("value=\"" + checks.getData(12,0) + "\"");}%> />
                            </td>
                            <td>
                                29
                            </td>
                            <td>
                                <input type="text" name="121" <% if (checks.getData(12,1) != null){out.print("value=\"" + checks.getData(12,1) + "\"");}%> />
                            </td>
                            <td>
                                45
                            </td>
                            <td>
                                <input type="text" name="122" <% if (checks.getData(12,2) != null){out.print("value=\"" + checks.getData(12,2) + "\"");}%> />
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(12,1) != null){out.print(checks.getError(12, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(12,2) != null){out.print(checks.getError(12, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                22
                            </td>
                            <td>
                                <input type="text" name="130" <% if (checks.getData(13,0) != null){out.print("value=\"" + checks.getData(13,0) + "\"");}%> />
                            </td>
                            <td>
                                30
                            </td>
                            <td>
                                <input type="text" name="131" <% if (checks.getData(13,1) != null){out.print("value=\"" + checks.getData(13,1) + "\"");}%> />
                            </td>
                            <td>
                                50
                            </td>
                            <td>
                                <input type="text" name="132" <% if (checks.getData(13,2) != null){out.print("value=\"" + checks.getData(13,2) + "\"");}%> />
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(13,1) != null){out.print(checks.getError(13, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(13,2) != null){out.print(checks.getError(13, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                23
                            </td>
                            <td>
                                <input type="text" name="140" <% if (checks.getData(14,0) != null){out.print("value=\"" + checks.getData(14,0) + "\"");}%> />
                            </td>
                            <td>
                                31
                            </td>
                            <td>
                                <input type="text" name="141" <% if (checks.getData(14,1) != null){out.print("value=\"" + checks.getData(14,1) + "\"");}%> />
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
                                <% if (checks.getError(14,0) != null){out.print(checks.getError(14, 0));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(14,1) != null){out.print(checks.getError(14, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table>
                        <tr>
                            <td>
                                <b>Acetic acid: Indicator titration: </b>Indicator used:
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
                    </table>
                    <br>
                    <table>
                        <tr>
                            <td>
                                Initial buret reading :
                            </td>
                            <td>
                                <input type="text" name="160" <% if (checks.getData(16,0) != null){out.print("value=\"" + checks.getData(16,0) + "\"");}%> />
                            </td>
                            <td>
                                Final buret reading:
                            </td>
                            <td>
                                <input type="text" name="161" <% if (checks.getData(16,1) != null){out.print("value=\"" + checks.getData(16,1) + "\"");}%> />
                            </td>
                            <td>
                                mL of NaOH used:
                            </td>
                            <td>
                                <input type="text" name="162" <% if (checks.getData(16,2) != null){out.print("value=\"" + checks.getData(16,2) + "\"");}%> />
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
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(16,1) != null){out.print(checks.getError(16, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(16,2) != null){out.print(checks.getError(16, 2));} %>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <b>Phosphoric acid</b>
                    <table>
                        <tr>
                            <th>
                                mL NaOH
                            </th>
                            <th>
                                pH
                            </th>
                            <th>
                                mL NaOH
                            </th>
                            <th>
                                pH
                            </th>
                            <th>
                                mL NaOH
                            </th>
                            <th>
                                pH
                            </th>
                        </tr>
                        <tr>
                            <td>
                                0
                            </td>
                            <td>
                                <input type="text" name="170" <% if (checks.getData(17,0) != null){out.print("value=\"" + checks.getData(17,0) + "\"");}%> />
                            </td>
                            <td>
                                17
                            </td>
                            <td>
                                <input type="text" name="171" <% if (checks.getData(17,1) != null){out.print("value=\"" + checks.getData(17,1) + "\"");}%> />
                            </td>
                            <td>
                                26
                            </td>
                            <td>
                                <input type="text" name="172" <% if (checks.getData(17,2) != null){out.print("value=\"" + checks.getData(17,2) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(17,1) != null){out.print(checks.getError(17, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(17,2) != null){out.print(checks.getError(17, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                5
                            </td>
                            <td>
                                <input type="text" name="180" <% if (checks.getData(18,0) != null){out.print("value=\"" + checks.getData(18,0) + "\"");}%> />
                            </td>
                            <td>
                                18
                            </td>
                            <td>
                                <input type="text" name="181" <% if (checks.getData(18,1) != null){out.print("value=\"" + checks.getData(18,1) + "\"");}%> />
                            </td>
                            <td>
                                27
                            </td>
                            <td>
                                <input type="text" name="182" <% if (checks.getData(18,2) != null){out.print("value=\"" + checks.getData(18,2) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(18,1) != null){out.print(checks.getError(18, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(18,2) != null){out.print(checks.getError(18, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                10
                            </td>
                            <td>
                                <input type="text" name="190" <% if (checks.getData(19,0) != null){out.print("value=\"" + checks.getData(19,0) + "\"");}%> />
                            </td>
                            <td>
                                19
                            </td>
                            <td>
                                <input type="text" name="191" <% if (checks.getData(19,1) != null){out.print("value=\"" + checks.getData(19,1) + "\"");}%> />
                            </td>
                            <td>
                                28
                            </td>
                            <td>
                                <input type="text" name="192" <% if (checks.getData(19,2) != null){out.print("value=\"" + checks.getData(19,2) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(19,1) != null){out.print(checks.getError(19, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(19,2) != null){out.print(checks.getError(19, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                11
                            </td>
                            <td>
                                <input type="text" name="200" <% if (checks.getData(20,0) != null){out.print("value=\"" + checks.getData(20,0) + "\"");}%> />
                            </td>
                            <td>
                                20
                            </td>
                            <td>
                                <input type="text" name="201" <% if (checks.getData(20,1) != null){out.print("value=\"" + checks.getData(20,1) + "\"");}%> />
                            </td>
                            <td>
                                29
                            </td>
                            <td>
                                <input type="text" name="202" <% if (checks.getData(20,2) != null){out.print("value=\"" + checks.getData(20,2) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(20,1) != null){out.print(checks.getError(20, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(20,2) != null){out.print(checks.getError(20, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                12
                            </td>
                            <td>
                                <input type="text" name="210" <% if (checks.getData(21,0) != null){out.print("value=\"" + checks.getData(21,0) + "\"");}%> />
                            </td>
                            <td>
                                21
                            </td>
                            <td>
                                <input type="text" name="211" <% if (checks.getData(21,1) != null){out.print("value=\"" + checks.getData(21,1) + "\"");}%> />
                            </td>
                            <td>
                                30
                            </td>
                            <td>
                                <input type="text" name="212" <% if (checks.getData(21,2) != null){out.print("value=\"" + checks.getData(21,2) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(21,1) != null){out.print(checks.getError(21, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(21,2) != null){out.print(checks.getError(21, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                13
                            </td>
                            <td>
                                <input type="text" name="220" <% if (checks.getData(22,0) != null){out.print("value=\"" + checks.getData(22,0) + "\"");}%> />
                            </td>
                            <td>
                                22
                            </td>
                            <td>
                                <input type="text" name="221" <% if (checks.getData(22,1) != null){out.print("value=\"" + checks.getData(22,1) + "\"");}%> />
                            </td>
                            <td>
                                35
                            </td>
                            <td>
                                <input type="text" name="222" <% if (checks.getData(22,2) != null){out.print("value=\"" + checks.getData(22,2) + "\"");}%> />
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
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(22,1) != null){out.print(checks.getError(22, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(22,2) != null){out.print(checks.getError(22, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                14
                            </td>
                            <td>
                                <input type="text" name="230" <% if (checks.getData(23,0) != null){out.print("value=\"" + checks.getData(23,0) + "\"");}%> />
                            </td>
                            <td>
                                23
                            </td>
                            <td>
                                <input type="text" name="231" <% if (checks.getData(23,1) != null){out.print("value=\"" + checks.getData(23,1) + "\"");}%> />
                            </td>
                            <td>
                                40
                            </td>
                            <td>
                                <input type="text" name="232" <% if (checks.getData(23,2) != null){out.print("value=\"" + checks.getData(23,2) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(23,0) != null){out.print(checks.getError(23, 0));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(23,1) != null){out.print(checks.getError(23, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(23,2) != null){out.print(checks.getError(23, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                15
                            </td>
                            <td>
                                <input type="text" name="240" <% if (checks.getData(24,0) != null){out.print("value=\"" + checks.getData(24,0) + "\"");}%> />
                            </td>
                            <td>
                                24
                            </td>
                            <td>
                                <input type="text" name="241" <% if (checks.getData(24,1) != null){out.print("value=\"" + checks.getData(24,1) + "\"");}%> />
                            </td>
                            <td>
                                45
                            </td>
                            <td>
                                <input type="text" name="242" <% if (checks.getData(24,2) != null){out.print("value=\"" + checks.getData(24,2) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(24,0) != null){out.print(checks.getError(24, 0));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(24,1) != null){out.print(checks.getError(24, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(24,2) != null){out.print(checks.getError(24, 2));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                16
                            </td>
                            <td>
                                <input type="text" name="250" <% if (checks.getData(25,0) != null){out.print("value=\"" + checks.getData(25,0) + "\"");}%> />
                            </td>
                            <td>
                                25
                            </td>
                            <td>
                                <input type="text" name="251" <% if (checks.getData(25,1) != null){out.print("value=\"" + checks.getData(25,1) + "\"");}%> />
                            </td>
                            <td>
                                50
                            </td>
                            <td>
                                <input type="text" name="252" <% if (checks.getData(25,2) != null){out.print("value=\"" + checks.getData(25,2) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(25,0) != null){out.print(checks.getError(25, 0));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(25,1) != null){out.print(checks.getError(25, 1));} %>
                                </div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(25,2) != null){out.print(checks.getError(25, 2));} %>
                                </div>
                            </td>
                        </tr>
                    </table>

                </fieldset>
                <br>
                <fieldset>
                    <legend><b>RESULTS</b></legend>
                    <table>
                        <tr>
                            <th>
                                Acid
                            </th>
                            <th>
                                pH @ Equivalence <br>point
                            </th>
                            <th>
                                Vol base @ Equivalence <br>point
                            </th>
                        </tr>
                        <tr>
                            <td>
                                HCl
                            </td>
                            <td>
                                <input type="text" name="260" <% if (checks.getData(26,0) != null){out.print("value=\"" + checks.getData(26,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="261" <% if (checks.getData(26,1) != null){out.print("value=\"" + checks.getData(26,1) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(26,0) != null){out.print(checks.getError(26, 0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(26,1) != null){out.print(checks.getError(26, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Acetic Acid
                            </td>
                            <td>
                                <input type="text" name="270" <% if (checks.getData(27,0) != null){out.print("value=\"" + checks.getData(27,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="271" <% if (checks.getData(27,1) != null){out.print("value=\"" + checks.getData(27,1) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(27,0) != null){out.print(checks.getError(27, 0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(27,1) != null){out.print(checks.getError(27, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                H<sub>3</sub>PO<sub>4</sub> (1st equivalence point)
                            </td>
                            <td>
                                <input type="text" name="280" <% if (checks.getData(28,0) != null){out.print("value=\"" + checks.getData(28,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="281" <% if (checks.getData(28,1) != null){out.print("value=\"" + checks.getData(28,1) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(28,0) != null){out.print(checks.getError(28, 0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(28,1) != null){out.print(checks.getError(28, 1));} %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                H<sub>3</sub>PO<sub>4</sub> (2nd equivalence point)
                            </td>
                            <td>
                                <input type="text" name="290" <% if (checks.getData(29,0) != null){out.print("value=\"" + checks.getData(29,0) + "\"");}%> />
                            </td>
                            <td>
                                <input type="text" name="291" <% if (checks.getData(29,1) != null){out.print("value=\"" + checks.getData(29,1) + "\"");}%> />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(29,0) != null){out.print(checks.getError(29, 0));} %>
                                </div>
                            </td>
                            <td>
                                <div style="color: red" >
                                <% if (checks.getError(29,1) != null){out.print(checks.getError(29, 1));} %>
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
