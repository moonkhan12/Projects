#pragma once
#define FOOD_H
// creating header file for class Food
class Food
{
protected:
	int calories;
	bool vegetarian;
private:
	float volume; 
public:
	Food(); // default const
	Food(int cal, float vol, bool veg); // set constructor 
	Food(const Food &f); // copy constructor 
	void setCalories(int cals);
	void setVegetarian(bool TF);
	void setVolume(float Vol);
	int getCalories();
	bool getVegetarian();
	float getVolume();
	void printItem();
	bool operator ==(const Food &F); // overloading == operator 
};

