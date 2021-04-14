#include <iostream>
#include <fstream>
#include "server.h"
#include "client.h"
#include "messageServer.h"
#include "encodedServer.h"
#include "utility.h"


using namespace std;

int main() {
	Client Client1(1), Client2(2);
	messageServer server1;
	encodedServer server2;
	utility utilityObj;

	string input1 = "", input2 = "", userChoice = "";
	string printOutput;

	string fileName;
	cin >> fileName;
	/*
	fileContents - pointer to array of string. Stores the contents of
	the entire input file.
	*/
	string * fileContents = utilityObj.readInputFromFile(fileName);
	string * tracker = fileContents;

	input1 = fileContents[0];
	tracker++;
	input2 = fileContents[1];
	tracker++;

	if ((input1 == "y" || input1 == "Y") && (input2 == "y" || input2 == "Y")) {
		userChoice = fileContents[2];
		tracker++;

		if (userChoice == "y" || userChoice == "Y") //use encoded server
		{
			utilityObj.encodedConnection(Client1, Client2, server2, tracker);
		}
		else // use normal messageServer
		{
			utilityObj.standardConnection(Client1, Client2, server1, tracker);
		}
	} //if ends
	else {
		printOutput = "No connection made.";
		cout << printOutput;
		exit(0);
	}

	printOutput = utilityObj.outputString();
	cout << printOutput;

	return 0;
}