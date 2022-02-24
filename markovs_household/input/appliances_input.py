from abc import ABC, abstractmethod

from markovs_household.data.appliance import ApplianceCategory, ApplianceType
from markovs_household.data.household_categories import HouseholdType, HouseholdIncome


class Input(ABC):

    @classmethod
    @abstractmethod
    def get_appliance_types(cls) -> dict[ApplianceCategory, ApplianceType]:
        pass

    @classmethod
    @abstractmethod
    def get_household_average_appliances(cls) -> dict[ApplianceCategory, float]:
        pass

    @classmethod
    @abstractmethod
    def get_household_average_appliances_by_no_of_inhabitants(cls) -> dict[int, dict[ApplianceCategory, float]]:
        pass

    @classmethod
    @abstractmethod
    def get_household_average_appliances_by_income(cls) -> dict[HouseholdIncome, dict[ApplianceCategory, float]]:
        pass

    @classmethod
    @abstractmethod
    def get_household_average_appliances_by_household_type(cls) -> dict[HouseholdType, dict[ApplianceCategory, float]]:
        pass
