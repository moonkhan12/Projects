#include <iostream>
using namespace std;
#include <string>
#include <sstream>



class DynamicArray {
public:
	DynamicArray(int arraySize);
	DynamicArray(const DynamicArray &a);
	int getArraySize();
	int getNumOfElements();
	string print();
	void addElement(int num);
	void deleteElement(int num);
	void setArraySize(int array_size);
	~DynamicArray();
private:
	int *arr;
	int arraySize;
	int numOfElements = 0;
};

DynamicArray::DynamicArray(int arraySize_)
{
	if (arraySize_ < 1)
	{
		arraySize_ = 1;
	}
	arraySize = arraySize_;
	arr = new int[arraySize];

}

DynamicArray::DynamicArray(const DynamicArray &a)
{
	arraySize = a.arraySize;
	arr = new int[arraySize];
	for (int b = 0; b < a.arraySize; b++)
	{
		arr[b] = a.arr[b];
	}
	numOfElements = a.numOfElements;

}

DynamicArray::~DynamicArray()
{
	delete[] arr;
}

int DynamicArray::getArraySize()
{	
	return 	arraySize;
}

int DynamicArray::getNumOfElements()
{
	return numOfElements;
}

string DynamicArray::print()
{
	string str = "No Elements";
	if (numOfElements > 0)
	{
		str = "";
		for (int i = 0; i < numOfElements; i++)
		{
		/*	str.append(to_string(arr[i]));
			if (i < numOfElements - 1)
				str.append(", ");
				*/
			stringstream c;
			c << arr[i];
			string t = c.str();
			str = str + t;
			if (i < numOfElements - 1)
				str = str + ",";

		}
	}
	return str;
}

void DynamicArray::addElement(int num)
{
	if (numOfElements == arraySize)
	{
		arraySize *= 2;
		int* temp = new int[arraySize];
		for (int a = 0; a < arraySize; a++)
		{
			temp[a] = arr[a];
		}
		delete[] arr;
		arr = temp;
	}

	arr[numOfElements] = num;
	numOfElements += 1;

}

void DynamicArray::deleteElement(int num)
{
	for (int k = 0; k < arraySize; k++)
	{
		if (arr[k] == num)
		{
			numOfElements--;
			for (; k < arraySize - 1; k++)
			{
				arr[k] = arr[k + 1];
			}
			if (numOfElements <= arraySize / 2 && arraySize > 1)
			{
				arraySize /= 2;
				int * temp = new int[arraySize];
				for (int o = 0; o < arraySize; o++)
				{
					temp[o] = arr[o];
				}
				delete[] arr;
				arr = temp;
			}
		}

	}
}

void DynamicArray::setArraySize(int array_size)
{
	if (array_size >= numOfElements)
	{
		arraySize = array_size;
		arr = new int[arraySize];

	}
	cout << "arraySize = " << array_size;
}	


////////******************************************************************************************************************

int main() {

	//***********  addElements Function is Tested  ***********

	DynamicArray Darr(1);
	Darr.addElement(1);
	Darr.addElement(2);
	Darr.addElement(3);
	Darr.addElement(4);
	Darr.addElement(5);
	if (Darr.getArraySize() == 8)
	{
		cout << "Correct Result" << endl;
		cout << "array Size after expansion is : 8" << endl << endl;
	}
	else
	{
		cout << "Your addElement Function is not correct" << endl;
		cout << "Your arraySize after Expansion is : " << Darr.getArraySize() << endl;
		cout << "Expected Output : 8 " << endl << endl;
	}
	//*********** Constructor with invalid input  is Tested  ***********
	DynamicArray Darr2(0);
	if (Darr2.getArraySize() == 1)
	{
		cout << "Correct Result" << endl;
		cout << "array Size after given wrong value (less than one) : 1" << endl << endl;
	}
	else
	{
		cout << "Your constrcutor is not Correct" << endl;
		cout << "The arraySize should be at least One" << endl << endl;
	}

	//***********  Method with invalid input  is Tested ***********
	DynamicArray Darr3(3);
	Darr3.addElement(20);
	Darr3.addElement(22);

	if (Darr3.getArraySize() == 3) {
		cout << "Correct Result" << endl;
		cout << "array Size is after given a wrong value (less than actual numOfElements) : 3" << endl << endl;
	}
	else {
		cout << "Your Constrcutor is not Correct" << endl;
		cout << "The value passed for arraySize should be bigger than actual numOfElements" << endl << endl;
	}

	//*********** Print Function  is Tested  ***********
	DynamicArray Darr4(1);
	Darr4.addElement(1);
	Darr4.addElement(2);
	Darr4.addElement(3);
	string s = Darr4.print();
	string str1 = "1,2,3";

	if (s == str1) {
		cout << "Correct Result" << endl;
		cout << "Elements of array :1,2,3" << endl << endl;
	}
	else {
		cout << "Result is incorrect " << endl;
		cout << "your function prints:";
		cout << s << endl;
		cout << " But, Expected output should be:" << str1 << endl << endl;

	}

	//*********** Copy Constructor  is Tested  ***********
	DynamicArray Darr5(1);
	Darr5.addElement(10);
	DynamicArray Darr6 = Darr5;
	Darr6.addElement(100);
	Darr6.addElement(1000);
	string s1 = Darr5.print();
	string output1 = "10";
	string s2 = Darr6.print();
	string output2 = "10,100,1000";
	//if(Darr.getnumOfElements() == 3 && Darr.getarraySize() == 4)
	if (s1 == output1 && s2 == output2) {
		cout << "Correct Result" << endl;
		cout << "First array has " << Darr5.print() << endl;
		cout << "Copied array after modification has " << Darr6.print() << endl << endl;
	}
	else {
		cout << "Result is incorrect " << endl;
		cout << "First array has " << Darr5.print() << " should have: 10" << endl;
		cout << "Copied array after modification has " << Darr5.print() << " should have: 10,100,1000";


	}
	system("pause");
	return 0;


}