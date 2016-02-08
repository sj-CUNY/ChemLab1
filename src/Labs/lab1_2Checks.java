package Labs;

import blackboard.platform.context.Context;

public class lab1_2Checks extends inputChecks
{
    public lab1_2Checks(Context ctx, int x, int y, String labname)
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
                    
                    if ((i > -1 && i < 3 )&& j == 0 )
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),4));
                    }
                    
                    if (i==4 && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),4));
                    }
                    
                    if (i == 3 && j ==0)
                     {
                         setKey(i,j,"0.02000");
                     }
                    
                     if ((i==5 || i ==6 || i==7) && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),2));
                    }
                     
                     if (i==8 && (j == 0 || j==1 || j==2))
                    {
                        double temp = (0.02) * Double.parseDouble(getData(7,j)) /
                                1000;
                                              
                        setKey(i, j,"" + temp); 
                    }
                     
                      if (i==9 && (j == 0 || j==1 || j==2))
                    {
                        double temp = Double.parseDouble(getData(8,j)) * 5 / 2;
                                              
                        setKey(i, j,"" + temp); 
                    }
                      
                     if (i==10 && (j == 0 || j==1 || j==2))
                    {
                        double temp = Double.parseDouble(getData(9,j)) /
                                Double.parseDouble(getData(4,j));
                                              
                        setKey(i, j,"" + temp); 
                    }
                     
                     if (i==11 && j == 0 )
                    {
                        double temp = (Double.parseDouble(getData(10,0)) +
                                Double.parseDouble(getData(10,1)) +
                                Double.parseDouble(getData(10,2))) / 3;
                                              
                        setKey(i, j,"" + temp); 
                    }
                     
                     if (((i > 7 && i < 11) && (j == 0 || j==1 || j==2)) || ( i==11 && j==0))
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
