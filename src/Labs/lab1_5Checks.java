package Labs;

//import blackboard.platform.context.Context;

public class lab1_5Checks extends inputChecks
{
    public lab1_5Checks(int x, int y)
    {
        super(x,y, "lab1_5");
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
                    
                    if (( i > 8 && i < 12) && j == 0)
                    {
                        setKey(i, j,"0.0750"); 
                    }
                    
                    if (i==9 && j==1)
                    {
                        setKey(i,j,"0.0125");
                    }
                    
                    if (i==10 && j==1)
                    {
                        setKey(i,j,"0.0250");
                    }
                    
                    if (i==11 && j==1)
                    {
                        setKey(i,j,"0.0375");
                    }
                    
                    if (( i > 8 && i < 12) && j == 2)
                    {
                        setKey(i, j,"0.000313"); 
                    }
                    
                     if (i==9 && j==3)
                    {
                        double temp = (Double.parseDouble(getData(0,0)) +
                                Double.parseDouble(getData(1,0)) +
                                Double.parseDouble(getData(2,0))) / 3;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i==10 && j==3)
                    {
                        double temp = (Double.parseDouble(getData(3,0)) +
                                Double.parseDouble(getData(4,0)) +
                                Double.parseDouble(getData(5,0))) / 3;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i==11 && j==3)
                    {
                        double temp = (Double.parseDouble(getData(6,0)) +
                                Double.parseDouble(getData(7,0)) +
                                Double.parseDouble(getData(8,0))) / 3;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (( i > 8 && i < 12) && j == 2)
                    {
                        double temp = Double.parseDouble(getData(i,2)) /
                                Double.parseDouble(getData(i,3));
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i==12 && j==0)
                    {
                        setKey(i,j,"0.0250");
                    }
                    
                    if (i==13 && j==0)
                    {
                        setKey(i,j,"0.0500");
                    }
                    
                    if (i==14 && j==0)
                    {
                        setKey(i,j,"0.0750");
                    }
                    
                    if (( i > 11 && i < 15) && j == 0)
                    {
                        setKey(i, j,"0.0750"); 
                    }
                    
                     if (( i > 11 && i < 15) && j == 1)
                    {
                        setKey(i, j,"0.0375"); 
                    }
                     
                     if (( i > 11 && i < 15) && j == 2)
                    {
                        setKey(i, j,"0.000313"); 
                    }
                     
                      if (i==12 && j==3)
                    {
                        double temp = (Double.parseDouble(getData(0,1)) +
                                Double.parseDouble(getData(1,1)) +
                                Double.parseDouble(getData(2,1))) / 3;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i==13 && j==3)
                    {
                        double temp = (Double.parseDouble(getData(3,1)) +
                                Double.parseDouble(getData(4,1)) +
                                Double.parseDouble(getData(5,1))) / 3;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (i==14 && j==3)
                    {
                        double temp = (Double.parseDouble(getData(6,1)) +
                                Double.parseDouble(getData(7,1)) +
                                Double.parseDouble(getData(8,1))) / 3;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (( i > 11 && i < 15) && j == 4)
                    {
                        double temp = Double.parseDouble(getData(i,2)) /
                                Double.parseDouble(getData(i,3));
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                    if (( i > 14 && i < 21) && j == 0)
                    {
                        double temp = Double.parseDouble(getData(i-5,4)) /
                                (Double.parseDouble(getData(i-5,0)) * 
                                Double.parseDouble(getData(i-5,1)));
                                              
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
