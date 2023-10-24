import os.path

from markovs_household.data.probability import SwitchOnProbabilityKey
from markovs_household.input.probabilities import (
    read_switch_on_probablities,
    read_usage_probabilities,
)
from markovs_household.utils.appliance import ApplianceCategory
from markovs_household.utils.time import DayType, Season
from tests.common.utils import TEST_RESOURCES_DIR

up_path = os.path.join(
    TEST_RESOURCES_DIR,
    "probabilities",
    "usage_probabilities",
    "usage_probabilities.csv",
)
sop_path = os.path.join(TEST_RESOURCES_DIR, "probabilities", "switch_on_probabilities")


def test_read_usage_probabilities():
    up = read_usage_probabilities(up_path)
    for appliance in ApplianceCategory:
        assert appliance in up


def test_switch_on_probability():
    usage_probabilities = read_usage_probabilities(up_path)
    for appliance in ApplianceCategory:
        switch_on_probabilities = read_switch_on_probablities(
            ApplianceCategory.STOVE,
            sop_path,
            usage_probabilities[appliance],
        )
        assert len(switch_on_probabilities) == 1152
        if appliance == ApplianceCategory.STOVE:
            actual = switch_on_probabilities[
                SwitchOnProbabilityKey(Season.AUTUMN, DayType.SATURDAY, 24)
            ]
            expected = 0.002
            assert actual == expected
