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
                    
                    //TODO
                    
                }
                else
                {
                    setKey(i,j,"WRONG");
                }
            }
        }
    }
}
