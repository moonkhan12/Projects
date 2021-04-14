import random
i = random.randint(0,10)
while 1:
    n = int(input("Enter a number between 1 and 10: "))
    if n < i:
        print("too low")
    elif n > i:
        print("too high")
    elif n == i:
        print("Yes that is the right number")
        break
