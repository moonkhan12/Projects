def averageRand(x): #Find the average of a random set of numbers
    from random import randint
    arr = []
    total = 0
    for i in range(x):
        arr.append(randint(0,x))
    total = sum(arr)
    print(arr)
    return (total / x)
x = int(input("enter a value: "))
print(averageRand(x))
