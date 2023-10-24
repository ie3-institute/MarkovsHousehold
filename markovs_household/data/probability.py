from dataclasses import dataclass
from datetime import datetime

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

    @staticmethod
    def get_all():
        return [
            SwitchOnProbabilityKey(season, day_type, quarterly_hour_of_day)
            for season in Season
            for day_type in DayType
            for quarterly_hour_of_day in range(4 * 24)
        ]
