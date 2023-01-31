import logging
import random
from abc import ABC, abstractmethod
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from typing import ClassVar, List

from markovs_household.data.probability import (
    SwitchOnProbabilities,
    SwitchOnProbabilityKey,
)
from markovs_household.data.timeseries import TimeSeries
from markovs_household.utils.time import TimeInterval
from markovs_household.utils.appliance import ApplianceCategory


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

    @abstractmethod
    def get_operation_time(self) -> timedelta:
        pass


@dataclass(frozen=True)
class ApplianceTypeLoadProfile(ApplianceType):
    """
    Appliance type that has an associated load profile
    """

    profile: TimeSeries

    def get_operation_time(self) -> timedelta:
        return self.profile.length


@dataclass(frozen=True)
class ApplianceTypeConstantPower(ApplianceType):
    """
    Appliance that has an associated constant power and an operation time in seconds
    """

    power: float
    operation_time: timedelta

    def get_operation_time(self) -> timedelta:
        return self.operation_time


@dataclass(frozen=True)
class Appliance:
    """
    A household appliance that is defined by its type and stores the intervals in which it is operating.
    """

    appliance_type: ApplianceType
    _operation_intervals: List[TimeInterval] = field(default_factory=list)
    random_generator: ClassVar[random.Random] = random.Random(42)

    @property
    def __operation_intervals(self):
        return self._operation_intervals

    def handle_simulation_step(self, current_time: datetime) -> None:
        """
        Handles a simulation step to check stochastically check if the appliance is turned on at this point in time.
        If the appliance is turned on an operation interval is added to the appliances operation intervals.
        :param current_time: current time
        """
        if self.is_turned_on(current_time):
            return
        self.__sample_switch_on(current_time)

    def is_turned_on(self, current_time) -> bool:
        if not self._operation_intervals:
            return False
        return self._operation_intervals[-1].is_within(current_time)

    def __sample_switch_on(self, current_time) -> None:
        """
        Rolls the dice and compares it with the probability of the appliance to be turned on. If the dice roll falls
        within the turn on probability of the device at the current time we "turn it on" by adding a corresponding
        operation interval
        :param current_time: current time
        """
        switch_on_probability_key = SwitchOnProbabilityKey.extract_from_datetime(
            current_time
        )
        switch_on_probability = (
            self.appliance_type.switch_on_probabilities.get_probability(
                switch_on_probability_key
            )
        )
        dice_roll = self.random_generator.random()
        if dice_roll <= switch_on_probability:
            self.__add_operation_interval(current_time)

    def __add_operation_interval(self, current_time: datetime):
        self._operation_intervals.append(
            TimeInterval.get_operation_interval(
                current_time, self.appliance_type.get_operation_time()
            )
        )
