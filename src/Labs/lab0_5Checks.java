package Labs;

//import blackboard.platform.context.Context;

public class lab0_5Checks extends inputChecks
{
    public lab0_5Checks(int x, int y)
    {
        super(x,y,"lab0_5");
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
                    
                    if ((i > 0 && i < 7) && (j == 0 || j==1))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),4));
                    }
                    
                    if (i == 1 &&( j == 0 || j==1))
                    {
                        int temp = getSigFigs(i,j);
                                
                        if (!(temp < 6 && temp > 3))
                        {
                            setKey(i,j, "WRONG");
                        }
                    }
                    
                    if (i == 4 &&( j == 0 || j==1))
                    {
                        int temp = getSigFigs(i,j);
                                
                        if (!(temp == 5))
                        {
                            setKey(i,j, "WRONG");
                        }
                    }
                    
                    if (((i > 1 && i < 11) && (j == 0 || j==1)) && (4!=1)&&(i!=7 && j!=1))
                    {
                        int temp = getSigFigs(i,j);
                                
                        if (!(temp == 4))
                        {
                            setKey(i,j, "WRONG");
                        }
                    }
                    
                    if (i == 3 && (j == 0 || j == 1))
                    {
                        double temp = Double.parseDouble(getData(1,j)) -
                                Double.parseDouble(getData(2,j)) ;
                        
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i == 6 && (j == 0 || j == 1))
                    {
                        double temp = Double.parseDouble(getData(4,j)) -
                                Double.parseDouble(getData(5,j)) ;
                        
                        setKey(i, j,"" + temp); 
                    }
                    
                    setKey(7,0,"64.11");
                    
                    if (i == 8 && (j == 0 || j == 1))
                    {
                        double temp = Double.parseDouble(getData(6,j)) *
                                0.6411 ;
                        
                        setKey(i, j,"" + temp); 
                    }
                    
                    setKey(9,0,getData(3,0));
                    setKey(9,1,getData(3,1));
                    
                    if (i == 10 && (j == 0 || j == 1))
                    {
                        double temp = Double.parseDouble(getData(8,j)) /
                                Double.parseDouble(getData(9,j)) *
                                100;
                        
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i == 11 && j == 0 )
                    {
                        double temp = Double.parseDouble(getData(10,0)) +
                                Double.parseDouble(getData(10,1)) /
                                2;
                        
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