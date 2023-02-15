import os.path
from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Dict

import pandas as pd

from markovs_household.data.appliance import ApplianceCategory, ApplianceType
from markovs_household.data.household_categories import HouseholdIncome, HouseholdType
from markovs_household.input.probabilities import (
    read_switch_on_probablities,
    read_usage_probabilities,
)


class HouseholdAppliancesInput(ABC):
    @abstractmethod
    def get_appliance_types(self) -> Dict[ApplianceCategory, ApplianceType]:
        pass

    @abstractmethod
    def get_household_average_appliances(self) -> Dict[ApplianceCategory, float]:
        pass

    @abstractmethod
    def get_household_average_appliances_by_no_of_inhabitants(
        self,
    ) -> Dict[int, Dict[ApplianceCategory, float]]:
        pass

    @abstractmethod
    def get_household_average_appliances_by_income(
        self,
    ) -> Dict[HouseholdIncome, Dict[ApplianceCategory, float]]:
        pass

    @abstractmethod
    def get_household_average_appliances_by_household_type(
        self,
    ) -> Dict[HouseholdType, Dict[ApplianceCategory, float]]:
        pass


@dataclass
class CsvHouseholdAppliancesInput(HouseholdAppliancesInput):
    average_hh: Dict[ApplianceCategory, float]
    by_income: Dict[HouseholdIncome, Dict[ApplianceCategory, float]]
    by_inhabitants: Dict[int, Dict[ApplianceCategory, float]]
    by_type: Dict[HouseholdType, Dict[ApplianceCategory, float]]
    appliance_types: Dict[ApplianceCategory, ApplianceType]

    def __init__(self, dir_path: str, delimiter: str):
        appliances_path = os.path.join(dir_path, "appliances")

        average_hh = pd.read_csv(
            os.path.join(appliances_path, "average_hh.csv"), delimiter=delimiter
        )
        average_hh_dict = {}
        for appliance in ApplianceCategory:
            if not appliance.value in average_hh.columns:
                raise ValueError("Appliance doesn't exist!")
            average_hh_dict[appliance] = average_hh[appliance.value]
        self.average_hh = average_hh_dict

        def get_category_dict(data: pd.DataFrame):
            res = {}
            for idx, row in data.iterrows():
                appliance_dict = {}
                for appliance in ApplianceCategory:
                    if not appliance.value in row.keys():
                        raise ValueError("Appliance doesn't exist!")
                    appliance_dict[appliance] = row[appliance.value]
                res[idx] = appliance_dict
            return res

        by_income = pd.read_csv(
            os.path.join(appliances_path, "by_income.csv"), delimiter=delimiter
        )
        by_income["income"] = by_income["income"].apply(lambda x: HouseholdIncome(x))
        by_income.set_index("income", inplace=True, drop=True)
        by_income_dict = get_category_dict(by_income)
        self.by_income = by_income_dict

        by_inhabitants = pd.read_csv(
            os.path.join(appliances_path, "by_inhabitants.csv"),
            delimiter=delimiter,
            index_col="inhabitants",
        )
        by_inhabitants_dict = get_category_dict(by_inhabitants)
        self.by_inhabitants = by_inhabitants_dict

        by_type = pd.read_csv(
            os.path.join(appliances_path, "by_type.csv"), delimiter=delimiter
        )
        by_type["type"] = by_type["type"].apply(lambda x: HouseholdType(x))
        by_type.set_index("type", inplace=True, drop=True)
        by_type_dict = get_category_dict(by_type)
        self.by_type = by_type_dict

        self.appliance_types = self.initialize_appliance_types(
            os.path.join(
                dir_path,
                "probabilities",
                "usage_probabilities",
                "usage_probabilities.csv",
            ),
            os.path.join(dir_path, "probabilities", "switch_on_probabilities"),
        )

    @staticmethod
    def initialize_appliance_types(
        usage_probs_path: str, switch_on_probs_path: str
    ) -> dict[ApplianceCategory, ApplianceType]:
        usage_probs = read_usage_probabilities(usage_probs_path)
        dct = {}
        for cat in ApplianceCategory:
            switch_on_probs = read_switch_on_probablities(
                cat, switch_on_probs_path, usage_probs[cat]
            )
            dct[cat] = ApplianceType(cat, switch_on_probs)
        return dct

    def get_appliance_types(self) -> Dict[ApplianceCategory, ApplianceType]:
        return self.appliance_types

    def get_household_average_appliances(self) -> Dict[ApplianceCategory, float]:
        return self.average_hh

    def get_household_average_appliances_by_no_of_inhabitants(
        self,
    ) -> Dict[int, Dict[ApplianceCategory, float]]:
        return self.by_inhabitants

    def get_household_average_appliances_by_income(
        self,
    ) -> Dict[HouseholdIncome, Dict[ApplianceCategory, float]]:
        return self.by_income

    def get_household_average_appliances_by_household_type(
        self,
    ) -> Dict[HouseholdType, Dict[ApplianceCategory, float]]:
        return self.by_type
