import logging
import os
from dataclasses import dataclass
from datetime import datetime
from typing import Dict

import pandas as pd

from markovs_household.data.usage_probabilities import UsageProbabilities
from markovs_household.utils import time
from markovs_household.utils.appliance import ApplianceCategory
from markovs_household.utils.time import DayType, Season


@dataclass(frozen=True)
class SwitchOnProbabilityKey:
    """
    Class that is used for instantiating keys to access switch on probabilities with respect to season, day type and
    quarterly hour of day.
    """

    season: Season
    day_type: DayType
    quarterly_hour_of_day: int

    @staticmethod
    def extract_from_datetime(date_time: datetime) -> "SwitchOnProbabilityKey":
        season = Season.get_season(date_time)
        day_type = DayType.get_day_type(date_time)
        quarterly_hour_of_day = time.get_quarterly_hour_of_day(date_time)
        return SwitchOnProbabilityKey(season, day_type, quarterly_hour_of_day)


@dataclass(frozen=True)
class SwitchOnProbabilities:
    """
    Probabilities to switch on an appliance given factors defined in the SwitchOnProbabilityKey class.
    """

    probabilities: Dict[SwitchOnProbabilityKey, float]

    @classmethod
    def from_csv(
        cls, cat: ApplianceCategory, path: str, usageprobs: UsageProbabilities
    ) -> "SwitchOnProbabilities":
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

        probabilities_df = probabilities_df / 4 * usageprobs.get_usage_probability(cat)

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

        return cls(probabilities)

    def get_probability(self, key: SwitchOnProbabilityKey) -> float:
        try:
            return self.probabilities[key]
        except KeyError as exc:
            logging.error(f"Couldn't find a switch on probability for key: {key}")
            raise exc
