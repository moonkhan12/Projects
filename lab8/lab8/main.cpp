#include <iostream>
using namespace std;
#include <string>


int main() 
{
	try 
	{
		string name;
		int num;
		cout << "Enter a name: ";
		getline(cin, name);
		
		try
		{
			cout << "Enter a number: ";
			cin >> num;
			if (num < 0)
			{
				throw 0;
			}
		}
		catch (int e)
		{
			cout << " Error a value less than " << e << " was entered"<<endl;
		}
		if (!((name.at(0) >= 65 && name.at(0) <= 90) || (name.at(0) >= 97 && name.at(0) <= 122)))
		{
			throw name.at(0);
		}
	}
	catch (char i) 
	{
		cout << " Your name starts with the value: " << i << " which is not valid" << endl;
	}
	
	system("pause");
	return 0;
}