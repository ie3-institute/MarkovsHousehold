import os

import pandas as pd

from markovs_household.data.probability import SwitchOnProbabilityKey
from markovs_household.utils.appliance import ApplianceCategory
from markovs_household.utils.time import DayType, Season


def read_usage_probabilities(path: str) -> dict[ApplianceCategory, float]:
    df_usage_probabilities = pd.read_csv(path, sep=";", index_col="appliance_category")
    usage_probability_dict = df_usage_probabilities.to_dict()["usage_probability"]
    for category in ApplianceCategory:
        if category.value not in usage_probability_dict:
            raise ValueError(
                "No switch on probability with name {} found in file {}.".format(
                    category.value, path
                )
            )
        usage_probability_dict[category] = usage_probability_dict.pop(category.value)
    return usage_probability_dict


def read_switch_on_probablities(
    cat: ApplianceCategory,
    path: str,
    usage_prob: float,
) -> dict[SwitchOnProbabilityKey, float]:
    probabilities_df = pd.read_csv(
        os.path.join(path + "/" + cat.value + ".csv"), sep=";"
    )

    # since the input values have an hourly resolution we repeat them 4 times to get values for all quarter hours
    probabilities_df = probabilities_df.loc[
        probabilities_df.index.repeat(4)
    ].reset_index(drop=True)

    probabilities_df["spring_weekday"] = (
        probabilities_df["summer_weekday"] + probabilities_df["winter_weekday"]
    ) / 2
    probabilities_df["spring_saturday"] = (
        probabilities_df["summer_saturday"] + probabilities_df["winter_saturday"]
    ) / 2
    probabilities_df["spring_sunday"] = (
        probabilities_df["summer_sunday"] + probabilities_df["winter_sunday"]
    ) / 2

    probabilities_df["autumn_weekday"] = probabilities_df["spring_weekday"]
    probabilities_df["autumn_saturday"] = probabilities_df["spring_saturday"]
    probabilities_df["autumn_sunday"] = probabilities_df["spring_sunday"]

    probabilities_df = probabilities_df / 4 * usage_prob

    probability_keys = [
        SwitchOnProbabilityKey(season, day_type, quarterly_hour_of_day)
        for season in Season
        for day_type in DayType
        for quarterly_hour_of_day in range(4 * 24)
    ]

    probabilities = {
        probability_key: probabilities_df[
            probability_key.season.value + "_" + probability_key.day_type.value
        ][probability_key.quarterly_hour_of_day]
        for probability_key in probability_keys
    }

    return probabilities
