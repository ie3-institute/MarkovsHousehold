from dataclasses import dataclass
from enum import Enum
from typing import List
from markovs_household.data.probability import SwitchOnProbabilities, SwitchOnProbabilityKey
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
class ApplianceData(ABC):
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
            logging.error("Cannot determine the switch on probability")
            raise exc


@dataclass(frozen=True)
class ApplianceDataLoadProfile(ApplianceData):
    """
    Appliance that has an associated load profile
    :param profile: the load profile of the device
    :type profile: TimeSeries
    """
    profile: TimeSeries


@dataclass(frozen=True)
class ApplianceDataConstantPower(ApplianceData):
    """
    Appliance that has an associated constant power
    :param power: power draw of the appliance
    :type power: float
    """
    power: float


@dataclass(frozen=True)
class Appliance(ABC):
    """
    Abstract class for household appliances
    :param appliance_data: type data of the appliance
    :type appliance_data: ApplianceData
    :param operation_intervals: the intervals in which this appliance is operating
    :type operation_interfals: List[OperationInterval]
    """
    appliance_data: ApplianceData
    operation_intervals: List[TimeInterval]
