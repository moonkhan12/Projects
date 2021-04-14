public class Test
{
    public static void main(String[] args)
    {
      int numberOfTestsPassed = 0;

      StockMachine machine = new StockMachine("Tickers.txt");

      //Test 1 - getBestPriceFor()
      String price = machine.getBestPriceFor("AAPL");

      if(price.equals("149.55")){
        numberOfTestsPassed ++;
        System.out.println("Passed test 1- getBestPriceFor()");
      }
      else{
        System.out.println("Error testing getBestPriceFor() method!");
        System.out.println("Checked: AAPL and expected: 149.55");
        System.out.println("Answer received was: " + price);
      }


      //Test 2 - getServiceWithHighestAvg()
      String serviceWithHighestAverage = machine.getServiceWithHighestAvg();

      if(serviceWithHighestAverage.equals("UH")){
        numberOfTestsPassed ++;
        System.out.println("Passed test 2- getServiceWithHighestAvg()");
      }
      else{
        System.out.println("Error testing getServiceWithHighestAvg() method!");
        System.out.println("Expected: UH");
        System.out.println("Answer received was: " + serviceWithHighestAverage);
      }

      //Test 3 - getServiceWithLowestAvg()
      String serviceWithLowestAverage = machine.getServiceWithLowestAvg();

      if(serviceWithLowestAverage.equals("External")){
        numberOfTestsPassed ++;
        System.out.println("Passed test 3- getServiceWithLowestAvg()");
      }
      else{
        System.out.println("Error testing getServiceWithLowestAvg() method!");
        System.out.println("Expected: External");
        System.out.println("Answer received was: " + serviceWithLowestAverage);
      }

      if(numberOfTestsPassed == 3)
        System.out.println("\n\n\nPassed all Tests! Enjoy the weeknd. :)");
      else
        System.out.println("\n\n\nError. You passed: " + numberOfTestsPassed + " of 3 tests.");



    }
}