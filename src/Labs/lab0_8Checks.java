package Labs;

//import blackboard.platform.context.Context;

public class lab0_8Checks extends inputChecks
{
    public lab0_8Checks(int x, int y)
    {
        super(x,y,"lab0_8" );
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
                    
                    if ((i==1 || i ==2 || i==6) && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),4));
                    }
                    
                    if ((i > 2 && i < 5) && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),1));
                    }
                    
                    if (i == 5 && j ==0)
                     {
                         setKey(i,j,"50.0");
                     }
                    
                     if (i == 7 && (j == 0 || j == 1 || j==2))
                    {
                        double temp = Double.parseDouble(getData(4,j)) / 760 *
                                        Double.parseDouble(getData(5,j)) / 1000 / (0.0821 * (
                                        Double.parseDouble(getData(3,j)) * 273));
                        
                        setKey(i, j,"" + temp); 
                    }
                     
                     if (i == 8 && (j == 0 || j == 1 || j==2))
                    {
                        double temp = Double.parseDouble(getData(6,j)) /
                                        Double.parseDouble(getData(6,j)) ;
                        
                        setKey(i, j,"" + temp); 
                    }
                     
                     if (i == 9 && j == 0)
                    {
                        double temp = (Double.parseDouble(getData(8,0)) +
                                Double.parseDouble(getData(8,1)) +
                                Double.parseDouble(getData(8,2)) )/
                                3;
                        
                        setKey(i, j,"" + temp); 
                    }
                }
                else
                {
                    setKey(i,j,"WRONG");
                }
            }
        }
    }
}