#pragma once
#define ENCODEDSERVER_H
#include "server.h"
#include <string>


class encodedServer : public server
{
private:
	char key​[26] = { 'B','A','D','C','F','E','H','G','J','I','L','K','N','M','P','0','R','Q','T','S','V','U','X','W','Z','Y' };
public:
	encodedServer();
	void establishConnection(Client *sender, Client *reciever);
	void sendMessage(std::string input);
	std::string encodedMessage(std::string val);
};