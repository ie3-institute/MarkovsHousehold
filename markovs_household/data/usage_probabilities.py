import pandas as pd
from markovs_household.data.appliance import ApplianceType

class UsageProbabilities:

# __init__ statt methode sinnvoll?
# wofuer sind unten die unterstriche bei self.__probabilities
# muessen/sollten wir in der klasse zu Beginn auch Klassenvariablen definieren?

    @classmethod
    def read_usage_probabilities(cls, config):
        df_usage_probabilities = pd.read_csv(config.usage_probabilities_path)
        for data in ApplianceType:
            if not(df_usage_probabilities.ApplianceType.str.contains(data.value.replace(' ', '_')).any()):
                raise ValueError("ApplianceType not found")

        cls.__probabilities = df_usage_probabilities.to_dict

