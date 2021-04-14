#include "encodedServer.h"
#include <iostream>
using namespace std;


encodedServer::encodedServer()
{

}

void encodedServer::establishConnection(Client *sender, Client *reciever)
{

}

void encodedServer::sendMessage(string input)
{
	encodedMessage(input);
}

string encodedServer::encodedMessage(string val)
{
	return val;
}