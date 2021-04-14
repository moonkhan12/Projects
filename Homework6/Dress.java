public class Dress extends Item
{
	private String size;
	private String fabric;

	public void setSize(String s)
	{
		size = s;
	}
	public void setFabric(String f)
	{
		fabric = f;
	}
	public String getSize()
	{
		return size;
	}
	public String getFabric()
	{
		return fabric;
	}
	public String formattedOutput()
	{
		return (super.formattedOutput() + "," +size+","+fabric);
	}
	public Dress(String n, double p, String s, String f)
	{
		setName(n);
		setPrice(p);
		size = s;
		fabric = f;
	}
	public Dress()
	{
		name = "";
		price = 0.00;
		size = "";
		fabric = "";
	}
}