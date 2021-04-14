import java.util.*;
import java.util.regex.*;
import java.io.*;



public class HW1
{
	public static void main(String[] args) throws Exception
	{
		//get input
		String inputFile = getInputFile(args).replace(".", "").replace("!", "").replace("?", ""); // String array that stores each sentence. A sentence's end is identified by a period followed by a space followed by a capital letter
		String[] inputArray = inputFile.split(",\\s*");
		//Input complete

		//Main
		problem1(inputArray, args);//List the most frequent word(s) in the whole file and its frequency.
		problem2(inputArray, args);//List the 3rd most frequent word(s) in the whole file and its frequency.
		problem3(inputArray, args);//List the word(s) with the highest frequency in a sentence across all sentences in the whole file, also print its frequency and the corresponding sentence.
		problem4(inputArray, args);//List sentence(s) with the maximum no. of occurrences of the word "the" in the entire file and also list the corresponding frequency.
		problem5(inputArray, args);//List sentence(s) with the maximum no. of occurrences of the word "of" in the entire file and also list the corresponding frequency.
		problem6(inputArray, args);//List sentence(s) with the maximum no. of occurrences of the word "was" in the entire file and also list the corresponding frequency.
		problem7(inputArray, args);//List sentence(s) with the maximum no. of occurrences of the phrase "but the" in the entire file and also list the corresponding frequency.
		problem8(inputArray, args);//List sentence(s) with the maximum no. of occurrences of the phrase "it was" in the entire file and also list the corresponding frequency.
		problem9(inputArray, args);//List sentence(s) with the maximum no. of occurrences of the phrase "in my" in the entire file and also list the corresponding frequency.

		
		//CHECK 2, 3
		//UPDATE: Potentially fixed 3. Might encounter an arrayOutOfBounds error if the input file is too small.- I didn't check
	}
	
	
	public static void problem1(String[] arr, String[] args) throws IOException
	{
		ArrayList<String> words = new ArrayList<String>(); //will store the words
		ArrayList<Integer> amount = new ArrayList<Integer>(); //will store the count
		String[] allwords = {};
		
		int indx;
		for(int i = 0; i<arr.length; i++)
		{
			allwords = arr[i].split(" ");
			for(int j = 0; j < allwords.length; j++) //(String item: allwords)
			{
				if (!words.contains(allwords[j]))
				{
					words.add(allwords[j]);
					amount.add(1);
				}
				else
				{
					indx = words.indexOf(allwords[j]);
					int value = amount.get(indx); // get value
					value = value + 1; // increment value
					amount.set(indx, value); // replace value
				}
			}
		}
		
		int max = 0;
		int repeat = amount.size();
		int count = 0;
		ArrayList<String> out = new ArrayList<String>();
			
		
		//WORKS BUT COULD CLEAN THIS UP BY USING A DO WHILE //Do later
		indx = 0;
		for (int i : amount) //taken from https://www.geeksforgeeks.org/min-and-max-in-a-list-in-java/
	    {
	    	if (max < i) 
	    	{ 
	    		max = i; 
	    		indx = amount.indexOf(max);
	    	} 
	    	
	    }
		out.add(words.get(indx).concat(":").concat(Integer.toString(max)));
		amount.set(indx, 0);
		//check for a tie  **Very Inefficient**
		while(count<repeat) 
		{
			for (int i : amount)
			{
				if (max == i) 
				{ 
					indx = amount.indexOf(max);
					out.add(words.get(indx).concat(":").concat(Integer.toString(max)));
					amount.set(indx, 0);
				} 
	    	
			}
			count++;
		}
		output(1,out,args);
	
	}
	
	public static void problem2(String[] arr, String[] args) throws IOException
	{
		ArrayList<String> words = new ArrayList<String>(); //will store the words
		ArrayList<Integer> amount = new ArrayList<Integer>(); //will store the count
		String[] allwords = {};
		
		int indx;
		for(int i = 0; i<arr.length; i++)
		{
			allwords = arr[i].split(" ");
			for(int j = 0; j < allwords.length; j++) //(String item: allwords)
			{
				if (!words.contains(allwords[j]))
				{
					words.add(allwords[j]);
					amount.add(1);
				}
				else
				{
					indx = words.indexOf(allwords[j]);
					int value = amount.get(indx); // get value
					value = value + 1; // increment value
					amount.set(indx, value); // replace value
				}
			}
		}
		
		int count = 0;
		int maxCount = 2;
		
		int max = 0;
		indx = 0;
		ArrayList<String> out = new ArrayList<String>();
		while(count <= maxCount)
		{
			max = 0;
			count++;
			for (int i : amount) //taken from https://www.geeksforgeeks.org/min-and-max-in-a-list-in-java/
	    	{
				
	    		if (max < i) 
	    		{ 
	    			max = i; 
	    			indx = amount.indexOf(max);
	    		} 	    		
	    	}
			//System.out.println(amount.get(indx));
			//System.out.println(words.get(indx));
			if (count <= maxCount)
				amount.set(indx, 0);
			
		}
		out.add(words.get(indx).concat(":").concat(Integer.toString(max)));

		amount.set(indx, 0);
		for (int i: amount)
		{
			if(i == max)
			{
				indx = amount.indexOf(max);
				out.add(words.get(indx).concat(":").concat(Integer.toString(max)));
				amount.set(indx, 0);
			}
		}
		
		output(2,out,args);
		
	}
	
	public static void problem3(String[] arr, String[] args) throws IOException
	{
		ArrayList<String> words = new ArrayList<String>();
		ArrayList<Integer> amount = new ArrayList<Integer>();
		ArrayList<String> wordsMax = new ArrayList<String>();
		ArrayList<Integer> amountMax = new ArrayList<Integer>();
		

		
		String[] word;
		int index;
		int max = 0;
		for(String sentence: arr)
		{
			words.clear();
			amount.clear();
			word = sentence.split(" ");
			for(int i = 0; i < word.length; i++)
			{
				if(words.contains(word[i]))
				{
					index = words.indexOf(word[i]);
					int value = amount.get(index);
					value++;
					amount.set(index, value);
				}
				else
				{
					words.add(word[i]);
					amount.add(1);
				}	
			}
			
			for(int i = 0; i <words.size(); i++)
			{
				//System.out.println(words.get(i) + "   " + amount.get(i));
				if(max<=amount.get(i))
				{
					max = amount.get(i);
					//if(!wordsMax.contains(words.get(i)))
					//{
						wordsMax.add(words.get(i));
						amountMax.add(max);
					//}
					
					
				}
			}
			//System.out.println(max);
			//System.out.println("/////////////////////////////////////////////////////////////////////");
			//System.out.println(wordsMax.get(amountMax.size()-1));
			
		
		}
		ArrayList<String> out = new ArrayList<String>();
		
		int count = 0;
		String[] word2;
		
		while(amountMax.get(amountMax.size()-1) == max)
		{
			for(String sentence:arr)
			{
				word2 = sentence.split(" ");
				for(int i = 0; i<word2.length; i++)
				{
					if (word2[i].equals(wordsMax.get(amountMax.size()-1)))
					{
						count++;
					//System.out.println(word2[i]);
						if(count == max)
						{
						//System.out.println(max);
						//System.out.println(wordsMax.get(wordsMax.size()-1).concat(":").concat(Integer.toString(max)).concat(":").concat(sentence));
							out.add(wordsMax.get(wordsMax.size()-1).concat(":").concat(Integer.toString(max)).concat(":").concat(sentence));
						}
					}
				}
				count = 0;
			
			
			}
			/*
			int d = 0;
			for(String i : wordsMax)
			{
				if(i.equals(wordsMax.get(wordsMax.size()-1)))
					d++;
				//System.out.println(i);
			} */
			//System.out.println(d);
		/*for(int i : amountMax)
		{
			System.out.println(i);
		} */int o = 0;
			int duplicate=0;
			if(wordsMax.size() > 1)
			{
				for(int i = 0; i < wordsMax.size()-1; i++)
				{
					if(wordsMax.get(i).contains(wordsMax.get(wordsMax.size()-1)) && amountMax.get(i).equals(amountMax.get(amountMax.size()-1)))
					{
						duplicate++;
						//System.out.println(wordsMax.get(i));
						//System.out.println(duplicate);
					}
				}
			
				while(duplicate>=o)
				{
				//System.out.println(wordsMax.get(wordsMax.size()-2) + ", " + wordsMax.get(wordsMax.size()-1));
					o++;
					//duplicate--;
					wordsMax.remove(wordsMax.size()-1);
					amountMax.remove(amountMax.size()-1);
				}
			}
		
		
		//wordsMax.remove(wordsMax.size()-1);
		//amountMax.remove(amountMax.size()-1);
		}
		output(3,out,args);
		
		
		
		/*
		ArrayList<String> words = new ArrayList<String>(); //will store the words
		ArrayList<Integer> amount = new ArrayList<Integer>(); //will store the count
		ArrayList<Integer> maxCount = new ArrayList<Integer>(); 
		ArrayList<String> maxWord = new ArrayList<String>();
		
		
		
		int index;
		int indx;
		int max = 0;
		
		for (String a: arr) //splits up into each sentence
		{
			words.clear();
			amount.clear();
			String[] x = a.split(" "); //splits each sentence into words
			for(int i = 0; i < x.length; i++)
			{
				
				if(words.contains(x[i]))
				{
					index = words.indexOf(x[i]);
					int value = amount.get(index);
					value++;
					amount.set(index, value);
				}
				else
				{
					words.add(x[i]);
					amount.add(1);
				}	
			}
			indx = 0;
			for (int j : amount)
		    {
		    	if (max <= j) 
		    	{ 
		    		
		    		max = j; 
		    		indx = amount.indexOf(max);
		    		maxCount.add(max);
		    		maxWord.add(words.get(indx));
		    		
		    	} 
		    	
		    }	
			
		}
		
		for (int i = 0; i < maxCount.size(); i++) ///////////YESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSssss
		{
			//System.out.println(maxWord.get(i));
			//System.out.println(maxCount.get(i));
			//Now you need to find which sentence has the 8 the's
		}
		
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		ArrayList<String> out = new ArrayList<String>();
		String text;
		int countmax;
		int g = maxCount.get(maxCount.size()-1);
		//System.out.println(g);
		
		while(maxCount.get(maxCount.size()-1).equals(g))
		{
			
			for (String a: arr) //splits up into each sentence
			{
				String[] x = a.split(" "); //splits each sentence into words
				countmax = 0;
				for(int i = 0; i < x.length; i++)
				{
				//System.out.println(x[i]);
				//System.out.println(maxWord.get(maxWord.size()-1));
					//if(maxCount.get(maxCount.size()-1).equals(g))
					if(x[i].equals(maxWord.get(maxWord.size()-1)))
					{
					
						countmax++;
						if(countmax == g)
						{
							//System.out.println(a);
							text = maxWord.get(maxWord.size()-1).concat(":").concat(maxCount.get(maxCount.size()-1).toString()).concat(":").concat(a);
							out.add(text);
							a = "";
							//System.out.println("///////////////////////////////////////////////////////////");
							//System.out.println(maxWord.get(maxWord.size()-1));
							//System.out.println(maxCount.get(maxCount.size()-1));
							maxWord.remove(maxWord.size()-1);
							maxCount.remove(maxCount.size()-1);
						}
						
					}
					
				}
				
			}
			//System.out.println(maxWord.get(maxWord.size()-1));
			//System.out.println(maxCount.get(maxCount.size()-1));
			
		
		}
		
		//it works for 1 value so the error is most likely with how you are looping it. See while loop
		output(3,out,args);
		
		*/
		
	}
	
	public static void problem4(String[] arr, String[] args) throws IOException
	{
		String keyword = "the";
		solveFourtoSix(arr, args, keyword, 4);
	}
	
	public static void problem5(String[] arr, String[] args) throws IOException
	{
		String keyword = "of";
		solveFourtoSix(arr, args, keyword, 5);
	}
	
	public static void problem6(String[] arr, String[] args) throws IOException
	{
		String keyword = "was";
		solveFourtoSix(arr, args, keyword, 6);
	}
	
	public static void problem7(String[] arr, String[] args) throws IOException
	{
		String keyword = "but the";
		solveSeventoNine(arr, args, keyword, 7);
	}
	
	public static void problem8(String[] arr, String[] args) throws IOException
	{
		String keyword = "it was";
		solveSeventoNine(arr, args, keyword, 8);
	}
	
	public static void problem9(String[] arr, String[] args) throws IOException
	{
		String keyword = "in my";
		solveSeventoNine(arr, args, keyword, 9);
	}
	
	
	public static void solveFourtoSix(String[] arr, String[] args, String keyword ,Integer probNum) throws IOException
	{
		ArrayList<String> words = new ArrayList<String>(); //will store the words
		ArrayList<Integer> amount = new ArrayList<Integer>(); //will store the count
		ArrayList<Integer> trackWord = new ArrayList<Integer>();
		
		
		int index;
		
		
		//int sentenceNumber = 0;
		int wordCount = 0;
		
		for (String a: arr) //splits up into each sentence
		{
			words.clear();
			amount.clear();
			String[] x = a.split(" "); //splits each sentence into words
			for(int i = 0; i < x.length; i++)
			{
				
				if(words.contains(x[i]))
				{
					index = words.indexOf(x[i]);
					int value = amount.get(index);
					value++;
					amount.set(index, value);
				}
				else
				{
					words.add(x[i]);
					amount.add(1);
				}	
			}
			
			wordCount = 0;
			for (int i = 0; i < x.length; i++)
			{
				if(x[i].equals(keyword))
				{
					//System.out.println(x[i]);
					wordCount++;
					
					
				}
			}
			trackWord.add(wordCount);
			//System.out.println("Sentence: " +sentenceNumber + "  Word Count: " + wordCount);
			//sentenceNumber++;
		}
		
		int max = 0;
		for (int i : trackWord)
		{
			if (max <= i) 
			{ 
				max = i; //max should contain the highest # occurrence of the keyword
			} 
		}
		//System.out.println(max);
		//System.out.println(trackWord.get(86));
		
		
		int repeat = trackWord.size();
		int count = 0;
		ArrayList<String> out = new ArrayList<String>();
		
		while(count<repeat) 
		{
			for (int i =0; i < trackWord.size(); i++)
			{
				if (max == trackWord.get(i)) 
				{ 
				
					out.add(keyword.concat(":").concat(Integer.toString(max)).concat(":").concat(arr[i]));
					trackWord.set(i, 0);
				} 
	    	
			}
			count++;
		}
		output(probNum,out,args);
		
		/*
		for(String a : out)
		{
			System.out.println(a);
		} */
	}
	
	public static void solveSeventoNine(String[] arr, String[] args, String keyword ,Integer probNum) throws IOException
	{
		
		//ArrayList<String> words = new ArrayList<String>(); //will store the words
		//ArrayList<Integer> amount = new ArrayList<Integer>(); //will store the count
		ArrayList<Integer> trackWord = new ArrayList<Integer>();
		
		
		//int index;
		
		
		//int sentenceNumber = 0;
		
		
		//int indx;
		//int c = 0;
		int matches;
		for (String a: arr) //splits up into each sentence
		{
			
			Matcher m = Pattern.compile(keyword).matcher(a);

			matches = 0;
			while(m.find())
			    matches++;

			//System.out.println(matches);
			trackWord.add(matches);
		}

		
		int max = 0;
		for (int i : trackWord)
		{
			if (max <= i) 
			{ 
				max = i; //max should contain the highest # occurrence of the keyword
			} 
		}
		//System.out.println(max);
		//System.out.println(trackWord.get(86));
		
		
		//int repeat = trackWord.size();
		//int count = 0;
		ArrayList<String> out = new ArrayList<String>();
		
		//System.out.println(repeat);
		//while(count<repeat) 
		//{
			
			for (int i =0; i < trackWord.size(); i++)
			{
				if (max == trackWord.get(i)) 
				{ 
				
					out.add(keyword.concat(":").concat(Integer.toString(max)).concat(":").concat(arr[i]));
					trackWord.set(i, 0);
				} 
	    	
			}
		//	count++;
		//}
		output(probNum,out,args);
		
	}
	
	public static String getInputFile(String[] args) throws IOException //input function
	{
		ArrayList<String> filein = new ArrayList<String>();//Dynamic Array to store text file
		BufferedReader reader = new BufferedReader(new FileReader(args[0]));//.concat(".txt"))); //Opens the text file for reading
		String line = null;
		String[] a = {};
		while((line = reader.readLine()) != null) //Reads in each line
		{ 
			line = line.toLowerCase();
			a = line.split("\\. "); //("\\. (?=[a-z])"); //"\\W+");
			for(String item: a)
				filein.add(item); //Stores the line into the array filein
		}

		reader.close();
		String arr = filein.toString();
		arr = arr.substring(1, arr.length()-1);
		return arr;
	}
	
	public static void output(Integer probNum, ArrayList<String> text, String[] args) throws IOException
	{
		String filename = args[1].concat(Integer.toString(probNum)).concat(".txt"); // create file name
		BufferedWriter writer = new BufferedWriter(new FileWriter(filename)); // open file
		for(int i = 0; i < text.size(); i ++)
			writer.write(text.get(i)+"\n"); // write to file
		writer.close(); // close file
	}
	
}






