<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
    <head>
        <link rel="stylesheet" href="labs_css.css">
        <%
            int theClass;
            int labs;
        %>
        <script>
            function callLab() {
            window.open("lab" + arguments[0] + "_" + arguments[1] + ".jsp");		
            }		
        </script>
        <title>
            Labs Directory
    	</title>
    </head>
    <body>
        Labs Directory
        <fieldset>
            <legend>
                Chem 109
            </legend>
        <%
            theClass = 0;
            labs = 9;
            for (int i = 0; i < labs; i++)
            {
                if (i != 5 )
                {
                    out.println("<input type=\"button\" id=\"Lab" + theClass + "_" + (i+1) + "\" value=\"lab " + (i+1) + "\" onclick=\"callLab(" + theClass + "," + (i+1) + ")\" />");
                    if (i != labs - 1)
                    {
                        out.println("<br></br>");
                    }
                }
            }
        %>
        </fieldset>
        
        <fieldset>
            <legend>
                Chem 112
            </legend>
        <%
            theClass = 1;
            labs = 9;
            for (int i = 0; i < labs; i++)
            {
                if (i != 0 )
                {
                    out.println("<input type=\"button\" id=\"Lab" + theClass + "_" + (i+1) + "\" value=\"lab " + (i+1) + "\" onclick=\"callLab(" + theClass + "," + (i+1) + ")\" />");
                    if (i != labs - 1)
                    {
                        out.println("<br></br>");
                    }
                }
            }
        %>
        </fieldset>
    </body>
</html>