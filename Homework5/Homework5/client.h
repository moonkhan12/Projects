#pragma once
#define CLIENT_H
#include <string>

class Client
{
private:
	int id;
	std::string message;
	bool possesKey;
	char key​[26] = {'B','A','D','C','F','E','H','G','J','I','L','K','N','M','P','0','R','Q','T','S','V','U','X','W','Z','Y'};

public:
	Client(int ID);
	int getID();
	void setID(int ID);
	std::string getMessage();
	void setMessage(std::string m);
	void setPossesKey(bool a);
};
