from markovs_household.data.appliance import (
    ApplianceTypeLoadProfile,
    ApplianceTypeConstantPower,
)
from markovs_household.data.probability import SwitchOnProbabilityKey
from markovs_household.utils.appliance import ApplianceCategory
from tests.common import test_data


def test_init_appliance_load_profile():
    appliance_type = ApplianceCategory.STOVE
    switch_on_probabilities = test_data.RANDOM_SWITCH_ON_PROBABILITIES
    profile = test_data.LOAD_PROFILE_STOVE
    appliance = ApplianceTypeLoadProfile(
        category=appliance_type,
        switch_on_probabilities=switch_on_probabilities,
        profile=profile,
    )
    assert appliance.category is ApplianceCategory.STOVE
    assert appliance.switch_on_probabilities is test_data.RANDOM_SWITCH_ON_PROBABILITIES
    assert appliance.profile is test_data.LOAD_PROFILE_STOVE


def test_init_appliance_constant_profile():
    appliance_type = ApplianceCategory.STOVE
    switch_on_probabilities = test_data.RANDOM_SWITCH_ON_PROBABILITIES
    appliance = ApplianceTypeConstantPower(
        category=appliance_type,
        switch_on_probabilities=switch_on_probabilities,
        power=42,
    )
    assert appliance.category is ApplianceCategory.STOVE
    assert appliance.switch_on_probabilities is test_data.RANDOM_SWITCH_ON_PROBABILITIES
    assert appliance.power is 42


def test_get_switch_on_probability():
    stove = test_data.STOVE
    (datetime, key) = test_data.DATE_TIME_KEY_PAIR
    expected = stove.switch_on_probabilities.get_probability(key)
    assert stove.get_switch_on_probability(datetime) == expected
