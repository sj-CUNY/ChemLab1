package Labs;

//import blackboard.platform.context.Context;

public class lab0_3Checks extends inputChecks
{
    public lab0_3Checks(int x, int y)
    {
        super(x,y, "lab0_3");
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
                    //Waiting on formula schema from Mahmudul
                    
                }
                else
                {
                    setKey(i,j,"WRONG");
                }
            }
        }
    }
}
