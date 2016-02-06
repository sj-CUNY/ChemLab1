package Labs;

//import blackboard.platform.context.Context;

public class lab1_7Checks extends inputChecks
{
    public lab1_7Checks(int x, int y)
    {
        super(x,y, "lab1_7");
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
                    
                    if ((i > 0 && i < 5) && (j == 0 || j==1))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),2));
                    }
                    
                    if (( i > 0 && i < 5) && j == 2)
                    {
                        double temp = Double.parseDouble(getData(i,1)) /
                                Double.parseDouble(getData(i,0));
                                              
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
