/*
Project 3 (Skipped Project 2) Programming Applications for Electrical and Computer Engineering
Created By: Mubashar Khan, Computer Engineer at UH
ID: 1512949
Due: February 4, 2018
*/

//Microsoft has deprecated lots of calls which use buffers to improve code security
//You might need the following 2 lines of definitions, but probably not::
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING   //They are meant to circumvent errors telling me to use safe versions of functions; 
//I'm not sure how they impact other IDE's

//The coding of this program assumes that the text file you used had only doubles in it

#include <stdio.h>
#include <stdlib.h>

int main() //used int main(void) because for some reason the program wasn't working without the 'int' part
{
	int num = 0,  count_A = 0, count_Amin = 0, count_Bplus = 0, count_B = 0, count_Bmin = 0, count_Cplus = 0, count_C = 0, count_Cmin = 0, count_Dplus = 0, count_D = 0,
		count_Dmin = 0 , count_F = 0; //all counters and num is used to start the main body of the code
	float x; // x and y are the variables used to store the input float values
	char A = 'A', B = 'B', C = 'C', D = 'D', F = 'F', plus = '+', minus = '-';
	FILE *fin, *fout; //pointer... or something
	fin = fopen("in.dat", "r"); // reads in the file 'in.dat'
	fout = fopen("out.dat", "w"); // creates a file called 'out.dat' to output the grades to
	if (fin == NULL) //checks to see if 'in.dat' exists
	{
		printf("Error: the file in.dat did not successfully open\n"); //prints an error message if there is no text file called 'in.dat'
	}
	else
	{
		while (num != EOF) //'ifexists' is initially defined as 0 which is not EOF so it will run through the loop until the text file runs out of data
		{
			num = fscanf(fin, "%f", &x); //stores a value into 'ifexists'
			if (num != EOF) //Ensures the loop does not output an extra time
			{
				//Going down the line of grades and checking to see if the value is greater than or equal to the threshold value of each letter grade
				if ((x > 100.0) || (x < 0.0))//Fake grade, no such thing as bonus points
				{
					printf("Error: Grade entered was not between 0.0 and 100.0\n\n");
				}
				else if (x >= 94.0) //A
				{
					fprintf(fout, "%5.1f%5c\n", x, A); //formatted output
					count_A++;
				}
				else if (x >= 90) //A-
				{
					fprintf(fout, "%5.1f%5c%c\n", x, A, minus); //formatted output
					count_Amin++;
				}
				else if (x >= 86) //B+
				{
					fprintf(fout, "%5.1f%5c%c\n", x, B, plus); //formatted output
					count_Bplus++;
				}
				else if (x >= 82) //B
				{
					fprintf(fout, "%5.1f%5c\n", x, B); //formatted output
					count_B++;
				}
				else if (x >= 78) //B-
				{
					fprintf(fout, "%5.1f%5c%c\n", x, B, minus); //formatted output
					count_Bmin++;
				}
				else if (x >= 74) //C+
				{
					fprintf(fout, "%5.1f%5c%c\n", x, C, plus); //formatted output
					count_Cplus++;
				}
				else if (x >= 70) //C
				{
					fprintf(fout, "%5.1f%5c\n", x, C); //formatted output
					count_C++;
				}
				else if (x >= 66) //C-
				{
					fprintf(fout, "%5.1f%5c%c\n", x, C, minus); //formatted output
					count_Cmin++;
				}
				else if (x >= 62) //D+
				{
					fprintf(fout, "%5.1f%5c%c\n", x, D, plus); //formatted output
					count_Dplus++;
				}
				else if (x >= 58) //D
				{
					fprintf(fout, "%5.1f%5c\n", x, D); //formatted output
					count_D++;
				}
				else if (x >= 54) //D-
				{
					fprintf(fout, "%5.1f%5c%c\n", x, D, minus); //formatted output
					count_Dmin++;
				}
				else if (x < 54) //F
				{
					fprintf(fout, "%5.1f%5c\n", x, F); //formatted output
					count_F++;
				}
			}
		}

		//Prints the number of students that received each grade
		fprintf(fout, "\n%d students earned an A\n", count_A); 
		fprintf(fout, "%d students earned an A-\n", count_Amin);
		fprintf(fout, "%d students earned a B+\n", count_Bplus);
		fprintf(fout, "%d students earned a B\n", count_B);
		fprintf(fout, "%d students earned a B-\n", count_Bmin);
		fprintf(fout, "%d students earned a C+\n", count_Cplus);
		fprintf(fout, "%d students earned a C\n", count_C);
		fprintf(fout, "%d students earned a C-\n", count_Cmin);
		fprintf(fout, "%d students earned a D+\n", count_Dplus);
		fprintf(fout, "%d students earned a D\n", count_D);
		fprintf(fout, "%d students earned a D-\n", count_Dmin);
		fprintf(fout, "%d students earned a F\n", count_F);
		fclose(fin); //closes the file opened at the start of the program
		fclose(fout); //closes the output file opened to write in
	}
	return 0; //standard EXIT_SUCCESS to show program completion. inclusion is not nessessary in C++ because C++ auto includes it when compiling.
}

