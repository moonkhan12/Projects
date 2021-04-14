#include "Food.h"
#include <iostream>
using namespace std;

Food::Food()
{
	volume = 0.0;
	calories = 0;
	vegetarian = true;
}

Food::Food(int cal, float vol, bool veg)
{
	calories = cal;
	volume = vol;
	vegetarian = veg; 
}

Food::Food(const Food & f)
{
	calories = f.calories;
	volume = f.volume;
	vegetarian = f.vegetarian;
}

void Food::setCalories(int cals)
{
	calories = cals;
}

void Food::setVegetarian(bool TF)
{
	vegetarian = TF;
}

void Food::setVolume(float Vol)
{
	volume = Vol;
}

int Food::getCalories()
{
	return calories;
}

bool Food::getVegetarian()
{
	return vegetarian;
}

float Food::getVolume()
{
	return volume;
}

void Food::printItem()
{
	if (vegetarian == true)
	{
		cout << "I am a vegetarian Food, my volume is " << calories << " fl. Oz";
		cout << " and I have " << volume << " calories" << endl;
	}
	else
	{
		cout << "I am a not vegetarian Food, my volume is " << volume << " fl. Oz";
		cout << " and I have " << calories << " calories" << endl;
	}
}

bool Food::operator==(const Food & F)
{
	if (calories == F.calories && volume == F.volume && vegetarian == F.vegetarian)
	{
		return true;
	}
	else
	{
		return false;
	}
}
