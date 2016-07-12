/*
 * inputChecks.java
 * 
 * This class contains generic checks used for the various labs
 * that will need to be graded across the two courses of chemistry.
 * It also has containers that stores various relevant data and
 * metadata for the labs.
 * 
 */

package Labs;
import java.math.RoundingMode;
import java.text.DecimalFormat;

//import blackboard.data.course.CourseMembership;

 import blackboard.persist.Id;
import blackboard.platform.context.Context;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class inputChecks {
    
    protected int dataX; //number of rows
    protected int dataY; //number of columns
    protected String data[][]; //stores lab data inputed by the student
    protected String error[][]; //stores error messages
    protected String isCorrect[][]; //keeps track of correctness of data; stores HTML values for front end
    protected String key[][]; //stores correct answers for the lab
    protected double grade[][]; //stores the grade values
    protected String errorTypes[] = new String[]{"s.f. error", "calculation error", "unit error", "error"}; //container for error types
    protected String errorMsg = "&#10007;"; //✗ (hex: &#x2717; / dec: &#10007;): ballot x
    protected String correctMsg = "&#10004;"; // ✔ (hex: &#x2714; / dec: &#10004;): heavy check mark
    
    private DataLoader load;
    private DataPersister save;
	private static final Logger LOGGER = LoggerFactory.getLogger(inputChecks.class.getName()); 
    
    //constructor that also calls initData()
	public inputChecks(Context ctx, String tableName, int X, int Y, 
			int userid, String courseid, int labNumber)
    {
        dataX = X;
        dataY = Y;
        load = new DataLoader(tableName);
        save = new DataPersister();
        
        data = new String[dataX][dataY]; //stores lab data
        error = new String[dataX][dataY]; //stores error messages
        isCorrect = new String[dataX][dataY]; //keeps track of correct answers
        key = new String[dataX][dataY]; //answer key
        grade = new double[dataX][dataY]; //the grade given for each correct answer

         
        String tempData;
        tempData = load.restoreLab(userid, courseid, labNumber); //get lab data
        
        LOGGER.info("tempData " + tempData + ", lab number " + labNumber);
        
        initData(tempData);
    }

    //parses string of submitted user data and stores it within data[][] array
    private void initData(String tempData)
    {
    	String temp = "";
    	
        for(int i = 0; i < dataX; ++i)
        {
            for(int j = 0; j < dataY; ++j)
            {
                //get substring
            	while(tempData.length() > 0 && !tempData.substring(0,1).equals(","))
                {
                    temp += "" + tempData.substring(0,1);
                    tempData = tempData.substring(1);
                }
                
            	//remove comma
                if(tempData.length() > 0 && tempData.substring(0,1).equals(","))
                {
                    tempData = tempData.substring(1);
                }
                
                if(temp.length() > 0)
                {
                    data[i][j] = temp;
                }
                else
                {
                    data[i][j] = "";
                }
                
                //type[i][j] = "";
                error[i][j] = "";
                isCorrect[i][j] = "";
                key[i][j] = "";
                grade[i][j] = 0.0;
            }
        } 
    }
    
    public void setData(int x, int y, String info)
    {
        data[x][y] = info;
    }
    
    public String getData(int x, int y)
    {
        return data[x][y];
    }
    
    /*
    public void setType(int x, int y, String info)
    {
        type[x][y] = info;
    }
    
    public String getType (int x, int y)
    {
        return type[x][y];
    }
    */
    
    public void setError(int x, int y, String info)
    {
        error[x][y] = info;
    }
    
    public String getError(int x, int y)
    {
        return error[x][y];
    }
    
    public void setIsCorrect(int x, int y, String info)
    {
    	isCorrect[x][y] = info;
    }
    
    public String getIsCorrect(int x, int y)
    {
        return isCorrect[x][y];
    }
    
    public void setKey(int x, int y, String info)
    {
        key[x][y] = info;
    }
    
    public String getKey(int x, int y)
    {
        return key[x][y];
    }
    
    //checks if the input is a standard unit
    protected void unitStandard (int x, int y)
    {
        String temp;
        temp = data[x][y].toUpperCase();
        temp = temp.trim();
        
        if (temp.equals("G"))
        {
            temp = "g";
        }
        else if (temp.equals("MG"))
        {
            temp = "mg";
        }
        else if (temp.equals("KG"))
        {
            temp = "kg";
        }
        else if (temp.equals("L"))
        {
            temp = "L";
        }
        else if (temp.equals("ML"))
        {
            temp = "mL";
        }
        else if (temp.equals("CM"))
        {
            temp = "cm";
        }
        else if (temp.equals("M"))
        {
            temp = "m";
        }
        else if (temp.equals("KM"))
        {
            temp = "km";
        }
        else if (temp.equals("LB"))
        {
            temp = "lb";
        }
        else if (temp.equals("OZ"))
        {
            temp = "oz";
        }
        else if (temp.equals("CM"))
        {
            temp = "cm";
        }
        else if (temp.equals("S"))
        {
            temp = "s";
        }
        else if (temp.equals("IN"))
        {
            temp = "in";
        }
        else if (temp.equals("FT"))
        {
            temp = "ft";
        }
        else
        {
            temp = "";
        }
        
        if (temp.equals(""))
        {
            error[x][y] = "Invalid unit: \"" + data[x][y] + "\"";
            data[x][y] = "";
        }
        else
        {
            data[x][y] = temp;
        }
    }
    
    //checks if there are multiple decimal points
    protected void doubleStandard(int x, int y)
    {
        String temp = data[x][y];
        boolean hasDot = false;
        
        //check for numbers and . only
        //check for multiple .        
        for(int i = 0; i < temp.length(); i++)
        {
            if(temp.charAt(i) == '.')
            {
                if(hasDot)
                {
                	error[x][y] = "Invalid character: '.'";
                	data[x][y] = "";
                	return;
                }
                else
                {
                    hasDot = true;
                }
            }
            
            //check if there is a non-number character
            if (temp.charAt(i) != '.' && (int)temp.charAt(i) < 48 || (int)temp.charAt(i) > 57)
            {
                error[x][y] = "Invalid character: '" + temp.charAt(i) + "'";
                data[x][y] = "";
                return;
            }
        }
    }
    
    //checks for invalid characters
    protected void integerStandard (int x, int y)
    {
        String temp = data[x][y];        
                
        for(int i = 0; i < temp.length(); i++)
        {
            if((int)temp.charAt(i) < 48 || (int)temp.charAt(i) > 57)
            {
                error[x][y] = "Invalid character: '" + temp.charAt(i) + "'";
                data[x][y] = "";
                return;
            }
        }
    }
    
    //not used
    /*
    protected int getSigFigs(int x, int y)
    {
        return getSigFigs(getData(x,y));
    }
    */
    
    //returns the number of significant figures in a number
    //returns -1 if there is an error
    protected int getSigFigs(String in)
    {
        int sigFigs = 0;
        String num = in;
        int length;
        
        if(num != null && num.length() != 0)
        {
            length = num.length();

            //remove leading zeros
            int i = 0;
            
            while(num.charAt(i) == '0')
            {
               i++;
            }
            
            //check to see if there is a '.' in sig figs
            boolean flag = false;
            
            while( i < length)
            {
                if(num.charAt(i) == '.')
                {
                    flag = true;
                    i++;
                }
                else
                {
                    i++;
                    sigFigs++;
                }
            }
            
            //remove trailing zero's if not a decimal
            if(!flag)
            {
                i = length;
                
                while(i < length && num.charAt(i) == '0')
                {
                    sigFigs --;
                }
            }

            return sigFigs;
        }
        else
        {
            return (-1);
        }
    }
    
    //not used
    /*
    protected int getDecPlaces(int x, int y)
    {
        return getDecPlaces(x, getData(x,y));
    }
    */

    //returns the number of digits after the decimal point
    protected int getDecPlaces(String in)
    {
    	int decPlace = 0;
    	String num = in;
        
        if (num != null && num.length() != 0)
        {
        	//get the decPlace
            decPlace = (num.length() - num.indexOf(".")) - 1;
        }
    	
        return decPlace;
    }
    
    //not used
    //check and compare decimal places
    /*
    protected int getDecPlaces(int x, String in)
    {
        int decPlace = 0; 
        String num = in;
        
        if (num != null && num.length() != 0)
        {
            //get the decPlace
            decPlace = (num.length() - num.indexOf(".")) -1;
            
            if(decPlace == 0) 
            {
            	//System.out.println(decPlace);
            	//return decPlace; 
            }
            //Quadruple beam balance
            if ((x > 1 && x < 4) && decPlace != 3)
            {
            	//System.out.println(decPlace);
            	return (-1); 
            }
            //Analytical balance
            if ((x > 3 && x < 10) && decPlace != 4)
            {
            	//System.out.println(decPlace);
            	return (-1);
            }
            //Results
            if ((x > 9 && x < 12) && decPlace != 4)
            {
            	//System.out.println(decPlace);
            	return (-1);
            }
            /* hold this part for test
            //move past everything leading .
            int i = 0;
            while (num.charAt(i) != '.' && i < num.length())
            {
               i++;
            }
            
            //move past .
            if (num.charAt(i) == '.' && i < num.length())
            {
                i++;
            }
            
            //add dec places
            while (i < num.length())
            {
                decPlace ++;
            }
            
            return decPlace;   
        }
        else
        {
        	return (-1);
        }
    }
    */
    
    //formats decimal value into a given number of places
    protected String setDecPlaces(String in, int places)
    {
        String format = "%." + places + "f";
        String.format(format, Double.parseDouble(in));
        return in;
    }
    
    //not used    
    //check and set the decimal format for 1 to 4 places
    /*
    protected String setDecimalFormat(String in, int places)
    {
    	String format = "#.";
    	
    	for(int i = 0; i < places; ++i)
    	{
    		format = format + "#";
    	}
    	
    	DecimalFormat df = new DecimalFormat(format);
    	df.setRoundingMode(RoundingMode.HALF_UP);
    	
    	Double temp = Double.parseDouble(in);
    	Double temp1 = temp.doubleValue(); 
    	String s = df.format(temp1);
    	StringBuilder s1 = new StringBuilder(s);
    	int decimalPlace = getDecPlaces(s);
    	
    	//for lab:1 result part only (apply with only 4 decimal values)
    	if (decimalPlace == 3)
    	{
    		s1.append("0");
    		s = s1.toString();
    	}
    	else if (decimalPlace == 2)
    	{
    		s1.append("00");
    		s = s1.toString();
    	}
    	else if (decimalPlace == 1 && in.charAt(in.length() - 1) != '0')
    	{
    		s1.append("000");
    		s = s1.toString();
    	}
    	else if (decimalPlace == 1 && in.charAt(in.length() - 1) == '0'  )
    	{
    		s1.append(".0000");
    		s = s1.toString();
    	}
    	return s;
    }
    */
    
    //counts the number of integers before a decimal point
    //returns -1 if there exists an error
    protected int countIntegers(String in)
    {
    	String temp = in;
    	
    	if(temp != null && temp.length() != 0)
    	{
	    	if(temp.contains("."))
	    	{    	
	    		int i = temp.indexOf('.');
	    		temp = temp.substring(0, i);
	    	}
    	}
    	else
    	{
    		return -1;
    	}
    	
    	return temp.length();
    }
    
    protected void gradeLab()
    {
        //compare data to key
        for (int i = 0; i < dataX; i++)
        {
            for (int j = 0; j < dataY; j++)
            {
                if (data[i][j] != null && key[i][j] != null)
                {
                    if (key[i][j].equals("WRONG"))
                    {
                        grade[i][j] = 0;
                        if (error[i][j].equals(""))
                        {
                            error[i][j] += errorMsg;
                        }
                    }
                    else if (j != 0 && data[i][j].equals(key[i][j]) || key[i][j].equals("*"))
                    {
                    	grade[i][j] = 1;
                    	isCorrect[i][j] = correctMsg;
                    } 
                    //Weight column
                    else if (j == 0 && (i > 1 && i < 10))
                    {
                    	String d = Integer.toString(getDecPlaces(i,getData(i,0)));
                    	
                        if(d.equals(key[i][0]))
                        {
                        	grade[i][0] = 1;
                        	isCorrect[i][j] = correctMsg;
                        }
                        else
                        {
                        	grade[i][j] = 0;
                        	error[i][j] += errorMsg;
                        }
                    }
                    //Results
                    else if ((j == 0 && i > 9 && i < 12) && Double.compare(Double.parseDouble(data[i][j]), Double.parseDouble(key[i][j])) == 0 )
                    {
                    	grade[i][0] = 1;
                    	isCorrect[i][j] = correctMsg;
                    }
                    //Results: Error 	
                    else if ((j == 0 && i > 9 && i < 12) && Double.compare(Double.parseDouble(data[i][j]), Double.parseDouble(key[i][j])) != 0)
                    {
                    	grade[i][0] = 0;
                    	error[i][j] += "X("+ setDecimalFormat(key[i][j], 4) +")";
                    }
                    else
                    {
                        grade[i][j] = 0;
                        //if (error[i][j].equals(""))
                        {
                            error[i][j] += errorMsg;
                        }
                    }
                }
            }        
        }
    }
    
    public void save(String labname, String userid, String courseid)
    {
        //build string of data to save
        String theString = "";
        
        for (int i = 0; i < dataX; i++)
        {
            for (int j = 0; j < dataY; j++)
            {
                theString += data[i][j];
                if (i + j < dataX + dataY - 2)
                {
                    theString += ",";
                }
            }
        }
         //call function
        save.saveData(labname, theString, userid, courseid);
    }
    
    public void check()
    {
        for (int i = 0; i < dataX; i ++)
        {
            for (int j = 0; j < dataY; j++)
            {
                if (data[i][j] != null && !data[i][j].equals(""))
                {
                    //clear previous errors
                    error[i][j] = "";
                    //clear previous corrections
                    isCorrect[i][j] = "";

                    //check based on type
                    if (type[i][j].equals("Unit"))
                    {
                        unitStandard(i,j);
                    }
                    if (type[i][j].equals("Double"))
                    {
                        doubleStandard(i,j);
                    }
                    if (type[i][j].equals("Integer"))
                    {
                        integerStandard(i,j);
                    }
                }
                else
                {
                    error[i][j] = "empty";
                }           
            }
        }

        buildKey();
        gradeLab();
    }

    public void clear()
    {
        for (int i = 0; i < dataX; i ++)
        {
            for (int j = 0; j < dataY; j++)
            {
                if (data[i][j] != null && !data[i][j].equals(""))
                {
                    //clear data
                    data[i][j] = "";
                }

                if (error[i][j] != null && !error[i][j].equals(""))
                {
                    //clear previous errors
                    error[i][j] = "";
                }
                
                if (isCorrect[i][j] != null && !isCorrect[i][j].equals(""))
                {
                    //clear previous corrections
                	isCorrect[i][j] = "";
                }
                    
                if (key[i][j] != null && !key[i][j].equals(""))
                {
                    //remove any built key
                    key[i][j] = "";
                }
            }
        }
    }
    
    public void submit(Context ctx, String labname, String jspname)
    {
        //call save and then save grade
        save(labname, ctx.getUserId().toExternalString(), ctx.getCourseId().toExternalString());

        //build string of grade to save
        String theString = "";
        
        for (int i = 0; i < dataX; i++)
        {
            for (int j = 0; j < dataY; j++)
            {
                theString += grade[i][j];
                if (i + j < dataX + dataY - 2)
                {
                    theString += ",";
                }
            }
        }

        //call function
        save.saveGrade(theString);

        //set submitted
        save.submitted(ctx, labname, jspname);
    }

    protected void buildKey()
    {
    	
    }
    
    public void clearAttempt(Context ctx, String uid, String labname)
    {
    	save.clearAttempt(ctx, uid, labname);
    }
}