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

    if not(os.path.isdir(r"tests\\input\\probabilities\\" + config.switch_on_probabilities_folder)):
        os.mkdir(r"tests\\input\\probabilities\\" + config.switch_on_probabilities_folder)

    probabilities_df.to_csv(r"tests\\input\\probabilities\\" + config.switch_on_probabilities_folder + r"\\" + type + r".csv")

    return probabilities_df


def import_probabilities(type, config):

        df = pd.read_csv(os.path.join(config.switch_on_probabilities_path + "/" + type + ".csv"), sep=";")



            if not(config.switch_on_probabilities_folder):
            df_switch_on_probabilities = pd.read_csv(os.path.join("tests/input/probabilities/default/" + type + "_default.csv"), sep=";")
            print("defaukt")
        else:
            df_switch_on_probabilities = pd.read_csv(os.path.join("tests/input/probabilities/" + config.switch_on_probabilities_folder + r'/' + type + ".csv"), sep=";")
            print("berechnet")

    return df_switch_on_probabilities


config = Configuration.parse_config(r"tests\input\config.yaml")
type = "freezer"
df = pd.read_csv(os.path.join(config.switch_on_probabilities_path + "/" + type + ".csv"), sep=";")
print(df)
# import_probabilities("freezer")
