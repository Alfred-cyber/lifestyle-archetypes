"""
Reusable data preparation helpers for the lifestyle archetypes project.

Keep functions here small, tested, and imported into notebooks rather than
duplicated across them.
"""

import pandas as pd


def load_raw_data(train_path: str, test_path: str) -> pd.DataFrame:
    """Load and concatenate the raw train and test tables.

    Parameters
    ----------
    train_path, test_path : str
        Paths to the raw Kaggle CSV files.

    Returns
    -------
    pd.DataFrame
        Combined raw dataframe with a `split` column indicating origin.
    """
    train = pd.read_csv(train_path)
    train["split"] = "train"
    test = pd.read_csv(test_path)
    test["split"] = "test"
    return pd.concat([train, test], ignore_index=True)


def summarise_missingness(df: pd.DataFrame) -> pd.DataFrame:
    """Return a per-column missingness summary (count and percentage)."""
    missing = df.isna().sum()
    pct = (missing / len(df) * 100).round(2)
    return pd.DataFrame({"n_missing": missing, "pct_missing": pct}).sort_values(
        "pct_missing", ascending=False
    )


def engineer_features(df: pd.DataFrame) -> pd.DataFrame:
    """Engineer sleep, activity and body composition features.

    Placeholder — implement feature engineering logic here, e.g.:
    - daily sleep duration and variability from actigraphy data
    - activity intensity and consistency measures
    - BMI and related body composition markers
    """
    raise NotImplementedError("Implement feature engineering for this dataset.")
