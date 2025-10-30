# 1st Question

# Load the inbuilt dataset
infert_data <- infert
print(head(infert_data))

# (a) Train the model (80% training)
set.seed(123)
train_indices <- sample(1:nrow(infert_data), size = 0.8 * nrow(infert_data))
training_set <- infert_data[train_indices, ]
testing_set <- infert_data[-train_indices, ]

# Fitting a GLM model (Gaussian family)
model_glm <- glm(case ~ parity + age + spontaneous + induced, 
                 data = training_set, 
                 family = gaussian())

# Print the summary
summary_output <- summary(model_glm)
print(summary_output)

# (b) Significant variables at the level of alpha = 0.05
coeff_table <- summary_output$coefficients
significant_vars <- coeff_table[coeff_table[, 4] < 0.05, ]
print("Significant Variables (p < 0.05):")
print(significant_vars)

# (c) Predict the output of test dataset
predictions_glm <- predict(model_glm, testing_set)
print("Predicted Values:")
print(predictions_glm)

# Actual values
actual_values <- testing_set$case
print("Actual Values:")
print(actual_values)

# Compare predictions vs actual
comparison_df <- data.frame(Actual = actual_values, Predicted = predictions_glm)
print("Comparison:")
print(comparison_df)

# Calculate RMSE
rmse_value <- sqrt(mean((predictions_glm - actual_values)^2))
print(paste("RMSE:", rmse_value))

# (d) Classification using 0.5 threshold
classified_preds <- ifelse(predictions_glm > 0.5, 1, 0)
true_classes <- testing_set$case

# Confusion Matrix
conf_matrix_alt <- table(Predicted = classified_preds, Actual = true_classes)
print("Confusion Matrix:")
print(conf_matrix_alt)

# Accuracy
accuracy_score <- sum(classified_preds == true_classes) / length(true_classes)
print(paste("Accuracy:", accuracy_score))

# 2 nd question

# a) Given data in the question
X <- c(1, 3, 2, 2, 0, 3, 4, 3, 2, 1)
n <- length(X)
sum_x <- sum(X)
print(sum_x)

# b) Prior hyperparameters
alpha <- 2
beta <- 1

# c)  Posterior parameters
alpha_post <- alpha + sum_x
beta_post <- beta + n

# d) Posterior distribution is Gamma(alpha_post, beta_post)
posterior_mean <- alpha_post / beta_post

cat("Posterior: Gamma(", alpha_post, ",", beta_post, ")\n")
cat("Bayesian estimator (posterior mean):", posterior_mean, "\n")

# 3rd question


library(tidyquant)
library(tseries)
library(forecast)
library(quantmod)

# Load the Apple (AAPL) stock price data
getSymbols("AAPL", from = "2020-01-01", src = "yahoo")

#  closing prices and convert to time series
closing_prices <- Cl(AAPL)
aapl_ts <- ts(closing_prices, frequency = 252)

## (a) Check for stationariers
plot(aapl_ts, col = "darkred", main = "Apple Closing Prices", ylab = "Price")

# Apply differencing and log transformation
ts_diff <- diff(aapl_ts)
log_ts_diff <- diff(log(aapl_ts))

# Plot log diference
plot(log_ts_diff, col = "orange", main = "Log-Differenced Apple Price", ylab = "Log Difference")

## (b) ACF and PACF plots in the diffrence
acf(log_ts_diff, col = "navy", main = "ACF - Log Differenced")
pacf(log_ts_diff, col = "brown", main = "PACF - Log Differenced")

## (c) the  ARIMA model selected
best_model <- auto.arima(log_ts_diff, seasonal = FALSE)
best_model

## (d) Forecast 10 steps of future and plot
forecast_10 <- forecast(best_model, h = 10)
plot(forecast_10, col = "darkgreen", main = "10-Day Forecast of Apple Stock")
