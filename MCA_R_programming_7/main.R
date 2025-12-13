# setwd("C://Users/RAVIRAJ/OneDrive/Documents/MCA_docs_FY/statistics/R_dir/MCA_R_programming_7/")
# getwd()
#start
myname<-"raviraj mali"
myroll<-30
metadata<- paste("[name:", myname, "] [roll:" , myroll, "]", sep = " ")

metadata

library(ggplot2)
library(Metrics)
library(caTools)

set.seed(42)

metadata
dataset <- read.csv('icecream.csv')

print("SUMMARY")
summary(dataset)
head(dataset)

print("DATA STRUCTURE")
str(dataset)

print("SCATTER PLOT")
print(ggplot(dataset, aes(x=Temperature, y=Revenue))+ geom_point(color="#0072B2", size=3)+ labs(title="ICE CREAM SALES [REV] vs DAILY TEMP [TEMP]", x= "TEMP", y="REV")+theme_minimal()+theme(plot.title = element_text(hjust = 0.5, face="bold")))

metadata
sample.split(dataset$Revenue, SplitRatio = 0.70)-> split_tag
train_data <- subset(dataset, split_tag== TRUE)
test_data <-subset(dataset, split_tag==FALSE)

cat(paste("\nTraining set size:", nrow(train_data), "rows"))
cat(paste("\nTesting set size:", nrow(test_data), "rows\n"))

model <- lm(Revenue ~ Temperature, data = train_data)

summary(model)

print("SCATTER PLOT WITH REG LINE")
print(ggplot(dataset,aes(x=Temperature, y= Revenue))+geom_point(color="#0072B2", size=3)+ geom_smooth(method="lm", col="red", se=TRUE)+ labs(title="Lin Reg Fit (REV ~ TEMP)", x="Temperature", y="Revenue")+theme_minimal()+theme(plot.title=element_text(hjust=0.5, face="bold")))

metadata
new_temp <- data.frame(Temperature=c(22))
predicted_sales<-predict(model, newdata=new_temp)
print(paste("Predicted revenue at 22 cel is: ", round(predicted_sales, 2)))

prediction_test<-predict(model, newdata=test_data)

Rsq_train <- summary(model)$r.squared
rmse_val <- rmse(test_data$Revenue, prediction_test)
mae_val <- mae(test_data$Revenue, prediction_test)


cat(paste("\n==============\nModel Performance on Test Data"))
cat(paste("\nTraining R-squared:", round(Rsq_train, 4)))
cat(paste("\nTest RMSE (Lower is better):", round(rmse_val, 2)))
cat(paste("\nTest MAE (Lower is better):", round(mae_val, 2)))
cat("\n==============")

comparison_df <- data.frame(
  Temperature = test_data$Temperature,
  Actual_Revenue = test_data$Revenue,
  Predicted_Revenue = prediction_test,
  Error_Difference = test_data$Revenue - prediction_test
)


print("--- Individual Prediction Comparison (First 10 Test Samples) ---")
print(head(comparison_df, 10))

print("RESIDUAL vs FITTED VALS ")
#dev.new(width = 7, height = 7)
plot(model, which = 1)
residuals<- residuals(model)



print("HISTOGRAM")
png("residuals_hist.png", width = 800, height = 800)
hist(residuals, main = "Hist Of Residuals", xlab = "RESIDUALS", col = "lightblue", border = "white")
dev.off()
results <- data.frame(Actual=test_data$Revenue, Predicted=prediction_test)

print("Q-Q Plot of Residuals")
plot(model, which = 2)

print("ACTUAL vs PREDICTED")

print(ggplot(results, aes(x=Actual, y=Predicted))+ geom_point(color="#D55E00", size=3)+geom_abline(intercept=0, slope=1, linetype="dashed", color="black")+ labs(title="Actual vs Predicted Revenue (test set)", x = "Actual Revenue", y="Predicted Revenue")+theme_minimal()+theme(plot.title = element_text(hjust=0.5, face="bold")))

