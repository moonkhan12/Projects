import java.util.*;
import java.io.*;

public interface StockPriceService
{
	Double priceForTicker(String ticker);
	String nameOfService();
}