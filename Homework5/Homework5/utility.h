#pragma once
#define UTILITY_H
#include <iostream>
#include <fstream>
#include "client.h"
#include "encodedServer.h"
#include "messageServer.h"


class utility
{
private: 
	ifstream myfile; 
	string outputFile = "";
	string input[100];
	int number_of_lines;
public:
	void encodedConnection(Client c1, Client c2 , encodedServer e, string s);
	void standardConnection(Client c1, Client c2, messageServer m, string s);
	string * readInputFromFile(string fileName);
	string outputString();
};