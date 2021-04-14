/*
Project 1 Programming Applications for Electrical and Computer Engineering
Created By: Mubashar Khan, Computer Engineer at UH
ID: 1512949
Due: January 28, 2018
*/

//Microsoft has deprecated lots of calls which use buffers to improve code security
//You might need the following 2 lines of definitions, but probably not::
//#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
//#define _CRT_SECURE_NO_WARNING   //They are meant to circumvent errors telling me to use safe versions of functions; 
				   //I'm not sure how they impact other IDE's

//The coding of this program assumes that the text file you used had only integers in it

#include <stdio.h>
#include <stdlib.h>

int main() //used int main(void) because for some reason the program wasn't working without the 'int' part
{
	int x, i = 0, ifexists = 0, userin, duplicate = 0; //defining some variables
	FILE *fin; //pointer... or something
	fin = fopen("in.txt", "r"); // reads in the file 'in.txt'
	if (fin == NULL) //checks to see if 'in.txt' exists
	{
		printf("Error: the file in.txt did not successfully open\n"); //prints an error message if there is no text file called 'in.txt'
	}
	else
	{
		printf("Please enter an integer value: ");
		scanf("%d", &userin); //stores user provided value in 'userin'
		while (ifexists != EOF) //'ifexists' is initially defined as 0 which is not EOF so it will run through the loop until the text file runs out of data
		{
			ifexists = fscanf(fin, "%d", &x); //stores a value into 'ifexists'
			if (ifexists != EOF)//redundant because it is the same as the while() condition, but i dont feel like removing it since the 3 lines from this conditional makes this program exactly 50 lines long
			{
				i = i + 1; //counter to store many integers are in the text file
				if (userin == x)
				{
					duplicate = duplicate + 1; //counter to store how many times the number the user entered exists in 'in.txt'
				}
			}
		}
		printf("\nThe number %d appears %d time(s) in the file 'in.txt'.\n\n", userin, duplicate); //Self Explanitory
		printf("There are %d integers in the file.\n\n", i); //Self Explanitory
		fclose(fin); //closes the file opened at the start of the program
	}
	return 0; //standard EXIT_SUCCESS to show program completion. inclusion is not nessessary in C++ because C++ auto includes it when compiling.
} 
//Have a nice day.