/*
Project 9 Programming Applications for Electrical and Computer Engineering
Created By: Mubashar Khan, Computer Engineer at UH
ID: 1512949
Due: April 6, 2018
*/

#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
	unsigned char *header;
	header = (unsigned char*)calloc(44, sizeof(unsigned char));
	header[0] = 'R';
	header[1] = 'I';
	header[2] = 'F';
	header[3] = 'F';
	header[4] = 0;
	header[5] = 0;
	header[6] = 0;
	header[7] = 0;
	header[8] = 'W';
	header[9] = 'A';
	header[10] = 'V';
	header[11] = 'E';
	header[12] = 'f';
	header[13] = 'm';
	header[14] = 't';
	header[15] = ' ';
	header[16] = 0;
	header[17] = 0;
	header[18] = 0;
	header[19] = 0;
	header[20] = 1;
	header[21] = 0;
	header[22] = 1;
	header[23] = 0;
	header[24] = 68;
	header[25] = 172;
	header[26] = 0;
	header[27] = 0;
	header[34] = 16;
	header[35] = 0;
	header[36] = 'd';
	header[37] = 'a';
	header[38] = 't';
	header[39] = 'a';
	header[40] = 0;
	header[41] = 0;
	header[42] = 0;
	header[43] = 0;


	FILE *fout;
	fout = fopen("song.wav", "wb");
	if (fout == NULL)
	{
		printf("File could not be opened.");
		exit(1);
	}
	unsigned int totalbytes;
	totalbytes = fwrite(header,sizeof(unsigned char),44,fout);

	//Step 5: I dont know if I made a mistake here
	unsigned short int N = 44100 * (1 / 3);
	unsigned short int **arr;
	arr = (unsigned short int**)malloc(25*sizeof(unsigned short int*));
	
	for (int i = 0; i < 25; i++)
	{
		arr[i] = (unsigned short int*)malloc(N*sizeof(unsigned short int)); //*(arr + i)
	}

	
	float twopi = 6.2832,a= 32700.0, b= 44100.0;
	float Freq[25] = { 440.00,466.16,493.88,523.25,554.37,587.33,622.25,659.25,698.46,739.99,783.99,830.61,880.00,932.33,987.77,1046.50,1109.73,1174.66,1244.51,1318.51,1396.91,1479.98,1567.98,1661.22,0.0 };
	int x,y;
	for (x = 0; x < 25;x++)
	{
		for (y = 0; y < (44100 / 3);y++)
		{
			arr[x][y] = (unsigned short int)(a*sin(twopi * (y / b) * Freq[x]));
		}
	}
	
	unsigned short int song[48] = { 3,3,10,10,12,12,10,24,8,8,7,7,5,5,3,24,10,10,8,8,7,7,5,24,10,10,8,8,7,7,5,24,3,3,10,10,12,12,10,24,8,8,7,7,5,5,3,3 };
	for (int w = 0; w < 48; w++)
	{
		totalbytes += sizeof(unsigned short int)*fwrite(*(arr+song[w]), sizeof(unsigned short int), (44100 / 3), fout);
	}


	unsigned int subchunk2size = totalbytes - 44, chunksize = totalbytes - 8, subchunk1size = 16,byterate = 44100*1*16/8;
	unsigned short int blockalign = 1 * 16 / 8;

	*((unsigned int*)(header + 28)) = byterate;
	*((unsigned short int*)(header + 32)) = blockalign;
	*((unsigned int*)(header + 4)) = chunksize;
	*((unsigned int*)(header + 16)) = subchunk1size;
	*((unsigned int*)(header + 40)) = subchunk2size;

	fseek(fout, 0, SEEK_SET);
	fwrite(header, sizeof(unsigned char), 44, fout);
	
	/*
	int GT = total + 36, format_size = 16; 
	fseek(fout, 40, SEEK_SET); 
	fwrite(&total, sizeof(int), 1, fout);
	fseek(fout, 16, SEEK_SET);
	fwrite(&format_size, sizeof(int), 1, fout);
	fseek(fout, 4, SEEK_SET);
	fwrite(&GT, sizeof(int), 1, fout);
	*/

	free(header);
	fclose(fout);
	system("pause");
	return 0;
}