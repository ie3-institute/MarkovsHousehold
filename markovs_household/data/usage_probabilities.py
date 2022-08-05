from dataclasses import dataclass

import pandas as pd
from typing import Dict

from markovs_household.utils.appliance import ApplianceCategory


@dataclass(frozen=True)
class UsageProbabilities:
    __probabilities: Dict[str, float]

    @classmethod
    def from_csv(cls, path: str) -> 'UsageProbabilities':
        df_usage_probabilities = pd.read_csv(path, sep=';')
        for data in ApplianceCategory:
            if not (df_usage_probabilities["ApplianceType"].str.contains(data.value.replace(' ', '_')).any()):
                raise ValueError(data)

        probability_dict = df_usage_probabilities.set_index("ApplianceType")["UsageProbability"].to_dict()

        return UsageProbabilities(probability_dict)

    def get_usage_probability(self, cat: ApplianceCategory):
        return self.__probabilities[cat.value]


usage_probability = UsageProbabilities
