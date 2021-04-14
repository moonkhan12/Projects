#Project 2 Python COSC 1306
#Created By: Mubashar Khan, Computer Engineer at the Univeristy of Houston
#ID: 1512949
#Due: March 10, 2018

import string
# I like to add comment lines to seperate functions ----> Makes the program much easier to read/edit
#Comments for the next 2 functions are pretty much the same since it is the same code with 1 line of variation
#######################################################################################################################################################################################
def enc(): #Encode function
    text = input("Enter the text you would like to encode: ")
    shift = int(input("Enter how many values you would like to shift over (integer): ")) #If 0, assuming the user enters 0 rather than leaving it blank
    i = 0 #counter variable
    data = [] #Empty matrix to store converted string
    for i in text:
        num = int(ord(i))  #ord function converts characters to integers
        new_char = chr(num+shift) #Converts the number back to a character according to the ASCII character code
        data.append(new_char) #adds the new_char to the end of the list, data
    print("") #Used this print statement to add some spacing between the input and output on the console window
    print(''.join(data),"\n") #Used .join(string) from the string class to combine all the elements in the list, data, into a single string
    return data
#######################################################################################################################################################################################
def dec(): #decode function
    text = input("Enter the text you would like to decode: ")
    shift = int(input("Enter how many values you would like to shift over (integer): ")) #If 0, assuming the user enters 0 rather than leaving it blank
    i = 0 #counter variable
    data = [] #Empty matrix to store converted string
    for i in text:
        num = int(ord(i))  #ord function converts characters to integers
        new_char = chr(num-shift) #Converts the number back to a character according to the ASCII character code
        data.append(new_char) #adds the new_char to the end of the list, data
    print("") #Used this print statement to add some spacing between the input and output on the console window
    print(''.join(data),"\n") #Used .join(string) from the string class to combine all the elements in the list, data, into a single string
    return data
#######################################################################################################################################################################################
def enc_dec():  
    ui = [] #User input storage variable
    while (1): 
        if ((ui == 'E') or (ui == 'e') or (ui == 'd') or (ui == 'D')):
            break #Used break rather than setting an end condition in the while loop---> was having some issues with using the condition within if(...) inside the while(...)
        else:
            ui = input("Enter the letter 'E' to encode or the letter 'D' to decode: ")
    if (ui == 'E' or ui == 'e' ):
        data = enc() #calls the encode function
    else:
        data = dec() #calls the decode function
    return data
#######################################################################################################################################################################################
while(1):
    new_list = enc_dec() #Main body of the code
    # I did not include a way to recreate the original statement entered, but that is not really needed anyway since the user could always just look at what they entered
    # it would be redundent to output the same information twice and there is no point in actually writing code for this since the user wouldnt know the difference between you outputing
    # what they wrote or you recreating the text from the encoded string.
    choice = input("Would you like to encode or decode some more text? (Y/N): ") #Provides the user with an option to repeat
    if (choice == 'y' or choice == 'Y'):
        print("") #Formatting
        print("") #adding some more spacing
        continue
    else:
        break #if the user chooses no or anything besides y or Y, the program will stop looping and end. Alternatively I could have used 'exit' instead of 'break'


    #<<<<<<<<<<note to self>>>>>>>>>>>
    #Ways to optimize the code: 
    #Rather than outputing to the console window, I would print in a text doc. That way you can access the items in the text doc and this program can be more versatile
    #have all input statments in the main program and then pass input values to the functions
    #Create bounds for the shift key, but this creates another problem: bunch of conditionals for every single character value. <----- doesnt optimize the code, just makes it really long