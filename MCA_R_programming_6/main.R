create_sample_dataset <- function(filename = "apriori_data.csv") {
  # Create sample grocery transaction data
  set.seed(123)
  
  # Sample products
  products <- c("Milk", "Bread", "Butter", "Eggs", "Cheese", "Yogurt", 
                "Apple", "Banana", "Orange", "Tomato", "Potato", "Onion",
                "Chicken", "Beef", "Fish", "Rice", "Pasta", "Cereal",
                "Coffee", "Tea", "Juice", "Soda", "Water", "Beer",
                "Shampoo", "Soap", "Toothpaste", "Detergent")
  
  # Generate transactions
  transactions_data <- data.frame()
  transaction_id <- 1
  
  # Create 100 transactions
  for(i in 1:100) {
    # Random number of items per transaction (2-6 items)
    n_items <- sample(2:6, 1)
    items <- sample(products, n_items, prob = runif(length(products), 0.3, 1))
    
    for(item in items) {
      transactions_data <- rbind(transactions_data,
                                 data.frame(Transaction = transaction_id,
                                            Product = item))
    }
    transaction_id <- transaction_id + 1
  }
  
  write.csv(transactions_data, filename, row.names = FALSE)
  cat("Sample dataset created:", filename, "\n")
  cat("Total transactions:", max(transactions_data$Transaction), "\n")
  cat("Total records:", nrow(transactions_data), "\n")
  
  return(transactions_data)
}
create_sample_dataset()
