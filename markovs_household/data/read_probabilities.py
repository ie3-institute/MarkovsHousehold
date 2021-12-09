import os
import pandas as pd
import numpy as np
from markovs_household.config.config import Configuration


def calculate_probabilities(df, type):
    config = Configuration.parse_config(r"tests\input\config.yaml")
    usage_probability_str = "usage_probability_" + type

    probabilities_df = pd.DataFrame(np.repeat(df.values, 4, axis=0))
    probabilities_df.columns = df.columns

    probabilities_df.insert(0, "spring_weekday", value=(probabilities_df["summer_weekday"] + probabilities_df["winter_weekday"]) / 2)
    probabilities_df.insert(1, "spring_saturday", value=(probabilities_df["summer_saturday"] + probabilities_df["winter_saturday"]) / 2)
    probabilities_df.insert(2, "spring_sunday", value=(probabilities_df["summer_sunday"] + probabilities_df["winter_sunday"]) / 2)
    probabilities_df.insert(6, "autumn_weekday", value=(probabilities_df["summer_weekday"] + probabilities_df["winter_weekday"]) / 2)
    probabilities_df.insert(7, "autumn_saturday", value=(probabilities_df["summer_saturday"] + probabilities_df["winter_saturday"]) / 2)
    probabilities_df.insert(8, "autumn_sunday", value=(probabilities_df["summer_sunday"] + probabilities_df["winter_sunday"]) / 2)

    probabilities_df = probabilities_df / 4 * getattr(config, usage_probability_str)

    return probabilities_df


def import_probabilities(type):
    try:
        df = pd.read_csv(os.path.join("tests/input/probabilities/" + type + ".csv"), sep=";")
        df_switch_on_probabilities = calculate_probabilities(df, type)
    except FileNotFoundError:
        df_switch_on_probabilities = pd.read_csv(os.path.join("tests/input/probabilities/default/" + type + "_default.csv"), sep=";")

    return df_switch_on_probabilities

import_probabilities("stove")
