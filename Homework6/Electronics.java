public class Electronics extends Item
{
	private String model;
	private int year;

	public void setModel(String m)
	{
		model = m;
	}
	public void setYear(int y)
	{
		if(y>=0)
		{
			year = y;
		}
	}
	public String getModel()
	{
		return model;
	}
	public int getYear()
	{
		return year;
	}
	public String formattedOutput()
	{
		String num = Integer.toString(year);
	    return (super.formattedOutput()+ "," + model + "," + num);
	}
	public Electronics(String n, double p, String m, int y)
	{
		setName(n);
		setPrice(p);
		model = m;
		if(y<0)
		{
			year = 0;
		}
		else
		{
			year = y;
		}
	}
	public Electronics()
	{
		name = "";
		price = 0.00;
		model = "";
		year = 0;
	}
}