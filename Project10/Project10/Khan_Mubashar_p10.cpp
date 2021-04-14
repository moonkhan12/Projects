/*
Project 10 Programming Applications for Electrical and Computer Engineering
Created By: Mubashar Khan, Computer Engineer at UH
ID: 1512949
Due: April 22, 2018
*/

#define _CRT_SECURE_NO_DEPRECATE 
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Test Location:  C:/Users/moon7/Downloads/ts9_mono.wav

int main()
{
	struct HEADER { //This is what <wav.h> looks like
		char riff[4];                      // RIFF string
		unsigned int overall_size;                  // overall size of file in bytes
		unsigned char wave[4];                      // WAVE string
		unsigned char fmt_chunk_marker[4];          // fmt string with trailing null char
		unsigned int length_of_fmt;                 // length of the format data
		unsigned int format_type;                   // format type. 1-PCM, 3- IEEE float, 6 - 8bit A law, 7 - 8bit mu law
		unsigned int channels;                      // no.of channels
		unsigned int sample_rate;                   // sampling rate (blocks per second)
		unsigned int byterate;                      // SampleRate * NumChannels * BitsPerSample/8
		unsigned int block_align;                   // NumChannels * BitsPerSample/8
		unsigned int bits_per_sample;               // bits per sample, 8- 8bits, 16- 16 bits etc
		unsigned char data_chunk_header[4];         // DATA string or FLLR string
		unsigned int data_size;                     // NumSamples * NumChannels * BitsPerSample/8 - size of the next chunk that will be read
	} header;

	//STEP 1:
	char filepath[150];
	while (1)
	{
		printf("Enter a valid path name to your file. A valid path name may look like: C:/User/music/thisone.wav\n");
		printf("Enter the path file location of your mono wav file: ");
		scanf("%s", &filepath);
		if (!strcmp(strrchr(filepath, '\0') - 4, ".wav")) //Checks to see if the last 4 characters are .wav
		{
			if (fopen(filepath, "rb") == NULL) //Checks to see if the file exists
			{
				printf("\nERROR: The file does not exist in the path you entered.\n\n");
			}
			else
			{
				FILE* ptfin;
				ptfin = fopen(filepath, "rb");
				fread(&header.riff, sizeof(header.riff), 1, ptfin);
				printf("(1-4): %s \n", header.riff);

				if (header.riff[0] == 'R' || header.riff[1] == 'I' || header.riff[2] == 'F' || header.riff[3] == 'F')
				{
					break;//The String ends with ".wav" and the
				}
				else
				{
					printf("The file you entered is not a valid .wav file.\nEnter a valid wav file: ");
					scanf("%s", &filepath);
				}
				fclose(ptfin);
			}
		}
		else
		{
			printf("You did not enter a valid file name. Enter a file name ending in '.wav': ");
			scanf("%s", &filepath);
		}
	}

	system("pause");
	return 0;
}

