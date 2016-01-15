<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Labs.lab0_9Checks" %>
<!DOCTYPE html>
<%!
    int dataX = 68;
    int dataY = 3;
    String button = "";
    boolean initial = true;
    lab0_9Checks checks = new lab0_9Checks(dataX, dataY);
   
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
        <title>Lab 9: Thermochemistry: Determination of the Heat of Neutralization</title>
        <link rel="stylesheet" href="labs_css.css">
    </head>
    <body>
        <fieldset>
            <legend>Lab 9: Thermochemistry: Determination of the Heat of Neutralization</legend>
            <form method="POST" action=""><!--add destination in action field-->
                <fieldset>
                    <legend>DATA AND RESULTS</legend>
                    Determination of Heat of Neutralization<br><br>
                    <fieldset>
                        <legend>1M NaOH + 1M HCl</legend>
                        <table>
                            <tr>
                                <td>
                                    Volume of NaOH:
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
                                    Volume of HCl:
                                </td>
                                <td>
                                    <input type="text" name="10" <% if (checks.getData(1,0) != null){out.print("value=\"" + checks.getData(1,0) + "\"");}%> />
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
                                    Total volume after mixing :
                                </td>
                                <td>
                                    <input type="text" name="20" <% if (checks.getData(2,0) != null){out.print("value=\"" + checks.getData(2,0) + "\"");}%> />
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
                        </table>
                        <table>
                            <tr>
                                <th>

                                </th>
                                <th>
                                </th>
                                <th>
                                    Temperature (°C)
                                </th>
                                <th>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    Time (min)
                                </th>
                                <th>
                                    NaOH
                                </th>
                                <th>
                                    HCl
                                </th>
                                <th>
                                    Mixture
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    0.0
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
                                    1.0
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
                                    2.0
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
                            <tr>
                                <td>
                                    3.0
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
                                    4.0
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
                                    5.0
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
                                    6.0
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
                            </tr>
                            <tr>
                                <td>
                                    6.5
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
                            </tr>
                            <tr>
                                <td>
                                    7.0
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
                            </tr>
                            <tr>
                                <td>
                                    7.5
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
                            </tr>
                            <tr>
                                <td>
                                    8.0
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
                            </tr>
                            <tr>
                                <td>
                                    8.5
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
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    net ionic equation:
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
                                    T<sub>1</sub>=
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
                                    T<sub>2</sub>=
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
                                    &Delta;T = T<sub>1</sub> - T<sub>2</sub> =
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
                                    q =
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
                                    n =
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
                                    &Delta;H =
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
                    <fieldset>
                        <legend>1M NaOH + 1M HAc</legend>
                        <table>
                            <tr>
                                <td>
                                    Volume of NaOH:
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
                            <tr>
                                <td>
                                    Volume of HAc:
                                </td>
                                <td>
                                    <input type="text" name="230" <% if (checks.getData(23,0) != null){out.print("value=\"" + checks.getData(23,0) + "\"");}%> />
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
                            </tr>
                            <tr>
                                <td>
                                    Total volume after mixing :
                                </td>
                                <td>
                                    <input type="text" name="240" <% if (checks.getData(24,0) != null){out.print("value=\"" + checks.getData(24,0) + "\"");}%> />
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
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <th>

                                </th>
                                <th>
                                </th>
                                <th>
                                    Temperature (°C)
                                </th>
                                <th>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    Time (min)
                                </th>
                                <th>
                                    NaOH
                                </th>
                                <th>
                                    HAc
                                </th>
                                <th>
                                    Mixture
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    0.0
                                </td>
                                <td>
                                    <input type="text" name="250" <% if (checks.getData(25,0) != null){out.print("value=\"" + checks.getData(25,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="251" <% if (checks.getData(25,1) != null){out.print("value=\"" + checks.getData(25,1) + "\"");}%> />
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
                                    <div style="color: red" >
                                    <% if (checks.getError(25,1) != null){out.print(checks.getError(25, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(25,2) != null){out.print(checks.getError(25, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    1.0
                                </td>
                                <td>
                                    <input type="text" name="260" <% if (checks.getData(26,0) != null){out.print("value=\"" + checks.getData(26,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="261" <% if (checks.getData(26,1) != null){out.print("value=\"" + checks.getData(26,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="262" <% if (checks.getData(26,2) != null){out.print("value=\"" + checks.getData(26,2) + "\"");}%> />
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
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(26,2) != null){out.print(checks.getError(26, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    2.0
                                </td>
                                <td>
                                    <input type="text" name="270" <% if (checks.getData(27,0) != null){out.print("value=\"" + checks.getData(27,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="271" <% if (checks.getData(27,1) != null){out.print("value=\"" + checks.getData(27,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="272" <% if (checks.getData(27,2) != null){out.print("value=\"" + checks.getData(27,2) + "\"");}%> />
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
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(27,2) != null){out.print(checks.getError(27, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    3.0
                                </td>
                                <td>
                                    <input type="text" name="280" <% if (checks.getData(28,0) != null){out.print("value=\"" + checks.getData(28,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="281" <% if (checks.getData(28,1) != null){out.print("value=\"" + checks.getData(28,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="282" <% if (checks.getData(28,2) != null){out.print("value=\"" + checks.getData(28,2) + "\"");}%> />
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
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(28,2) != null){out.print(checks.getError(28, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    4.0
                                </td>
                                <td>
                                    <input type="text" name="290" <% if (checks.getData(29,0) != null){out.print("value=\"" + checks.getData(29,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="291" <% if (checks.getData(29,1) != null){out.print("value=\"" + checks.getData(29,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="292" <% if (checks.getData(29,2) != null){out.print("value=\"" + checks.getData(29,2) + "\"");}%> />
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
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(29,2) != null){out.print(checks.getError(29, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    5.0
                                </td>
                                <td>
                                    <input type="text" name="300" <% if (checks.getData(30,0) != null){out.print("value=\"" + checks.getData(30,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="301" <% if (checks.getData(30,1) != null){out.print("value=\"" + checks.getData(30,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="302" <% if (checks.getData(30,2) != null){out.print("value=\"" + checks.getData(30,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(30,0) != null){out.print(checks.getError(30, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(30,1) != null){out.print(checks.getError(30, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(30,2) != null){out.print(checks.getError(30, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    6.0
                                </td>
                                <td>
                                    <input type="text" name="310" <% if (checks.getData(31,0) != null){out.print("value=\"" + checks.getData(31,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="311" <% if (checks.getData(31,1) != null){out.print("value=\"" + checks.getData(31,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="312" <% if (checks.getData(31,2) != null){out.print("value=\"" + checks.getData(31,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(31,0) != null){out.print(checks.getError(31, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(31,1) != null){out.print(checks.getError(31, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(31,2) != null){out.print(checks.getError(31, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    6.5
                                </td>
                                <td>
                                    <input type="text" name="320" <% if (checks.getData(32,0) != null){out.print("value=\"" + checks.getData(32,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="321" <% if (checks.getData(32,1) != null){out.print("value=\"" + checks.getData(32,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="322" <% if (checks.getData(32,2) != null){out.print("value=\"" + checks.getData(32,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(32,0) != null){out.print(checks.getError(32, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(32,1) != null){out.print(checks.getError(32, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(32,2) != null){out.print(checks.getError(32, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    7.0
                                </td>
                                <td>
                                    <input type="text" name="330" <% if (checks.getData(33,0) != null){out.print("value=\"" + checks.getData(33,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="331" <% if (checks.getData(33,1) != null){out.print("value=\"" + checks.getData(33,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="332" <% if (checks.getData(33,2) != null){out.print("value=\"" + checks.getData(33,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(33,0) != null){out.print(checks.getError(33, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(33,1) != null){out.print(checks.getError(33, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(33,2) != null){out.print(checks.getError(33, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    7.5
                                </td>
                                <td>
                                    <input type="text" name="340" <% if (checks.getData(34,0) != null){out.print("value=\"" + checks.getData(34,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="341" <% if (checks.getData(34,1) != null){out.print("value=\"" + checks.getData(34,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="342" <% if (checks.getData(34,2) != null){out.print("value=\"" + checks.getData(34,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(34,0) != null){out.print(checks.getError(34, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(34,1) != null){out.print(checks.getError(34, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(34,2) != null){out.print(checks.getError(34, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    8.0
                                </td>
                                <td>
                                    <input type="text" name="350" <% if (checks.getData(35,0) != null){out.print("value=\"" + checks.getData(35,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="351" <% if (checks.getData(35,1) != null){out.print("value=\"" + checks.getData(35,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="352" <% if (checks.getData(35,2) != null){out.print("value=\"" + checks.getData(35,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(35,0) != null){out.print(checks.getError(35, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(35,1) != null){out.print(checks.getError(35, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(35,2) != null){out.print(checks.getError(35, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    8.5
                                </td>
                                <td>
                                    <input type="text" name="360" <% if (checks.getData(36,0) != null){out.print("value=\"" + checks.getData(36,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="361" <% if (checks.getData(36,1) != null){out.print("value=\"" + checks.getData(36,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="362" <% if (checks.getData(36,2) != null){out.print("value=\"" + checks.getData(36,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(36,0) != null){out.print(checks.getError(36, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(36,1) != null){out.print(checks.getError(36, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(36,2) != null){out.print(checks.getError(36, 2));} %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    net ionic equation:
                                </td>
                                <td>
                                    <input type="text" name="370" <% if (checks.getData(37,0) != null){out.print("value=\"" + checks.getData(37,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(37,0) != null){out.print(checks.getError(37, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    T<sub>1</sub>=
                                </td>
                                <td>
                                    <input type="text" name="380" <% if (checks.getData(38,0) != null){out.print("value=\"" + checks.getData(38,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(38,0) != null){out.print(checks.getError(38, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    T<sub>2</sub>=
                                </td>
                                <td>
                                    <input type="text" name="390" <% if (checks.getData(39,0) != null){out.print("value=\"" + checks.getData(39,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(39,0) != null){out.print(checks.getError(39, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &Delta;T = T<sub>1</sub> - T<sub>2</sub> =
                                </td>
                                <td>
                                    <input type="text" name="400" <% if (checks.getData(40,0) != null){out.print("value=\"" + checks.getData(40,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(40,0) != null){out.print(checks.getError(40, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    q =
                                </td>
                                <td>
                                    <input type="text" name="410" <% if (checks.getData(41,0) != null){out.print("value=\"" + checks.getData(41,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(41,0) != null){out.print(checks.getError(41, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    n =
                                </td>
                                <td>
                                    <input type="text" name="420" <% if (checks.getData(42,0) != null){out.print("value=\"" + checks.getData(42,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(42,0) != null){out.print(checks.getError(42, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &Delta;H =
                                </td>
                                <td>
                                    <input type="text" name="430" <% if (checks.getData(43,0) != null){out.print("value=\"" + checks.getData(43,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(43,0) != null){out.print(checks.getError(43, 0));} %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset>
                        <legend>1M NH<sub>3</sub> + 1M HCl</legend>
                        <table>
                            <tr>
                                <td>
                                    Volume of NH<sub>3</sub>:
                                </td>
                                <td>
                                    <input type="text" name="440" <% if (checks.getData(44,0) != null){out.print("value=\"" + checks.getData(44,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(44,0) != null){out.print(checks.getError(44, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Volume of HAc:
                                </td>
                                <td>
                                    <input type="text" name="450" <% if (checks.getData(45,0) != null){out.print("value=\"" + checks.getData(45,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(45,0) != null){out.print(checks.getError(45, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Total volume after mixing :
                                </td>
                                <td>
                                    <input type="text" name="460" <% if (checks.getData(46,0) != null){out.print("value=\"" + checks.getData(46,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(46,0) != null){out.print(checks.getError(46, 0));} %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <th>

                                </th>
                                <th>
                                </th>
                                <th>
                                    Temperature (°C)
                                </th>
                                <th>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    Time (min)
                                </th>
                                <th>
                                    NH<sub>3</sub>
                                </th>
                                <th>
                                    HAc
                                </th>
                                <th>
                                    Mixture
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    0.0
                                </td>
                                <td>
                                    <input type="text" name="470" <% if (checks.getData(47,0) != null){out.print("value=\"" + checks.getData(47,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="471" <% if (checks.getData(47,1) != null){out.print("value=\"" + checks.getData(47,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="472" <% if (checks.getData(47,2) != null){out.print("value=\"" + checks.getData(47,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(47,0) != null){out.print(checks.getError(47, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(47,1) != null){out.print(checks.getError(47, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(47,2) != null){out.print(checks.getError(47, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    1.0
                                </td>
                                <td>
                                    <input type="text" name="480" <% if (checks.getData(48,0) != null){out.print("value=\"" + checks.getData(48,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="481" <% if (checks.getData(48,1) != null){out.print("value=\"" + checks.getData(48,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="482" <% if (checks.getData(48,2) != null){out.print("value=\"" + checks.getData(48,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(48,0) != null){out.print(checks.getError(48, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(48,1) != null){out.print(checks.getError(48, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(48,2) != null){out.print(checks.getError(48, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    2.0
                                </td>
                                <td>
                                    <input type="text" name="490" <% if (checks.getData(49,0) != null){out.print("value=\"" + checks.getData(49,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="491" <% if (checks.getData(49,1) != null){out.print("value=\"" + checks.getData(49,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="492" <% if (checks.getData(49,2) != null){out.print("value=\"" + checks.getData(49,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(49,0) != null){out.print(checks.getError(49, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(49,1) != null){out.print(checks.getError(49, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(49,2) != null){out.print(checks.getError(49, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    3.0
                                </td>
                                <td>
                                    <input type="text" name="500" <% if (checks.getData(50,0) != null){out.print("value=\"" + checks.getData(50,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="501" <% if (checks.getData(50,1) != null){out.print("value=\"" + checks.getData(50,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="502" <% if (checks.getData(50,2) != null){out.print("value=\"" + checks.getData(50,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(50,0) != null){out.print(checks.getError(50, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(50,1) != null){out.print(checks.getError(50, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(50,2) != null){out.print(checks.getError(50, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    4.0
                                </td>
                                <td>
                                    <input type="text" name="510" <% if (checks.getData(51,0) != null){out.print("value=\"" + checks.getData(51,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="511" <% if (checks.getData(51,1) != null){out.print("value=\"" + checks.getData(51,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="512" <% if (checks.getData(51,2) != null){out.print("value=\"" + checks.getData(51,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(51,0) != null){out.print(checks.getError(51, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(51,1) != null){out.print(checks.getError(51, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(51,2) != null){out.print(checks.getError(51, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    5.0
                                </td>
                                <td>
                                    <input type="text" name="520" <% if (checks.getData(52,0) != null){out.print("value=\"" + checks.getData(52,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="521" <% if (checks.getData(52,1) != null){out.print("value=\"" + checks.getData(52,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="522" <% if (checks.getData(52,2) != null){out.print("value=\"" + checks.getData(52,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(52,0) != null){out.print(checks.getError(52, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(52,1) != null){out.print(checks.getError(52, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(52,2) != null){out.print(checks.getError(52, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    6.0
                                </td>
                                <td>
                                    <input type="text" name="530" <% if (checks.getData(53,0) != null){out.print("value=\"" + checks.getData(53,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="531" <% if (checks.getData(53,1) != null){out.print("value=\"" + checks.getData(53,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="532" <% if (checks.getData(53,2) != null){out.print("value=\"" + checks.getData(53,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(53,0) != null){out.print(checks.getError(53, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(53,1) != null){out.print(checks.getError(53, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(53,2) != null){out.print(checks.getError(53, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    6.5
                                </td>
                                <td>
                                    <input type="text" name="540" <% if (checks.getData(54,0) != null){out.print("value=\"" + checks.getData(54,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="541" <% if (checks.getData(54,1) != null){out.print("value=\"" + checks.getData(54,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="542" <% if (checks.getData(54,2) != null){out.print("value=\"" + checks.getData(54,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(54,0) != null){out.print(checks.getError(54, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(54,1) != null){out.print(checks.getError(54, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(54,2) != null){out.print(checks.getError(54, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    7.0
                                </td>
                                <td>
                                    <input type="text" name="550" <% if (checks.getData(55,0) != null){out.print("value=\"" + checks.getData(55,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="551" <% if (checks.getData(55,1) != null){out.print("value=\"" + checks.getData(55,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="552" <% if (checks.getData(55,2) != null){out.print("value=\"" + checks.getData(55,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(55,0) != null){out.print(checks.getError(55, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(55,1) != null){out.print(checks.getError(55, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(55,2) != null){out.print(checks.getError(55, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    7.5
                                </td>
                                <td>
                                    <input type="text" name="560" <% if (checks.getData(56,0) != null){out.print("value=\"" + checks.getData(56,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="561" <% if (checks.getData(56,1) != null){out.print("value=\"" + checks.getData(56,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="562" <% if (checks.getData(56,2) != null){out.print("value=\"" + checks.getData(56,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(56,0) != null){out.print(checks.getError(56, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(56,1) != null){out.print(checks.getError(56, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(56,2) != null){out.print(checks.getError(56, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    8.0
                                </td>
                                <td>
                                    <input type="text" name="570" <% if (checks.getData(57,0) != null){out.print("value=\"" + checks.getData(57,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="571" <% if (checks.getData(57,1) != null){out.print("value=\"" + checks.getData(57,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="572" <% if (checks.getData(57,2) != null){out.print("value=\"" + checks.getData(57,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(57,0) != null){out.print(checks.getError(57, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(57,1) != null){out.print(checks.getError(57, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(57,2) != null){out.print(checks.getError(57, 2));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    8.5
                                </td>
                                <td>
                                    <input type="text" name="580" <% if (checks.getData(58,0) != null){out.print("value=\"" + checks.getData(58,0) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="581" <% if (checks.getData(58,1) != null){out.print("value=\"" + checks.getData(58,1) + "\"");}%> />
                                </td>
                                <td>
                                    <input type="text" name="582" <% if (checks.getData(58,2) != null){out.print("value=\"" + checks.getData(58,2) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(58,0) != null){out.print(checks.getError(58, 0));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(58,1) != null){out.print(checks.getError(58, 1));} %>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(58,2) != null){out.print(checks.getError(58, 2));} %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    net ionic equation:
                                </td>
                                <td>
                                    <input type="text" name="590" <% if (checks.getData(59,0) != null){out.print("value=\"" + checks.getData(59,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(59,0) != null){out.print(checks.getError(59, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    T<sub>1</sub>=
                                </td>
                                <td>
                                    <input type="text" name="600" <% if (checks.getData(60,0) != null){out.print("value=\"" + checks.getData(60,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(60,0) != null){out.print(checks.getError(60, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    T<sub>2</sub>=
                                </td>
                                <td>
                                    <input type="text" name="610" <% if (checks.getData(61,0) != null){out.print("value=\"" + checks.getData(61,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(61,0) != null){out.print(checks.getError(61, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &Delta;T = T<sub>1</sub> - T<sub>2</sub> =
                                </td>
                                <td>
                                    <input type="text" name="620" <% if (checks.getData(62,0) != null){out.print("value=\"" + checks.getData(62,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(62,0) != null){out.print(checks.getError(62, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    q =
                                </td>
                                <td>
                                    <input type="text" name="630" <% if (checks.getData(63,0) != null){out.print("value=\"" + checks.getData(63,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(63,0) != null){out.print(checks.getError(63, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    n =
                                </td>
                                <td>
                                    <input type="text" name="640" <% if (checks.getData(64,0) != null){out.print("value=\"" + checks.getData(64,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(64,0) != null){out.print(checks.getError(64, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &Delta;H =
                                </td>
                                <td>
                                    <input type="text" name="650" <% if (checks.getData(65,0) != null){out.print("value=\"" + checks.getData(65,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(65,0) != null){out.print(checks.getError(65, 0));} %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset>
                        <legend>Determination of the Heat of Neutralization Using Hess' Law</legend>
                        1M NH<sub>3</sub> + 1M Hac
                        <table>
                            <tr>
                                <td>
                                    net ionic equation 
                                </td>
                                <td>
                                    <input type="text" name="660" <% if (checks.getData(66,0) != null){out.print("value=\"" + checks.getData(66,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(66,0) != null){out.print(checks.getError(66, 0));} %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &Delta;H =
                                </td>
                                <td>
                                    <input type="text" name="670" <% if (checks.getData(67,0) != null){out.print("value=\"" + checks.getData(67,0) + "\"");}%> />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <div style="color: red" >
                                    <% if (checks.getError(67,0) != null){out.print(checks.getError(67, 0));} %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
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
