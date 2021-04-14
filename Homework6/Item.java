public class Item
{
	protected String name; //name of item
	protected double price; //price of item

	public void setName(String n)
	{
		name = n;
	}
	public void setPrice(double p)
	{
		if(p >= 0)
			price = p;
	}
	public String getName()
	{
		return name;
	}
	public double getPrice()
	{
		return price;
	}
	public String formattedOutput()
	{
		String doubleStringVal = Double.toString(price);
		return(name +  "," + doubleStringVal);
	}
	public Item(String n, double p)
	{
			name = n;
			price = p;
	}
	public Item()
	{
		name = "";
		price = 0;
	}
}