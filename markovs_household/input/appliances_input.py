from abc import ABC, abstractmethod
from typing import Dict

from markovs_household.data.appliance import ApplianceCategory, ApplianceType
from markovs_household.data.household_categories import HouseholdIncome, HouseholdType


class HouseholdAppliancesInput(ABC):
    @classmethod
    @abstractmethod
    def get_appliance_types(cls) -> Dict[ApplianceCategory, ApplianceType]:
        pass

    @classmethod
    @abstractmethod
    def get_household_average_appliances(cls) -> Dict[ApplianceCategory, float]:
        pass

    @classmethod
    @abstractmethod
    def get_household_average_appliances_by_no_of_inhabitants(
        cls,
    ) -> Dict[int, Dict[ApplianceCategory, float]]:
        pass

    @classmethod
    @abstractmethod
    def get_household_average_appliances_by_income(
        cls,
    ) -> Dict[HouseholdIncome, Dict[ApplianceCategory, float]]:
        pass

    @classmethod
    @abstractmethod
    def get_household_average_appliances_by_household_type(
        cls,
    ) -> Dict[HouseholdType, Dict[ApplianceCategory, float]]:
        pass
