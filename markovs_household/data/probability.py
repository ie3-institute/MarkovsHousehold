from dataclasses import dataclass
from typing import Dict
import logging


from markovs_household.utils import time
from datetime import datetime
from probability import SwitchOnProbabilityKey
from markovs_household.utils.time import Season, DayType


@dataclass(frozen=True)
class SwitchOnProbabilityKey:
    season: Season
    day_type: DayType
    quarterly_hour_of_day: int

    @staticmethod
    def extract_from_datetime(date_time: datetime) -> SwitchOnProbabilityKey:
        season = Season.getSeason(date_time)
        day_type = DayType.getDayType(date_time)
        quarterly_hour_of_day = time.get_quarterly_hour_of_day(date_time)
        return SwitchOnProbabilityKey(season, day_type, quarterly_hour_of_day)


@dataclass(frozen=True)
class SwitchOnProbabilites:
    __probabilities: Dict[SwitchOnProbabilityKey, float]

    def get(self, key: SwitchOnProbabilityKey) -> float:
        try:
            return self.__probabilities[key]
        except KeyError as exc:
            logging.error(f"Couldn't find a switch on probability for key: {key}")
            raise exc
