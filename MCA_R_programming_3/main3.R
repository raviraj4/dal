#1
data <- c(22, 30, 35, 40, 42, 45, 50, 55, 60, 65) 
hist(data, main = "Histogram Example", xlab = "Values", col = "yellow", border = "red", breaks = 5) 
#2
data <- c(22, 30, 35, 40, 42, 45, 50, 55, 60, 65) 
boxplot(data, main = "Boxplot Example",
col = "lightyellow", horizontal = TRUE) 
#3
categories <- c("Category A", "Category B", "Category C") 
values <- c(10, 20, 30) 
barplot(values, names.arg = categories, main = "Bar Chart Example (raviraj, 30)", col = "lightyellow")
#4
x <- 1:10 
y <- x^2
plot(x, y, type = "l", main = "Line Graph Example (raviraj, 30)", xlab = "Time", ylab = "Value", col = "green")
#5
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)
 
plot(x, y, main = "Scatterplot Example (raviraj, 30)", xlab = "X-Axis",ylab = "Y-Axis", col ="red")
#6
data <- c(10, 70, 30)

labels <- c("Category X", "Category Y", "Category Z") # Create a pie chart
custom <-c("#BE2A3E", "#EC754A", "#EACF65", "#3C8D53")
pie(data, labels = labels, main = "Pie Chart Example", col = custom)


# ass 1
student_scores <- read.csv("student_scores.csv")

hist(student_scores$Scores, main = "Distribution of Student Scores  (raviraj , 30)", xlab = "Test Scores", ylab = "Frequency")

hist(student_scores$Scores, breaks = 10, col = "lightyellow", border = "black", main = "Distribution of Student Scores  (raviraj , 30)", xlab = "Test Scores", ylab = "Frequency", xlim = c(0, 100))

# ass 2
student_data <- read.csv("student_scores_gg.csv") 
mycolor<- c("#FFA990", "#008080", "#1E956F", "#FF7780")

boxplot(
  student_data$score, 
  main = "Boxplot of Student Scores (raviraj, 30)", 
  ylab = "Test Scores")

boxplot(
  score ~ school, 
  data = student_data, 
  main = "Boxplot of Student (raviraj, 30)", 
  ylab = "School", 
  xlab = "Test Scores", 
  col = mycolor, 
  horizontal = TRUE)

#3

activities <- c("Sports", "Language", "Drama", "Debate", "Chess", "Music") 
percentages <- c(30, 20, 15, 10, 5, 20)

barplot(percentages,
names.arg = activities,
main = "Participation in Extracurricular Activities (raviraj, 30)", xlab = "Activities",
ylab = "Number of Students")

bar_positions <- barplot(percentages,
names.arg = activities,
main = "Participation in Extracurricular Activities", xlab = "Number of Students",
ylab = "Activities", col = "lightyellow",
las = 2, horiz = TRUE)
text(x = percentages,
     y = bar_positions,
     label = percentages,
     pos = 4, cex = 0.8, col = "black")
#4
studentData<-read.csv("Students_Grade.csv")

plot(studentData$Hours, studentData$Scores, type = "o",
     main = "Scores vs Hours of Study (raviraj, 30)", xlab = "Hours of Study",
     ylab = "Scores")

plot(studentData$Hours, studentData$Scores,
type = "o",
main = "Scores vs Hours of Study (raviraj , 30)", xlab = "Hours of Study",
ylab = "Scores",
col = "lightpink",	lwd = 2,	
pch = 16,	ylim = c(0, 100),
) 


points(studentData$Hours, studentData$Scores, col = "black", pch = 16)

#5
data <- read.csv("employee_performance.csv")

plot(data$HoursWorked, data$PerformanceRating, main = "Employee Performance Scatter Plot (ravi,30)", xlab = "Hours Worked per Week",
     ylab = "Performance Rating")

plot(
  data$HoursWorked, 
  data$PerformanceRating, 
  main = "Employee Performance Scatter Plot (ravi,30)", 
  xlab = "Hours Worked per Week",
  ylab = "Performance Rating",
  pch = 19,	col = "red")	
#6
activities <- c("Sports", "Language", "Drama", "Debate", "Chess", "Music") 
percentages <- c(30, 20, 15, 10, 5, 20)
pie(
percentages,
labels = activities,
main = "Participation in Extracurricular Activities (ravi,30)", 
col =length(activities))

percent_labels <- paste(
  activities, "\n", percentages, "%", sep = "") 
pie(percentages, labels = percent_labels, main = "Participation in Extracurricular Activities (ravi,30)", col = rainbow(length(activities)))

library(plotrix)

activities <- c("Sports", "Language", "Drama", "Debate", "Chess", "Music")
percentages <- c(30, 20, 15, 10, 5, 20)
percent_labels <- paste(activities, "\n", percentages, "%", sep = "")

pie3D(percentages,
      labels = percent_labels,
      main = "3D Participation in Extracurricular Activities (ravi,30)",
      explode = 0.2,
      col = rainbow(length(activities)),
      cex = 0.8)
mystring<-"raviraj"
