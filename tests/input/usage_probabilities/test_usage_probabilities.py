from markovs_household.config.config import Configuration
from markovs_household.data import read_probabilities
from markovs_household.data.appliance import ApplianceCategory
from markovs_household.data.usage_probabilities import UsageProbabilities

test_config_path = "/Users/thomas/PycharmProjects/MarkovsHousehold/tests/input/config.yaml"
config = Configuration.parse_config(test_config_path)
usage_probs = UsageProbabilities.from_csv("/Users/thomas/PycharmProjects/MarkovsHousehold/tests/input/usage_probabilities/usage_probabilities.csv")
switch_on_probs = read_probabilities.import_probabilities(ApplianceCategory.PC.value, config, 0.5)

print("")