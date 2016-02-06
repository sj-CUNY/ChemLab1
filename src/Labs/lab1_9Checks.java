package Labs;

//import blackboard.platform.context.Context;

public class lab1_9Checks extends inputChecks
{
    public lab1_9Checks(int x, int y)
    {
        super(x,y, "lab1_9");
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
                    
                    if ((i > 0 && i < 26 && i!=15) && (j == 0 || j==1 || j==2))
                    {
                        setKey(i,j,setToDecPlaces(getData(i,j),2));
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
