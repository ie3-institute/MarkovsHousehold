import pandas as pd
from typing import Dict
from markovs_household.data.appliance import ApplianceCategory


class UsageProbabilities:
    __probabilities: Dict[ApplianceCategory, float]


    @classmethod
    def read_usage_probabilities(cls, config):
        df_usage_probabilities = pd.read_csv(config.usage_probabilities_file, sep=';')
        for data in ApplianceCategory:
            if not (df_usage_probabilities["ApplianceType"].str.contains(data.value.replace(' ', '_')).any()):
                raise ValueError(data)

        df_usage_probabilities = df_usage_probabilities.set_index("ApplianceType")

        return df_usage_probabilities.to_dict()

    @classmethod
    def get_usage_probability(cls, cat: ApplianceCategory, config):
        cls.__probabilities = cls.read_usage_probabilities(config)

        return cls.__probabilities["UsageProbability"][cat]
