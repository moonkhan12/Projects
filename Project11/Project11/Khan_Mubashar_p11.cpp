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

//Step 6:
void read_bmpheader(FILE *image, struct Bitmapfileheader *bmph);

int main(void)
{
	//Step 1:
	struct Bitmapfileheader 
	{
		char v[2];
		unsigned int filesize;
		unsigned int reserved;
		unsigned int offset;
	};

	struct Bitmapinfoheader
	{
		unsigned int size;
		unsigned int width;
		unsigned int height;
		unsigned short int planes;
		unsigned short int bitcount;
		unsigned int compression;
		unsigned int imagedatasize;
		unsigned int pixelspermeterx;
		unsigned int pixelspermetery;
		unsigned int colors_used;
		unsigned int colors_important;
	};
	//Step 2:
	struct Bitmapheader
	{
		struct Bitmapfileheader fileheader;
		struct Bitmapinfoheader infoheader;
	};
	//Step 3:
	struct Bitmapheader bmph1, bmph2, bmph3;
	//Step 4: My instuctions has step 4 on there twice
	printf("size of Bitmapheader = %d\n", sizeof(bmph1)); //56
	//Step 4:
	FILE *ptimage1, *ptimage2;
	ptimage1 = fopen("image1_393x257.bmp", "rb");
	ptimage2 = fopen("image2_393x257.bmp", "rb");
	//Step 5:
	if (ptimage1 == NULL)
	{
		perror("Error opening image1_393x257.bmp");
		exit(1);
	}
	if (ptimage2 == NULL)
	{
		perror("Error opening image2_393x257.bmp");
		exit(1);
	}
	//Step 7:
	//read_bmpheader(ptimage1, bmph1);
	//read_bmpheader(ptimage2, bmph2);
	
	//Step 8:

	//Step 9:
	//(unsigned char *)malloc(sizeof(infoheader.imagedatasize) * sizeof(unsigned char));
	//int imagedata;
	//printf("Creating a 1-D array with %d bytes\n", imagedata);


	//Step 10:
	float sf;
	printf("Enter a floating point scale facter between 0.0 and 1.0 not including 0.0 and 1.0: ");
	scanf("%f", &sf);

	//Step 11:
	FILE *ptimage3;
	ptimage3 = fopen("image3_393x257.bmp", "wb");
	for (int r = 0;r < 24;r++)
	{
		for (int g = 0;g < 24;g++)
		{
			for (int b = 0; b<24;b++)
			ptimage3 = sf * ptimage1[r][g][b] + (1.0 - sf)*ptimage2[r][g][b];
		}
	}

	system("pause");
	return 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Step 6:
void read_bmpheader(FILE *image, struct Bitmapfileheader *bmph)
{
	fread(&bmph, 14, 1, image); //fread(&(bmph->fileheader),14,1,image);
	fread(&bmph, 40, 1, image); //fread(&(bmph->fileheader),40,1,image);
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////