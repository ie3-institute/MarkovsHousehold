import random
from datetime import datetime, timedelta

from markovs_household.data.appliance import ApplianceTypeLoadProfile
from markovs_household.data.probability import (
    SwitchOnProbabilities,
    SwitchOnProbabilityKey,
)
from markovs_household.data.timeseries import TimeSeries, TimeSeriesEntry
from markovs_household.utils.appliance import ApplianceCategory
from markovs_household.utils.time import DayType, Season

SWITCH_ON_PROBABILITY_KEYS = [
    SwitchOnProbabilityKey(season, day_type, quarterly_hour_of_day)
    for season in Season
    for day_type in DayType
    for quarterly_hour_of_day in range(96)
]

random.seed(42)
RANDOM_SWITCH_ON_PROBABILITIES = SwitchOnProbabilities(
    {key: random.random() for key in SWITCH_ON_PROBABILITY_KEYS}
)
LOAD_PROFILE_STOVE = TimeSeries(
    [
        TimeSeriesEntry(timedelta(), 100),
        TimeSeriesEntry(timedelta(seconds=60), 200),
        TimeSeriesEntry(timedelta(seconds=120), 150),
    ],
    timedelta(minutes=4),
)
STOVE = ApplianceTypeLoadProfile(
    category=ApplianceCategory.STOVE,
    switch_on_probabilities=RANDOM_SWITCH_ON_PROBABILITIES,
    profile=LOAD_PROFILE_STOVE,
)
DATE_TIME_KEY_PAIR = (
    datetime(year=2021, month=11, day=16, hour=9, minute=0),
    SwitchOnProbabilityKey(Season.AUTUMN, DayType.WEEKDAY, 36),
)
