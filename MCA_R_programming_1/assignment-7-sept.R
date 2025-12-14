mystring<-"Raviraj Mali RollNo:__ DIV:B"
mystring
#33 (2)
write.csv(data_from_sheet2, "exported_data.csv", row.names = FALSE) 
exportedData=read.csv("exported_data.csv") 
head(exportedData) 

#33
library(readxl)
data_from_sheet2 <- read_excel("RavirajDataSheet.xlsx", sheet = 1)
head(data_from_sheet2)

#32 (2)
df_loaded <- read.csv("output.csv") 
print(df_loaded) 
#32 (1)
df <- data.frame( 
  Name = c("Raviraj", "Ashish", "Ankit", "Aditya"), 
  Age = c(21, 22, 21,22), 
  Score = c(15, 20, 18, 17) 
) 
write.csv(df, "output.csv", row.names = FALSE) 
read.csv("output.csv") 

#31 (2)
grades_data <-read_excel("grades.xlsx", sheet=1)
print(grades_data)
#31
install.packages("readxl")  
library(readxl) 
#30 (2)
str(students_data)
#30 (1)
list.files()
students_data<-read.csv("students.csv")
print(students_data)
#29 (1)
data_frame <-read.table(
  text="
  Name Age Score
  Raviraj 21 85
  Ashish 24 87
  Ankit 22 90
  ", header=TRUE, stringsAsFactors=FALSE)
print(data_frame)
#28 (2)
sum_of_numbers <- sum(my_numbers)
print(sum_of_numbers)
#28
my_numbers <- scan()
#27 (1)
mean_mpg <- mean(mtcars$mpg)
print(mean_mpg)
#26 (3)
detach(mtcars)
exists("mtcars")
#26 (2)
mean_mpg <- mean(mpg)
print(mean_mpg)

#26 (1)
attach(mtcars)
exists("mtcars")
#25 (2)
rm(iris)
exists("iris")

#25 
data("iris")
exists("iris")
#24 (2)iris#24 (2)
data("CO2")
#24 (1)
data()

#23 (3)
write.csv(combined_data, "combined_data.csv", row.names = FALSE)
read.csv("combined_data.csv")
#23 (2)
combined_data <- rbind(data1, data2)
print(combined_data)
#23 
list.files()
data1<-read.csv("part1.csv")
print(data1)
data2<-read.csv("part2.csv")
print(data2)
#22 (2)
save(results, file = "results.RData")
load("results.RData")
print(results)
#22 (1)
results <- matrix(c(11,12,31,40,15,6,27,28,39), nrow=3, ncol=3)
print(results)
write.csv(results, "results.csv", row.names = FALSE)
#21 (2)
write.table(students_data, "marks.txt", sep= "\t", row.names = FALSE)
read.table("marks.txt")

#21
students_data <- data.frame(
  StudentID = c(17, 18, 19),
  Name = c("Raviraj", "Smit", "Shivam"),
  Marks=c(85,90, 78)
  )
write.csv(students_data, "marks.csv", row.names = FALSE)
read.csv("marks.csv")
#20 (2)
students_data <- read.csv("students_2.csv")
str(students_data)
#20
df <- data.frame(
  Name = c("Raviraj", "Ashish", "Ankit"),
  Age = c(21,24,22),
  Grade = c('A','A','A')
)

write.csv(df, "students_2.csv", row.names=FALSE)
read.csv("students_2.csv")
#19 (3)
read.table("Ravirajdata.txt", sep="\t", header=TRUE)
#19 (2)
head(students_data)
#19 (1)
setwd("C:/Users/RAVIRAJ/OneDrive/Documents/MCA_docs_FY/R_dir/MCA_R_programming") 
students_data <- read.csv("students.csv")
students_data
#18 (4)
Age = c(23,22)
df1 = cbind.data.frame(df1, Age)
print(df1)
#18 (3)
RavirajDataFrame = rbind(df1, df2)
print(RavirajDataFrame)
#18 (2)
name <- c('Charlie', 'David')
Score <- c(88, 95)
df2=data.frame(Name=name, Score= Score)
print(df2)
#18
name <- c('Alice', 'Bob')
Score <- c(85, 90)

df1 = data.frame(Name=name, Score=Score)
print(df1)

#17 (4)
rbinding = rbind(a, b)
print(rbinding)
#17 (3)
cbinding = cbind(a, b)
print(cbinding)
#17 (2)
b = matrix(c(7,8,9,10,11,12), nrow=2, ncol=3)
print(b)
#17 (1)
a = matrix(c(1,2,3,4,5,6), nrow=2, ncol=3)
print(a)

#16
filtereddata=csvdata[csvdata$Weight>=70,]
print(filtereddata)
write.csv(filtereddata, "filtered_small_file.csv")
#2
sum(csvdata$Weight<65)
#1
print(csvdata$Weight<65)
#15 b
print(csvdata$Weight)
#2)
mean(csvdata$Height)
#1)
print(csvdata[3,])
#15 a
names<-c("Raviraj", "Shyama", "Ankit", "Smit", "Ashish", "Shivam", "Balaji")
height <- c(170, 175, 156, 165, 167, 187, 146) 
weight <- c(85, 86, 68, 74, 78, 73, 63)
data<-data.frame(Name=names, Height=height, Weight=weight)
write.csv(data, "small_file.csv", row.names=FALSE)
csvdata<-read.csv("small_file.csv")
print(csvdata)
#14
setwd("C:/Users/RAVIRAJ/OneDrive/Documents/MCA_docs_FY/R_dir/MCA_R_programming")
getwd()
#13
mouse.info = data.frame(color= mouse.color, weight= mouse.weight)
print(mouse.info)
print(mouse.info[3,])
print(mouse.info[, 1])
print(mouse.info[4,1])
#12
mouse.weight = c(12,15,12.5,18)
print(mouse.weight)
#11
print(mouse.color[2])
#10
mouse.color = c("Yellow", "Red", "Green", "Black")
print(mouse.color)
#9
result[10:30]
#8
result[c(5,10,15,20)] 
#7 
result = seq(from=2, by=3, length.out=100)
#6
result = vec1-vec2
print(result)
#5
5:9 -> vec2
print(vec2)
#4
vec1=c(2,5,8,12)
print(vec1)
#3
result<-sqrt(2345)
print(result)
log2(result)
#2
x<-39
y<-22
z=x-y
print(z)
#1
print(31*78)
print(697/41)