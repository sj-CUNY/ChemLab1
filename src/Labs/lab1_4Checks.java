package Labs;

//import blackboard.platform.context.Context;

public class lab1_4Checks extends inputChecks
{
    public lab1_4Checks(int x, int y)
    {
        super(x,y, "lab1_4");
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
                    
                    if ((i==1 || i==2 || i==18 || i==19) && (j == 0 || j==1))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),2));
                    }
                    
                    if ((i > 2 && i < 18) && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),1));
                    }
                            
                     if ((i > 19 && i < 23) && (j == 0 || j==1))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),1));
                    }
                     
                     if ( i==18 && (j == 0 || j==1))
                    {
                        setKey(i,j,getData(1,j));
                    }
                     
                     if ( i==19 && (j == 0 || j==1))
                    {
                        setKey(i,j,getData(2,j));
                    }
                     
                     if ( i==22 && (j == 0 || j==1))
                    {
                        double temp = Double.parseDouble(getData(20,j)) -
                                Double.parseDouble(getData(21,j));
                                              
                        setKey(i, j,"" + temp); 
                    }
                     
                     if ( i==23 && (j == 0 || j==1))
                    {
                        setKey(i, j,"20.8"); 
                    }
                    
                     if ( i==24 && (j == 0 || j==1))
                    {
                        double temp = Double.parseDouble(getData(22,j)) /
                                Double.parseDouble(getData(23,j));
                                              
                        setKey(i, j,"" + temp); 
                    }
                     
                     if ( i==25 && (j == 0 || j==1))
                    {
                        double temp = Double.parseDouble(getData(24,j)) *
                                Double.parseDouble(getData(18,j)) / 1000;
                                              
                        setKey(i, j,"" + temp); 
                    }
                    
                     if ( i==26 && (j == 0 || j==1))
                    {
                        double temp = Double.parseDouble(getData(19,j)) /
                                Double.parseDouble(getData(25,j));
                                              
                        setKey(i, j,"" + temp); 
                    }
                     
                      if (i==27 && j == 0 )
                    {
                        double temp = (Double.parseDouble(getData(26,0)) +
                                Double.parseDouble(getData(26,1)) +
                                Double.parseDouble(getData(26,2))) / 3;
                                              
                        setKey(i, j,"" + temp); 
                    }
                      
                      if (((i > 23 && i < 27) && (j == 0 || j==1)) || i==27 && j==0)
                    {
                        if (getSigFigs(getData(i,j)) != 2)
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
