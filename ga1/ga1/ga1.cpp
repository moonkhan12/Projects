#include <iostream>
#include <cstring>
#include <fstream>
#include <math.h>
#include "ArgumentManager.h"
#include <string>
using namespace std;

/*
	DUE: February 5 @ 9:00 PM
	Created by: Mubashar Khan, Ed Chase, Kevan Kasraei
	last edited: February 4 @ 7:45 PM
*/

int main(int argc, char *argv[])
{

	if (argc < 2)
	{
		cout << "Error: Need at least 2 arguments: an input and output text file." << endl;
		//system("pause");
		return -1;
	}


	ArgumentManager am(argc, argv);
	const string inFileName = am.get("input");
	const string outFileName = am.get("output");

	//Input
	ifstream inFile;

	inFile.open(inFileName);
	//inFile.open("input13.txt"); //test
	if (!inFile)
	{
		cout << "Error: Could not open input file" << endl;
		return -1;
	}
	
	string str = "";
	getline(inFile, str);
	inFile.close(); //End of use for input file
	float va = str.length();
	int n = str.length();

	//cout << sqrt(va) << " " << (float)ceil(sqrt(n)); //test

	//Add extra periods (.) if the string entered is not a perfect square
	while (sqrt(va) < (float)ceil(sqrt(n)))
	{
		str += ".";
		va = str.length();
		//cout << sqrt(va) << " " << ceil(sqrt(n)) << endl; //test
		//cout << str << endl; //test
	}
	
	int new_n = ceil(sqrt(n));

	char** spiral = new char*[new_n];
	for (int i = 0; i < new_n; ++i)
		spiral[i] = new char[new_n];

	//counter variables
	int count = 0; 
	int sr = 0; //starting row
	int sc = 0; //starting column
	int fr = new_n - 1; //final row
	int fc = new_n - 1; //final col



	while (count+1 <= new_n * new_n) //Does the rearranging of the input string
	{
		for (int i = sc; i <= fc; i++)
		{
			spiral[sr][i] = (char)str[count];
			count++;
		}
		for (int i = sr + 1; i <= fr; i++)
		{
			spiral[i][fc] = (char)str[count];
			count++;
		}
		for (int i = fc - 1; i >= sc; i--)
		{
			spiral[fr][i] = (char)str[count];
			count++;
		}
		for (int i = fr - 1; i >= sr + 1; i--)
		{
			spiral[i][sc] = (char)str[count];
			count++;
		}
		//Starting at the upper left hand corner and bottom right hand corner and working inwards
		sr++;
		sc++;
		fr--;
		fc--;

	}

	//Output
	ofstream outFile;
	outFile.open(outFileName);
	//outFile.open("output13.txt"); //test

	//cout << str << endl << endl;// test
	for (int i = 0; i < new_n; i++)
	{
		for (int j = 0; j < new_n; j++)
		{
			outFile << spiral[i][j];
			//cout << spiral[i][j]; //test
		}
		outFile << endl;
		//cout << endl; //test
	}
	outFile.close();
	for (int i = 0; i < new_n; i++)
	{
		delete[] spiral[i];
	}
	delete[] spiral;

	//system("pause");
	return 0;
}