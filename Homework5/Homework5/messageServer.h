#pragma once
#define MESSAGESERVER_H
#include "server.h"
#include <string>

class messageServer : public server
{
public: 
	messageServer();
	void establishConnection(Client *sender, Client *reciever);
	void sendMessage(std::string input);
};