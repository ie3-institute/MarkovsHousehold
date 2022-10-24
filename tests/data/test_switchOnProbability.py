from markovs_household.data.probability import *
from markovs_household.data.usage_probabilities import *
from markovs_household.config.config import *
from markovs_household.utils.utils import ROOT_DIR


def test_switch_on_probility():
    config = Configuration.parse_config(os.path.join(ROOT_DIR, "tests", "input", "config.yaml"))
    usage_probabilities = UsageProbabilities.from_csv(os.path.join(ROOT_DIR, config.usage_probabilities_file))
    switch_on_probabilities = SwitchOnProbabilities.from_csv(ApplianceCategory.STOVE, os.path.join(ROOT_DIR, config.switch_on_probabilities_datapath), usage_probabilities)
    actual = switch_on_probabilities.get_probability(SwitchOnProbabilityKey(Season.AUTUMN, DayType.SATURDAY, 24))
    expected = 0.002
    assert(actual == expected)
