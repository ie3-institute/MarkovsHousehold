from markovs_household.data.appliance import ApplianceType, ApplianceLoadProfile, ApplianceConstantPower
from markovs_household.data.probability import SwitchOnProbabilityKey
from tests.common import test_data


def test_init_appliance_load_profile():
    appliance_type = ApplianceType.STOVE
    switch_on_probabilities = test_data.RANDOM_SWITCH_ON_PROBABILITIES
    profile = test_data.LOAD_PROFILE_STOVE
    appliance = ApplianceLoadProfile(type=appliance_type, switch_on_probabilities=switch_on_probabilities, profile=profile)
    assert(appliance.type is ApplianceType.STOVE)
    assert (appliance.switch_on_probabilities is test_data.RANDOM_SWITCH_ON_PROBABILITIES)
    assert (appliance.profile is test_data.LOAD_PROFILE_STOVE)


def test_init_appliance_constant_profile():
    appliance_type = ApplianceType.STOVE
    switch_on_probabilities = test_data.RANDOM_SWITCH_ON_PROBABILITIES
    appliance = ApplianceConstantPower(type=appliance_type, switch_on_probabilities=switch_on_probabilities, power=42)
    assert(appliance.type is ApplianceType.STOVE)
    assert (appliance.switch_on_probabilities is test_data.RANDOM_SWITCH_ON_PROBABILITIES)
    assert (appliance.power is 42)


def test_get_switch_on_probability():
    stove = test_data.STOVE
    (datetime, key) = test_data.DATE_TIME_KEY_PAIR
    probabilities = stove.switch_on_probabilities.get_probabilities()
    expected = probabilities[SwitchOnProbabilityKey.extract_from_datetime(datetime)]
    assert(stove.get_switch_on_probability(datetime) == expected)
