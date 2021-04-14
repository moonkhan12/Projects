import java.util.*;
import java.io.*;

public class NLPService implements StockPriceService
{
	private Map<String, Double> tickerPrices;
	private double avg;
	public NLPService()
	{
		try
		{
			tickerPrices = new HashMap<String, Double>();
			Scanner sc = new Scanner(new FileReader("NLPService.txt"));
			sc.useDelimiter("\\s+");
			while (sc.hasNext())
			{
			    String tempString = sc.next();
			    Double tempdouble = sc.nextDouble();
			    tickerPrices.put(tempString,tempdouble);
			}

		}
		catch(IOException e)
		{

		}
	}

	public Double priceForTicker(String ticker)
	{
		Double value = tickerPrices.get(ticker);
		if(value != null || value != 0)
			return value;
		else
			return 0.0;
	}

	public String nameOfService()
	{
		return "NLP";
	}
	public Double getAvgLow()
	{
		Double sum = 0.0;
		Double count = 0.0;
		for (Double d : tickerPrices.values())
		{
			if(d > 0)
			{
		    	sum += d;
		    	count++;
			}
		}
		avg = sum/count;
		return avg;
	}
	public Double getAvg()
		{
			Double sum = 0.0;
			Double count = 0.0;
			for (Double d : tickerPrices.values())
			{
			    sum += d;
			   	count++;

			}
			avg = sum/count;
			return avg;
	}

}