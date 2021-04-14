#include <iostream>
using namespace std;


void menu()
{
	cout << "(p) : Print elements" << endl;
	cout << "(a) : Add element" << endl;
	cout << "(d) : Delete element" << endl;
	cout << "(r) : Return size" << endl;
	cout << "(e) : Exit" << endl;
}

int main(void)
{
	int size = 2, nullfound, count = 0;
	int *myArr = new int[size];
	for (int j = 0; j < size; j++)
	{
		myArr[j] = NULL;
	}

	while (1)
	{
		menu();
		char opt;
		cout << endl << "Enter option: ";
		cin >> opt;
		if (opt == 'p') //Print
		{
			if (*myArr == NULL)
			{
				cout << "No elements" << endl << endl;
			}
			else
			{
				for (int i = 0; i < size; i++)
				{
					if (i < size - 1) 
					{
						cout << myArr[i];
						if (i+1 < size && i != count-1 ) // added this && statement to make sure that last integer does not have comma added
						cout << ", ";
					}
					else if (myArr[i] != NULL) // added else if 
						cout << myArr[i];
				}
				cout << endl << endl;
			}
		}
		else if (opt == 'a') //Add
		{
			int number;
			cout << "Enter element: ";
			cin >> number;

			if (count == size)
			{
				size *= 2;
				cout << "Array expanded" << endl;
				int* temp = new int[size];
				for (int a = 0; a < size; a++)
				{
					temp[a] = myArr[a];
				}
				delete[] myArr;
				myArr = temp;
				for (int j = size / 2; j < size; j++)
				{
					myArr[j] = NULL;
				}
			}
			myArr[count] = number;
			count++;
			cout << endl;
		}
		else if (opt == 'd') //Delete
		{
			int num, position = NULL, check = 0;// intialized position to null and added another varible to check if element is in array or not.
			cout << "Enter the number you want to remove: ";
			cin >> num;
			for (int k = 0; k < size; k++)
			{
				if (myArr[k] == num)
				{
					myArr[k] = NULL;
					count--;
					check = 1;
					position = k;
					if (size > position) //Moved this here so that it will only change array size when the number exists in the array. 
										 //If left alone it was still deleting array values if there was only 1 left.
					{
						for (int d = 0; d < (size - position); d++)
						{
							myArr[d + position] = myArr[d + position + 1];
						}
						myArr[size - 1] = NULL;
					}
				}
				
			}
			
			if (check == 0) // added statement to respond to non array value
			{
				cout << "Not there" << endl;
			}
			if ((count <= size / 2) &&  (size > 2))// Added size > 2 so that when size == 2, it will not shrink the array to a size of 1.
			{
				size /= 2;
				cout << "Array shrinked" << endl;
			}
			cout << endl;
		}
		else if (opt == 'r') //Return Size
		{
			int count_elements = 0;
			for (int u = 0; u < size; u++)
			{
				if (myArr[u] != NULL)
				{
					count_elements++;
				}
			}
			cout << "S: " << size << ", " << "E: " << count_elements << endl << endl;
		}
		else if (opt == 'e') //Exit
		{
			delete[] myArr;
			myArr = NULL;
			break;
		}
	}
	return 0;
}