#include "Candy.h"
#include "CandyWrapper.h"
#include "Food.h"
#include <iostream>
using namespace std;

int main()
{
	Food fd1 = Food(1, 200, true);
	Food fd2 = Food(fd1);
	Candy cd1;
	Candy cd2;
	CandyWrapper cw1 = CandyWrapper(1, 0.5, "red");
	CandyWrapper cw2 = CandyWrapper(0.5, 0.25, "blue");
	cd1.setVolume(0.05);
	cd1.setCalories(100);
	cd1.setVegetarian(true);
	cd1.setSweetness(0.7);
	cd1.setColor("pink");
	cd1.setCandyWrap(cw1);
	cd2 = cd1;
	cd2.setCandyWrap(cw2);
	if (fd1 == fd2)
		cout << "we are similar !!" << endl << endl;
	else
		cout << "we are different !!" << endl << endl;
	fd1.printItem();
	cout << endl;
	fd2.printItem();
	cout << endl;
	if (cd1 == cd2)
		cout << "we are similar !!" << endl << endl;
	else
		cout << "we are different !!" << endl << endl;
	cd1.printItem();
	cout << endl;
	cd2.printItem();
	cout << endl;
	system("pause");
	return 0;
}