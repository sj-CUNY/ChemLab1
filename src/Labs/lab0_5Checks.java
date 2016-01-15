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