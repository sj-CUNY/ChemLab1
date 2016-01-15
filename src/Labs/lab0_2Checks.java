package Labs;

//import blackboard.platform.context.Context;

public class lab0_2Checks extends inputChecks
{
    public lab0_2Checks(int x, int y)
    {
        super(x,y, "lab0_2");
    }
    
    @Override
    protected void buildKey()
    {
        for (int i = 0; i < dataX; i ++)
        {
            for (int j = 0; j < dataY; j++)
            {
                setKey(i,j,"*");
                
                if (i == 1 && j == 0)
                {
                    setKey(i,j,setToDecPlaces(getData(i,j),4));
                }
                
                if ((i > 1 && i < 4) && j == 0)
                {
                    setKey(i,j,setToDecPlaces(getData(i,j),1));
                }
                
                if ((i > 4 && i < 10) && j == 0)
                {
                    setKey(i,j,setToDecPlaces(getData(i,j),2));
                }
                
                if ((i > 4 && i < 10) && j == 1)
                {
                    setKey(i,j,setToDecPlaces(getData(i,j),4));
                }
                
                if (i == 10 && j == 0)
                {
                    double temp = Double.parseDouble(getData(3,0)) -
                            Double.parseDouble(getData(2,0));
                    setKey(i,j,setToDecPlaces("" + temp, 1));
                }
                
                if (i == 10 && j == 0)
                {
                    double temp = Double.parseDouble(getData(1,0)) /
                            Double.parseDouble(getData(10,0));
                    if (temp < 10)
                    {
                        setKey(i,j,setToDecPlaces("" + temp, 2));
                    }
                    else
                    {
                        setKey(i,j, "WRONG");
                    }
                }
                
                if ((i > 11 && i < 16) && j == 0)
                {
                    setKey(i,j,setToDecPlaces(getData(i,j),2));
                }
                
                if ((i > 11 && i < 16) && j == 1)
                {
                    setKey(i,j,setToDecPlaces(getData(i,j),4));
                }
                
                if (i == 16 && j == 0)
                {
                    setKey(i,j,setToDecPlaces(getData(i,j),3));
                }
                
            }
        }
    }
}
