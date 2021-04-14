# Mubashar Khan
# PSID: 1512949
# 
#
"""
#Dont use a semicolon at the end of each line because a semicolon counts as a seperator not a terminator. As a result python interprets there is a space (blank statement) after the semicolon in a second statement
x = 72
y = "hi"
z = 5.0036

print(x)
print(y)
print(z)
#help() # this line is a comment 

if x > z:
    print("pass")
else:
    print("fail")

#
if x == 1: #Comparison
    print("x is 1")
elif x== 2:
    print("x is 72")
elif x > 3:
    print("x is greater than 3")
# Keep using elif. there is no else in a long statement unless you run it the long way
if z == 1:
    print("Z is 1")
else:
    if z >= 2 and z <= 3:
        print("Z is between 2 and 3")
    else:
        print("Z is greater than 3")

r = 28
g = 19
b = 12
k = 6
i = 3
sum = 0

# \n goes to the next line
python = "python"
avar= python[2]   #This is how you call an index
print(avar + " is a letter in Python\n") # concatenation: combining 2 or more things with a plus sign
#slicing 
print("\t"+python[2:4]) #This is an example of slicing letting you see a segment of an array
print("\t#*@_2 \n"*3) # The text is output 3 times
# \t indents

#Size:
length = len("python")
#print("Python has " + " letters"); #len(object) gives the length of the object

#comparing 2 strings
#use the "is" function to compare 2 strings. this is the same as ==
a = 'havana'
b = 'havana'
if (a is b):
    print("\n\nString A is equal to String B\n\n");

#OPERATORS:
#+- Addition and subtraction work normally
# *,%,/ Multiplication and Modulo(Remainder after number is divided) and Division 
print(27%7) # output is 6
#modular division works by n-1 where the divisor is n#

# 24 % 8 = 0
# 25 % 8 = 1
# 26 % 8 = 2
# 27 % 8 = 3
# 28 % 8 = 4
# 29 % 8 = 5
# 30 % 8 = 6
# 31 % 8 = 7
# 32 % 8 = 0


# // Truncated Diviision (Floor Division) rounds value down
print(10//3) #gives 3
#can also be done using int(10/3) but // is twice as fast so it is the best option in terms of efficiency

#Exponents **
print(10**3)

#Boolean or, and, not 
#just write and or & not
#Bitwise or: | bitwise and: & Bitwise xor: ^
# != not equal

#python calls arrays lists 
#List_Example1 = [] #empty list
#it is possible to have a nested list:
#List_Example2 = ["data1",["test1","info2"],"total"]

#print(List_Example2[0]) #remember that like C/C++ lists start counting from 0

#str = "Python under Linux is great"
#str[::3] #[begin,end,step]
#Output: 'Ph d n  e'
#print(8//9,"\n") #this is the opposite of C/C++


#User Input:
#name = input("Enter your name (First and Last): ")
#import string # this import allows you to access the string library
#print('The first letter of your name is: ' +  string.capwords(name[0])) #string.capwords will capitalize the first letter of every word
#print('Your last name is: ' + name.split()[1]) #use this .split()[n] function to get the nth term in a string

#You can use .upper to capitalize all letters
# .lower to lowercase all letters
# .count('whatever character') to count the occurences of 'whatever character'


#+= is a thing saves you from having to write the variable name twice

#a=input('please enter a number:')
#b='80'
#print(a+b)
"""
"""
#Turtle Graphics
import turtle
window = turtle.Screen()
item = turtle.Turtle()

item.forward(50)
item.left(90) #90 degree left turn
item.forward(30)
item.right(35)
item.forward(140)
item.right(400)
item.forward(135)
item.home()
#item.shape("square") #creates a solid square
window.exitonclick() 
# pensize(width) #changes marker size
#color(color) #changes color

import math as m #serves as a shorter name to call the math module
del m #will remove the short name from storage
"""
#importing data >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#text = open("words.txt", "rb").read()

#results = []
#with open('inputfile.txt') as inputfile:  #Change inputfile.txt to file name
#    for line in inputfile:
#        results.append(line.strip().split(','))
#text.close() #this line closes the file opened earlier

#<<<<<<<<<<<<< Alternative Method >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#import csv

#results = []
#with open('inputfile.txt', newline='') as inputfile:
#    for row in csv.reader(inputfile):
#        results.append(row)

##You can import modules but not text files. If you want to print the content do the following:

##Open a text file for reading:

#f = open('words.txt', 'r')
##Store content in a variable:

#content = f.read()
##Print content of this file:

#print(content)
##After you're done close a file:

#f.close()

#February 15
#Look up Excepetions

#random number game :)
"""
import random
x = random.randint(1,100)
count = 0
guess = -1
while (guess != x):
    print("enter num")
    guess = int(input())
    if (guess == x):
        print("You win!")
    elif (guess < x):
        print("Number is too low")
    else:
        print("Number is too high")
    count += 1
print("you trook " + str(count) + " trys") #Convert the number to a string to print it out in this format
"""

"""
print("enter num")
f = int(input("f"))
t = int(input("t"))
i = int(input("i"))
t += 1
for x in range(f,t,i):
    print(x)
"""

"""
import random
c = 0
x = 0
while c < 3:
    val = random.randint(1,100)
    print(val)
    if(val % 2) == 0:
        x = x + val
        c = c + 1
print(x)
"""

"""
# Python's equivalent of functions
def fucntion1(a):
    a = a + 10
    return a
    

print(fucntion1(10))

"""

"""
for i in range(3):
    for j in range(5):
        print("*",end = "")
    print("")
"""

"""
import string
arr = []
v = int(input("?Enter a number"))
while (v != 1):
    if ((v % 2 )== 0):
        v = v / 2
        arr.append(v)
    else:
        v = (v * 3) + 1
        arr.append(v)
print(arr)
"""

"""
n = int(input("HI"))
for i in range(n):
    for j in range(n):
        if (((i // j) == 1) or (i == 0 and j == 0)):
            print("1",end = "")
        else:
            print("0",end = "")
    print("")
"""
"""
list_of_lists = [[180.0], [173.8], [164.2], [156.5], [147.2], [138.2]]
#for sublist in list1:
#    for item in sublist:
#       flat_list.append(item)
#list1 = sum(list1,[])
#print(list1)

flattened1 = []
for sublist in list_of_lists:
    for val in sublist:
        flattened1.append(val)

flattened2 = []
flattened2 = [val for sublist in list_of_lists for val in sublist]

print(flattened1)
print(flattened2)
"""

"""
n = int(input("Enter: "))
arr = []
for i in range(n):
    templist = []
    for j in range(n):
        if (i == j):
            templist.append(1)
            #print("1",end = "")
        else:
            templist.append(0)
            #print("0",end = "")
    arr.append(templist)
    #print("")
print(arr)
"""

"""
#This program revesres text to see if a string is a palindrome
text = input("Enter a string: ")
reverse_text = text[::-1]
if (text == reverse_text):
    print("The string entered is a palindrome")
else:
    print("The string entered is not a palindrome")
"""

"""
str = "this is string example....wow!!! this is really string"
a = str.replace(" is ", " was ")
b = a.replace(" this "," here ")
print(b)
"""

"""
arr = []
count_int = 0
k = int(input("num: "))
for i in range(k):
    a = input("Enter your string: ")
    if a.isdigit():
        a = int(a)
        count_int += 1
    else:
        pass         
    arr.append(a)
print(arr)
print(count_int)

"""

"""
a = input("Enter text: ")
keyword = input("Key: ")
for letters in keyword:
   print(letters,a.count(letters))
"""

"""
#Bubble Sort:
alist = [54,26,93,17,77,31,44,55,20]
for i in range(len(alist)):
    for j in range(len(alist)-1):
        if alist[i] < alist[j] : #Note the way the sign is facing will determine ascending or descending
            temp = alist[i]
            alist[i] = alist[j]
            alist[j] = temp
print(alist)
    
"""

""" 
#no duplicates in a list and sorted
def Remove(duplicate):
    final_list = []
    for num in duplicate:
        if num not in final_list:
            final_list.append(num)
    return final_list
     
# Driver Code
duplicate = [2, 4, 10, 20, 5, 2, 20, 4]
a = Remove(duplicate)
a.sort()
print(a)
"""

"""
#Print all A's in a list
grades = {"a": 90, "b": 70, "c": 100, "d" : 85}
names = []
for key, value in grades.items():
    if value >= 90:
        names.append(key)
print(names)
"""

"""
import urllib.request

word = []
wordcount = []

for i in range(3): #Program repeats 3 times
    url = (input("Enter a website name: "))
    for j in range(3):
        word.append(input("Enter a key word to search: "))
    response = urllib.request.urlopen(url)
    bytestream = response.read()
    html = str(bytestream)
    for k in range(3):
        wordcount.append(html.count(word[k]))
        print("The word "+str(word[k])+" appears "+str(wordcount[k])+" times on the website "+str(url))
    print("")#newline
"""
"""
dict1 = {"A":1234,"B":2345,"c":{"C":3456}}
print(dict1)
print(8//9,"\n")
a = "king,Tom".split(',')
print(a)
print(a[0]+', '+a[1])
print("king, Tom")
"""

"""

from collections import Counter as Word_count
sent = "the quick brown fox jumps over the lazy dog"
print(Word_count(sent.split(" ")))

def wordcount(filename):
    from collections import counter as count
    fin = open(filename,"r").read()
    fnew = fin.lower()
    return count(fnew)

print(wordcount()
"""


#def search(lst,target,i,j):
#    if i == j:
#        return
#    mid = (i+j)//2
#    print(lst[mid])
#    if lst[mid] == target:
#        return mid
#    if target < lst[mid]:
#        return search(lst, target, i, mid)
#    else:
#        return search(lst, target, mid + 1, j)

#lst = [-4,-1,0,3,7,9,14,31,53,76,77,85,92,99]
#a = search(lst,78, 0, len(lst))
#print(a)

#def countOdd(arr):
#    if len(arr) == 0: return 0
#    #if arr == list(): return 0
#    return arr[0] % 2 + countOdd(arr[1:])
#arr1 = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
#arr2 = [2, 4, 6]
#arr3 = []
#c = countOdd(arr3)
#print(c)

#def negCount(arr):
#    if arr == list(): return 0
#    if arr[0] < 0:
#        return 1 + negCount(arr[1:])
#    else:
#        return negCount(arr[1:])
    
#arr1 = [-1,-5,6,9,-7,-6,4,-4,6]
#print(negCount(arr1)) 

#def sq(func, x):
#    y = x**2
#    return func(y)

#def f(x):
#    return x**2

#calc = sq(f, 3)
#print(calc)

#def always_sunny(t1, t2):
#    sun = ("sunny","sun")
#    first = t1[0] + t2[0]
#    return (sun[0], first)

#print(always_sunny(('cloudy'), ('cold',)))
#sunny, ccold

list_of_lists = [[180.0], [173.8], [164.2], [156.5], [147.2], [138.2]]
flat_list = []
for sublist in list_of_lists:
    for item in sublist:
       flat_list.append(item)
list_of_lists = sum(list1,[])
print(list1)