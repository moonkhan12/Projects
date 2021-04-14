#include "client.h"
#include <iostream>
using namespace std;

Client::Client(int ID)
{
	id = ID;
}

int Client::getID()
{
	return id;
}

void Client::setID(int ID)
{
	id = ID;
}

string Client::getMessage()
{
	return message;
}

void Client::setMessage(string m)
{
	message = m;
}

void Client::setPossesKey(bool a)
{
	
}


