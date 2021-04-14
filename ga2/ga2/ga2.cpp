#include <iostream>
#include <fstream>
#include <algorithm>
#include "ArgumentManager.h"
#include <string>
#include <cstring>
using namespace std;
//#include <time.h> //test line
#include <sstream>
#include <queue> 

void func(int * arr_2, int value, int pos, int max_size, int * remov_arr);

//Due: January 31, 2019 @ 10:00 AM
//Final Edit: February 1, 2019 @ 8:00AM
/*

*/

void showq(queue <int> gq)
{
	queue <int> g = gq;
	while (!g.empty())
	{
		cout << g.front() << " ";
		g.pop();
	}
	cout << '\n';
}


int main(int argc, char *argv[])
{
	//clock_t tStart = clock(); //testline

	/*
	ArgumentManager am(argc, argv);
	const string inFileName = am.get("input");
	const string outFileName = am.get("output");
	*/

	//input
	ifstream inFile;
	inFile.open("input1.txt"); //test 
	//inFile.open(inFileName);

	string readint;
	int *arr1 = new int[100]; //Stores base job lengths
	int count1 = 0; //array length
	while (!inFile.eof())
	{
		inFile >> readint; //adds each int into line matrix1. ignores whitespaces and newlines
		stringstream strtoInt(readint); //create an object of type stringstream -> converts from string to int.
		strtoInt >> arr1[count1];
		count1++;
	}
	
	inFile.close(); //End of use for input file

	//Do Stuff....
	queue <int> jobs; //creates a queue called jobs
	for (int j = 0; j < count1; j++) 
		jobs.push(arr1[j]); //fills the with values from the input file
	

	
	int *wait_time_arr = new int[count1]; // arr to store wait times
	for (int i = 0; i < count1; i++)
		wait_time_arr[i] = 0; //fill array with 0's


	int * removed_array = new int[count1]; //keeps track of which numbers in queue have been removed
	for (int e = 0; e < count1; e++)
		removed_array[e] = 0; //fill array with 0's

	int count2 = 0;
	int wait_time = 0;
	int gen_a = 0;
	int baseSize = jobs.size();

	while(jobs.front() != 0)
	{
		cout << endl;
		showq(jobs); //test
		//system("pause");
		

		if (jobs.front() >= 2)
		{
			jobs.front() = jobs.front() - 2;
			wait_time = 2;
			if (jobs.front() == 0)
			{
				jobs.pop();
				removed_array[count2] = 1;
				gen_a = 1;
			}
			
		}
		else if (jobs.front() == 1)
		{
			jobs.front() = jobs.front() - 1;
			wait_time = 1;
			if (jobs.front() == 0)
			{
				jobs.pop();
				removed_array[count2] = 1;
				gen_a = 1;
			}
			
		}

		func(wait_time_arr, wait_time, count2, baseSize, removed_array);
		cout << "Count: " <<count2 << endl;
		count2++;

		if (jobs.size() == 0 || jobs.size() == 1) // once the queue is empty, program will move on to output
			break;
			
		for (int r = 0; r < baseSize; r++)
		{
			cout << wait_time_arr[r] << endl;
		}
		
		
		//system("pause");
	
		jobs.push(jobs.front()); //add first element in queue to the back of the queue
		jobs.pop(); // remove the first element
		if (gen_a == 0)
		{
			
		}
		gen_a = 0;


		if (count2 == baseSize)
			count2 = 0;
		
	
	}
	for (int i = 0; i < 5; i++)
		cout << removed_array[i] << endl;
	//Output
	ofstream outFile;
	//outFile.open(outFileName);
	outFile.open("output1.txt"); //test
	for (int k = 0; k < count1; k++)
	{
		outFile << "Job " << k + 1 << ", burst time: " << arr1[k] << ", waiting time: " << wait_time_arr[k] << endl;
		cout << "Job " << k + 1 << ", burst time: " << arr1[k] << ", waiting time: " << wait_time_arr[k] << endl; //test
	}

	outFile.close();

	system("pause"); // test
	return 0;
}


void func(int * arr_2, int value, int pos, int max_size, int * remov_arr)
{
	for (int w = 0; w < max_size; w++)
	{
		if (w == pos || remov_arr[w] == 1) 
			continue;
		else
			arr_2[w] += value;
	}
}