import logging
from dataclasses import dataclass
from datetime import datetime
from typing import Dict

from markovs_household.utils import time
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
    Probabilities to switch on an appliance given factors defined in the SwitchOnProbibilityKey class.
    """

    __probabilities: Dict[SwitchOnProbabilityKey, float]

    def get_probabilities(self):
        return self.__probabilities

    def get_probability(self, key: SwitchOnProbabilityKey) -> float:
        try:
            return self.__probabilities[key]
        except KeyError as exc:
            logging.error(f"Couldn't find a switch on probability for key: {key}")
            raise exc
