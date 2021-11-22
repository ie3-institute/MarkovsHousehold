import random
from datetime import datetime

from markovs_household.data.appliance import ApplianceLoadProfile, ApplianceType
from markovs_household.data.probability import SwitchOnProbabilityKey, SwitchOnProbabilities
from markovs_household.data.timeseries import TimeSeries
from markovs_household.utils.time import Season, DayType

SWITCH_ON_PROBABILITY_KEYS = [SwitchOnProbabilityKey(season, day_type, quarterly_hour_of_day)
                              for season in Season
                              for day_type in DayType
                              for quarterly_hour_of_day in range(96)]

random.seed(42)
RANDOM_SWITCH_ON_PROBABILITIES = SwitchOnProbabilities({key: random.random() for key in SWITCH_ON_PROBABILITY_KEYS})
LOAD_PROFILE_STOVE = TimeSeries({quarterly_hour: 700 for quarterly_hour in range(4)})
STOVE = ApplianceLoadProfile(type=ApplianceType.STOVE, switch_on_probabilities=RANDOM_SWITCH_ON_PROBABILITIES, profile=LOAD_PROFILE_STOVE)
DATE_TIME_KEY_PAIR = (datetime(year=2021, month=11, day=16, hour=9, minute=0),
                      SwitchOnProbabilityKey(Season.AUTUMN, DayType.WORKING_DAY, 36))
