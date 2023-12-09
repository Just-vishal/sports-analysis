

library(tidyverse)
library(caret)
library(randomForest)
library(readxl)
# Read the FIFA 19 player dataset
fifa_data <- read.csv("C:\\Users\\justvishal\\Downloads\\archive\\Book1.csv")

# Data cleaning and preprocessing (if needed)
# For simplicity, we'll focus on numeric features and remove non-numeric ones
numeric_features <- select_if(fifa_data, is.numeric)

# Split the data into training and testing sets
set.seed(123)
train_index <- createDataPartition(numeric_features$Overall, p = 0.8, list = FALSE)
train_data <- numeric_features[train_index, ]
test_data <- numeric_features[-train_index, ]

# Define the predictive features (X) and the target variable (y)
X_train <- subset(train_data, select = -c(Overall))
y_train <- train_data$Overall
X_test <- subset(test_data, select = -c(Overall))
y_test <- test_data$Overall

# Train a random forest regression model
rf_model <- randomForest(X_train, y_train, ntree = 100)

# Make predictions on the test set
predictions <- predict(rf_model, X_test)

# Evaluate the model performance
rmse <- sqrt(mean((predictions - y_test)^2))
cat("Root Mean Squared Error:", rmse, "\n")

# Feature importance plot
varImpPlot(rf_model)

# You can further fine-tune the model, try different algorithms, and explore additional features.

# Save the trained model (optional)
saveRDS(rf_model, "rf_model.rds")

