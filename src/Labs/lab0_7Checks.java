package Labs;

//import blackboard.platform.context.Context;

public class lab0_7Checks extends inputChecks
{
    public lab0_7Checks(int x, int y)
    {
        super(x,y,"lab0_7" );
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
                    
                     if ((i > 0 && i < 4) && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),4));
                    }
                     
                     if ((i > 3 && i < 7) && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),2));
                    }
                     
                     if (i == 7 && j ==0)
                     {
                         setKey(i,j,"0.0500");
                     }
                     
                     if (i == 8 && (j == 0 || j == 1 || j==2))
                    {
                        double temp = Double.parseDouble(getData(6,j)) /
                                1000 *
                                Double.parseDouble(getData(7,0));
                        
                        setKey(i, j,"" + temp); 
                    }
                     
                     if (i == 9 && (j == 0 || j == 1 || j==2))
                    {
                        setKey(i,j,getKey(8,j));
                    }
                     
                     if (i == 10 && (j == 0 || j == 1 || j==2))
                    {
                        double temp = Double.parseDouble(getData(9,j)) *
                                35.45;
                        
                        setKey(i, j,"" + temp); 
                    }
                     
                     if (i == 11 && (j == 0 || j == 1 || j==2))
                    {
                        double temp = Double.parseDouble(getData(10,j)) /
                                        Double.parseDouble(getData(3,0)) *
                                        100;
                        
                        setKey(i, j,"" + temp); 
                    }
                     
                     if (i == 12 && j == 0)
                    {
                        double temp = (Double.parseDouble(getData(11,0)) +
                                Double.parseDouble(getData(11,1)) +
                                Double.parseDouble(getData(11,2)) )/
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