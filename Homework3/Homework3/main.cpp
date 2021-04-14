#include <iostream>
#include <fstream>
#include <string>
#include <cmath>
using namespace std;
#define min(x,y,z) (x < y ? (x < z ? x : z) : (y < z ? y : z))
#define MIN(a,b) (((a)<(b))?(a):(b))

double difference(double array[5][6], int r, int c, int r1, int c1);

int main(void)
{
	double arr[5][6];
	string filename;
	getline(cin, filename);
	ifstream infile;
	infile.open(filename);

	ofstream outfile;
	outfile.open("out.txt");
	
	//ifstream infile; //Test
	//infile.open("text.txt");
	
	int num;

	if (infile.is_open())
	{
		infile >> num;
		for (int i = 0; i < 5; i++)
		{
			//if(i>0)
				//cout << endl << endl;
			for (int j = 0; j < 6; j++)
			{
				infile >> arr[i][j];
				//cout << arr[i][j] << " ";
			}
		}
		//cout << endl << endl;
		
		int row = 1, col = 1, count = 1, diff1,diff2,diff3;
		int smallest;

		while (count <= 6)
		{
			switch (num)
			{
			case 1:
				count++;
				row = num;
				outfile << row << "," << col << ":" << arr[row - 1][col - 1] << endl;
				diff2 = difference(arr, row - 1, col - 1, row - 1, col);//middle
				diff3 = difference(arr, row - 1, col - 1, row, col);//bottom
				smallest = MIN(diff2, diff3);
				if ((smallest == diff2) && (diff2 != diff3))
				{
					num = 1;
				}
				else if ((smallest == diff3) || (diff2 == diff3))
				{
					num = 2;
				}
				col++;
				break;
			case 2:
				count++;
				row = num;
				outfile << row << "," << col << ":" << arr[row - 1][col - 1] << endl;
				diff1 = difference(arr, row - 1, col - 1, row - 2, col);//top
				diff2 = difference(arr, row - 1, col - 1, row - 1, col);//middle
				diff3 = difference(arr, row - 1, col - 1, row, col);//bottom
				smallest = min(diff1, diff2, diff3);
				if (smallest == diff1)
				{
					num = 1;
				}
				else if (smallest == diff2)
				{
					num = 2;
				}
				else if (smallest == diff3)
				{
					num = 3;
				}
				col++;
				break;
			case 3:
				count++;
				row = num;
				outfile << row << "," << col << ":" << arr[row - 1][col - 1] << endl;
				diff1 = difference(arr, row-1, col-1, row - 2, col);//top
				diff2 = difference(arr, row-1, col-1, row-1, col);//middle
				diff3 = difference(arr, row-1, col-1, row, col);//bottom
				smallest = min(diff1, diff2,diff3);
				if (smallest == diff1)
				{
					if ((diff1 == diff2) && (diff1 != diff3))
						num = 3;
					else if ((diff1 == diff3) && (diff1 != diff2))
						num = 4;
					else 
						num = 2;
				}
				else if (smallest == diff2)
				{
					num = 3;
				}
				else if (smallest == diff3)
				{
					num = 4;
				}
				col++;
				break;
			case 4:
				count++;
				row = num;
				outfile << row << "," << col << ":" << arr[row - 1][col - 1] << endl;
				diff1 = difference(arr, row - 1, col - 1, row - 2, col);//top
				diff2 = difference(arr, row - 1, col - 1, row - 1, col);//middle
				diff3 = difference(arr, row - 1, col - 1, row, col);//bottom
				smallest = min(diff1, diff2, diff3);
				if (smallest == diff1)
				{
					num = 3;
				}
				else if (smallest == diff2)
				{
					num = 4;
				}
				else if (smallest == diff3)
				{
					num = 5;
				}
				col++;
				break;
			case 5:
				count++;
				row = num;
				outfile << row << "," << col << ":" << arr[row - 1][col - 1] << endl;
				diff1 = difference(arr, row - 1, col - 1, row - 2, col);//top
				diff2 = difference(arr, row - 1, col - 1, row - 1, col);//middle
				smallest = MIN(diff1, diff2);
				if (smallest == diff1)
				{
					num = 4;
				}
				else if (smallest == diff2)
				{
					num = 5;
				}
				col++;
				break;
			}
		}
	}
	//else
	//	cout << "File not found";
	infile.close();
	outfile.close();
	return 0;
}


double difference(double arr[5][6], int row1, int col1, int row2, int col2)
{
	double diff = abs(arr[row1][col1] - arr[row2][col2]);
	return diff;
}