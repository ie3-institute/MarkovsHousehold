from datetime import datetime, timedelta

from markovs_household.data.appliance import (
    Appliance,
    ApplianceCategory,
    ApplianceTypeConstantPower,
    ApplianceTypeLoadProfile,
)
from markovs_household.data.probability import (
    SwitchOnProbabilities,
    SwitchOnProbabilityKey,
)
from markovs_household.utils.time import DayType, Season, TimeInterval
from tests.common import test_data
from tests.common.test_data import STOVE


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
        operation_time=timedelta(minutes=10),
    )
    assert appliance.category == ApplianceCategory.STOVE
    assert appliance.switch_on_probabilities is test_data.RANDOM_SWITCH_ON_PROBABILITIES
    assert appliance.power == 42
    appliance = ApplianceTypeConstantPower(
        category=appliance_type,
        switch_on_probabilities=switch_on_probabilities,
        power=42,
        operation_time=timedelta(hours=1),
    )
    assert appliance.category == ApplianceCategory.STOVE
    assert appliance.switch_on_probabilities is test_data.RANDOM_SWITCH_ON_PROBABILITIES
    assert appliance.power == 42


def test_get_switch_on_probability():
    (datetime, key) = test_data.DATE_TIME_KEY_PAIR
    expected = STOVE.switch_on_probabilities.get_probability(key)
    assert STOVE.get_switch_on_probability(datetime) == expected

    (dt, key) = test_data.DATE_TIME_KEY_PAIR
    probabilities = STOVE.switch_on_probabilities.probabilities
    expected = probabilities[SwitchOnProbabilityKey.extract_from_datetime(dt)]
    assert STOVE.get_switch_on_probability(dt) == expected


def test_is_turned_on():
    appliance_type = ApplianceTypeLoadProfile(
        category=ApplianceCategory.STOVE,
        switch_on_probabilities=test_data.RANDOM_SWITCH_ON_PROBABILITIES,
        profile=test_data.LOAD_PROFILE_STOVE,
    )
    operation_start = datetime(year=2021, month=11, day=11, hour=11, minute=11)
    operation_end = operation_start + appliance_type.get_operation_time()
    operation_interval = TimeInterval(operation_start, operation_end)
    appliance = Appliance(
        appliance_type=appliance_type, _operation_intervals=[operation_interval]
    )
    assert (
        appliance.is_turned_on(
            operation_start + appliance_type.get_operation_time() / 2
        )
        is True
    )
    assert (
        appliance.is_turned_on(
            operation_start + appliance_type.get_operation_time() + timedelta(seconds=1)
        )
        is False
    )


def test_handle_smiulation_step():
    zero_probability_key = SwitchOnProbabilityKey(Season.WINTER, DayType.WEEKDAY, 0)
    one_probability_key = SwitchOnProbabilityKey(Season.WINTER, DayType.WEEKDAY, 1)
    switch_on_probabilities = SwitchOnProbabilities(
        {zero_probability_key: 0, one_probability_key: 1}
    )
    appliance_type = ApplianceTypeConstantPower(
        category=ApplianceCategory.STOVE,
        switch_on_probabilities=switch_on_probabilities,
        power=42,
        operation_time=timedelta(minutes=10),
    )
    appliance = Appliance(appliance_type)
    initial_time = datetime(year=2022, month=1, day=4, hour=0, minute=11)
    appliance.handle_simulation_step(initial_time)
    assert len(appliance.get_operation_intervals()) == 0
    next_time = datetime(year=2022, month=1, day=4, hour=0, minute=24)
    appliance.handle_simulation_step(next_time)
    assert len(appliance.get_operation_intervals()) == 1
