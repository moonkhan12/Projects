// DONE OCTOBER 14, 2019 1:40 PM
// Probably not the most efficient code for 5 pegs. Might be a better way to get around the (2 + 3n) issue

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class HW4 
{
	public static void main(String[] args) throws IOException
	{
		int pegs = Integer.parseInt(args[0]);
		int disks = Integer.parseInt(args[1]); // Number of disks 
		BufferedWriter writer = new BufferedWriter(new FileWriter(args[2])); // open file
		switch(pegs)
		{
		case 3:
			towerOfHanoi3(disks, 'A', 'C', 'B', writer);  // A, B and C are names of rods , writer is used to create the output file. //A is first rod, C is final rod, B is extra rod1.
			break;
		case 4:
			towerOfHanoi4(disks, 'A', 'D', 'B', 'C', writer); //D is destination
			break;
		case 5:
			towerOfHanoi5(disks, 'A', 'E', 'B', 'C', 'D', writer); // E is destination
			break;
		}
		writer.close();
	}
	
	public static void towerOfHanoi3(int disks, char startingRod, char endingRod, char midRod1, BufferedWriter writer) throws IOException
    { 
		if (disks == 0) //can't do much if there aren't any disks
			return;
        if (disks == 1) //move from first to last
        { 
            writer.write(disks + " " +  startingRod + " " + endingRod); //System.out.println(disks+ " " +  startingRod + " " + endingRod); 
            writer.newLine();
            return; 
        } 
        towerOfHanoi3((disks - 1), startingRod, midRod1, endingRod, writer); 
        writer.write(disks + " " +  startingRod + " " + endingRod);  //System.out.println(disks+ " " +  startingRod + " " + endingRod); 
        writer.newLine();
        towerOfHanoi3((disks - 1), midRod1, endingRod, startingRod, writer); 
    } 
	
	
	public static void towerOfHanoi4(int disks, char startingRod, char endingRod, char midRod1, char midRod2, BufferedWriter writer) throws IOException
	{ 
		if (disks == 0) 
			return; 
		if (disks == 1) 
		{ 
			writer.write(disks+ " " + startingRod + " " + endingRod); //System.out.println(disks+ " " + startingRod + " " + endingRod); 
			writer.newLine();
			return; 
		}
		
		towerOfHanoi4((disks - 2), startingRod, midRod1, midRod2, endingRod, writer); 
		writer.write((disks - 1) + " " + startingRod + " " + midRod2);  //System.out.println((disks - 1) + " " + startingRod + " " + midRod2); 
		writer.newLine();
		writer.write(disks + " " + startingRod + " " + endingRod); //System.out.println(disks + " " + startingRod + " " + endingRod); 
		writer.newLine();
		writer.write((disks - 1) + " " + midRod2 + " " + endingRod); //System.out.println((disks - 1) + " " + midRod2 + " " + endingRod); 
		writer.newLine();
		towerOfHanoi4((disks - 2), midRod1, endingRod, startingRod, midRod2, writer); 
	} 
	
	
	public static void towerOfHanoi5(int disks, char startingRod, char endingRod, char midRod1, char midRod2, char midRod3, BufferedWriter writer) throws IOException
	{
		if (disks == 0)
			return;
		if (disks == 1)
		{
			writer.write( disks + " " + startingRod + " " + endingRod);//System.out.println( disks+ " " + startingRod + " " + endingRod);
			writer.newLine();
			return;
		}
		if (disks == 2) // Needed to fix (2 + 3k) issue
		{
			writer.write((disks - 1) + " " + startingRod + " " +midRod1);//System.out.println((n-1) + " " + startingRod + " " +midRod1);
			writer.newLine();
			writer.write(disks + " " + startingRod + " " + endingRod);//System.out.println(disks+ " " + startingRod + " " + endingRod);
			writer.newLine();
			writer.write((disks - 1) + " " + midRod1 + " " + endingRod);//System.out.println((n-1) + " " + midRod1 + " " + endingRod);
			writer.newLine();
			return;
		}
		//will give an error for any rod (2 + 3k) where k can range from 0 to infinity
		//ERROR FIXED BY ADDING disks==2 case above::
		towerOfHanoi5((disks - 3), startingRod, midRod1, midRod2, midRod3, endingRod, writer); // Call for n-3 was causing the issue.
		writer.write((disks - 2) + " " + startingRod + " " + midRod3); //System.out.println((disks- 2) + " " + startingRod + " " + midRod3); 
		writer.newLine();
		writer.write((disks - 1) + " " + startingRod + " " + midRod2); //System.out.println((disks- 1) + " " + startingRod + " " + midRod2); 
		writer.newLine();
		writer.write((disks - 0) + " " + startingRod + " " + endingRod); //System.out.println((disks- 0) + " " + startingRod + " " + endingRod); 
		writer.newLine();
		writer.write((disks - 1) + " " + midRod2 + " " + endingRod); //System.out.println((disks- 1) + " " + midRod2 + " " + endingRod); 
		writer.newLine();
		writer.write((disks - 2) + " " + midRod3 + " " + endingRod); //System.out.println((disks- 2) + " " + midRod3 + " " + endingRod); 
		writer.newLine();
		towerOfHanoi5((disks - 3), midRod1, endingRod, midRod2, startingRod, midRod3, writer);	
	}
}
