package Labs;

//import blackboard.platform.context.Context;

public class lab1_3Checks extends inputChecks
{
    public lab1_3Checks(int x, int y)
    {
        super(x,y, "lab1_3");
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
                    
                    if (i==0 && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),4));
                    }
                    
                    if ((i>0 && i<4) && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),2));
                    }
                    
                    if (i == 4 && j ==0)
                     {
                         setKey(i,j,"0.05000");
                     }
                    
                    if (i==5 && (j == 0 || j==1 || j==2))
                    {
                        double temp = 0.05 * Double.parseDouble(getData(3,j)) /
                                1000;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i==7 && (j == 0 || j==1 || j==2))
                    {
                        double temp = Double.parseDouble(getData(6,j)) /
                                Double.parseDouble(getData(0,j));
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i==8 && j == 0 )
                    {
                        double temp = (Double.parseDouble(getData(7,0)) +
                                Double.parseDouble(getData(7,1)) +
                                Double.parseDouble(getData(7,2))) / 3;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i==10 && j == 0 )
                    {
                        double temp = Double.parseDouble(getData(9,j)) /
                                Double.parseDouble(getData(8,j));
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                     if (((i > 5 && i < 8) && (j == 0 || j==1 || j==2)) || ( (i==8 || j==9) && j==0))
                    {
                        if (getSigFigs(getData(i,j)) != 4)
                        {
                            setKey(i,j,"WRONG");
                        }
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
