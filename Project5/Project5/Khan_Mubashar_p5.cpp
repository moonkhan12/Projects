/*
Project 5 Programming Applications for Electrical and Computer Engineering
Created By: Mubashar Khan, Computer Engineer at UH
ID: 1512949
Due: February 21, 2018
*/

//<<<<<<<<<<<<<    WIPE ALL TEST CODE LINES    >>>>>>>>>>>>>>>//

//MS VS 2017 function call depreciation work around
#define _CRT_SECURE_NO_DEPRECATE 
#define _CRT_SECURE_NO_WARNING 

//The coding of this program assumes that the text file you used had only integers in it
//Code is not particularly efficient. I have had only about 15-17 hours of sleep in the last 72 hours and am very tired.

#include <stdio.h>
#include <stdlib.h>

//Declaring Functions:
int instructions(int array_date[]);
int weekday(int array_date[]);
int output(int day_num);

int main()
{
	printf("This program allows you to find which day of the week it was or will be on any date.\nFollow the following instructions exactly.\n\n");
	char repeat;
	do
	{
		int day_num, array_date[3];
		printf("\n");
		instructions(array_date); //using arrays to store the values ofyear month and day //I took the user input in the function instructions ----> the directions didnt say I couldn't do that
		day_num = weekday(array_date); 
		output(day_num);
		printf("\n\nEnter 'y' to repeat with a new date. Enter any other key to EXIT: "); //giving user the option to not repeat
		scanf(" %c", &repeat);
		printf("\n");

	} while (repeat == 'y' || repeat == 'Y');
	int day_num, array_date[3];
	return 0;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int instructions(int array_date[])
{
	int day, month, year, correctyear = -1, correctmonth = -1, correctday = -1;
	while (correctyear == -1) //using correctyear as the loop trigger condition
	{
		printf("Enter the year as an integer (0-9999): ");
		correctyear = scanf("%d", &year);
		if ((year >= 0) && (year <= 9999))
		{
			break;
		}
		else
		{
			correctyear = -1;
		}
	}
	while (correctmonth == -1)
	{
		printf("Enter the month as an integer (1-12): ");
		correctmonth = scanf("%d", &month);
		if ((month >= 1) && (month <= 12))
		{
			break;
		}
		else
		{
			correctmonth = -1;
		}
	}
	
	switch (month)
	{
	case 1: //January
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-31): ");
			correctday = scanf("%d", &day);
			if ((day > 0) && (day <= 31))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	case 2: //February
		while (correctday == -1)
		{
			if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))// ((float)year / 4 == float(year / 4)) //Leap year Checks to see if the year is divisible by 4 where it will return an integer
			{ //Question: why is it called a leap year if instead of skipping a day, we get a day?
			  
			  //Answer: The name "leap year" probably comes from the fact that while a fixed date in the Gregorian calendar normally advances 
			  //one day of the week from one year to the next, the day of the week in the 12 months following the leap day (from March 1 
			  //through February 28 of the following year) will advance two days due to the extra day (thus "leaping over" one of the days in 
			  //the week). For example, Christmas Day (December 25) fell on a Tuesday in 2001, Wednesday in 2002, and Thursday in 2003 but 
			  //then "leapt" over Friday to fall on a Saturday in 2004
				
				printf("Enter the day as an integer (1-29): ");
				scanf("%d", &day);
				if ((day > 0) && (day <= 29))
				{
					break;
				}
				else
				{
					correctday = -1;
				}
			}
			else //Common Year
			{
				printf("Enter the day as an integer (1-28): ");
				scanf("%d", &day);
				if ((day > 0) && (day <= 28))
				{
					break;
				}
				else
				{
					correctday = -1;
				}
			}
		}
		break;
	case 3: //March
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-31): ");
			scanf("%d", &day);
			if ((day > 0) && (day <= 31))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	case 4: //April
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-30): ");
			scanf("%d", &day);
			if ((day > 0) && (day <= 30))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	case 5: //May
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-31): ");
			scanf("%d", &day);
			if ((day > 0) && (day <= 31))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	case 6: //June
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-31): ");
			scanf("%d", &day);
			if ((day > 0) && (day <= 31))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	case 7: //July
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-31): ");
			scanf("%d", &day);
			if ((day > 0) && (day <= 31))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	case 8: //August
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-31): ");
			scanf("%d", &day);
			if ((day > 0) && (day <= 31))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	case 9: //September
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-30): ");
			scanf("%d", &day);
			if ((day > 0) && (day <= 30))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	case 10: //October
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-31): ");
			scanf("%d", &day);
			if ((day > 0) && (day <= 31))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	case 11: //November
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-30): ");
			scanf("%d", &day);
			if ((day > 0) && (day <= 30))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	case 12: //December
		while (correctday == -1)
		{
			printf("Enter the day as an integer (1-31): ");
			scanf("%d", &day);
			if ((day > 0) && (day <= 31))
			{
				break;
			}
			else
			{
				correctday = -1;
			}
		}
		break;
	}
	array_date[0] = year;
	array_date[1] = month;
	array_date[2] = day;
	return 0;
}
int weekday(int array_date[])
{
	int year_code = 0, yy, month_code = 0, century_code = 0, date_number = 0, ly_code = 0, day_num = 0;
	//Calculation
	//(Year Code + Month Code + Century Code + Date Number – Leap Year Code) mod 7
	
	//Year Code
	yy = array_date[0] % 100;
	year_code = (yy + (yy / 4)) % 7;

	//Month Code
	int mm[] = {0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5, 5}; //Create an array containing the month codes
	month_code = mm[array_date[1]]; // assigns month code the correspoding value for the month entered by the user

	//Century Code
	if ((array_date[0] >= 1700) && (array_date[0] < 1800))
		century_code = 4;
	else if ((array_date[0] >= 1800) && (array_date[0] < 1900))
		century_code = 2;
	else if ((array_date[0] >= 1900) && (array_date[0] < 2000))
		century_code = 0;
	else if ((array_date[0] >= 2000) && (array_date[0] < 2100))
		century_code = 6;
	else if ((array_date[0] >= 2100) && (array_date[0] < 2200))
		century_code = 4;
	else if ((array_date[0] >= 2200) && (array_date[0] < 2300))
		century_code = 2;
	else if ((array_date[0] >= 2300) && (array_date[0] < 2400))
		century_code = 0;
	else if ((array_date[0] >= 2400) && (array_date[0] < 2500))
		century_code = 6;
	else if ((array_date[0] >= 2500) && (array_date[0] < 2600))
		century_code = 4;
	else if ((array_date[0] >= 2600) && (array_date[0] < 2700))
		century_code = 2;
	else if ((array_date[0] >= 2700) && (array_date[0] < 2800))
		century_code = 0;
	else if ((array_date[0] >= 2800) && (array_date[0] < 2900))
		century_code = 6;
	else if ((array_date[0] >= 2900) && (array_date[0] < 3000))
		century_code = 4;
	else if ((array_date[0] >= 3000) && (array_date[0] < 3100))
		century_code = 2;
	else if ((array_date[0] >= 3100) && (array_date[0] < 3200))
		century_code = 0;
	else if ((array_date[0] >= 3200) && (array_date[0] < 3300))
		century_code = 6;
	else if ((array_date[0] >= 3300) && (array_date[0] < 3400))
		century_code = 4;
	else if ((array_date[0] >= 3400) && (array_date[0] < 3500))
		century_code = 2;
	else if ((array_date[0] >= 3500) && (array_date[0] < 3600))
		century_code = 0;
	else if ((array_date[0] >= 3600) && (array_date[0] < 3700))
		century_code = 6;
	else if ((array_date[0] >= 3700) && (array_date[0] < 3800))
		century_code = 4;
	else if ((array_date[0] >= 3800) && (array_date[0] < 3900))
		century_code = 2;
	else if ((array_date[0] >= 3900) && (array_date[0] < 4000))
		century_code = 0;
	else if ((array_date[0] >= 4000) && (array_date[0] < 4100))
		century_code = 6;
	else if ((array_date[0] >= 4100) && (array_date[0] < 4200))
		century_code = 4;
	else if ((array_date[0] >= 4200) && (array_date[0] < 4300))
		century_code = 2;
	else if ((array_date[0] >= 4300) && (array_date[0] < 4400))
		century_code = 0;
	else if ((array_date[0] >= 4400) && (array_date[0] < 4500))
		century_code = 6;
	else if ((array_date[0] >= 4500) && (array_date[0] < 4600))
		century_code = 4;
	else if ((array_date[0] >= 4600) && (array_date[0] < 4700))
		century_code = 2;
	else if ((array_date[0] >= 4700) && (array_date[0] < 4800))
		century_code = 0;
	else if ((array_date[0] >= 4800) && (array_date[0] < 4900))
		century_code = 6;
	else if ((array_date[0] >= 4900) && (array_date[0] < 5000))
		century_code = 4;
	else if ((array_date[0] >= 5000) && (array_date[0] < 5100))
		century_code = 2;
	else if ((array_date[0] >= 5100) && (array_date[0] < 5200))
		century_code = 0;
	else if ((array_date[0] >= 5200) && (array_date[0] < 5300))
		century_code = 6;
	else if ((array_date[0] >= 5300) && (array_date[0] < 5400))
		century_code = 4;
	else if ((array_date[0] >= 5400) && (array_date[0] < 5500))
		century_code = 2;
	else if ((array_date[0] >= 5500) && (array_date[0] < 5600))
		century_code = 0;
	else if ((array_date[0] >= 5600) && (array_date[0] < 5700))
		century_code = 6;
	else if ((array_date[0] >= 5700) && (array_date[0] < 5800))
		century_code = 4;
	else if ((array_date[0] >= 5800) && (array_date[0] < 5900))
		century_code = 2;
	else if ((array_date[0] >= 5900) && (array_date[0] < 6000))
		century_code = 0;
	else if ((array_date[0] >= 6000) && (array_date[0] < 6100))
		century_code = 6;
	else if ((array_date[0] >= 6100) && (array_date[0] < 6200))
		century_code = 4;
	else if ((array_date[0] >= 6200) && (array_date[0] < 6300))
		century_code = 2;
	else if ((array_date[0] >= 6300) && (array_date[0] < 6400))
		century_code = 0;
	else if ((array_date[0] >= 6400) && (array_date[0] < 6500))
		century_code = 6;
	else if ((array_date[0] >= 6500) && (array_date[0] < 6600))
		century_code = 4;
	else if ((array_date[0] >= 6600) && (array_date[0] < 6700))
		century_code = 2;
	else if ((array_date[0] >= 6700) && (array_date[0] < 6800))
		century_code = 0;
	else if ((array_date[0] >= 6800) && (array_date[0] < 6900))
		century_code = 6;
	else if ((array_date[0] >= 6900) && (array_date[0] < 7000))
		century_code = 4;
	else if ((array_date[0] >= 7000) && (array_date[0] < 7100))
		century_code = 2;
	else if ((array_date[0] >= 7100) && (array_date[0] < 7200))
		century_code = 0;
	else if ((array_date[0] >= 7200) && (array_date[0] < 7300))
		century_code = 6;
	else if ((array_date[0] >= 7300) && (array_date[0] < 7400))
		century_code = 4;
	else if ((array_date[0] >= 7400) && (array_date[0] < 7500))
		century_code = 2;
	else if ((array_date[0] >= 7500) && (array_date[0] < 7600))
		century_code = 0;
	else if ((array_date[0] >= 7600) && (array_date[0] < 7700))
		century_code = 6;
	else if ((array_date[0] >= 7700) && (array_date[0] < 7800))
		century_code = 4;
	else if ((array_date[0] >= 7800) && (array_date[0] < 7900))
		century_code = 2;
	else if ((array_date[0] >= 7900) && (array_date[0] < 8000))
		century_code = 0;
	else if ((array_date[0] >= 8000) && (array_date[0] < 8100))
		century_code = 6;
	else if ((array_date[0] >= 8100) && (array_date[0] < 8200))
		century_code = 4;
	else if ((array_date[0] >= 8200) && (array_date[0] < 8300))
		century_code = 2;
	else if ((array_date[0] >= 8300) && (array_date[0] < 8400))
		century_code = 0;
	else if ((array_date[0] >= 8400) && (array_date[0] < 8500))
		century_code = 6;
	else if ((array_date[0] >= 8500) && (array_date[0] < 8600))
		century_code = 4;
	else if ((array_date[0] >= 8600) && (array_date[0] < 8700))
		century_code = 2;
	else if ((array_date[0] >= 8700) && (array_date[0] < 8800))
		century_code = 0;
	else if ((array_date[0] >= 8800) && (array_date[0] < 8900))
		century_code = 6;
	else if ((array_date[0] >= 8900) && (array_date[0] < 9000))
		century_code = 4;
	else if ((array_date[0] >= 9000) && (array_date[0] < 9100))
		century_code = 2;
	else if ((array_date[0] >= 9100) && (array_date[0] < 9200))
		century_code = 0;
	else if ((array_date[0] >= 9200) && (array_date[0] < 9300))
		century_code = 6;
	else if ((array_date[0] >= 9300) && (array_date[0] < 9400))
		century_code = 4;
	else if ((array_date[0] >= 9400) && (array_date[0] < 9500))
		century_code = 2;
	else if ((array_date[0] >= 9500) && (array_date[0] < 9600))
		century_code = 0;
	else if ((array_date[0] >= 9600) && (array_date[0] < 9700))
		century_code = 6;
	else if ((array_date[0] >= 9700) && (array_date[0] < 9800))
		century_code = 4;
	else if ((array_date[0] >= 9800) && (array_date[0] < 9900))
		century_code = 2;
	else if ((array_date[0] >= 9900) && (array_date[0] < 10000))
		century_code = 0;
	else
		century_code = 0;

	//Date Code
	date_number = array_date[2];
	bool leapyear;
	//Leap Year Code
	if (((array_date[0] % 4 == 0) && (array_date[0] % 100 != 0)) || (array_date[0] % 400 == 0))
	{
		ly_code = 2; // Needed to set this to 2 in order for leap years to be properly calculated. Not sure how the error arose
		leapyear = true;
	}
	else
	{
		ly_code = 0;
	}

	if (leapyear && (array_date[1] = 1))
	{
		day_num = (year_code + month_code + century_code + date_number - ly_code + 1) % 7;
	}
	else
	{
		day_num = (year_code + month_code + century_code + date_number - ly_code) % 7;
	}

	return day_num;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int output(int day_num)
{
	switch (day_num)
	{
	case 1:
		printf("\nSunday\n");
		break;
	case 2:
		printf("\nMonday\n");
		break;
	case 3:
		printf("\nTuesday\n");
		break;
	case 4:
		printf("\nWednesday\n");
		break;
	case 5:
		printf("\nThursday\n");
		break;
	case 6:
		printf("\nFriday\n");
		break;
	case 7:
		printf("\nSaturday\n");
		break;
	}
	return 0;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
