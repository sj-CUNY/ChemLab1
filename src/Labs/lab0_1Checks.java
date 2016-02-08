package Labs;

import blackboard.platform.context.Context;

 
public class lab0_1Checks extends inputChecks
{
    public lab0_1Checks(Context ctx, int x, int y, String labname)
    {
        super(ctx, x,y, labname);
    }
    
    @Override
    protected void buildKey()
    {
        for (int i = 0; i < dataX; i ++)
        {
            for (int j = 0; j < dataY; j++)
            {
                if (data[i][j] != null && !data[i][j].equals(""))
                {
                    setKey(i,j,"*");
                    
                    if ((i > 1 && i < 4) && j == 0)
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),3));
                    }

                    if ((i > 3 && i < 10) && j == 0)
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),4));
                    }

                    if ((i > 1 && i < 12) && j == 1)
                    {
                        setKey(i,j,"g");
                    }

                    if ((i > 1 && i < 12) && j == 2)
                    {
                        setKey(i,j,"" + getSigFigs(i,0));
                    }

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

                    if (i == 10 && j == 0)
                    {
                        double temp = Double.parseDouble(getData(5,0)) +
                                Double.parseDouble(getData(6,0)) +
                                Double.parseDouble(getData(7,0));
                        temp = temp / 3;
                        setKey(i, j,"" + temp); 
                    }

                    if (i == 11 && j == 0)
                    {
                        double temp = Double.parseDouble(getData(9,0)) - 
                                Double.parseDouble(getData(8,0));
                        
                        setKey(i, j,setToDecPlaces("" + temp, 4)); 
                    }
                }
                else
                {
                    setKey(i,j,"WRONG");
                }
                
                //for testing only!
                setError(i,j,getError(i,j) + " <*> " + getKey(i,j));
            }
        }
    }
}
