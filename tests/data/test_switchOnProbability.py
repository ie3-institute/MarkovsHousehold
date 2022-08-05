from markovs_household.data.probability import *
from markovs_household.data.usage_probabilities import *
from markovs_household.config.config import *

Config = Configuration.parse_config(r"U:\Wiss.Angestellter\Git\_github\MarkovsHousehold\tests\input\config.yaml")

UP = UsageProbabilities.from_csv(Config.usage_probabilities_file)

SO_PROBS = SwitchOnProbabilities.from_csv(ApplianceCategory.STOVE, Config.switch_on_probabilities_datapath, UP)

print(SO_PROBS.get_probability(SwitchOnProbabilityKey(Season.AUTUMN, DayType.SUNDAY, 71)))
