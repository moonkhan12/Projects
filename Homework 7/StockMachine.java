import java.util.*;
import java.io.*;

public class StockMachine
{
	private StockPriceService[] stockPriceServices;

	private String[] tickerSymbols;

	private Double[] arr;

	private final int NUMBEROFSERVICES = 3;

	public StockMachine(String fileName)
	{
		stockPriceServices = new StockPriceService[3];
		stockPriceServices[0] = new UHStockService();
		stockPriceServices[1] = new NLPService();
		stockPriceServices[2] = new ExternalService();
		try
		{
			Scanner sc = new Scanner(new FileReader(fileName));
			int val = sc.nextInt();
			for(int a = 0; a < val; a++)
			{
				tickerSymbols[a] = sc.next();
			}
		}
		catch(IOException e)
		{

		}
		catch(NullPointerException npe)
		{}
	}

	public String getServiceWithLowestAvg()
	{
		UHStockService UH = new UHStockService();
		Double avg1 = UH.getAvgLow();

		NLPService NLP = new NLPService();
		Double avg2 = NLP.getAvgLow();

		ExternalService Ex = new ExternalService();
		Double avg3 = Ex.getAvgLow();

		String best = "";

		if(avg1 <= avg2 && avg1 <= avg3)
			best = UH.nameOfService();
		else if(avg2 <= avg1 && avg2 <= avg3)
			best = NLP.nameOfService();
		else if(avg3 <= avg1 && avg3 <= avg1)
			best = Ex.nameOfService();

		return best;
	}

	public String getServiceWithHighestAvg()
	{
		UHStockService UH = new UHStockService();
				Double avg1 = UH.getAvg();

				NLPService NLP = new NLPService();
				Double avg2 = NLP.getAvg();

				ExternalService Ex = new ExternalService();
				Double avg3 = Ex.getAvg();

				String best = "";

				if(avg1 >= avg2 && avg1 >= avg3)
					best = UH.nameOfService();
				else if(avg2 >= avg1 && avg2 >= avg3)
					best = NLP.nameOfService();
				else if(avg3 >= avg1 && avg3 >= avg1)
					best = Ex.nameOfService();

		return best;
	}

	public Double average(StockPriceService service)
	{
		/*
		Double sum = 0.0;
		Double count = 0.0;
		for (Double d : priceForTicker.values())
		{
		    sum += d;
		    count++;
		}
		Double avg = sum/count;
		return avg;
		/*
		arr = new Double[3];

		NLPService NLP = new NLPService();
		Double avg1 = NLP.getAvg();
		arr[0] = avg1;

		UHStockService UH = new UHStockService();
		Double avg2 = UH.getAvg();
		arr[1] = avg2;

		ExternalService Ex = new ExternalService();
		Double avg3 = Ex.getAvg();
		arr[2] = avg3;
		return arr;
		*/
		return 0.0;
	}

	public String getBestPriceFor(String ticker)
	{
		UHStockService UH = new UHStockService();
		Double priceUH = UH.priceForTicker(ticker);

		NLPService NLP = new NLPService();
		Double priceNLP = NLP.priceForTicker(ticker);

		ExternalService Ex = new ExternalService();
		Double priceEx = Ex.priceForTicker(ticker);

		String best = "";
		if(priceUH < priceNLP && priceUH < priceEx && priceUH > 0)
			best = Double.toString(priceUH);
		else if(priceNLP < priceUH && priceNLP < priceEx && priceNLP > 0)
			best = Double.toString(priceNLP);
		else if(priceEx < priceNLP && priceEx < priceUH && priceEx > 0)
			best = Double.toString(priceEx);
		return best;
	}
}