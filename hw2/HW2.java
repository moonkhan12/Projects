import java.io.*;




public class HW2 
{	
	public static int rowCount, colCount; //tracks number of rows and columns //I know, global variables are bad >:D
	//these values should not change at any point after the files has been read and will be used for matrix operations.
	//There is probably a better way to do this, but this seemed the most obvious way to me.
	
	public static void main(String[] args) throws IOException
	{
		int r1, r2, c1, c2;
		DoublyLinkedList fileA = getInputFile(args,1);
		r1 = rowCount;
		c1 = colCount;
		//System.out.println(r1 + " " + c1); //check row and col size
		//fileA.printForward();
		//System.out.println("\n"+ rowCount + " " + colCount);
		DoublyLinkedList fileB = new DoublyLinkedList();
		if(args[0].toLowerCase().contentEquals("add") || args[0].toLowerCase().contentEquals("sub") || args[0].toLowerCase().contentEquals("mul"))
		{
			fileB = getInputFile(args,2);
		}
		
		r2 = rowCount;
		c2 = colCount;
		//System.out.println(r2 + " " + c2);  //check row and col size
		//fileB.printForward();
		String operation = args[0].toLowerCase();
		
		switch(operation)
		{
		case "add":
			add(fileA, fileB, r1, r2, c1, c2, args);
			break;
		case "sub":
			sub(fileA, fileB, r1, r2, c1, c2, args);
			break;
		case "mul":
			mul(fileA, fileB, r1, r2, c1, c2, args);
			break;
		case "tra":
			tra(fileA, r1, c1, args);
			break;
		case "det":
			det(fileA, r1, c1, args);
			break;
		}
		
	}

	private static void add(DoublyLinkedList list1, DoublyLinkedList list2, int r1, int r2, int c1, int c2, String[] args) throws IOException
	{
		if ((c1 == c2) && (r1 == r2)) //check to see that dimensions for both matrices are the same
		{
			DoublyLinkedList outputMatrix = new DoublyLinkedList();
			int sum;
			int location = 0;
			for(int i = 0; i < r1; i++)
			{
				for(int j = 0; j < c1; j++)
				{
					//System.out.println(location);
					sum = (int)list1.get(location) + (int)list2.get(location);
					//System.out.println(sum);
					outputMatrix.append(sum);
					location++;
				}
			}
			//System.out.println();
			//outputMatrix.printForward();
			location = 0;
			BufferedWriter writer = new BufferedWriter(new FileWriter(args[3]));
			for(int i = 0; i < r1; i++)
			{
				for (int j = 0; j < c1; j++)
				{
					
					//System.out.println(outputMatrix.get(location));
					//String out = String.format("%5s", outputMatrix.get(location)+".0");
					writer.write(outputMatrix.get(location)+".0 ");//(""+outputMatrix.get(location) + ".0 ");
					location++;
				}
				writer.write("\n");
			}
			writer.close();
		}
		
			
	}
	
	private static void sub(DoublyLinkedList list1, DoublyLinkedList list2, int r1, int r2, int c1, int c2, String[] args) throws IOException
	{
		if ((c1 == c2) && (r1 == r2)) //check to see that dimensions for both matrices are the same
		{
			DoublyLinkedList outputMatrix = new DoublyLinkedList();
			int dif;
			int location = 0;
			for(int i = 0; i < r1; i++)
			{
				for(int j = 0; j < c1; j++)
				{
					//System.out.println(location);
					dif = (int)list1.get(location) - (int)list2.get(location);
					//System.out.println(sum);
					outputMatrix.append(dif);
					location++;
				}
			}
			//System.out.println();
			//outputMatrix.printForward();
			location = 0;
			BufferedWriter writer = new BufferedWriter(new FileWriter(args[3]));
			for(int i = 0; i < r1; i++)
			{
				for (int j = 0; j < c1; j++)
				{
					//String out = String.format("%5s", outputMatrix.get(location)+".0");
					writer.write(outputMatrix.get(location)+".0 ");//(""+outputMatrix.get(location) + ".0 ");
					location++;
				}
				writer.write("\n");
			}
			writer.close();
		}
	}
	
	private static void mul(DoublyLinkedList list1, DoublyLinkedList list2, int r1, int r2, int c1, int c2, String[] args) throws IOException
	{
		if(c1 == r2) //check to ensure inner dimensions are the same
		{
			
			//System.out.println(r1);
			//System.out.println(c1);
			//System.out.println(r2);
			//System.out.println(c2);
			//DoublyLinkedList prod = new DoublyLinkedList();
			int num1 = 0;
			int num2 = 0;
			int product = 0;
			int total;
			int multiplier1 = 0;
			int multiplier2 = 0;
			BufferedWriter writer = new BufferedWriter(new FileWriter(args[3]));
			//int location;
			for(int i = 0; i < r1; i++) // row m1
			{
				for(int j = 0; j < c2; j++) // col m2
				{
					multiplier2 = 0;
					total = 0;
					//location = 0;
					for(int k = 0; k < c1; k++) // col m1
					{
						//System.out.println(j + " " + multiplier2 + " " + (j +multiplier2));
						num1 = (int)list1.get(i+k+multiplier1);
						num2 = (int)list2.get(j + multiplier2);
						product = num1 * num2;
						//System.out.println(num1 + " * " + num2 + " = " + product);
						multiplier2 += c2;
						total += product;
					}
					writer.write(total+".0 ");
					//System.out.println(total+".0 ");
				}
				writer.write("\n");
				//System.out.println();
				multiplier1 += c1-1;
			}
			writer.close();
		}
	}
	
	private static void tra(DoublyLinkedList list, int r1, int c1, String[] args) throws IOException
	{
		if(!list.isEmpty())
		{
			//System.out.println("LIST HAS NUMBERS");
			
			//CHECK TO SEE IF the matrix is made of the same value like all 0's or all 1's... No point in transposing then.
			int first = (int)list.get(0); //gets the first value in the list
			int c = 0;
			for(int i = 0; i < list.getSize(); i++)
			{
				if((int)list.get(i) == first) //compares the first value of the list to the whole list
				{
					c++;
				}
			}
			if(c++ == list.getSize()) //if c = number of elements in list, then all values in the list are the same. Output the given input file.
			{
				int loc = 0;
				BufferedWriter writer = new BufferedWriter(new FileWriter(args[2]));
				for (int i = 0; i < r1; i++)
				{
					for(int j = 0; j < c1; j++)
					{
						writer.write((int)list.get(loc)+".0 ");
						loc++;
					}
					writer.write("\n");
				}
				writer.close();
			}
			
			//Now for the actual part: How to transpose. Remember data, row, col
			int new_row = c1; //flipping row and col values so that output has correct shape.
			int new_col = r1;
			int location;
			DoublyLinkedList Transversed_List = new DoublyLinkedList();

			for(int i = 0; i < list.getSize(); i++)
			{
				int x1 = (int)list.getRow(i);
				int y1 = (int)list.getCol(i);
				location = 0;
				for(int j = 0; j < list.getSize(); j++)
				{
					int x2 = (int)list.getRow(j);
					int y2 = (int)list.getCol(j);
					if ((x1 == y2) && (y1 == x2))
					{
						//System.out.println(x1 + " " + y1 + "-----" + x2 + " " + y2);
						Transversed_List.append((int)list.get(location));
					}
					
					location++;
				}	
			}
			BufferedWriter writer = new BufferedWriter(new FileWriter(args[2]));
			int loc = 0;
			for (int i = 0; i < new_row; i++)
			{
				for(int j = 0; j < new_col; j++)
				{
					writer.write((int)Transversed_List.get(loc)+".0 ");
					loc++;
				}
				writer.write("\n");
			}
			writer.close();
		}
	}
	
	private static void det(DoublyLinkedList list, int r1, int c1, String[] args) throws IOException
	{
		
		//Determinant can only be found for square matrix
		if(r1 == c1)
		{
			if((int)list.getSize() == 1)
			{
				int loc = 0;
				BufferedWriter writer = new BufferedWriter(new FileWriter(args[2]));
				for (int i = 0; i < r1; i++)
				{
					for(int j = 0; j < c1; j++)
					{
						writer.write((int)list.get(loc)+".0 ");
						loc++;
					}
					writer.write("\n");
				}
				writer.close();
			}
			else
			{
				int d = matrixDeterminant(list,r1,c1);
				System.out.println("DETERMINANT: " + d + ".0\n");
				//ToDo: Determinant Function::
				BufferedWriter writer = new BufferedWriter(new FileWriter(args[2]));
				writer.write(d + ".0\n");
				writer.close();
				
			}	
		}
	}
	
	//Modified as needed from https://gist.github.com/Cellane/398372
	public static int matrixDeterminant (DoublyLinkedList matrix, int r1, int c1) {
		DoublyLinkedList temporary = new DoublyLinkedList();
		for(int i = 0; i < matrix.getSize(); i++)
			temporary.append(0);
		int result = 0;
		int length = r1;
		
		if (length == 1) {
			result = (int)matrix.get(0);
			return result;
		}
		if (length == 2) {
			result = (( (int)matrix.get(0) * (int)matrix.get(3)) - ((int)matrix.get(1) * (int)matrix.get(2)));
			return result;
		}
		
		
		//You arent looking at the indexes properly. Check them again.
		
		int sign = 1;
		//int location = 0;
		for(int i = 0; i < r1; i++) {
			
			for(int j = 1; j < c1; j++) {

				for(int k = 0; k < r1; k++) {
					if (k < 1) {
						//System.out.println((j-1) + " " + k);
						//System.out.println(location);
						temporary.set(j-1+k,(int)matrix.get(j+k)); //temporary[j - 1][k] = matrix[j][k]; // fix this line
						//location++;
						//get index, if index = j-1 and k, add to temp **
						
					}else if(k > 1) {
						//System.out.println((j-1) + " " + (k-1));
						//System.out.println(location);
						temporary.set(j-1+k-1,(int)matrix.get(j+k)); //temporary[j - 1][k - 1] = matrix[j][k];
						//location++;
						
					}//location++;
				}//location = 0;
			}
			result += (int)matrix.get(i) * sign * matrixDeterminant (temporary, r1-1, c1-1);
			sign = -sign;
		}
		return result;
	}
	
 
 
	public static DoublyLinkedList getInputFile(String[] args, int argNum) throws IOException //input function
	{
		
		rowCount = 0;
		DoublyLinkedList filein = new DoublyLinkedList();
		BufferedReader reader = new BufferedReader(new FileReader(args[argNum])); //Opens the text file for reading
		
		String line = null;
		String[] a = {};
		while((line = reader.readLine()) != null) //Reads in each line
		{ 

			a = line.split(" ");
			colCount = 0;
			for(String item: a)
			{
				filein.append(Integer.parseInt(item)); 
				colCount++;
			}
			rowCount++;
		}
		
		
		
		reader.close();
		return filein; 
		
		/*
		//Get input without using array and array lists
		DoublyLinkedList filein = new DoublyLinkedList();
		Scanner input = new Scanner(new File(args[argNum]));
		rowCount = 0;
		while(input.hasNextLine())
		{

			int i = 0;
		    Scanner colReader = new Scanner(input.nextLine());
		    DoublyLinkedList col = new DoublyLinkedList();
		    colCount = 0;
		    while(colReader.hasNextInt())
		    {
		        col.append(colReader.nextInt());
		        colCount++;
		        i++;
		    }
		    //System.out.println(col.getSize());
		    for(int j = 0; j < i; j++)
		    {
		    	//System.out.println(col.get(j));
		    	filein.append((int)col.get(j));
		    }
			rowCount++;	
			colReader.close();
		}
		//for(int a = 0; a < filein.getSize(); a++)
		//	System.out.println(filein.get(a));
		
		
		input.close();
		return filein;
		*/
		
		
	}
}
