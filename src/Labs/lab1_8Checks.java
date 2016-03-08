package Labs;

//import blackboard.platform.context.Context;

public class lab1_8Checks extends inputChecks
{
    public lab1_8Checks(int x, int y)
    {
        super(x,y, "lab1_8");
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
                    
                    if ((i==2 || i==6) && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),4));
                    }
                    
                    if ((i > 2 && i < 6) && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),2));
                    }
                    
                    if (i==6)
                    {
                        setKey(i,j,getData(2,j));
                    }
                    
                    if (i==7)
                    {
                        double temp = Double.parseDouble(getData(6,j)) /
                                204.22;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i==8)
                    {
                        setKey(i,j,getData(7,j));
                    }
                    
                    if (i==9)
                    {
                        double temp = Double.parseDouble(getData(5,j)) /
                                1000;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i==10)
                    {
                        double temp = Double.parseDouble(getData(8,j)) /
                                Double.parseDouble(getData(9,j));
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                      if (i==11 && j==0)
                    {
                        double temp = (Double.parseDouble(getData(10,0)) +
                                Double.parseDouble(getData(10,1)) +
                                Double.parseDouble(getData(10,2))) / 3;
                                              
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
