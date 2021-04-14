#Project 3 for COSC 1306
#Created By: Mubashar Khan, Computer Engineer at UH
#ID: 1512949
#Due: April 30, 2018

#This program was written without efficiency in mind. As such once you make num >= 3, the time to finish drawing starts 
#increasing significantly with num = 3 taking about 10 seconds and num = 4 taking about 43 seconds
#The program will draw any number of squares you desire, however it will take a long time.
#NOTE: instructions did not ask for a particularly efficient program. One of the things causes a lack of efficency is the goto function
#being used even when not needed. Another thing is turtle speed, however this is something that can't be fixed since my turtle
#is already set to fastest: t.speed(0)

#Gets user defined values
x = int(input("Enter the x-coordinate to start at: "))
y = int(input("Enter the y-coordinate to start at: "))
length = int(input("Enter the length of the first square: "))
num = int(input("Enter the number of times you want to repeat the pattern: "))

import turtle
s = turtle.Screen() #Defines the screen object
t = turtle.Turtle() #Defines the turtle object

##################################################################################################################

def square(t,x,y,length):
    t.goto(x,y)
    t.right(90) #Puts the center of the square at the coordinate point passed to square()
    t.forward(length/2)
    t.right(90)
    t.forward(length/2)
    t.right(180)
    t.down() #puts the pen down to draw
    t.begin_fill()
    for i in range(4): #Draw the red square
        t.forward(length)
        t.left(90)
    t.end_fill()
    t.up() #picks up the pen to allow the position to be moved without drawing

##################################################################################################################

def pattern(t,x,y,length,num):
    if num == 0:
        pass
    elif num == 1: #needed a seperate case for num = 1 because of the way I wrote the following portion, 
                   #if this was not there then you get one extra level to the layers
        square(t,x,y,length) 
        pattern(t,x,y,length,num-1)
    else:
        length2 = length/2.2
        #top right
        x2 = x+length/2
        y2 = y+length/2
        t.goto(x2, y2) 
        square(t,x2,y2,length2)
        pattern(t,x2,y2,length2,num-1)
        #Central Square
        square(t,x,y,length) #drawn after the top right so that it is on top of it
        #top left
        x2 = x-length/2
        y2 = y+length/2
        t.goto(x2, y2) 
        square(t,x2,y2,length2)
        pattern(t,x2,y2,length2,num-1)
        #bottom left
        x2 = x-length/2
        y2 = y-length/2
        t.goto(x2, y2) 
        square(t,x2,y2,length2)
        pattern(t,x2,y2,length2,num-1)
        #bottom right
        x2 = x+length/2   
        y2 = y-length/2
        t.goto(x2, y2) 
        square(t,x2,y2,length2)
        pattern(t,x2,y2,length2,num-1)

##################################################################################################################

t.speed(0) #This should move the turtle at max speed
t.color("black","red") #Sets the outline to black and the fill color to red
t.up() #picks up pen so position can be adjusted without drawing
pattern(t,x,y,length,num) 

s.exitonclick() #closes the turtle graphics window
exit() #closes the console window once the user closes the turtle screen
