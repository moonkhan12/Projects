public class Food extends Item
{
	private double weight;
	private String weightUnit;

	public void setWeightUnit(String wu)
	{
		weightUnit = wu;
	}
	public void setWeight(double wt)
	{
		if(wt>=0)
		{
			weight = wt;
		}
	}
	public String getWeightUnit()
	{
		return weightUnit;
	}
	public double getWeight()
	{
		return weight;
	}
	public String formattedOutput()
	{
		String doubleStringVal = Double.toString(weight);
		return(super.formattedOutput() +","+doubleStringVal +","+weightUnit);
	}
	public Food(String n, double p, double w, String wu)
	{
		setName(n);
		setPrice(p);
		if(w<0)
		{
			weight = 0;
		}
		else
		{
			weight = w;
		}
		weightUnit = wu;
	}
	public Food()
	{
		name = "";
		price = 0.00;
		weight = 0.00;
		weightUnit = "";
	}
}