# Mubashar Khan
# PSID: 1512949
# Homework Project 1

flash_size = float(input("Enter the storage size of your USB (flash) drive in gigabytes (GB): "))
while flash_size <= 0: #Ensuring that the user input for USB size is positive
    flash_size = float(input(" \nThe USB drive storage amount you entered is not possible. Please enter your USB drive storage size: "))

# assuming that all the images have a resolution of 800 x 600 pixels -----> computing how many bytes are in the image
bytesize1 = 800*600   #GIF is one Byte
bytesize2 = 800*600*3 #JPEG is three Bytes
bytesize3 = 800*600*3 #PNG is three Bytes
bytesize4 = 800*600*6 #TIFF is six Bytes

comp_rate_05 = bytesize1/5  #Adjusting for the compression ratio 5:1
comp_rate_25 = bytesize2/25 #Adjusting for the compression ratio 25:1
comp_rate_08 = bytesize3/8  #Adjusting for the compression ratio 8:1
comp_rate_na = bytesize4/1  #Adjusting for the compression ratio 1:1

userByte = flash_size*1000000000

import math #using this to use the floor command

print("\n" + str(math.floor(userByte/comp_rate_05)) + " images in GIF format can be stored\n")
print(str(math.floor(userByte/comp_rate_25)) + " images in JPEG format can be stored\n")
print(str(math.floor(userByte/comp_rate_08)) + " images in PNG format can be stored\n")
print(str(math.floor(userByte/comp_rate_na)) + " images in TIFF format can be stored\n")