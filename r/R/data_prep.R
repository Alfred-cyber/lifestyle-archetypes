# Reusable data preparation helpers for the lifestyle archetypes project.
# Keep functions here small, tested, and sourced into notebooks rather than
# duplicated across them.

library(readr)
library(dplyr)

#' Load and combine the raw train and test tables.
#'
#' @param train_path Path to the raw Kaggle train CSV.
#' @param test_path Path to the raw Kaggle test CSV.
#' @return A combined dataframe with a `split` column indicating origin.
load_raw_data <- function(train_path, test_path) {
  train <- read_csv(train_path) %>% mutate(split = "train")
  test <- read_csv(test_path) %>% mutate(split = "test")
  bind_rows(train, test)
}

#' Summarise missingness per column (count and percentage).
#'
#' @param df A dataframe.
#' @return A dataframe with n_missing and pct_missing per column, sorted descending.
summarise_missingness <- function(df) {
  n_missing <- colSums(is.na(df))
  pct_missing <- round(n_missing / nrow(df) * 100, 2)
  result <- data.frame(
    column = names(df),
    n_missing = n_missing,
    pct_missing = pct_missing,
    row.names = NULL
  )
  result[order(-result$pct_missing), ]
}

#' Engineer sleep, activity and body composition features.
#'
#' Placeholder — implement feature engineering logic here, e.g.:
#' - daily sleep duration and variability from actigraphy data
#' - activity intensity and consistency measures
#' - BMI and related body composition markers
#'
#' @param df A combined raw dataframe.
#' @return A dataframe of engineered features.
engineer_features <- function(df) {
  stop("Implement feature engineering for this dataset.")
}
