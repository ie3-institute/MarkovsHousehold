from dataclasses import dataclass
from typing import Dict

import pandas as pd

from markovs_household.utils.appliance import ApplianceCategory


@dataclass(frozen=True)
class UsageProbabilities:
    __probabilities: Dict[str, float]

    @classmethod
    def from_csv(cls, path: str) -> "UsageProbabilities":
        df_usage_probabilities = pd.read_csv(
            path, sep=";", index_col="appliance_category"
        )
        usage_probability_dict = df_usage_probabilities.to_dict()["usage_probability"]
        for category in ApplianceCategory:
            if not category.value in usage_probability_dict:
                raise ValueError(
                    "No switch on probability with name {} found in file {}.".format(
                        category.value, path
                    )
                )

        return UsageProbabilities(usage_probability_dict)

    def get_usage_probability(self, cat: ApplianceCategory):
        return self.__probabilities[cat.value]


usage_probability = UsageProbabilities
