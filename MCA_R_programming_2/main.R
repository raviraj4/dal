
mystring<-"Raviraj Mali Div: B roll-30"
setwd("C:/Users/RAVIRAJ/OneDrive/Documents/MCA_docs_FY/statistics/R_dir/MCA_R_programming_2")
#1
RavirajData<-mtcars
head(RavirajData)
RavirajData = RavirajData[1:6, 1:5]
RavirajData

#2
require(dplyr)
RavirajData1 = rename(RavirajData, horse_power = hp)
print(RavirajData1)

#3
RavirajData1$new_hp1 <- RavirajData1$horse_power*0.5
colnames(RavirajData1)

#4
RavirajTable = read.table(file="C:/Users/user/Documents/MCA_FY_30_RSM/stats/r-prog/missing_col1.csv", sep=",")
RavirajTable

RavirajTable = read.csv(file= "C:/Users/user/Documents/MCA_FY_30_RSM/stats/r-prog/missing_col1.csv", col.names=c("Sno", "NAME", "SALARY", "DATEOFJOIN", "DEPT"))
RavirajTable
#5
mystring
NA+4
#6 and #7
RavirajVector <- c(1,2,NA,3)
RavirajVector
median(RavirajVector)
#8
median(RavirajVector)
median(RavirajVector, na.rm=T)
#9
is.na(RavirajVector)
#10
ravirajNavals <- is.na(RavirajVector)
ravirajNavals 
RavirajVector[!ravirajNavals]
#11 
RavirajVector[complete.cases(RavirajVector)]
#12
RavirajNaData <- read.csv(file="C:/Users/user/Documents/MCA_FY_30_RSM/stats/r-prog/missing_col1.csv", na.strings="")
RavirajCompleteCases<- RavirajNaData[complete.cases(RavirajNaData),]
RavirajCompleteCases
#13
#install.packages("Hmisc", repos = "https://cran.r-project.org")
install.packages("Hmisc")
library(Hmisc)
RaviMeanImputation = c(1,2,3,NA, 4,4, NA)
RaviMeanImputation <-  impute(RaviMeanImputation, fun = mean)
RaviMeanImputation
RaviMedianImpute <- impute(RaviMeanImputation, fun=median)
RaviMedianImpute

#14 
Ravigender_vector <- c("Male", "Female", "Male", "Male")
class(Ravigender_vector)
Ravi_factorgendervector <- factor(Ravigender_vector)
class(Ravi_factorgendervector)

#15 
day_vector<-c('evening', 'morning', 'afternoon', 'midday', 'midnight', 'evening')
factor_day <- factor(day_vector, order=TRUE, levels=c('morning', 'midday', 'afternoon', 'evening', 'midnight'))
factor_day
 
#16
age <-c(40,49, 48, 40, 67, 52, 53)
salary <- c(103200, 106200, 150200, 10606,10390, 14070, 10220)
gender <- c("male", "male", "transgender", "female", "male", "female", "transgender")
employee <- data.frame(age, salary, gender)
employee
wfact = cut(employee$age, 3, labels=c('Young', 'Medium', 'Age'))
table(wfact)


#assignment
#1
mystring
library(dplyr)
employee_df<-data.frame(
  emp_id = c(1,2,3),
  emp_name = c("Ravi", "Ankit", "Ashish"),
  age = c(30,25,28),
  salary = c(50000, 60000, 70000)
)
print(employee_df)
rename(name=emp_name, ID=emp_id)
print(employee_df)


new_column_names <- colnames(employee_df)
print(new_column_names)

#2 
mystring
student_df <- data.frame(
  StudentID = c(1,2,3,4),
  Name = c("Raviraj", "Ashish", "Aditya", "Shyama"),
  Marks = c(96, 83, 91, 90)
)
print(student_df)
library(dplyr)
colnames(student_df) <- tolower(colnames(student_df))
print(student_df)

student_df$Grade <- "B" # def grade
student_df$Grade[student_df$marks>90] <- "A"
print(student_df)

#3 
data(mtcars)
mtcars$performance <-"Low"
mtcars$performance[mtcars$hp>150] <- "High"
write.csv(mtcars, "updated_mtcars.csv", row.names = FALSE)
head(mtcars, 6)
#read.csv(file ="updated_mtcars.csv", sep = ",")

#4
mystring
sales_data <- data.frame(
  Product = c("Product A", "Product B", "Product C"),
  Sales = c(1200, 800, 1500),
  Region = c("North", "South", "East")
)

sales_data$Sales_Category <- "Low" 
sales_data$Sales_Category[sales_data$Sales > 1000] <- "High"
print(sales_data)

#5
mystring
survey_data <- data.frame(
  ID = 1:5,
  age = c(25, NA, 30, 22, NA),
  gender =c("M", "F", NA, "M", "F"),
  income = c(50000, 60000, NA, 45000, 70000)
)
missing_values <- colSums(is.na(survey_data))
print(missing_values)

survey_data$age <- as.numeric(survey_data$age)
mean_age <- mean(survey_data$age, na.rm= TRUE)
survey_data$age[is.na(survey_data$age)]<- mean_age
print(survey_data)
mystring
survey_data <- survey_data[rowSums(is.na(survey_data))<=2, ]
survey_data <- survey_data[complete.cases(survey_data),]
print(survey_data)

#6
mystring

customer_data <- data.frame(
  CustomerID = 1:10,
  Name = c("Ravi", "Ankit", "Shivam", "Anil", NA, "Boman", "Nitin", "Parikshit", NA, "Mera"),
  Age = c(25,NA,30,22, NA, NA,35,28,27,24),
  Gender = c("M", "M", "M", NA, "F", "M", "F", NA, "F", "F"),
  Income = c(50000, NA, 60000, NA, NA, 70000, 80000, NA, 90000,100000)
)

print("Original Dataset: ")
print(customer_data)
customer_data <- na.omit(customer_data)
print(customer_data)
threshold <- 0.5*nrow(customer_data) # setting threshold by (1/2)* no of rows
missing_counts <- colSums(is.na(customer_data)) # counting missing values
customer_data <- customer_data[, missing_counts<= threshold]
print("Cleaned Dataset")
print(customer_data)

#7 
mystring
employees <- data.frame(
  Name = c("ravi", "raj", "nitin", "ramesh", "rohit"), 
  Position = c("Analyst", "Clerk", "Manager", "Clerk", "Analyst")
)
print("Original Dataset")

print(employees)
employees$Position <- factor(employees$Position)
employees$Position <- factor(employees$Position, levels = c("Manager", "Analyst", "Clerk"))
employees <- employees[order(employees$Position), ]
print(employees)

#8 
mystring
survey_data <- data.frame(ID=1:5, Gender=c("Male", "Female", "Male", "Female", "Male"))
survey_data$Gender <- factor(survey_data$Gender)
print(survey_data)

survey_data$Gender_Male <- 0
survey_data$Gender_Male[survey_data$Gender == "Male"] <- 1
survey_data$Gender_Female <- 0
survey_data$Gender_Female[survey_data$Gender == "Female"] <- 1
print(survey_data)

#9
data(iris)
setosa_data <- iris[iris$Species == "setosa",]
head(setosa_data)

mystring
setosa_subset <- setosa_data[, c("Sepal.Length", "Sepal.Width", "Species")]
# print(setosa_subset)
head(setosa_subset)

#10
mystring
filtered_cars <- mtcars[mtcars$mpg > 25 & mtcars$hp < 150,] 
print(filtered_cars)
subset_cars <- filtered_cars[, c("mpg", "hp", "gear")]
print(subset_cars)
