from dataclasses import dataclass
from enum import Enum
from typing import List
from markovs_household.data.probability import (
    SwitchOnProbabilities,
    SwitchOnProbabilityKey,
)
from markovs_household.data.timeseries import TimeSeries
from abc import ABC
from datetime import datetime
import logging

from markovs_household.utils.time import TimeInterval


class ApplianceCategory(Enum):
    """
    Enumeration of all considered appliance types
    """

    DISH_WASHER = "dish washer"
    WASHING_MACHINE = "washing machine"
    DRYER = "dryer"
    STOVE = "stove"
    FRIDGE = "fridge"
    FREEZER = "freezer"
    TELEVISION = "television"
    VIDEO_RECORDER = "video recorder"  # what year is it?
    PC = "pc"
    TELECOMMUNICATION = "telecommunication"
    LIGHTING = "lighting"
    WATER_HEATING = "water heating"


@dataclass(frozen=True)
class ApplianceType(ABC):
    """
    Type of actual appliance.
    """

    category: ApplianceCategory
    switch_on_probabilities: SwitchOnProbabilities

    def get_switch_on_probability(self, date_time: datetime) -> float:
        """
        Determines the switch on probability of an appliance
        :param date_time: date time for which to determine the probability
        :return: the probability of switching the device on
        """
        key = SwitchOnProbabilityKey.extract_from_datetime(date_time)
        try:
            return self.switch_on_probabilities.get_probability(key)
        except KeyError as exc:
            logging.error("Cannot determine the switch on probability", exc)
            raise exc


@dataclass(frozen=True)
class ApplianceTypeLoadProfile(ApplianceType):
    """
    Appliance type that has an associated load profile
    """

    profile: TimeSeries


@dataclass(frozen=True)
class ApplianceTypeConstantPower(ApplianceType):
    """
    Appliance that has an associated constant power
    """

    power: float


@dataclass(frozen=True)
class Appliance:
    """
    A household appliance that is defined by its type and stores the intervals in which it is operating.
    """

    appliance_type: ApplianceType
    operation_intervals: List[TimeInterval]
