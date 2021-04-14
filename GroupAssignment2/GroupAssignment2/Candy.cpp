#include "Candy.h"
#include <iostream>
using namespace std;

Candy::Candy()
{
	sweetness = 0.0;
	color = "NA";
	calories = 0;
	vegetarian = true;
	setVolume(0.0);
	candyWrap = CandyWrapper();// set candWrap intially to zero by setting candyWrap to CandyWrapper default constructor
}

Candy::Candy(const Candy & C)
{
	sweetness = C.sweetness;
	color = C.color;
	candyWrap = C.candyWrap;

}

void Candy::setCandyWrap(CandyWrapper num)
{
	candyWrap = num;
}

void Candy::setSweetness(float num)
{
	sweetness = num;
}

void Candy::setColor(std::string val)
{
	color = val;
}

float Candy::getSweetness()
{
	return sweetness;
}
CandyWrapper Candy::getCandyWrap()
{
	return candyWrap;
}
std::string Candy::getColor()
{
	return color;
}

bool Candy::operator==(const Candy &C)
{
	if (sweetness == C.sweetness && color == C.color && candyWrap == C.candyWrap)
		return true;
	else
		return false;
}

void Candy::printItem()
{
		cout << "I am ";
		if (getVegetarian())
			cout << "a vegetarian";
		else
			cout << "not a vegetarian";
		cout << " Candy, my volume is " << getVolume() << " fl. Oz, ";
		cout << "I have " << getCalories() << endl <<"calories, my sweetness level is ";
		cout << getSweetness() << ", my color is " << getColor();
		cout << " and my wrapper"<<endl<<"has ";
		candyWrap.printItem();
}