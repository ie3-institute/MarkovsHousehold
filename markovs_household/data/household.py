from enum import Enum
from dataclasses import dataclass
from typing import Dict

from markovs_household.data.appliance import Appliance


class HouseHoldType(Enum):
    """
    Enumeration of different household types
    """
    FLAT = "flat"
    HOUSE = "house"


@dataclass(frozen=True)
class Household:
    """
    Represents a household that houses a certain amount of appliances
    :var appliances: mapping of an appliance to the number of the particular appliance within the household
    """
    appliances: Dict[Appliance, float]

    @classmethod
    def from_average_household(cls) -> "Household":
        """"
        Factory method that generates a household object with appliances based on an average household
        :return: a household instance
        """
        pass

    @classmethod
    def from_no_of_inhabitants(cls, no_of_inhabitants: int) -> "Household":
        """
        Factory method that generates a household object with appliances based on the number of its inhabitants
        :param no_of_inhabitants:
        :return: a household instance
        """
        pass

    @classmethod
    def from_income(cls, income: float):
        """"
        Factory method that generates a household object with appliances based on its income
        :param income: income of the household
        """
        pass

    @classmethod
    def from_household_tpye(cls, household_type: HouseHoldType) -> "Household":
        """
        Factory method that generates a household object with appliances based on its household type
        :param household_type: type of the household
        :return: a household instance
        """
        pass

