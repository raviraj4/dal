# setwd("MCA_# setwd("MCA_# setwd("MCA_docs_FY/statistics/R_dir/MCA_R_programming_9/")
# getwd()
# data[,5] # returns all element of 5th col data[row, col]

# raviraj mali
library(ggplot2)
data <- read.csv("Mall_Customers.csv")
summary(data)
dim(data)
tail(data)

# only numeric data
data_num <- data[, sapply(data, is.numeric)]
head(data_num)

# scaling the data 
scaled_data <- scale(data_num)
head(scaled_data)

set.seed(123)

wss <- sapply(1:10, function (k){
  kmeans(scaled_data, centers = k, nstart = 20)$tot.withinss
})

plot(1:10, wss, type="b", pch=15, xlab="K (No of Clusters)", ylab="Within Sum of Squares", main="Elbow Method")

# kmeans -> scaled 
k3 <- kmeans(scaled_data, centers=3, nstart=25)
data$Cluster_Kmeans <- as.factor(k3$cluster)
table(data$Cluster_Kmeans)


pca<-prcomp(scaled_data)
pca_data<-data.frame(pca$x[,1:2], Cluster=data$Cluster_Kmeans)

ggplot(pca_data, aes(PC1, PC2, color=Cluster))+geom_point(size=3)+theme_minimal()+ggtitle("K-Means Clusters (PCA)")



# HAC hierarchical clustering (HAC) 

d <- dist(scaled_data, method="euclidean")
hc <- hclust(d, method="ward.D2")

x11(width = 8, height = 6) # Opens a new window 8x6 inches
plot(hc, labels = FALSE, main = "Heirarchical Clustering Dendrogram (roll-30)")
abline(h = 15, col="red")

dev.off()


data$Cluster_HAC <- cutree(hc, k = 3)
table(data$Cluster_HAC)

pca_data$Cluster_HAC <- as.factor(data$Cluster_HAC)

ggplot(pca_data, aes(PC1, PC2, color=Cluster_HAC))+geom_point(size=3)+theme_minimal()+ggtitle("HAC Clusters (PCA)")
