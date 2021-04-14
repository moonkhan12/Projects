#pragma once
#include "Food.h"
#include "CandyWrapper.h"
#include <string.h>
#include <string>
#define CANDY_H

class Candy : public Food
{
private:
	float sweetness;
	CandyWrapper candyWrap;
protected:
	std::string color; // says float in the instructs, but I put string
public:
	Candy(); // default constructor 
	Candy(const Candy &C);
	void setSweetness(float num);
	void setCandyWrap(CandyWrapper num);
	void setColor(std::string val);
	float getSweetness();
	CandyWrapper getCandyWrap();
	std::string getColor();
	void printItem();
	bool operator==(const Candy &C);
};