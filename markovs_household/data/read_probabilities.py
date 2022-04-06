import os
import pandas as pd
import numpy as np
from markovs_household.data.usage_probabilities import UsageProbabilities


def import_probabilities(type, config):

    df = pd.read_csv(os.path.join(config.switch_on_probabilities_datapath + "/" + type + ".csv"), sep=";")

    probabilities_df = pd.DataFrame(np.repeat(df.values, 4, axis=0))
    probabilities_df.columns = df.columns

    probabilities_df.insert(0, "spring_weekday",
                            value=(probabilities_df["summer_weekday"] + probabilities_df["winter_weekday"]) / 2)
    probabilities_df.insert(1, "spring_saturday",
                            value=(probabilities_df["summer_saturday"] + probabilities_df["winter_saturday"]) / 2)
    probabilities_df.insert(2, "spring_sunday",
                            value=(probabilities_df["summer_sunday"] + probabilities_df["winter_sunday"]) / 2)
    probabilities_df.insert(6, "autumn_weekday",
                            value=(probabilities_df["summer_weekday"] + probabilities_df["winter_weekday"]) / 2)
    probabilities_df.insert(7, "autumn_saturday",
                            value=(probabilities_df["summer_saturday"] + probabilities_df["winter_saturday"]) / 2)
    probabilities_df.insert(8, "autumn_sunday",
                            value=(probabilities_df["summer_sunday"] + probabilities_df["winter_sunday"]) / 2)

    probabilities_df = probabilities_df / 4 * UsageProbabilities.get_usage_probability(type, config)

    if config.switch_on_probabilities_savepath is not None:
        probabilities_df.to_csv(
            config.switch_on_probabilities_savepath + r"\\switch_on_probabilities_calculated_" + type + r".csv")

    return probabilities_df
