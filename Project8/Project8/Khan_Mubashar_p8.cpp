/*
Project 8 Programming Applications for Electrical and Computer Engineering
Created By: Mubashar Khan, Computer Engineer at UH
ID: 1512949
Due: February 28, 2018
*/


//TEST LOCATION: C:/Users/moon7/Downloads/thisone.wav

#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	printf("Enter a valid path name to your file. A valid path name may look like: C:/User/music/thisone.wav\n");
	printf("Enter the file path to your audio file: ");
	char filename[150]; //creates a large empty array to store the file path

	scanf("%s", &filename); //gets the user entered file name

	while (1) // Keeps repeating until the user enters a valid file name
	{
		//Only 8 combinations of upper and lower case letters for ".wav"
		if (!strcmp(strrchr(filename, '\0') - 4, ".wav") || !strcmp(strrchr(filename, '\0') - 4, ".WAV") || !strcmp(strrchr(filename, '\0') - 4, ".Wav") || !strcmp(strrchr(filename, '\0') - 4, ".wAv") || !strcmp(strrchr(filename, '\0') - 4, ".waV") || !strcmp(strrchr(filename, '\0') - 4, ".WaV") || !strcmp(strrchr(filename, '\0') - 4, ".wAV") || !strcmp(strrchr(filename, '\0') - 4, ".WAv")) //Checks to see if the last 4 characters are .wav
		{
			break;//The String ends with ".wav" 
		}
		else
		{
			printf("You did not enter a valid file path. Enter a file name ending in '.wav': ");
			scanf("%s", &filename);
		}
	}
	if (fopen(filename, "rb") == NULL) //Checks to see if the file exists
	{
		printf("\nERROR: The file does not exist in the path you entered.\n");
	}
	else
	{
		FILE *fp;
		fp = fopen(filename, "rb");

		char * chunkid;
		unsigned int chunksize; //I get an error if I make this: unsigned int * chunksize;
		char * format;
		char * subchunk1id;
		unsigned int subchunk1size; //I get an error if I make this: unsigned int * subchunk1size;
		unsigned short int * audioformat;
		unsigned short int * NumChannels;
		unsigned int * SampleRate;
		unsigned int * ByteRate;
		unsigned int * BlockAlign;
		unsigned short int * BitsPerSample;
		char * Subchunk2ID;
		unsigned int * Subchunk2Size;

		char *header = (char *)malloc(44 * sizeof(char));
		fread(header,sizeof(char),44,fp);

		chunkid = header;
		chunksize = (int)(header + 4); 
		format = header + 8;
		subchunk1id = header + 12; 
		subchunk1size = (int)(header + 16);
		audioformat = (unsigned short int *)(header + 20);
		NumChannels = (unsigned short int *)(header + 22);
		SampleRate = (unsigned int *)(header + 24);
		ByteRate = (unsigned int *)(header + 28);
		BlockAlign = (unsigned int *)(header + 32);
		BitsPerSample = (unsigned short int *)(header + 34);

		//Output:
		printf("\n%c%c%c%c\n", *chunkid, *(chunkid + 1), *(chunkid + 2), *(chunkid + 3));
		printf("\n%d\n", chunksize); //Cannot dereference this or subchunk1size. It would not work properly for me.
		printf("\n%c%c%c%c\n", *format, *(format + 1), *(format + 2), *(format + 3));
		printf("\n%c%c%c\n", *subchunk1id, *(subchunk1id + 1), *(subchunk1id + 2));
		printf("\n%d\n", subchunk1size - chunksize); // Shows a difference of 12 with chunksize ---> If i dont subtract, this shows a memory address 12 greater than chunksize
		printf("\n%d\n", *audioformat);
		printf("\n%d\n", *NumChannels);
		printf("\n%d\n", *SampleRate);
		printf("\n%d\n", *ByteRate);
		printf("\n%d\n", *BlockAlign); //Not correct output?
		printf("\n%d\n", *BitsPerSample);

		free(header);
		fclose(fp);
		system("pause");
	}
	return 0;
}

//Have a nice day!