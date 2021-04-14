#pragma once
#define SERVER_H
#include "client.h"

class server
{
protected:
	Client *sender;
	Client *reciever;
public:
	virtual void establishConnection() = 0;
	virtual void sendMessage() = 0;
	void swapClients();
};