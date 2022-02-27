from datetime import datetime, timedelta

from markovs_household.data.appliance import ApplianceCategory, ApplianceTypeLoadProfile, ApplianceTypeConstantPower, \
    Appliance
from markovs_household.data.probability import SwitchOnProbabilityKey
from markovs_household.utils.time import TimeInterval
from tests.common import test_data


def test_init_appliance_load_profile():
    appliance_type = ApplianceCategory.STOVE
    switch_on_probabilities = test_data.RANDOM_SWITCH_ON_PROBABILITIES
    profile = test_data.LOAD_PROFILE_STOVE
    appliance = ApplianceTypeLoadProfile(category=appliance_type, switch_on_probabilities=switch_on_probabilities,
                                         profile=profile)
    assert (appliance.category is ApplianceCategory.STOVE)
    assert (appliance.switch_on_probabilities is test_data.RANDOM_SWITCH_ON_PROBABILITIES)
    assert (appliance.profile is test_data.LOAD_PROFILE_STOVE)


def test_init_appliance_constant_profile():
    appliance_type = ApplianceCategory.STOVE
    switch_on_probabilities = test_data.RANDOM_SWITCH_ON_PROBABILITIES
    appliance = ApplianceTypeConstantPower(category=appliance_type, switch_on_probabilities=switch_on_probabilities,
                                           power=42, operation_time=timedelta(minutes=10))
    assert (appliance.category is ApplianceCategory.STOVE)
    assert (appliance.switch_on_probabilities is test_data.RANDOM_SWITCH_ON_PROBABILITIES)
    assert (appliance.power is 42)


def test_get_switch_on_probability():
    stove = test_data.STOVE
    (dt, key) = test_data.DATE_TIME_KEY_PAIR
    probabilities = stove.switch_on_probabilities.get_probabilities()
    expected = probabilities[SwitchOnProbabilityKey.extract_from_datetime(dt)]
    assert (stove.get_switch_on_probability(dt) == expected)


def test_is_tpoeurned_on():
    appliance_type = ApplianceTypeLoadProfile(category=test_data.STOVE,
                                              switch_on_probabilities=test_data.RANDOM_SWITCH_ON_PROBABILITIES,
                                              profile=test_data.LOAD_PROFILE_STOVE)
    operation_start = datetime(year=2021, month=11, day=11, hour=11, minute=11)
    operation_end = operation_start + appliance_type.get_operation_time()
    operation_interval = TimeInterval(operation_start, operation_end)
    appliance = Appliance(appliance_type=appliance_type, operation_intervals=[operation_interval])
    assert (appliance.is_turned_on(operation_start + appliance_type.get_operation_time() / 2) is True)
    assert (appliance.is_turned_on(
        operation_start + appliance_type.get_operation_time() + timedelta(seconds=1)) is False)
