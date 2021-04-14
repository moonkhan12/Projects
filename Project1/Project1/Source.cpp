/*/*#include <stdio.h>
main()
{
char big_A = 'A';
char s[] = "look";
int sevens = 7777777;
double pi = 3.14159265;
printf("\n%d", big_A);    //65
printf("\n%c", 61); //=
printf("\n%x", sevens);   //76adf1
printf("\n%c", big_A);    //A
printf("\n%5c", big_A);      // A
printf("\n%-5c", big_A);  //A
printf("\n%10s", s);            //look
printf("\n%-10s", s);   //look
printf("\n%f", pi);       //3.141593
printf("\n%5.3f", pi);    //3.142
printf("\n%.15f", pi);    //3.141592650000000
printf("\n%-15.3f", pi);  //3.142
printf("\n%15.3f", pi);            // 3.142
}
// count the total number of bytes (characters) in a file
/* Factorial of a number */
/*
#include<stdio.h>

int main()
{
int fact = 1, num, i;

printf("Enter the number:\n");
//scanf("%d", &num);

for (i = 1;i <= num;i++)
{
fact = fact * i;

}

printf("\nFactorial of %d is : %d\n\n", num, fact);

return 0;

}
*/
/*
// distance example
#include <stdio.h>
main()
{
int distance, rate, time;
rate = 14;
printf("Enter next time: ");
scanf_s("%d", &time);

while (time > 0) {
distance = rate * time;
printf("Time = %d hours\n", time);
printf("Distance=%d kilometers\n\n",
distance);
printf("Enter next time: ");
scanf_s("%d", &time);
}
printf("*** END OF PROGRAM ***\n");
}
*/

// INCLUDE A NOTE WHEN USING scanf_s JUST IN CASE LETTING THE GRADER KNOW 

// Notes Tuesday January 23 
/*
//header file
#include <stdio.h> // stdio stands for (standard input and output)
#include <stdlib.h>// stdlib stands for (standard library)
#include <time.h>  // time

int main()
{
int time;
printf("Test\n");
printf("\tThis is a tab\n");
scanf_s("%d", &time);  //use scanf_s to use the user input function.
// "%d" tells scan that it will read an integer
// "%f" tells scan that it will read a float number type
// "%s" tells scan that it will read a string

system("pause"); //Keeps the dos window open
return 0;


}
*/

/*
define a file pointer int *fin, or *fout
This will look like:
FILE *fin, *fout;
fin = fopen("c:in.dat","r"); The file must be in the same folder
open file for writefile need not currently exist:
fout = fopen("outfile.dat","w");

use fprintf sprintf to out put things from a file.

*/

/*
#include <stdio.h>
#include <stdlib.h>


main()
{
FILE *data;
data = fopen("numbers.dat","w");
//x = 1;
fprintf(data, "%d\n", 1); //same as fprintf(data, "%d\n", 1);
fprintf(data, "%d\n", 2);
fprintf(data, "%d\n", 3);
fprintf(data, "%d\n", 4);
fclose(data);
system("pause");
}

*/
/*
//Microsoft has deprecated lots of calls which use buffers to improve code security
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING   //Feel free to remove them if they are preventing the program from working correctly
#include <stdio.h>
#include <stdlib.h>

main()
{
FILE *fpin;
int x, ireturn;
fpin = fopen("numbers.dat", "r");
ireturn = fscanf(fpin, "%d", &x);
printf("value returned by fscanf = %d\n", ireturn);
printf("First Value Read: %d\n", x);
ireturn = fscanf(fpin, "%d", &x);
printf("value returned by fscanf = %d\n", ireturn);
printf("First Value Read: %d\n", x);
ireturn = fscanf(fpin, "%d", &x);
printf("value returned by fscanf = %d\n", ireturn);
printf("First Value Read: %d\n", x);
ireturn = fscanf(fpin, "%d", &x);
printf("value returned by fscanf = %d\n", ireturn);
printf("First Value Read: %d\n", x);
ireturn = fscanf(fpin, "%d", &x);
printf("value returned by fscanf = %d\n", ireturn); //This will return a -1 which means that there is no 5th value in numbers.dat
printf("First Value Read: %d\n", x); //just prints out the value stored in x, which in this case was 4
fclose(fpin);
system("pause");
}
*/
//Loop

/*
//Microsoft has deprecated lots of calls which use buffers to improve code security
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING   //Feel free to remove them if they are preventing the program from working correctly; 
								 //I'm not sure how they impact other IDE's

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int x, i, back, len;
	FILE *fin;
	fin = fopen("in.txt", "r");
	i = 0;
	fseek(fin, 0L, SEEK_END); // seek to end of file
	len = ftell(fin);    //get current file pointer
	fseek(fin, 0, SEEK_SET); // seek back to beginning of file
	printf("Integers:\n");
	while (i < len)
	{
		back = fscanf(fin, "%d", &x);
		if (back != EOF)
		{
			i = i + 1;
			printf("\t %d\n", x);
		}
	
	}
	printf("There are %d integers in this file: \n", sizeof(fin));
	fclose(fin);
	system("pause");
}


//#include <math.h> //used for math based functions

//#pragma warning(disable:4430) used to disable error C4430 or put int in front of main()

*/

// Check Project 1 for a working file reading and user input

//January 30, 2018

/*
//Char c takes only 1 byte of storage
//char c;
//c = 'x';


#include <stdio.h>

int main(void)
{
	char d;
	d = 'x';
	printf("The character is: %c\n",d);
}

\n counts as 2 bytes

*/

//February 1, 2018

/*
\n (newline)
\t (tab)
\v (vertical tab)
\f (new page)
\b (backspace)
\r (carriage return)
\n (newline)

The printf(“:%s:\n”, “Hello, world!”); statement prints the string (nothing special happens.)
The printf(“:%15s:\n”, “Hello, world!”); statement prints the string, but print 15 characters. If the string is smaller the “empty” positions will be filled with “whitespace.”
The printf(“:%.10s:\n”, “Hello, world!”); statement prints the string, but print only 10 characters of the string.
The printf(“:%-10s:\n”, “Hello, world!”); statement prints the string, but prints at least 10 characters. If the string is smaller “whitespace” is added at the end. (See next example.)
The printf(“:%-15s:\n”, “Hello, world!”); statement prints the string, but prints at least 15 characters. The string in this case is shorter than the defined 15 character, thus “whitespace” is added at the end (defined by the minus sign.)
The printf(“:%.15s:\n”, “Hello, world!”); statement prints the string, but print only 15 characters of the string. In this case the string is shorter than 15, thus the whole string is printed.
The printf(“:%15.10s:\n”, “Hello, world!”); statement prints the string, but print 15 characters.
If the string is smaller the “empty” positions will be filled with “whitespace.” But it will only print a maximum of 10 characters, thus only part of new string (old string plus the whitespace positions) is printed.
The printf(“:%-15.10s:\n”, “Hello, world!”); statement prints the string, but it does the exact same thing as the previous statement, accept the “whitespace” is added at the end.

*/
/*
#include <stdio.h>
#include <stdlib.h>
int main(void)
{
	//Right justified:
	int width = 5;
	//Pyramid:
	printf("%*s\n", width, "a");
	printf("%*s\n", 6, "aaa");
	printf("%*s\n", 7, "aaaaa");
	printf("%*s\n", 8, "aaaaaaa");
	printf("%*s\n", 9, "aaaaaaaaa");
	printf("%*c\n", width, 'a');
	printf("%*d\n", width, 25);
	printf("%*f\n", width, 2.206);

	printf("%-s\n", 6, "aaa"); // the - means left justified
	return 0;
}
*/
/*
int y, x;
float z;
printf();
z = x / y;
printf();
z = (float)x / y;
printf();

*/


// February 6, 2018
/*
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define _GNU_SOURCE

int main(void)
{
	bool z = 0;
	int x = -1;
	int u = -4;
	if (!!x == x) // only 0 is evaluated as false
	{
		printf("True\n");
	}
	else
	{
		printf("False\n");
	}
	//true is a keyword to show non 0 for a logical statement
	// if(true)
	// {
		// statement
	// }

	/*
	for loop

	for(exp1;exp2;exp3)
	{
		actions;
	}

	

	for (x = 1; x < 6; x++) //x += 1 is the same as x++
	{
		printf("%d\n", x);
	}
	//++i vs i++
	//with post increment it increases the value after the logical operator determines if a variable is true or false
	x = -1;
	if (++x)
	{
		printf("true %d\n",x);
	}
	else
	{
		printf("false %d\n", x);
	}
	//vs:
	x = -1;
	if (x++)
	{
		printf("true %d\n", x);
	}
	else
	{
		printf("false %d\n", x);
	}
	// there is a --i too it acts just like ++i or i++

	//printf("%d", m_pi);

}
*/
/*
#include <stdio.h>
#include <stdlib.h>

int main(void)
{

	float y = 58.209, x = 4.3, z;
	int i = 3, j= 5;
	//z = y / x;
	z = x / i;
	i += j;
	printf("%d\n",4%6);
	
	
	return 0;

}


*/

//February 8, 2018
/*
#include <stdio.h>
#include <stdlib.h>



int main(void)
{
	printf("Test Complete\n");
	exit(0); //will not execute the remaining code doesnt matter what number you put in exit()
	// crtl + z will also end a program in the dos window
	printf("test ---030e20udjo 8ohfiskjdfjssj j dusdf skjdfh slk hao993 e\n");
	return 0;
}
*/

// break lets you jump out of a loop if you want to skip certain conditions:

/*
//Program to see if a number is odd or even
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(void)
{
	int i, j;
	for (i = 1; i <= 5; i++)
	{
		for (j = 1; j <= 5; j++)
		{
			if (i == 1 && j == 2)
			{
				printf("--------------------------------------------------------\n");
				break;
			}
			printf("i = %d\tj = %d\n", i, j);
		}
	}
	printf("\n\n\n");
	for (i = 1; i <= 5; i++)
	{
		for (j = 1; j <= 5; j++)
		{
			if (j == 2)
			{
				printf("--------------------------------------------------------\n");
				continue; //only skips this one iteration of the loop
			}
			printf("i = %d\tj = %d\n", i, j);
		}
	}
	
	// pick a number between 0 and 3
	int ge = 1;
	switch (ge)
	{
	case 1:
		printf("Test Complete 1\n");
	case 2:
		printf("Test Complete 2\n");
	case 3:
	{
		printf("Test Complete 3\n");
		break;
	}
	case 4:
		printf("Test Complete 3\n");
	}

	//goto statement
	//check the book

	return 0;
}
*/

/*
//February 13, 2018
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	/*
	z = flag ? y : z
	same as:
	if(flag)
		x = y;
	else
		x = z;


	//review bitwise operators
	//shift to the left << will always introduce 0's where as a right shift >> depends on the first number on the left
	// every variable in a sub-routine or function
	//char c = 1, ui;
	char prev = 0;

	while (1)
	{
		char c = getchar();

		if (c == '\n' && prev == c)
		{

			break;
		}

		prev = c;
	} 
	
	while (c != EOF)
	{
		printf("Enter a letter: ");
		ui = scanf(" %c", &c);
		if (c == 13)
			printf("\\n");
		else if (c == 9)
			printf("\\t");
		else
			printf("%c\n", c);
	}
	system("pause");
	return 0;
}

*/


// February 15, 2018

// create a function to get user instructions, check if user entered e or d, printf the encoded characters to the file

/*
#include <stdio.h>
#include <stdlib.h>

void instructions(void); //Function declaration 
int check(char a);

int main()
{
	char ui, en_de;
	instructions();
	scanf("%c", &en_de);
	return 0;
}
void instructions(void)
{
	printf("Enter the letter 'e' to ENCODE or the letter 'd' to DECODE: ");
}
int check(char a)
{
	int ireturn;
	if (1)
	{
		return 1;
	}
	else 
		return 0;
}

*/
/*
//Function Examples:

#include <stdio.h>

int power(double x, int n);
int main()
{
	double x = 2;
	int n = 3, ui;
	ui = power(x, n);
	printf("%d",ui);
	return 0;
}

int power(double x, int n)
{
	double pow = 1.0;
	while (n)
	{
		if (n)
			pow *= x;
		x *= x;
		n >>= 1;
	}
	return pow;
}
*/

/*
#include <stdio.h>
#include <math.h>

int sqrt(int x);

int main()
{
	double i;
	int x = 4;
	i = sqrt(x);
	printf("%f\n", i);
	return 0;
}

int sqrt(int x)
{
	double r = 1.0;
	while (fabs(pow(r, 2) - x) > 0.0001)
	{
		r = 0.5*((x / r) + r);
	}
	return r;
}
*/
/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>

int add(int, int);
int subtract(int, int);
int multiply(int, int);
int divide(int, int);
int print_result(int);


int main()
{
	int arg1, arg2;
	char option;
	printf("Enter an integer number: ");
	scanf("%d", &arg1);
	printf("Enter a second integer number: ");
	scanf("%d", &arg2);
	printf("Enter the letter 'a' to add, 's' to subtract, 'm' to multiply, or 'd' to divide: ");
	scanf(" %c", &option);
	switch (option)
	{
	case 'a':
		add(arg1, arg2);
		break;
	case 's':
		subtract(arg1, arg2);
		break;
	case 'm':
		multiply(arg1, arg2);
		break;
	case 'd':
		divide(arg1, arg2);
		break;
	}
	return 0;
}

int add(int arg1, int arg2)
{
	int total;
	total = arg1 + arg2;
	print_result(total);
	return 0;
}
int subtract(int arg1, int arg2)
{
	int total;
	total = arg1 - arg2;
	print_result(total);
	return 0;
}
int multiply(int arg1, int arg2)
{
	int total;
	total = arg1 * arg2;
	print_result(total);
	return 0;
}
int divide(int arg1, int arg2)
{
	int total;
	total = arg1 / arg2;
	print_result(total);
	return 0;
}
int print_result(int total)
{
	printf("%d\n",total);
	return 0;
}
*/
//February 27
/*

*/
/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>

void func(int a[], int m);

int main()
{
	//arrays ---> you know how to do this
	int	b[3] = { 0,0 };
	int n = 0;
	printf("%d %d %d\n", b[0], b[1], n);
	func(b, n);
	printf("%d %d %d\n", b[0], b[1], n);
	return 0;
}

void func(int a[], int m)
{
	a[0] += 1;
	m += 1;
}

*/

// int a[column] 1D array
// int a[row][column] 2D array
// int a[2][3] = {{2,4,6},{-9,-7,-5}}
// int b[row][column][depth] 3D array
// Can not use a variable to define a dimmension in an array
// USE definition
// #define variable amount
// #define MATRIX 25
// #define text (Hi i am bob)

/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING
//Macro Example:

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
	char c;
	FILE *fin;
	fin = fopen("C:/Users/moon7/Documents/file.txt", "r");
	if (fin == NULL)
		printf("Error: file not found\n");
	else
	{
		printf("Enter a 2 character sequence from the keyboard: ");
		scanf("%s", &c);

	}

	system("pause");
	return EXIT_SUCCESS;
}
*/

/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

// C program for implementation of Bubble sort
#include <stdio.h>

void swap(int *xp, int *yp)
{
	int temp = *xp;
	*xp = *yp;
	*yp = temp;
}

// A function to implement bubble sort
void bubbleSort(int arr[], int n)
{
	int i, j;
	for (i = 0; i < n - 1; i++)

		// Last i elements are already in place   
		for (j = 0; j < n - i - 1; j++)
			if (arr[j] > arr[j + 1])
				swap(&arr[j], &arr[j + 1]);
}

// Function to print an array 
void printArray(int arr[], int size)
{
	int i;
	for (i = 0; i < size; i++)
		printf("%d ", arr[i]);
	printf("\n");
}

// Driver program to test above functions
int main()
{
	int arr[] = { 64, 34, 25, 12, 22, 11, 90 };
	int n = sizeof(arr) / sizeof(arr[0]);
	printf("Original Array: \n");
	printArray(arr, n);
	bubbleSort(arr, n);
	printf("Sorted array: \n");
	printArray(arr, n);
	return 0;
}

*/

/////
/*
file *fp
unsigned int chunksize,sc1_size, sc2_size;
char name[5];
int chunksize;
name[4] = '\0';
wave[4] = '\0';
fp = fopen("D:/ap.wav", "rb");
fread(name, sizeof(char), 4, fp);
printf("Chuck name %s\n,name);
fseek(fb, 4, SEEK_SET);
freed(&chunksize, sizeof(int), 1, fp);

printf("Number of bytes in chunk %s = %d\n",name,chunk)
*/

/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE* ptr;
	char stock[61];
	int i, count;
	ptr = fopen("data.dat", "r");
	while (fgets(stock, 61, ptr) != NULL)
	{
		printf("\n%s", stock);
	}
	fclose(ptr);
	printf("E");
	scanf("%d", &count);
	ptr = fopen("data.dat", "w");
	for (i = 0;i<count;++i)
	{
		gets_s(stock);
		fputs(stock, ptr);
	}
	fclose(ptr);
	system("pause");
	return 0;
}
*/
/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

//char* ceck_fp(char*);

int main() {
	printf("hello workd\n");
	FILE *fp;
	int n = 44;
	char b20[2] = { 1,0 }, b22[2] = { 1,0 }, b24[4] = { 68,172,0,0 }, b28[4] = { 136,88,1,0 }, b32[2] = { 2,0 }, b34[2] = { 16,0 }; //I computed all of the little endian values and defined their arrays here.
	char *header;
	float _2pi = 6.2832, freq_hz = 700, freq_rad = freq_hz * _2pi;
	printf("hello workd\n");
	float freq[24] = { 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25,
		659.25, 698.46, 739.99, 783.99, 830.61, 880.0, 932.33,987.77, 1046.50,
		1109.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22 };

	header = (char*)calloc(n, sizeof(char)); //step 1: define header & calloc space for it
	printf("hello workd\n");
	//step 2: Input headder values byte by byte
	strncpy(header, "RIFF", 4);
	strncpy(header + 8, "WAVE", 4); //bytes 4 thru 7 initialted to 0 by callloc
	strncpy((header + 12), "fmt ", 4);
	//strncpy((header + 16),,4); //bytes 16 thru 19 initialted to 0 by callloc
	strncpy((header + 20), (char*)b20, 2); //bytes 20 - 21 
	strncpy((header + 22), (char*)b22, 2); //bytes 22 - 23                            	
	strncpy((header + 24), (char*)b24, (char)4);  //bytes 24 - 27
	strncpy((header + 28), (char*)b28, 4); //bytes 28-31 
	strncpy((header + 32), (char*)b32, 2); //bytes 32 - 33
	strncpy((header + 34), (char*)b34, 2); //bytes 34 - 35
	strncpy((header + 36), "data", 4); // bytes 36 - 39
									   //bytes 40 thru 43 initialted to 0 by callloc.

	fp = fopen("song.wav", "wb");
	printf("hello workd\n");
	while (1) {
		if (fp == NULL) { //step3: check if file is null
			printf("ERROR!!! filename doesn't exist");
			exit(1);
		}

		else { //step 4: write the .wav header into the file
			fwrite(header, sizeof(char), 44, fp);
			goto STEP5;
		}
	}//END while

	 //step 5: malloc 2-D array
STEP5:  int j, m = 25, samplerate = 44100;
	short int **malloc_array, sample;

	malloc_array = (short int**)malloc(sizeof(short int*) * m);
	for (j = 0; j<m; j++) {
		*(malloc_array + j) = (short int *)malloc(2 * (samplerate / (3)));
	}//END for

	 //step 6:
	int NoteNum, t, num;

	for (NoteNum = 0; NoteNum<m; NoteNum++) {
		for (t = 0; t<44100 / 3; t++) {
			sample = (short int)(32767.0*sin(freq[NoteNum] * 2 * 3.14159*t / samplerate));
			malloc_array[NoteNum][t] = sample;
		}//END nested for loop
	} //End outer for

	  //step7 & 8
	unsigned short int song[48] =
	{ 3,3,10,10,12,12,10,24,8,8,7,7,5,5,3,24,10,10,8,8,7,7,5,24,
		10,10,8,8,7,7,5,24,3,3,10,10,12,12,10,24,8,8,7,7,5,5,3,3 };

	unsigned short int Storage_of_note;

	int sum = 0, NoteNum1;
	for (NoteNum1 = 0; NoteNum1<48; NoteNum1++) {
		Storage_of_note = song[NoteNum1];
		fwrite(malloc_array[Storage_of_note], (sizeof(short int)), (44100 / 3), fp);
		sum += 2 * 44100 / 3;
	}
	printf("%d\n", sum);

	//step10: fseek
	int BIGsum = sum + 36, format_size = 16;
	fseek(fp, 40, SEEK_SET); //subchunck2 info
	fwrite(&sum, sizeof(int), 1, fp);
	fseek(fp, 16, SEEK_SET);
	fwrite(&format_size, sizeof(int), 1, fp);
	fseek(fp, 4, SEEK_SET);
	fwrite(&BIGsum, sizeof(int), 1, fp);


	//step 11

	fclose(fp);
	free(malloc_array);
} //END MAIN


  //BlockAllign = (#channals * bits_per_sample)/8
  //Byterate = (sample_size * bits_per_sample * #channals)/8


*/

/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	int n, ns[5];
	float r, ts[4];
	struct element //Struct is used to create new data types that can have varying fields (i.e. members)
	{
		char name[10];
		char symbol[5];
		float atomicweight;
		float mass;
	};
	struct element el, es[3];
	strcpy(el.name, "hydrogen");
	strcpy(el.symbol, "H");
	el.atomicweight = 1.0;
	el.mass = 3.0;
	
	/*
	struct element el = {"hydrogen","H",1.0,3.0}; //Does the same as the above 5 lines
	struct element es[3];
	es[0] = el;
	es[1] = (struct element){"hydrogen","H",1.0,3.0};
	*
	system("pasue");
	return 0;
}
*/
/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int mean(int arr[],int n);

int main(void)
{
	FILE *fp;
	fp = fopen("File.txt", "r");
	int arr[100],  avg;
	for (int i = 0; i < 100; i++)
	{
		fscanf(fp, "%d", &arr[i]);
	}
	int n = sizeof(arr) / sizeof(arr[0]);
	avg = mean(arr, n);
	printf("\n%d\n", avg);
	system("pause");
	return 0;
}

int mean(int arr[], int n)
{
	int sum = 0;
	for (int j = 0; j < n; j++)
	{
		sum += arr[j];
		printf("%d\n", sum);
	}
	return sum/n;
}
*/
/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <ctype.h>

int main()
{
	char c1 = 'c';
	char c2 = 'Z';
	int num1 = 111, num2 = 55;
	putchar(toupper(c1));
	putchar(tolower(c2));
	if (ispunct(']'))
		printf("\n] ispunt\n");
	if (isalnum(num2))
		printf("\n%c isalnum\n", num2);
	return EXIT_SUCCESS;
}
*/
/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>

int main()
{
	int letter;
	FILE* fp;
	fp = fopen("data.dat","rb");
	fseek(fp, 5, SEEK_SET);
	letter = fgetc(fp);
	printf("%c\n", letter);
	fseek(fp, 15, SEEK_CUR);
	letter = fgetc(fp);
	printf("%c\n", letter);
	fseek(fp, 0, SEEK_END);
	if ((letter = fgetc(fp)) == EOF)
		printf("EOF\n");
	else
		printf("c\n", letter);
	fseek(fp, -5, SEEK_END);
	letter = fgetc(fp);
	printf("%c\n", letter);
	return EXIT_SUCCESS;
}
*/
/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>

int main()
{
	int x = 1;
	printf("Address \t Name \t Value\n");
	printf("%d \t %s \t %d\n", &x, "x" , x ); //Address, variable name, value

	int * ptx = &x;
	printf("%d \t %s \t %d\n", ptx, "x", x); //Address, variable name, value

	//derefrence a pointer
	printf("\n*ptx: %d\n", *ptx);
	

	system("pause");
	return 0;
}
*/

/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>

int main() //Page 499 Problem 24
{
	struct disc {
		char compose[30];
		char work[30];
		long id;
		float price;
	} cd;
	//scanf("%29c%29c%61d%6.2f ", cd.compose, cd.work, &cd.id, &cd.price);
	//Ives, Charles                 Three Places in New England  302932 12.95
	//scanf("%29s%29s%61d%6f ", cd.compose, cd.work, &cd.id, &cd.price);
	fgets(cd.compose, 29, stdin);
	fgets(cd.work, 29, stdin);
	scanf("%61d%6f ", &cd.id, &cd.price);
	return 0;
}
*/

/*
4 byte unsigned int
/ vs \\ in file paths
little endian vs big endian
{
	unsigned int ui = 587;
	printf("ui stored at %u\n",(unsiged int)&ui); // for some reason you need to do an explicit cast
}

newline and character feed charige return 13 line feed 10

sscanf ----> String reading and writing
string commands
multidimentional arrays
pointers
macros
relation between arrays and pointers
storage class
vecter of structures


*/

/*
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>

int main()
{
	unsigned int i;
	char str[100];
	//printf("Enter a string: ");
	//i = scanf("%[abcdefg]", &str);
	//printf("%s\n", str);
	//printf("\n%d\n", i);
	for (int x = 0; x < 10; x++)
	{
		for (int y = 0; y < 10;y++)
		{
			printf("x = %d, y = %d\n", x, y);
			if (x == 8)
			{
				break;
			}
		}
		printf("X loop %d", x + 1);
	}
	return 0;
}

*/
#define _CRT_SECURE_NO_DEPRECATE //These 2 lines are nessesary for my code to work on MICROSOFT VISUAL STUDIO 2017
#define _CRT_SECURE_NO_WARNING

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int fun()
{
	int count = 0;
	count++;
	return count;
}

int main()
{
	printf("%d ", fun());
	printf("%d ", fun());
	return 0;
}