public class Cart
{
	private Item[] items;
	private int[] itemQuantities;
	private int itemCount;
	private double totalPrice;
	private int totalQuantity;
	private int cartSize;

	public Cart()
	{
		cartSize = 10;
		items = new Item[10];
		itemQuantities = new int[10];
		itemCount = 0;
		totalPrice = 0.00;
		totalQuantity = 0;
	}
	public Cart(int cs)
	{
		if(cs<=0)
		{
			cs = 10;
		}
		cartSize = cs;
		items = new Item[cs];
		itemQuantities = new int[cs];
		itemCount = 0;
		totalPrice = 0.00;
		totalQuantity = 0;
	}

	public int getItemCount()
	{
		return itemCount;
	}
	public double getTotalPrice()
	{
		return totalPrice;
	}
	public int getTotalQuantity()
	{
		return totalQuantity;
	}
	public int getCartSize()
	{
		return cartSize;
	}
	public void setCartSize(int newCartSize)
	{
		if(newCartSize > cartSize)
		{
			cartSize = newCartSize;
		}
		else if((newCartSize < cartSize) && (newCartSize > 0) && (itemCount < newCartSize))
		{
			cartSize = newCartSize;
		}
		else if(newCartSize <= 0)
		;
	}
	public void add (Item item, int addQuantity)
	{
		if(addQuantity > 0)
		{
			if (cartSize>itemCount)
			{
				if(search(item) >= 0)
				{
					int a = search(item);
					itemQuantities[a] += addQuantity;
					totalPrice += (item.getPrice() * addQuantity);
					totalQuantity +=addQuantity;
				}
				else
				{
					items[itemCount] = item;
					itemQuantities[itemCount] = addQuantity;
					totalPrice += (item.getPrice() * addQuantity);
					totalQuantity +=addQuantity;
					itemCount++;
				}
			}
		}
	}
	public void remove (Item item, int removeQuantity)
	{
		int b = search(item);
		if(b<0) //Item Exists check
			;
		else
		{
			if(removeQuantity < 0)
				;
			else if(removeQuantity < itemQuantities[b])
			{
				itemQuantities[b] -= removeQuantity;
				totalPrice -= (item.getPrice() * removeQuantity);
				totalQuantity -=removeQuantity;
			}
			else if(removeQuantity >= itemQuantities[b])
			{
				for(int i = 0; i < items.length; i++)
				{
				   	if(items[i] == items[b])
				    {
				        for(int j = i; j < items.length - 1; j++)
				        {
				            items[j] = items[j+1];
				    	}
				    	break;
					}
        		}
        		totalPrice -= (item.getPrice() * itemQuantities[b] );
				totalQuantity -= itemQuantities[b];
				itemCount--;
			}
		}
	}
	private int search(Item item)
	{
		for(int i = 0; i<itemCount; i++)
		{
			if(items[i] == item)
			{
				return i;
			}
		}
		return -1;
	}
	public String formattedOutput()
	{
		for(int i = 0; i < itemCount; i++)
		{

		}
		return "a";
	}
}