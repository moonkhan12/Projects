/*
Project 4 Programming Applications for Electrical and Computer Engineering
Created By: Mubashar Khan, Computer Engineer at UH
ID: 1512949
Due: February 12, 2018
*/

#define _CRT_SECURE_NO_DEPRECATE 
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>

//NOTE TO SELF:
//If for some reason you get an error with the variable 'ui', try restarting the program. --> Stack around the variable 'ui' was corrupted
//This error should only apply to an array opject

int main(void) //ENCODE and DECODE a .txt file
{
	FILE *fin, *fout;
	fin = fopen("in.txt", "r");
	fout = fopen("out.txt", "w");
	if (!fin)
	{
		printf("Error: A file named 'in.txt' does not exists in the directory\n");
	}

	char ui, nextchar;
	while (1) // using a break to cancel this loop so it will run infinetly until the right condition is met
	{
		printf("Enter the letter 'e' to ENCODE or the letter 'd' to DECODE: ");
		scanf(" %c", &ui); //only looks at the first letter of a string entered. User could type 'epodsldasfk_dwq432421' and it would accept is as ENCODE
		if (ui == 100 || ui == 101) //100 - d, 101 - e
		{
			break;
		}
	}

	//MAIN CODE SECTION
	if (ui == 101) //encode
	{
		while (fscanf(fin, "%c", &nextchar) != EOF)
		{
			switch (nextchar)
			{
				//Letters ---> 97-122 to 33-58: -64
			case 97:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 98:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 99:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 100:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 101:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 102:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 103:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 104:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 105:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 106:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 107:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 108:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 109:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 110:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 111:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 112:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 113:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 114:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 115:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 116:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 117:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 118:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 119:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 120:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 121:
				fprintf(fout, "%c", nextchar - 64);
				break;
			case 122:
				fprintf(fout, "%c", nextchar - 64);
				break;
				//Number 0-9 ---> 48-57 to 59-68: +11
			case 0: 
				fprintf(fout, "%c", nextchar + 11);
				break;
			case 1:
				fprintf(fout, "%c", nextchar + 11);
				break;
			case 2:
				fprintf(fout, "%c", nextchar + 11);
				break;
			case 3:
				fprintf(fout, "%c", nextchar + 11);
				break;
			case 4:
				fprintf(fout, "%c", nextchar + 11);
				break;
			case 5:
				fprintf(fout, "%c", nextchar + 11);
				break;
			case 6:
				fprintf(fout, "%c", nextchar + 11);
				break;
			case 7:
				fprintf(fout, "%c", nextchar + 11);
				break;
			case 8:
				fprintf(fout, "%c", nextchar + 11);
				break;
			case 9:
				fprintf(fout, "%c", nextchar + 11);
				break;
				//Space ---> 32 to 69: +37
			case 32:
				fprintf(fout, "%c", nextchar + 37);
				break;
				//Period ---> 46 to 70: +24
			case 46:
				fprintf(fout, "%c", nextchar + 24);
				break;
				//Line Feed and Carrige Return 10 to 71---> +61
			case 10: //'\n'
				fprintf(fout, "%c", nextchar + 61);
				break;
			}
		}
	}
	else if (ui == 100) //decode
	{
		while (fscanf(fin, "%c", &nextchar) != EOF)
		{
			switch (nextchar)
			{
				//Letters ---> 33-58 to 97-122: +64
			case 33:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 34:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 35:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 36:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 37:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 38:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 39:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 40:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 41:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 42:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 43:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 44:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 45:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 46:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 47:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 48:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 49:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 50:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 51:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 52:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 53:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 54:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 55:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 56:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 57:
				fprintf(fout, "%c", nextchar + 64);
				break;
			case 58:
				fprintf(fout, "%c", nextchar + 64);
				break;
				//Number 0-9 ---> 59-68 to 48-57: -11
			case 59:
				fprintf(fout, "%c", nextchar - 11);
				break;
			case 60:
				fprintf(fout, "%c", nextchar - 11);
				break;
			case 61:
				fprintf(fout, "%c", nextchar - 11);
				break;
			case 62:
				fprintf(fout, "%c", nextchar - 11);
				break;
			case 63:
				fprintf(fout, "%c", nextchar - 11);
				break;
			case 64:
				fprintf(fout, "%c", nextchar - 11);
				break;
			case 65:
				fprintf(fout, "%c", nextchar - 11);
				break;
			case 66:
				fprintf(fout, "%c", nextchar - 11);
				break;
			case 67:
				fprintf(fout, "%c", nextchar - 11);
				break;
			case 68:
				fprintf(fout, "%c", nextchar - 11);
				break;
				//Space ---> 69 to 32: -37
			case 69:
				fprintf(fout, "%c", nextchar - 37);
				break;
				//Period ---> 70 to 46: -24
			case 70:
				fprintf(fout, "%c", nextchar - 24);
				break;
				//Line Feed and Carrige Return ---> -61
			case 71:
				fprintf(fout, "%c", nextchar - 61);
				break;
			}
		}
	}
	fclose(fin);
	fclose(fout);
	return 0;
}