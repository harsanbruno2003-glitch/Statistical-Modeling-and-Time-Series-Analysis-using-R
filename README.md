]# 📊 Statistical Modeling and Time Series Analysis using R

Three classic statistical problems solved end-to-end in R: a Generalized Linear Model, Bayesian parameter estimation, and ARIMA time series forecasting.

![R](https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white)

## 📌 Overview
This project works through three distinct statistical modelling tasks in R, each demonstrating a different inferential approach:

1. **Generalized Linear Model (GLM)** — fitting and interpreting a Gaussian-family GLM, testing variable significance at α = 0.05, generating predictions on a held-out test set, and evaluating via RMSE and a 0.5-threshold confusion matrix
2. **Bayesian Inference** — deriving prior hyperparameters, computing posterior parameters analytically, and estimating the posterior mean from a Gamma posterior distribution
3. **Time Series Forecasting** — converting Apple stock closing prices into a time series, examining ACF/PACF plots on the differenced series, selecting a model via `auto.arima`, and producing a 10-day forecast

## 🛠️ Tools & Technologies
R, RStudio, the `forecast` package (`auto.arima`, ACF/PACF diagnostics)

## 🔍 Approach
- **GLM:** trained on an 80% split, checked significance of predictors, validated predictions against actual values, and converted continuous predictions to binary classification at a 0.5 threshold
- **Bayesian:** worked through the full conjugate-prior derivation by hand in code — prior → posterior → posterior mean as a point estimate
- **Time series:** log-differenced the Apple stock series to achieve stationarity, used ACF/PACF to guide model selection, fit the best ARIMA model automatically, and forecast 10 steps ahead

## 📁 Repository Contents
| File | Description |
|---|---|
| `Harsanbruno ca2 stats.R` | Full R script — all three tasks |
| `ca2 Final report.pdf` | Full write-up with interpretation |

## 👤 Author
**Harsanbruno Maria Joseph Esuraj** — MSc Data Analytics, Dublin Business School
[LinkedIn](https://linkedin.com/in/harsanbruno) · [GitHub](https://github.com/harsanbruno2003-glitch)
