#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace std;
/*
#include <iostream>
using namespace std;

int main(void)
{
	int var1;
	const double PI = 3.1415;
	cout << "What is your name? ";
	cin >> var1;
	cout << "Hello" << var1 << "\n";
	int x = 1;
	if (x == 1)
	{
		cout << "HI" << endl;
	}
	system("pause");
	return 0;
}
*/
/*
#include <iostream>
using namespace std;
#include <cmath>

int main()
{
	double weight, radius, bf, volume;
	const double PI = 3.14, SG = 62.4;
	cin >> weight;
	cin >> radius;
	volume = (4 / 3)*PI*pow(radius, 3);
	bf = volume * SG;
	if (bf >= weight)
	{
		cout << "The sphere will float in water";
	}
	else
		cout << "The sphere will sink in water";
	return 0;
}
*/
/*
#include <stdlib.h>
#include <iostream>
#include <iomanip>
#include <cmath>

using namespace std;

int main()
{
	// TYPE YOUR CODE BELOW THIS COMMENT
	const double PI = 3.14; 
	int choice;
	double length, area;

	cin >> length;
	cin >> choice;

	if (length <= 0)
	{
		cout << "error";
	}
	else
	{
		switch (choice)
		{
		case 1:
			area = pow(length, 2);
			cout << fixed;
			cout << setprecision(2) << area;
			break;

		case 2:
			area = PI * pow(length, 2);
			cout << fixed;
			cout << setprecision(2) << area;
			break;

		default:
			cout << "Wrong Option";
		}
	}
	system("pause");
	return 0;
}

*/

/*
//Homework 1
#include <iomanip>
#include <iostream>
using namespace std;

int main()
{
	int age;
	double price, discount;
	char category;
	
	cin >> price;
	cin >> age;
	cin >> category;

	if (age <= 0)
	{
		cout << ("Wrong input");
		return 0;
	}
	else if (age > 0 && age <= 5)
	{
		if (category == 'A' || category == 'a')
		{
			discount = 0;
		}
		else
		{
			discount = 100;
		}
	}
	else if (age > 5 && age <= 12)
	{
		if (category == 'B' || category == 'b')
		{
			discount = 0;
		}
		else
		{
			discount = 50;
		}
	}
	else if (age > 12 && age <= 26)
	{
		if (category == 'C' || category == 'c')
		{
			discount = 0;
		}
		else
		{
			discount = 60;
		}
	}
	else if (age > 26 && age <= 60)
	{
		if (category == 'D' || category == 'd')
		{
			discount = 0;
		}
		else
		{
			discount = 70;
		}
	}
	else if (age > 60)
	{
		if (category == 'E' || category == 'e')
		{
			discount = 0;
		}
		else
		{
			discount = 80;
		}
	}

	double final_price = price - ((price * discount) / 100);
	cout << fixed;
	cout << setprecision(2) << final_price;

	system("pause");	
	return 0;
}
*/

/*
//Homework 2
#include <iostream>
#include <stdlib.h>
#include <iomanip>
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
		cout << "Class A wins!" << endl;
	else
		cout << "Class B wins!" << endl;
	system("pause");
	return 0;
}
*/
/*
// Pointers

#include <iostream>
using namespace std;

int main()
{
	int firstvalue = 5, secondvalue = 15;
	int *p1, *p2;

	p1 = &firstvalue;  // p1 = address of firstvalue
	p2 = &secondvalue; // p2 = address of secondvalue
	*p1 = 10;          // value pointed to by p1 = 10
	*p2 = *p1;         // value pointed to by p2 = value pointed to by p1
	p1 = p2;           // p1 = p2 (value of pointer is copied)
	*p1 = 20;          // value pointed to by p1 = 20

	cout << "firstvalue is " << firstvalue << '\n';
	cout << "secondvalue is " << secondvalue << '\n';
	system("pause");
	return 0;
}


*/
