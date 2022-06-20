import math
import random
from dataclasses import dataclass

from typing import List, Dict

from markovs_household.data.household_categories import HouseholdIncome, HouseholdType
from markovs_household.input.appliances_input import HouseholdAppliancesInput
from markovs_household.data.appliance import Appliance, ApplianceCategory, ApplianceType


@dataclass(frozen=True)
class Household:
    """
    Represents a household that houses a certain amount of appliances
    :var appliances: list of appliances within the household
    """

    appliances: List[Appliance]

    @classmethod
    def from_average_household(cls, inp: HouseholdAppliancesInput) -> "Household":
        """ "
        Factory method that generates a household object with appliances based on an average household
        :param inp: Source of inputs
        :return: a household instance
        """

        appliance_types = inp.get_appliance_types()
        appliance_stats = inp.get_household_average_appliances()

        return Household(
            cls.__create_household_with_stats(appliance_types, appliance_stats)
        )

    @classmethod
    def from_no_of_inhabitants(
        cls, inp: HouseholdAppliancesInput, no_of_inhabitants: int
    ) -> "Household":
        """
        Factory method that generates a household object with appliances based on the number of its inhabitants
        :param inp: Source of inputs
        :param no_of_inhabitants: Number of inhabitants of the household
        :return: a household instance
        """

        appliance_types = inp.get_appliance_types()
        appliance_stats = inp.get_household_average_appliances_by_no_of_inhabitants()[
            no_of_inhabitants
        ]

        return Household(
            cls.__create_household_with_stats(appliance_types, appliance_stats)
        )

    @classmethod
    def from_income(cls, inp: HouseholdAppliancesInput, income: float):
        """ "
        Factory method that generates a household object with appliances based on its income
        :param inp: Source of inputs
        :param income: income of the household
        """

        appliance_types = inp.get_appliance_types()
        income_category = HouseholdIncome.from_income(income)
        appliance_stats = inp.get_household_average_appliances_by_income()[
            income_category
        ]

        return Household(
            cls.__create_household_with_stats(appliance_types, appliance_stats)
        )

    @classmethod
    def from_household_type(
        cls, inp: HouseholdAppliancesInput, household_type: HouseholdType
    ) -> "Household":
        """
        Factory method that generates a household object with appliances based on its household type
        :param inp: Source of inputs
        :param household_type: type of the household
        :return: a household instance
        """

        appliance_types = inp.get_appliance_types()
        appliance_stats = inp.get_household_average_appliances_by_household_type()[
            household_type
        ]

        return Household(
            cls.__create_household_with_stats(appliance_types, appliance_stats)
        )

    @classmethod
    def __create_household_with_stats(
        cls,
        appliance_types: Dict[ApplianceCategory, ApplianceType],
        appliance_stats: Dict[ApplianceCategory, float],
    ):
        appliances = []
        for appliance_cat, avg_amount in appliance_stats.items():
            amount = cls.__discrete_amount(avg_amount)
            data = appliance_types[appliance_cat]

            for _ in range(amount):
                appliance = Appliance(data, [])
                appliances.append(appliance)

        return appliances

    @classmethod
    def __discrete_amount(cls, avg_amount: float) -> int:
        amount_small = math.floor(avg_amount)
        amount_large = math.ceil(avg_amount)

        prob_small = avg_amount - amount_small

        return amount_small if random.random() < prob_small else amount_large
