/*
Project 6 Programming Applications for Electrical and Computer Engineering
Created By: Mubashar Khan, Computer Engineer at UH
ID: 1512949
Due: February 28, 2018
*/

#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

void instructions(); //this program works without passing any values back and forth
void characters();
//NOTE: When I was testing, at times i would get a meesage on my default photo viewing program that the image was not supported. 
//This problem can be solved by either choosing a different name for the file or trying to rerun the program. Results Vary...
int main()
{
	instructions();
	characters();
	system("pause");
	return 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void instructions()
{
	printf("Enter a file name that has a 'bmp' extension: ");
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void characters()
{
	char filename[] = "temp char array"; //allvalues in this array are replaced when the user enters a value into the command prompt 
	
	scanf("%s", &filename); //gets the user entered file name

	while (1) // Keeps repeating until the user enters a valid file name
	{
		if (!strcmp(strrchr(filename, '\0') - 4, ".bmp")) //Checks to see if the last 4 characters 
		{
			break;//The String ends with ".bmp"
		}
		else
		{
			printf("You did not enter a valid file name. Enter a file name ending in '.bmp': ");
			scanf("%s", &filename);
		}
	}

	FILE *fout;
	fout = fopen(filename, "w"); //opens a file named whatever the user enters and prepares it to have data written to it

	unsigned char  BITMAPFILEHEADER[14] = { 66, 77, 54, 0, 3, 0, 0, 0, 0, 0, 54, 0, 0, 0 };
	unsigned char  BITMAPINFOHEADER[40] = { 40, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 24, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

	int N = 14;
	for (int n = 0; n < N; n++)
	{
		fprintf(fout, "%c", BITMAPFILEHEADER[n]);
	}

	N = 40;
	for (int n = 0; n < N; n++)
	{
		fprintf(fout, "%c", BITMAPINFOHEADER[n]);
	}

	unsigned char pixel[768] = {};
	srand((unsigned int)time(NULL));

	//DRAW PICTURE:
	for (int j = 0; j < 256; j++)
	{
		if (j == 10) //setting the 10th value to 11 as instructions instructed
		{
			int i = rand();
			pixel[11] = i;
			fprintf(fout, "%c", pixel[11]);
		}
		else 
		{
			for (int n = 0; n < 768; n++)
			{
				int i = rand();
				pixel[n] = i; //sets the value of the pixel at this location to the random value stored in i
				fprintf(fout, "%c", pixel[n]);
			}
		}
	}
	
	fclose(fout);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////