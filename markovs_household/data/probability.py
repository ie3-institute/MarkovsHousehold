from typing import Dict
import logging
import pandas as pd
import os
import numpy as np

from markovs_household.utils.appliance import ApplianceCategory
from markovs_household.utils import time
from datetime import datetime
from markovs_household.utils.time import Season, DayType
from dataclasses import dataclass
from markovs_household.data.usage_probabilities import UsageProbabilities


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

    __probabilities: Dict[SwitchOnProbabilityKey, float]

    @classmethod
    def from_csv(cls, cat: ApplianceCategory, path: str, usageprobs: UsageProbabilities) -> 'SwitchOnProbabilities':
        df = pd.read_csv(os.path.join(path + "/" + cat.value + ".csv"), sep=";")

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

        probabilities_df = probabilities_df / 4 * usageprobs.get_usage_probability(cat)

        probabilityKeys = [SwitchOnProbabilityKey(season, day_type, quarterly_hour_of_day)
                                      for season in Season
                                      for day_type in DayType
                                      for quarterly_hour_of_day in range(4*24)]

        probabilities = {probabilityKey: probabilities_df[probabilityKey.season.value + "_" + probabilityKey.day_type.value][probabilityKey.quarterly_hour_of_day] for probabilityKey in probabilityKeys}

        return cls(probabilities)

    def get_probability(self, key: SwitchOnProbabilityKey) -> float:
        try:
            return self.__probabilities[key]
        except KeyError as exc:
            logging.error(f"Couldn't find a switch on probability for key: {key}")
            raise exc
