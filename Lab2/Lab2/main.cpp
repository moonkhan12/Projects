#include <iostream>
#include <iomanip>
#include <stdlib.h>
using namespace std;

int main(void)
{
	int A[10], B[10], seedVal, sumA = 0, sumB = 0, i;
	double avgA, avgB;
	cin >> seedVal;
	srand(seedVal);

	for (i = 0; i < 10; i++)
	{
		A[i] = rand() % 101;
		B[i] = rand() % 101;
	}
	for (i = 0; i < 10; i++)
	{
		sumA = sumA + A[i];
		sumB = sumB + B[i];
	}
	avgA = sumA / 10.0;
	avgB = sumB / 10.0;
	
	cout << fixed;
	cout << setprecision(2) << "Class A average is: " << avgA << endl;
	cout << setprecision(2) << "Class B average is: " << avgB << endl;
	if (avgA > avgB)
		cout << "Class A wins!";
	else
		cout << "Class B wins!";

	return 0;
}
