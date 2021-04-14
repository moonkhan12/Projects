# Mubashar Khan
# PSID: 1512949
# Homework Project 3

##################################################################################################################################
def count(i,company_count,booth_count,fulltime_count,fulltime_vs_count,parttime_count,internship_count,Fr_count,Soph_count,Jr_count,Sr_count,Post_Bacs_count,Masters_count,PhD_count,Alumni_count):
    if i == 0:
        return(company_count)
    elif i == 1:
        return(booth_count)
    elif i == 2:
        return(fulltime_count)
    elif i == 3:
        return(fulltime_vs_count)
    elif i == 4:
        return(parttime_count)
    elif i == 5:
        return(internship_count)
    elif i == 6:
        return(Fr_count)
    elif i == 7:
        return(Soph_count)
    elif i == 8:
        return(Jr_count)
    elif i == 9:
        return(Sr_count)
    elif i == 10:
        return(Post_Bacs_count)
    elif i == 11:
        return(Masters_count)
    elif i == 12:
        return(PhD_count)
    elif i == 13:
        return(Alumni_count)
##################################################################################################################################

#Assuming this file is in the same directory as the .csv file

import csv

base_csv = [] #Define the list that will hold the read in value of the csv file

with open('CFSpring2018Employers.csv', newline='') as fin: #Open up the csv file to read
    for row in csv.reader(fin):
        if "BOOTH ORDER" in row:
            break      
        if ",".join(row) == "": #Tried to filter as I read in the file, does nothing
            pass
        else:
            base_csv.append(row)

#Filter the Data:
temp = base_csv[3:][:]
size1 = len(temp)
size2 = len(base_csv[2])

filtered_csv = [] #Define the list that will contain the filtered version of base_csv

for i in range(size1): #Removes any elements of temp that do not contain enough columns of data
    if len(temp[i]) == size2: 
        filtered_csv.append(temp[i])

index_empty_line = 0
for row in filtered_csv: #Removes any element of the filtered_csv that do not have a company name as the first value of the list
    if row[0] == "":
        filtered_csv.pop(index_empty_line) #Removes the empty list
    index_empty_line += 1

#for row in filtered_csv:
#    print(",".join(row))
size1 = len(filtered_csv) #adjust the size of size1 for use later in the program
     
#Defining some counters for use in the 1st output
company_count = 0
booth_count = 0
fulltime_count = 0
fulltime_vs_count = 0
parttime_count = 0
internship_count = 0
Fr_count = 0
Soph_count = 0
Jr_count = 0
Sr_count = 0
Post_Bacs_count = 0
Masters_count = 0
PhD_count = 0
Alumni_count = 0

#Find how many times each of the counts occured in the 1st page of the filtered csv file
for i in range(size1): #Assuming that there are always 14 columns. Not sure how to do this otherwise
    if len(filtered_csv[i]) == size2:
        if filtered_csv[i][0] is not "":
            company_count += 1
        if filtered_csv[i][1].isdigit() or '/' in filtered_csv[i][1]:#Counts the number of booths. Had to use 2 conditions in order to include companies that used multiple booths
            booth_count += 1  
        if filtered_csv[i][2] == 'Yes':#Counts the number of full time jobs
            fulltime_count += 1
        if filtered_csv[i][3] == 'Yes':#Counts the number of full time visa sponser jobs
            fulltime_vs_count += 1 
        if filtered_csv[i][4] == 'Yes':#Counts the number of part time jobs
            parttime_count += 1        
        if filtered_csv[i][5] == 'Yes':#Counts the number of internship
            internship_count += 1  
        if filtered_csv[i][6] == 'Fr':#Counts the number of freshmen students
            Fr_count += 1
        if filtered_csv[i][7] == 'Soph':#Counts the number of sophomore students
            Soph_count += 1
        if filtered_csv[i][8] == 'Jr':#Counts the number of Junior students
            Jr_count += 1
        if filtered_csv[i][9] == 'Sr':#Counts the number of Senior students
            Sr_count += 1
        if filtered_csv[i][10] == 'PB':#Counts the number of Post-Bac students
            Post_Bacs_count += 1
        if filtered_csv[i][11] == 'MS':#Counts the number of Masters students
            Masters_count += 1
        if filtered_csv[i][12] == 'PhD':#Counts the number of PhD students
            PhD_count += 1
        if filtered_csv[i][13] == 'All' or filtered_csv[i][13] == 'Recent':#Counts the number of of Allumni or recent grads
            Alumni_count += 1


#First part of number 4:
fout1 = open('CF-Spring2018-Employers_Summary.csv','w')
fout1.write("No")
fout1.write(",")
fout1.write("Column")
fout1.write(",")
fout1.write("Sum")
fout1.write("\n")
print("No Column Sum")#Prints step 4 on page 3
for i in range(size2):
    sub = count(i,company_count,booth_count,fulltime_count,fulltime_vs_count,parttime_count,internship_count,Fr_count,Soph_count,Jr_count,Sr_count,Post_Bacs_count,Masters_count,PhD_count,Alumni_count)
    print(i,base_csv[2][i],sub)
    fout1.write(str(i))
    fout1.write(",")
    fout1.write(str(base_csv[2][i]))
    fout1.write(",")
    fout1.write(str(sub))
    fout1.write("\n")

#Adding in some more spacing
print("")
print("")
print("")
#Easier to read on the console window

#Second part of number 4:
fout2 = open('CF-Spring2018-Employers_GradUnderGrad.csv','w')
fout2.write("No")
fout2.write(",")
fout2.write("Company")
fout2.write(",")
fout2.write("Grad")
fout2.write(",")
fout2.write("UnderGrad")
fout2.write("\n")
print("No Company Grad UnderGrad")

ungrad_count = 0
grad_count = 0
for i in range(size1):
    if (filtered_csv[i][6] == 'Fr' or filtered_csv[i][7] == 'Soph' or filtered_csv[i][8] == 'Jr' or filtered_csv[i][9] == 'Sr' or filtered_csv[i][10] == 'PB'):
        ungrad = 1
        ungrad_count += 1
    else:
        ungrad = 0
    if (filtered_csv[i][11] == 'MS' or filtered_csv[i][12] == 'PhD'):
        grad = 1
        grad_count += 1
    else:
        grad = 0
    if filtered_csv[i][0] != '': #puts the numbering off by 1(or more) if there is a blank row(s)
        print(i,filtered_csv[i][0],grad,ungrad)
        fout2.write(str(i))
        fout2.write(",")
        fout2.write(str(filtered_csv[i][0]))
        fout2.write(",")
        fout2.write(str(grad))
        fout2.write(",")
        fout2.write(str(ungrad))
        fout2.write("\n")        
print("","Total",grad_count,ungrad_count) #Print totals
fout2.write("")
fout2.write(",")
fout2.write("Total")
fout2.write(",")
fout2.write(str(grad_count))
fout2.write(",")
fout2.write(str(ungrad_count))
fout2.write("\n")

#Close out all files that were opened
fin.close()
fout1.close()
fout2.close()

#END OF PROGRAM

