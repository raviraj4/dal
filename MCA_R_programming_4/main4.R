metadata<-"name: Raviraj Mali, roll: 30"
metadata
setwd("C:/Users/user/Documents/MCA_FY_30_RSM/stats/r-prog")
library(ggplot2)
#1
housing_data <- read.csv("HousingData.csv")

ggplot(data= housing_data[is.finite(housing_data$AGE), ], aes(x=AGE))+
  geom_histogram(binwidth=5, fill="lightyellow", color="black")+
  labs(title="Histogram by Raviraj, 30 of AGE in Boston Housing Dataset", x="AGE", y="Frequency")
#2

metadata
ggplot(data=housing_data, aes(x=factor(RAD), y=AGE, fill=factor(RAD)))+
  geom_boxplot(outlier.colour = "red", outlier.shape = 8)+
  labs(
    title="Grouped BoxPlot of Property Age (AGE) by RAD category by Raviraj, 30",
    x="RAD category",
    y="Property Age (Age)"
  )

#3
metadata
ggplot(data=housing_data, aes(x=RM,y=MEDV))+
  geom_point(color="lightblue")+
  labs(
    title="Scatter plot of avg number of rooms (RM) vs Median Value (MEDV)",
    x = "Avg Number of Rooms (RM)",
    y = "Median Value (MEDV)"
  )

#4 
metadata
ggplot(data=housing_data, aes(x=factor(RAD)))+
  geom_bar(fill="lightcyan", color="black")+
  labs(
    title="Count of Properties in different RAD categories (raviraj, 30)",
    x="RAD Category",
    y="Count"
  )

# unsolved assignment
#1 
metadata
exams<-data.frame(
  exam_scores <- c(55, 67, 72, 80, 68, 90, 74, 61, 77, 85, 95, 88, 76, 54, 92, 79, 83, 70, 60,
                   73,
                   81, 65, 78, 93, 56, 82, 75, 66, 64, 89, 84, 87, 71, 69, 59, 62, 63, 57, 53, 58,
                   91, 86, 50, 52, 48, 47, 46, 94, 51, 49, 44, 45, 100, 99, 97, 96, 98, 43, 42, 41,
                   39, 40, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21,
                   20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1))
library(ggplot2)
ggplot(data=exams, aes(x=exam_scores))+
  geom_histogram(
    binwidth=22,
    color="black",
    fill="lightpink"
  )+
  labs(
    title="Exam Data",
    x="Exam Scores",
    y="Frequency"
  )

#2
metadata
product_sales <- data.frame(
  product = c("Apples", "Bananas", "Oranges", "Grapes", "Pineapples"), sales = c(150, 200, 120, 180, 90)
)
library(ggplot2)
ggplot(data=product_sales, aes(x=product, y=sales))+
  geom_bar(
    stat="identity",
    fill="purple",
    color="black",
    width=.5
  )+
  labs(
    title="Fruit Sales",
    x="Product",
    y="Sales",
    theme_dark()
  )


#3
metadata
library(dplyr)
library(ggplot2)
temp_data <- read.csv("C:/Users/RAVIRAJ/OneDrive/Documents/MCA_docs_FY/statistics/R_dir/MCA_R_programming_4/city_temperature.csv")

monthly_avg_temp <- temp_data %>%
  group_by(Month) %>%
  summarise(avg_temperature = mean(AvgTemperature, na.rm=TRUE))

ggplot(monthly_avg_temp, aes(x=Month, y=avg_temperature))+
  geom_line(color="pink", linewidth=2)+
  geom_point(size=4, shape=16)+
  labs(title="Average Monthly Temperature",
       x="Month",
       y="Temperature (Celsius)")+
  theme_classic()+
    scale_x_continuous(breaks=1:12, labels=1:12)


#4
metadata
monthly_avg_temp <- temp_data %>%
  group_by(Month) %>%
  summarise(avg_temperature = mean(AvgTemperature, na.rm=TRUE))

ggplot(monthly_avg_temp, aes(x=Month, y=avg_temperature))+
  geom_point(color="pink", size=4, shape=16)+
  labs(title="Average Monthly Temperature",
       x="Month",
       y="Temperature (celsius)")+
  theme_dark()+
  scale_x_continuous(breaks=1:12, labels=1:12)

