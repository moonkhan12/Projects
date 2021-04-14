import java.io.*;

public class HW3 
{
	public static void main(String[] args) throws IOException
	{
		long timestart = System.nanoTime(); //record time at start of program
		
		int inNum = Integer.parseInt(args[2]);
		int repeat = 1;
		int min = 1;
		int max = 100; //1 million
		BufferedWriter writer = new BufferedWriter(new FileWriter(args[1]));
		
		String which = args[0].toLowerCase();
		
		while (repeat <= inNum)
		{
			
			//System.out.println((int)Math.pow((double)10, (double)repeat));
			
			double[] a = new double[(int)Math.pow((double)10, (double)repeat)];
			int[] b = new int[(int)Math.pow((double)10, (double)repeat)];
			for(int i = 0; i < a.length; i++)
			{
				a[i] = (Math.random() * ((max - min) + 1)) + min; //popluate arrary with random numbers
				b[i] = (int)((Math.random() * ((max - min) + 1)) + min); //popluate arrary with random numbers
				//System.out.println(a[i]+ " " + b[i]);
				 
			}
			//System.out.println("THIS IS A BREAK BETWEEN SETS");
			
			
			switch(which)
			{
			case "p1":
				prefixAverage1(a);
				break;
			case "p2":
				prefixxAverage2(a);
				break;
			case "e1":
				example1(b);
				break;
			case "e2":
				example2(b);
				break;
			case "e3":
				example3(b);
				break;
			case "e4":
				example4(b);
				break;
			case "e5":
				example5(b,b);
				break;
			}
			
			repeat++;
			

			
			long timeend = System.nanoTime();
			double timetaken = (timeend - timestart) / 1000000.0; // converts to micro seconds
			//System.out.println(timestart + " " + timeend + " "+ timetaken);
			//System.out.println("WRITEN TO FILE: " + Math.log10(timetaken));
			writer.write(String.valueOf(Math.log10(timetaken))); // out time taken to do this loop
			writer.newLine();
		}
	
		writer.close();
		//System.out.println("DONE");
	}

	//p1
	public static double[] prefixAverage1(double[] x) 
	{
		int n = x.length;
		double[] a = new double[n];                     // filled with zeros by default
		for (int j=0; j < n; j++) 
		{
			double total = 0;                           // begin computing x[0] + ... + x[j]
			for (int i=0; i <= j; i++)
				total += x[i];
			a[j] = total / (j+1);                       // record the average
		}
		return a;
	}

	//p2
	public static double[] prefixxAverage2(double[] x) 
	{
		int n = x.length;
		double[] a = new double[n];                     // filled with zeros by default
		double total = 0;                               // compute prefix sum as x[0] + x[1] + ...
		for (int j=0; j < n; j++) 
		{
			total += x[j];                              // update prefix sum to include x[j]
			a[j] = total / (j+1);                       // compute average based on current sum
		}
		return a;
	}

	//e1
	/** Returns the sum of the integers in given array. */
	public static int example1(int[] arr) 
	{
		int n = arr.length, total = 0;
		for (int j=0; j < n; j++)                           // loop from 0 to n-1
			total += arr[j];
		return total;
	}

	//e2
	/** Returns the sum of the integers with even index in given array. */
	public static int example2(int[] arr) 
	{
		int n = arr.length, total = 0;
		for (int j=0; j < n; j += 2)                        // note the increment of 2
			total += arr[j];
		return total;
	}

	//e3
	/** Returns the sum of the prefix sums of given array. */
	public static int example3(int[] arr) 
	{
		int n = arr.length, total = 0;
		for (int j=0; j < n; j++)                           // loop from 0 to n-1
			for (int k=0; k <= j; k++)                      // loop from 0 to j
				total += arr[j];
		return total;
	}

	//e4
	/** Returns the sum of the prefix sums of given array. */
	public static int example4(int[] arr) 
	{
		int n = arr.length, prefix = 0, total = 0;
		for (int j=0; j < n; j++) 
		{                         // loop from 0 to n-1
			prefix += arr[j];
			total += prefix;
		}
		return total;
	}

	//e5
	/** Returns the number of times second array stores sum of prefix sums from first. */
	public static int example5(int[] first, int[] second) { // assume equal-length arrays  //Takes a long time after 4;
		int n = first.length, count = 0;
		for (int i=0; i < n; i++) 
		{                         // loop from 0 to n-1
			int total = 0;
			for (int j=0; j < n; j++)                       // loop from 0 to n-1
				for (int k=0; k <= j; k++)                  // loop from 0 to j
					total += first[k];
			if (second[i] == total) count++;
		}
		//System.out.println("round");
		return count;
	}

}

