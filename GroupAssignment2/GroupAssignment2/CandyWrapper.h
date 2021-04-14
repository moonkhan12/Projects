#pragma once
#include "Food.h"
#define CANDYWRAPPER_H
#include <string>


class CandyWrapper
{
private:
	float length;
	float width;
	std::string color;
public:
	CandyWrapper();
	CandyWrapper(float length, float width, std::string color);
	CandyWrapper(const CandyWrapper &CW);
	void printItem();
	float getLength();
	float getWidth();
	void setLength(float newlength);
	void setWidth(float newwidth);
	std::string getString();
	void setString(std::string newcolor);
	bool operator== (const CandyWrapper &CW);
};

