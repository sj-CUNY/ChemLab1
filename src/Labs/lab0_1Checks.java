package Labs;
import java.math.RoundingMode;
import java.text.DecimalFormat;

import blackboard.platform.context.Context;

public class lab0_1Checks extends inputChecks
{
	public lab0_1Checks(Context ctx, String tableName, int x, int y, 
			int userid, String courseid, int labNumber)
	{
        super(ctx, tableName, x, y, userid, courseid, labNumber);
    }
 
	@Override
    protected void buildKey()
    {
		int k = 0; //holds integer values for each answer
		
        for(int i = 0; i < dataX; ++i)
        {
            for (int j = 0; j < dataY; ++j)
            {
                if(data[i][j] != null)
                {
                    key[i][j] = "*"; //where there is no data to input
                    
                    //Quadruple beam balance (sig figs)
                    if (i > 1 && i < 4)
                    {
                    	if(j == 0)
                    	{
                    		key[i][j] = setDecPlaces(data[i][j], 3);
                    	}
                    	else if(j == 2)
                    	{
                    		k = countIntegers(data[i][j]) + 3;
                    		key[i][j] = Integer.toString(k);
                    	}
                    }
                    
                    //Analytical balance (sig figs)
                    if(i > 3 && i < 10)
                    {
                        if(j == 0) 
                    	{
                    		key[i][j] = setDecPlaces(data[i][j], 4);
                    	}
                    	else if(j == 2)
                    	{
                    		k = countIntegers(data[i][j]) + 4;
                    		key[i][j] = Integer.toString(k);
                    	}
                    }
                    
                    //Number of Sig Fig Column
                    if ((i > 9 && i < dataX) && j == 2)
                    {
                        key[i][j] = "" + getSigFigs(data[i][0]);
                    }
                    
                    //Unit column
                    if ((i > 1 && i < 12) && j == 1)
                    {
                        key[i][j] = "g";
                    }
                    
                    //'Results': first column
                    if (i == 10 && j == 0)
                    {
                    	Double temp = 0.0;
                        temp = Double.parseDouble(getData(5,0)) +
                                Double.parseDouble(getData(6,0)) +
                                Double.parseDouble(getData(7,0));
                        temp = temp / 3;
                        String temp1 = setDecPlaces(Double.toString(temp), 4);              	
                        
                       key[i][j] = "" + temp1;
                    }

                    if (i == 11 && j == 0)
                    {
                    	Double temp = 0.0;
                        temp = Double.parseDouble(getData(8,0)) - 
                                Double.parseDouble(getData(9,0));
                        String temp1 = setDecPlaces(Double.toString(temp), 4);
                        
                        key[i][j] = "" + temp1;
                    }
                }
                else
                {
                    //setKey(i,j,"WRONG");
                }
                
                //for testing only!
                //setError(i,j,getError(i,j) + " <*> " + getKey(i,j));
            }
        }
    }
	
	protected void labCheck()
	{
		double gradeValue = 0.0;
		
		//check significant figures of quadruple and analytical balance 
		for(int i = 2; i < 10; ++i)
		{
			//check accuracy of weighed values
			if(data[i][0] == key[i][0])
			{
				isCorrect[i][0] = correctMsg; //input value				
				grade[i][0] = 4.0;
				gradeValue += 4.0;
			}
			else
			{
				isCorrect[i][0] = errorMsg;				
				error[i][0] = errorTypes[3]; //generic error				
			}
			
			//check significant figures
			if(data[i][2] == key[i][2])
			{
				isCorrect[i][2] = correctMsg; //significant figures
				grade[i][2] = 5.0;
				gradeValue += 5.0;
				
			}
			else
			{
				isCorrect[i][2] = errorMsg;
				error[i][2] = errorTypes[0]; //sig fig error
			}
		}
		
		//check calculation of average metal weight
		if(data[10][0] == key[10][0])
		{
			isCorrect[10][0] = correctMsg;
			grade[10][0] = 4.0;
			gradeValue += 4.0;
		}
		else
		{
			isCorrect[10][0] = errorMsg;
			error[10][0] = errorTypes[1]; //calculation error
		}
		
		//check significant figures of average metal weight
		if(data[10][2] == key[10][2])
		{
			isCorrect[10][2] = correctMsg;
			grade[10][2] = 5.0;
			gradeValue += 5.0;
		}
		else
		{
			isCorrect[10][2] = errorMsg;
			error[10][2] = errorTypes[0]; //sig fig error
		}
		
		//check calculation of sodium chloride weight
		if(data[11][0] == key[11][0])
		{
			isCorrect[11][0] = correctMsg;
			grade[11][0] = 4.0;
			gradeValue += 5.0;
		}
		else
		{
			isCorrect[11][0] = errorMsg;
			error[11][0] = errorTypes[1]; //calculation error
		}
		
		//check significant figures of sodium chloride weight
		if(data[11][2] == key[11][2])
		{
			isCorrect[11][2] = correctMsg;
			grade[11][2] = 5.0;
			gradeValue += 5.0;
		}
		else
		{
			isCorrect[11][2] = errorMsg;
			error[11][2] = errorTypes[0]; //sig fig error
		}
		
		//check units
		for(int i = 2; i < dataX; ++i)
		{
			if(data[i][1] == key[i][1])
			{
				isCorrect[i][1] = correctMsg;
				grade[i][1] = 1.0;
				gradeValue += 1.0;
			}
			else
			{
				isCorrect[i][1] = errorMsg;
				error[i][1] = errorTypes[2]; //unit error
			}
		}		
	}
}
