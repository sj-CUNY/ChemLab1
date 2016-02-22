package Labs;

//import blackboard.data.course.CourseMembership;

 import blackboard.platform.context.Context;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class inputChecks {
    
    protected int dataX;
    protected int dataY;
    
    protected String data[][];
    protected String type[][];
    protected String error[][];    
    protected String key[][];
    protected double grade[][];
    
    DataLoader load;
    DataPersister save;
	private static final Logger LOGGER = LoggerFactory.getLogger(inputChecks.class.getName());

 
    
    public inputChecks(Context ctx, int X, int Y, String labname, String userid, String courseid)
    {
        dataX = X;
        dataY = Y;
        load = new DataLoader();
        save = new DataPersister();
        
        data = new String[dataX][dataY];
        type = new String[dataX][dataY];
        error = new String[dataX][dataY];
        key = new String[dataX][dataY];
        grade = new double[dataX][dataY];

         
        String tempData;
        tempData = load.loadData(labname, userid, courseid);
        LOGGER.info("tempData " + tempData + " labname " + labname);
        initData(tempData);
    }

    
    private void initData(String tempData)
    {
        for (int i = 0; i < dataX; i++)
        {
            for (int j = 0; j < dataY; j++)
            {
                //get first data and remove
                String temp = "";
                while (tempData.length() > 0 && !tempData.substring(0,1).equals(","))
                {
                    temp += "" + tempData.substring(0,1);
                    tempData = tempData.substring(1);
                }
                if (tempData.length() > 0 && tempData.substring(0,1).equals(","))
                {
                    //remove the ,
                    tempData = tempData.substring(1);
                }
                if (temp.length() > 0)
                {
                    data[i][j] = temp;
                }
                else
                {
                    data[i][j] = "";
                }
                
                type[i][j] = "";
                error[i][j] = "";
                key[i][j] = "";
                grade[i][j] = 0.0;
            }
        } 
    }
    
    public void setData(int x, int y, String info)
    {
        data[x][y] = info;
    }
    
    public String getData (int x, int y)
    {
        return data[x][y];
    }
    
    public void setType(int x, int y, String info)
    {
        type[x][y] = info;
    }
    
    public String getType (int x, int y)
    {
        return type[x][y];
    }
    
    public void setError(int x, int y, String info)
    {
        error[x][y] = info;
    }
    
    public String getError(int x, int y)
    {
        return error[x][y];
    }
    
    public void setKey(int x, int y, String info)
    {
        key[x][y] = info;
    }
    
    public String getKey(int x, int y)
    {
        return key[x][y];
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
    
    protected void doubleStandard (int x, int y)
    {
        String temp = data[x][y];
        boolean hasDot = false;
        
        //check for numbers and . only
        //check for multiple .
        
        for(int i = 0; i < temp.length(); i++)
        {
            if (temp.charAt(i) == '.')
            {
                if (hasDot)
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
            
            if (temp.charAt(i) != '.' && (int)temp.charAt(i) < 48 || (int)temp.charAt(i) > 57)
            {
                error[x][y] = "Invalid character: '" + temp.charAt(i) + "'";
                data[x][y] = "";
                return;
            }
        }
    }
    
    protected void integerStandard (int x, int y)
    {
        String temp = data[x][y];
        
                
        for(int i = 0; i < temp.length(); i++)
        {
            if ((int)temp.charAt(i) < 48 || (int)temp.charAt(i) > 57)
            {
                error[x][y] = "Invalid character: '" + temp.charAt(i) + "'";
                data[x][y] = "";
                return;
            }
        }
    }
    
    protected int getSigFigs (int x, int y)
    {
        return getSigFigs(getData(x,y));
    }

    protected int getSigFigs (String in)
    {
        int sigFigs = 0;
        String num = in;
        int length;
        
        if (num != null && num.length() != 0)
        {
            length = num.length();

            //remove leading zeros
            int i = 0;
            while (i< length && num.charAt(i) == '0' )
            {
               i++;
            }
            //check to see if there is a .
            //inc sig figs
            boolean flag = false;
            while ( i < length)
            {
                if (num.charAt(i) == '.')
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
            if (!flag)
            {
                i = length;
                while (i < length && num.charAt(i) == '0')
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
    
    protected int getDecPlaces (int x, int y)
    {
        return getDecPlaces(getData(x,y));
    }
    
    protected int getDecPlaces (String in)
    {
        int decPlace = -1;
        String num = in;
        
        if (num != null && num.length() != 0)
        {
            //prime decPlace
            decPlace = 0;
            
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
            
        }
        return decPlace;
    }
    
    protected String setToDecPlaces(String in, int places)
    {
        /*int i = 0;
        
        //find .
        while (i < in.length() && in.charAt(i) != '.')
        {
            i++;
        }
        
        //shorten it
        while (getDecPlaces(in) > places)
        {
            in = in.substring(0,in.length() - 2);
        }
        
        //pad it
        while(getDecPlaces(in) < places)
        {
            in += "0";
        }
        
        return in;
        */
        String format = "%." + places + "f";
        
         String.format( format, Double.parseDouble(in));
         
         return in;
    }
    
    protected void gradeLab()
    {
        //compare data to key
        for (int i = 0; i < dataX; i ++)
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
                            error[i][j] += "X";
                        }
                    }
                    else if (data[i][j].equals(key[i][j]) || key[i][j].equals("*"))
                    {
                        grade[i][j] = 1;
                    }
                    else
                    {
                        grade[i][j] = 0;
                        //if (error[i][j].equals(""))
                        {
                            error[i][j] += "X";
                        }
                    }
                }
            }        
        }
    }

    protected void buildKey()
    {
    }
}
    