if(!require('arules')) install.packages('arules')
library(arules)
metadata<- "raviraj"
get_apriori_parameters <- function() {
  cat("=== APRIORI ALGORITHM PARAMETER INPUT ===\n\n")
  
  # Get support value
  support <- as.numeric(readline(prompt = "Enter minimum support (0.0 to 1.0, e.g., 0.5 for 50%): "))
  while(is.na(support) || support < 0 || support > 1) {
    cat("Invalid input! Please enter a number between 0 and 1.\n")
    support <- as.numeric(readline(prompt = "Enter minimum support (0.0 to 1.0): "))
  }
  
  # Get confidence value
  confidence <- as.numeric(readline(prompt = "Enter minimum confidence (0.0 to 1.0, e.g., 0.7 for 70%): "))
  while(is.na(confidence) || confidence < 0 || confidence > 1) {
    cat("Invalid input! Please enter a number between 0 and 1.\n")
    confidence <- as.numeric(readline(prompt = "Enter minimum confidence (0.0 to 1.0): "))
  }
  
  # Get minlen value
  minlen <- as.integer(readline(prompt = "Enter minimum rule length (e.g., 2 for pairs): "))
  while(is.na(minlen) || minlen < 1) {
    cat("Invalid input! Please enter a positive integer.\n")
    minlen <- as.integer(readline(prompt = "Enter minimum rule length: "))
  }
  
  # Get maxlen value
  maxlen <- as.integer(readline(prompt = "Enter maximum rule length (e.g., 3): "))
  while(is.na(maxlen) || maxlen < minlen) {
    cat("Invalid input! Please enter an integer greater than or equal to minimum length.\n")
    maxlen <- as.integer(readline(prompt = "Enter maximum rule length: "))
  }
  
  return(list(
    support = support,
    confidence = confidence,
    minlen = minlen,
    maxlen = maxlen
  ))
}

if(!file.exists("apriori_data.csv")) {
  cat("apriori_data.csv not found. Creating sample dataset...\n")
  create_sample_dataset()
}

ap_data <- read.csv("apriori_data.csv")

cat("First few rows of the dataset:\n")
head(ap_data)

cat("\nDataset summary:\n")
cat("Number of transactions:", length(unique(ap_data$Transaction)), "\n")
cat("Number of unique products:", length(unique(ap_data$Product)), "\n")
cat("Total records:", nrow(ap_data), "\n\n")

trans <- split(ap_data$Product, ap_data$Transaction)
trans <- as(trans, "transactions")

cat("Transactions summary:\n")
summary(trans)

params <- get_apriori_parameters()

cat("\nRunning Apriori algorithm with your parameters...\n")
rules <- apriori(trans,
                 parameter = list(
                   support = params$support,
                   confidence = params$confidence,
                   minlen = params$minlen,
                   maxlen = params$maxlen
                 ))

# results
cat("Number of rules found:", length(rules), "\n\n")

if(length(rules) > 0) {
  # Display rules sorted by confidence
  rules_sorted <- sort(rules, by = "confidence", decreasing = TRUE)
  cat("Top association rules (sorted by confidence):\n")
  inspect(rules_sorted)
  
  # Additional insights
  cat("\nADDITIONAL INSIGHTS->\n")
  cat("Rules by different metrics:\n\n")
  
  # Top by lift
  rules_by_lift <- sort(rules, by = "lift", decreasing = TRUE)
  cat("Top 5 rules by LIFT (strength of association):\n")
  inspect(head(rules_by_lift, 5))
  
  # Top by support
  rules_by_support <- sort(rules, by = "support", decreasing = TRUE)
  cat("\nTop 5 rules by SUPPORT (frequency):\n")
  inspect(head(rules_by_support, 5))
  
} else {
  cat("No rules found with the current parameters.\n")
  cat("Try lowering support or confidence values.\n")
}

