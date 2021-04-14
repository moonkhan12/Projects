#include "CandyWrapper.h"
#include <iostream>
using namespace std;


CandyWrapper::CandyWrapper()
{
	length = 0.0;
	width = 0.0;
	color = "NA";
}

CandyWrapper::CandyWrapper(float l, float w, string c)
{
	length = l;
	width = w;
	color = c;
}

CandyWrapper::CandyWrapper(const CandyWrapper &CW)
{
	length = CW.length;
	width = CW.width;
	color = CW.color;
}

float CandyWrapper::getLength()
{
	return length;
}

float CandyWrapper::getWidth()
{
	return width;
}

void CandyWrapper::setLength(float val)
{
	length = val;
}

void CandyWrapper::setWidth(float val)
{
	width = val;
}

void CandyWrapper::printItem()
{
	cout << "a length of " << getLength() << " in, a width of "<< getWidth() <<" in and a "<< getString() <<" color" << endl;
}

string CandyWrapper::getString()
{
	return color;
}

void CandyWrapper::setString(string val)
{
	color = val;
}


bool CandyWrapper::operator==(const CandyWrapper &CW)
{
	if (length == CW.length &&
		width == CW.width &&
		color == CW.color)
		return true;
	else
		return false;
}

