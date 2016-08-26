###Developing Blackboard Building Block (aka plugin) to Grade Chemistry Lab Reports

##### Motivation:
-	Grading chemistry lab reports partly involves checking the numbers of significant numbers, units and calculated results based on correct formulas. This part of the work is very time-consuming for human beings but can be quickly done by a computer.
-	Blackboard is a platform widely used at York for courses. Developing a Blackboard Building Block (aka software plugin) to grade checmistry lab reports can greatly save faculty time. They can focus more on identifying students' misconceptions from lab reports and examining students' thinking processes.

##### Goals:
Create a Blackboard building block (aka plugin) that collects, save and grades general chemistry lab reports. This building block will accomplish the following tasks:
-	Provides appropriate fields for each lab where students can fill in experimental and calculated data as well as units;
-	Checks the correct numbers of significant figures and units for the data and records the grades associated with them;
-	Checks the correctness of the calculated values and records the grades associated with them;
-	Saves the data, units and the grades;
-	Connects the grades with a Blackboard Grade Center column and retrieve the lab reports from the grade center.

##### Building Block Process
>A Building Block is added to Blackboard via its Application Program Interfaces (APIs). We develop the code to perform the required tasks using java servlet and jsp, create Oracle database schema and tables added in Blackboard database to store the data. JDBC is used to enable the communication between the java code and the database.  A little HTML is also needed for most of the web based applications.  The data entered by a user is stored and can be retrieved from the database. Once the Building Block development is completed, it will be installed on the staging server for further testing and debugging.

##### What is a Building Block?
>A Blackboard Building Block is a software plugin that extends functionalities of Blackboard. Technically it is a .zip or .war file that is developed by taking advantages of the Blackboard open APIs. The open APTs enable that the newly developed plugin communicates with Blackboard application so that the plugin can be integrated in Blackboard seamlessly.  

>Once a plugin is installed in Blackboard, it adds a set of programming files to perform tasks upon requests. These files are structured as a file-directory hierarchy containing custom code tied together by a Blackboard Learn manifest.  

>A plugin can be called via predefined entry points in Blackboard. The entry points are URLs that are tracked in the Blackboard Learn database and associated with key entities such as content handlers and navigation items.  

>This is how the lab is going to look like for the students. They will input all their data in the empty fields and select the unit of measurement just like they would fill out a normal lab on paper. Once done they can click the check button to see if any errors are found. If there is an error, a message will be in red text under the input field. A student may also click save to save his data for a later time. Once completed , clicking the submit button will submit it to the grade center for the professor to see and grade it accordingly.  

##### Future Work
>Currently we have all the user interfaces of the labs completed as well as the “Check”, “Save “buttons. We will need to do more work on the “Activate” button as well as viewing and scoring  the submitted lab reports  from Grade Center.  
