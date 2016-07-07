package Labs;
import java.math.RoundingMode;
import java.text.DecimalFormat;

import blackboard.platform.context.Context;

public class lab0_1Checks extends inputChecks
{
	public lab0_1Checks(Context ctx, int x, int y, int userid, String courseid, int labNumber)
	{
        super(ctx, x, y, userid, courseid, labNumber);
    }
 
	@Override
    protected void buildKey()
    {
		int sigFig = 0;
		
        for (int i = 0; i < dataX; ++i)
        {
            for (int j = 0; j < dataY; ++j)
            {
                if(data[i][j] != null && !data[i][j].equals(""))
                {
                    setKey(i,j,"*"); //where there is no data to input
                    
                    //Quadruple beam balance (sig figs)
                    if (i > 1 && i < 4)
                    {
                    	if(j == 0)
                    	{
                    		//setKey(i,j,setToDecPlaces(getData(i,j),3));
	                    	setKey(i,j,"3");
                    	}
                    	else if(j == 2)
                    	{
                    		sigFig = getSigFigs(data[i][j]) + 3;
                    		setKey(i, j, Integer.toString(sigFig));
                    	}
                    }
                    
                    //Analytical balance (sig figs)
                    if(i > 3 && i < 10)
                    {
                        //setKey(i,j,setToDecPlaces(getData(i,j),4));
                    	if(j == 0) 
                    	{
                    		setKey(i,j,"4");
                    	}
                    	else if(j == 2)
                    	{
                    		sigFig = getSigFigs(data[i][j]) + 4;
                    		setKey(i, j, Integer.toString(sigFig));
                    	}
                    }
                    //Results
                    /*
                    if ((i > 9 && i < 12) && j == 0)
                    {
                        //setKey(i,j,setToDecPlaces(getData(i,j),4));
                        setKey(i,j,"4");
                    }
                    */
                    
                    //Unit column
                    if ((i > 1 && i < 12) && j == 1)
                    {
                        setKey(i,j,"g");
                    }
                    
                    //Num of Sig Fig Column
                    if ((i > 1 && i < 12) && j == 2)
                    {
                        setKey(i,j,"" + getSigFigs(i,0));
                    }
                    /*
                    if (i == 8 && j == 0)
                    {
                        if (Double.parseDouble(getData(i,j)) >= Double.parseDouble(getData(9,0)))
                        {
                            setKey(i,j,"WRONG");
                        }
                    }

                    if (i == 9 && j == 0)
                    {
                        if (Double.parseDouble(getData(i,j)) <= Double.parseDouble(getData(8,0)))
                        {
                            setKey(i,j,"WRONG");
                        }
                    }
					*/
                    //'Results': first column
                    if (i == 10 && j == 0)
                    {
                    	Double temp = 0.0;
                        temp = Double.parseDouble(getData(5,0)) +
                                Double.parseDouble(getData(6,0)) +
                                Double.parseDouble(getData(7,0));
                        temp = temp / 3;
                        String temp1 = setDecimalFormat(Double.toString(temp), 4);              	
                        //System.out.println("R1: " + temp1);
                        setKey(i, j, "" + temp1); 
                    }

                    if (i == 11 && j == 0)
                    {
                    	Double temp = 0.0;
                        temp = Double.parseDouble(getData(8,0)) - 
                                Double.parseDouble(getData(9,0));
                        String temp1 = setDecimalFormat(Double.toString(temp), 4);
                        //System.out.println("R2: " + temp1);
                        setKey(i, j, "" + temp1);
                        //setKey(i, j,setToDecPlaces("" + temp, 4)); 
                    }
                }
                else
                {
                    setKey(i,j,"WRONG");
                }
                
                //for testing only!
                //setError(i,j,getError(i,j) + " <*> " + getKey(i,j));
            }
        }
    }
	
	protected void labCheck()
	{
		//check significant figures of quadruple and analytical balance 
		for(int i = 2; i < 10; ++i)
		{
			if(getSigFigs(data[i][0]) + Integer.parseInt(key[i][0]) == Integer.parseInt(key[i][2]))
			{
				isCorrect[i][0] = correctMsg; //weighed value
				isCorrect[i][2] = correctMsg; //significant figures
			}
			else
			{
				isCorrect[i][0] = errorMsg;
				isCorrect[i][2] = errorMsg;
				error[i][0] = errorTypes[3]; //generic error
				error[i][2] = errorTypes[0]; //sig fig error
			}
		}
		
		//check calculation of average metal weight
		if(data[10][0] == key[10][0])
		{
			isCorrect[10][0] = correctMsg;
		}
		else
		{
			isCorrect[10][0] = errorMsg;
			error[10][0] = errorTypes[1]; //calculation error
		}
		
		//check significant figures
		if(data[10][2] == key[10][2])
		{
			isCorrect[10][2] = correctMsg;
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
		}
		else
		{
			isCorrect[11][0] = errorMsg;
			error[11][0] = errorTypes[1]; //calculation error
		}
		
		//check significant figures
		if(data[11][2] == key[11][2])
		{
			isCorrect[11][2] = correctMsg;
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
			}
			else
			{
				isCorrect[i][1] = errorMsg;
				error[i][1] = errorTypes[2]; //unit error
			}
		}		
	}
}
